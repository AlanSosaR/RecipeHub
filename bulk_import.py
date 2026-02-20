import os
import re
import zipfile
import xml.etree.ElementTree as ET

# Configuración
USER_ID = 'cf5ee75b-7182-4623-a8a0-fbeae25f4c61' # alansosa225@gmail.com
INPUT_DIR = 'recetas_import'
OUTPUT_SQL = 'import_data.sql'

def clean_name(name):
    parts = name.split(';')
    name = parts[-1].strip()
    name = re.sub(r'\{.*?\}', '', name)
    name = re.sub(r'^[ \*\d\.]+', '', name)
    name = name.strip().strip(':;,.')
    return name

def clean_rtf(rtf_text):
    pattern = re.compile(r"\\([a-z]{1,32})(-?\d{1,10})?[ ]?|\\'([0-9a-f]{2})|\\([^a-z])|([{}])|[\r\n]+|(.)", re.I)
    dest_stack = []
    printable = True
    result = []
    for match in pattern.finditer(rtf_text):
        word, arg, hexchar, char, brace, plain = match.groups()
        if brace:
            if brace == '{': dest_stack.append(printable)
            else: printable = dest_stack.pop()
        elif hexchar:
            if printable: result.append(chr(int(hexchar, 16)))
        elif char:
            if printable: result.append(char)
        elif plain:
            if printable: result.append(plain)
    text = "".join(result)
    text = re.sub(r'\n+', '\n', text)
    return text.strip()

def parse_odt(file_path):
    try:
        with zipfile.ZipFile(file_path, 'r') as z:
            with z.open('content.xml') as content_file:
                tree = ET.parse(content_file)
                root = tree.getroot()
                text_ns = '{urn:oasis:names:tc:opendocument:xmlns:text:1.0}'
                paragraphs = []
                for p in root.iter(f'{text_ns}p'):
                    paragraphs.append("".join(p.itertext()))
                return "\n".join(paragraphs)
    except Exception: return ""

def parse_txt(file_path):
    with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
        return f.read()

def structure_recipe(raw_text):
    lines = [l.strip() for l in raw_text.split('\n') if l.strip()]
    if not lines: return None
    
    name = clean_name(lines[0])
    if (not name or len(name) < 3) and len(lines) > 1:
        alt_name = clean_name(lines[1])
        if len(alt_name) > len(name): name = alt_name
        
    recipe = { 'name': name or "Receta sin nombre", 'ingredients': [], 'instructions': [] }
    section = 'ingredients'
    
    imperative_verbs = ['roast', 'cut', 'mix', 'give', 'put', 'set', 'place', 'pour', 'heat', 'spread', 'blitz', 'combine', 'bake', 'cool', 'marinade', 'bread', 'sift', 'grate', 'start', 'boil', 'fry', 'blanch', 'cook', 'deglaze']

    for line in lines[1:]:
        lower = line.lower()
        if any(kw in lower for kw in ['preparacion', 'procedimiento', 'modo de', 'instrucciones', 'preparation', 'method', 'instruction']):
            section = 'instructions'
            continue
        
        # Detectar si la línea parece una instrucción (empieza con verbo o es larga)
        starts_with_verb = any(lower.startswith(v) for v in imperative_verbs)
        
        if section == 'ingredients':
            if line.startswith('-') or line.startswith('*') or (line[0].isdigit() if line else False):
                recipe['ingredients'].append(line.lstrip('-* ').strip())
            elif len(line) > 50 or starts_with_verb:
                section = 'instructions'
                recipe['instructions'].append(line)
            else:
                recipe['ingredients'].append(line)
        else:
            recipe['instructions'].append(line)
    return recipe

def escape_sql(val):
    if val is None: return "NULL"
    return "'" + str(val).replace("'", "''") + "'"

recetas = []
nombres_vistos = set()

for filename in os.listdir(INPUT_DIR):
    path = os.path.join(INPUT_DIR, filename)
    content = ""
    if filename.endswith('.rtf'):
        with open(path, 'r', encoding='latin-1') as f: content = clean_rtf(f.read())
    elif filename.endswith('.odt'): content = parse_odt(path)
    elif filename.endswith('.txt'): content = parse_txt(path)
    
    if content:
        r = structure_recipe(content)
        if r and r['name'] not in nombres_vistos and len(r['name']) > 2:
            recetas.append(r)
            nombres_vistos.add(r['name'])

with open(OUTPUT_SQL, 'w', encoding='utf-8') as f:
    f.write("-- SQL Importación Masiva v5\n")
    for r in recetas:
        f.write("DO $$\n")
        f.write("DECLARE\n    v_recipe_id uuid;\nBEGIN\n")
        f.write(f"    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) \n")
        f.write(f"    VALUES ('{USER_ID}', {escape_sql(r['name'])}, 'Importado desde Dropbox/RTF', true) \n")
        f.write(f"    RETURNING id INTO v_recipe_id;\n\n")
        
        for ing in r['ingredients']:
            if ing:
                # El esquema real no tiene raw_text, usamos name_es
                f.write(f"    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, {escape_sql(ing)});\n")
        
        for i, step in enumerate(r['instructions']):
            if step:
                f.write(f"    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, {i+1}, {escape_sql(step)});\n")
        
        f.write("END $$;\n\n")

print(f"SQL v5 generado en {OUTPUT_SQL} con {len(recetas)} recetas.")
