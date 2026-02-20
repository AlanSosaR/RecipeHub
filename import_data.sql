-- SQL Importación Masiva v5
DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Apple Crumble', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '10 granny smith apples');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '8 tbsp Demerara sugar');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Spice bag (including cinnamon, star anise, cloves, fennel seeds, peppercorn)');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'for the crumble');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, '400gr plain flour');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 4, '350gr butter');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 5, '300gr demerara sugar');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 6, '2 tbsp ginger powder');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 7, 'baker 15 min at 180*');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Besciamel', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '125g Butter');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '125g Flour');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2ltr Milk');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Beer Batter', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '380g plain flour');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '130g rice flour');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'pinch of salt');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '4 tsp baking powder');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '560ml Beer (Stanley lager)');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Biscoff Crumble', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 pack Biscoff');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1/2 block of butter');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Blend and bake for 5 minutes');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Blue Cheese Sauce', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2kg Stilton Cheese');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '4kg Sour Cream');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2tblsn Celery Salt');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1tblsn Garlic Powder');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '250ml Double Cream');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Bread and butter pudding (Byatt style)', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '500g double cream');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1/4 tsp nutmeg');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '4 eggs');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '8 egg yolk');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '200g sugar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '100g raisins (dont have to)');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Bring the double cream to a simmer. Mix everything else until dissolved completely. Slowly add the hot cream. Put to the side for now.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'Cut up Brioche or hot cross bun or any bread like croissant and slice into thing slices. If the crust is too crunchy, cut it off before.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, 'Take your oven mould, and butter it completely so it doesnt stick. Take your thinly sliced brioche bread and dip it in the custard, then fill the oven mould with it and leave no open spots. Add some extra custard after each layer and some raisins and keep layering until the mould is filled.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 4, 'Now put in a tray on an oven cloth, add water until half the mould is covered. Cover the mould with baking paper and foil and cook in the oven at 185°c for 1 hour. Check if its cooked.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 5, 'Once its cooked, place a heavy tray on it with weight and put in the fridge over night. The next day, slice portions out and serve hot with custard. Add sugar on top and caramelise.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Brine', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '19l water');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1kg table salt');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '700g sugar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '10 cloves garlic');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'handful of black peppercorn');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '5 Bayleave');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Mix everything in a big pot and bring to a boil. Let completely cool, before using as a brine.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Brownie', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '600g Butter melted');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1120g Caster Sugar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '8 Eggs');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '320g Flour');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '200g Coco powder');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '12g Salt');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '100g veg oil');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Splash vanilla extract');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '500g Chocolate palettes');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Mix flour, coco powder and salt. Mix melted butter with sugar, slowly add beaten eggs till fully incorporated. Add a splash of vanilla extract. Mix in chocolate palettes.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'Fill into gastro lined with parchment paper and bake at 175°c for 30-40 minutes. Let set fully in the fridge before cutting into portions.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'kg Chicken breast', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '5kg Chicken breast');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1lt Buttermilk');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '3 tbsp Franks hot sauce');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Butterfly chicken breast (about 150g each, fillets taken off)');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'For the flour;');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, '350g Plain flour');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 4, '250g Corn flour');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 5, '2tbsp Paprika');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 6, '2tbsp Garlic');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 7, '1tbsp table salt');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 8, 'Deep fry for at least 5 min');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Buffalo Sauce', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 Bottle Franks Sauce');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2kg Salted Butter');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Melt the butter, add Franks Sauce and then blitz together.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Epic Burger Sauce', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '180g Mayonnaise');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '120g Ketchup');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '80g Dijon Mustard');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '20ml green peppercorn brine');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1/2 Caramelized onion');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 Cloves Garlic grated');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1Tbsp Worcestershire Sauce');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 Dill Pickles finely diced');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Salt and pepper to taste');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'CAULIFLOWER CHEESE', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'make about 16');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1lt Milk');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '125gr Butter');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '125 gr plain flour');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '3 tbsp English Mustard');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'salt');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '4 Culiflower heads cut into small florets');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '50 gr grated cheddar');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Cauliflower Gratin', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '12x Cauliflower heads, portioned and blanched');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Bechamel:');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '6l Milk');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '420g Butter');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '420g flour');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '3 spanish onions, thinly sliced');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '5 cloves of garlic grated');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 star anise');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '6 cloves (number)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 tbsp Black peppercorn');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 Bay leaf');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 tbsp onion powder');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 tbsp garlic powder');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 tbsp Dijon mustard');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '3 handful of cheddar grated');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1tbsp MSG');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Salt and pepper to taste');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Melt the butter in a pot. Add Onions and cook colourless till tender. Meanwhile slowly heat up the Milk in a different pot, add all spices in a spice bag already and put into the milk.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'Once the onions are cooked, add the flour and cook it out for 4-5 minutes on medium low heat.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, 'Add the hot Milk in batches to the flour, stir till homogenous. Once all incorporated, bring to a simmer and take off the heat.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 4, 'Add cheese, mustard, MSG and mix till fully incorporated. Mix with the cauliflower and season to taste.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 5, 'On Sunday, fill side dishes with cauliflower gratin mix, add cheddar and parmesan on top.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Cesar Dressing', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '250g blanched garlic');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '250g capers');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '125g anchovy');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '125g lemon juice');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '200g mustard dijon');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2tbsp grated parmesan (pecorino fuck it)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'salt, pepper to taste');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '4 eggs, boiled 3 minutes');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '0.6 olive oil blendone');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Put the garlic in a pot and add cold water. Bring to a boil and discard water. Repeat 2 more times. Now put everything in a blender except the oil and blend until pasty. Now slowly add the oil like making a mayonnaise. Season to taste and put in the fridge.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'CHOCOLATE DELICE', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '200g egg yolk');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '100g caster sugar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Wisk together ^');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '600g dbl cream');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '600g milk');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Bring to boil ^');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Then add to egg and sugar mixture slowly, cook off on low heat til thickens by 30%');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, '700g 70% chocolate - melt in the hot custard');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, '300g dbl cream semi wipped -  fold in the chocolate custard');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 4, 'For the praline base;');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 5, '300g Hazelnuts');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 6, '225g Caster sugar');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 7, '150ml H2O');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 8, 'Cook off sugar and water, once happy with the colour, add toasted shelled hazelnut and poor on a flat tray.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 9, 'Once completely cold, blitz with 1 packet of digestive biscuit.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Citronette', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '500ml lemon juice');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '350g sugar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '70g salt');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1.7L veg oil');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Mix everything and reserve.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Creme Brûlée (makes 13 portions)', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2L Double cream');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '220g sugar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '30 egg yolk');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Vanilla');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Bring Cream to just a simmer and take off heat. Meanwhile, beat egg yolks and sugar together in a bowl, making sure not to incorporate too much air. Use a spatula to mix.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'Now add the hot cream slowly to the egg mix while mixing constantly. Pass through a sieve.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, 'Weigh out 180g per portion. But the dishes on a tray lined with a kitchen towel and fill the tray with hot water. Put in the oven.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 4, 'Cook at 120°c for about 15-25 minutes on fan 3! Check with wobble test. Put in the fridge and let cool for at least 4 hours.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Crumble', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '250g dark brown sugar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '500g butter, room temperature');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '750g plain flour');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'pinch of salt');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Mix everything together. Crumble everything on top of an oven tray and bake at 185°c for about 10 minutes. Let cool completely.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Minted Crushed Peas', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1kg Frozen Peas');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '100g butter');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '300ml water');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Salt');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Pepper');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Mint');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Curry Powder', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 tbsp  ground coriander seeds');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 tbsp  ground cumin seeds');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 ground cloves');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '6 cardamon');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 tbsp ground nutmeg');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 tbsp tumeric');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 tsp cayenne');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 tsp cinnamon');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Curry sauce', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 Onion');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 Carrots');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1L Veg Stock');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '100g butter');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '50g flour');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 chips cup apple juice');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 Tbsp curry powder');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1/2 tsp white pepper');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Slice Onion and Carrots thinly. Sweat onion and carrots in butter until soft. Meanwhile heat up the veg stock together with the apple juice.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'Once the vegetables are soft, add the flour, curry powder and white pepper and cook out the flour for a few minutes. Slowly add the veg stock until its thickened and combined. Blend till smooth and season to taste.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Custard', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '250ml Cream');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '250ml milk');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '60g sugar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '4 eggs');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'touch vanilla');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Bring the cream and milk with the vanilla just to a simmer. Take off the heat. Mix sugar and egg yolk with a spatula until smooth and the sugar is dissolved. Try not to incorporate too much air into the mix.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'Now slowly add the hot cream while constantly mixing. Once its all mixed, strain through a chinois and place in theodora. Use thicken program until you reached the desired consistency. Let cool in the fridge.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Fish Pie', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Makes 6');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '500ml whole milk');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '300ml double cream');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '300g skinless cod fillets');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '200g skinless salmon fillet');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '200g smoked haddock');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '150g raw peeled prawns');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '60g butter');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '60g plain flour');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '300g frozen peas');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '30g capers');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '30g chives (finely chopped)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '30g flat leaf parsley (finely chopped)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 tbsp Dijon mustard');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '3/4 tsp salt');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'For the potato topping');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1.2kg potato (king edward)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '200ml whole milk');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '100ml double cream');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '60g butter');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 egg yolk (beaten)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '3/4 spoon salt');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '50grcheddar (grated|)');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Pour milk and cream into a medium pan, bring to simmer and add the fish and prawns, poach in the simmering milk for about 2 minutes.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'drain the fish and reserve the poaching liquid.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, 'Wipe the pan, add the butter, bring to bubble, then stir in the flour, reduce the heat and cook for 8 minutes.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 4, 'Add half of the reserved liquid, bring back to a simmer, whisking continuously to prevent any lumps.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 5, 'Add the remaining liquid and cook until thick and smooth. Add the capers, parsley, chives, mustard and salt and mix well.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 6, 'Returne the drained fish to the pan a gently fold in the sauce.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 7, 'For the topping');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 8, 'Put the potatoes in a pan and add enough salted water to cover them. Bring to boil, then reduce the heat and simmer untill the potatoes are very tender. Drain the water, add the milk, double cream and butter to the pan and mash together with the potatoes until smooth.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 9, 'Add the yolks with the sat, mix well until incorporate.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 10, 'Cook the finished pie at 180* for about 20 min');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Fish Sauce Caramel (Thai)', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '800ml fish sauce');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '200ml water');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1kg caster sugar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'dash of sherry vinegar');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Put fish sauce, water and sugar into a stock pot, reduce by half over low heat.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'once happy with the consistency take off the heat add the sherry vinegar and stir in.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Gravy', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '20kg Veal Bones');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1kg Carrots');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 Celery');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '5 Onions');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 bottles red wine');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 can tomato paste');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '4 Bay leaves');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'black peppercorns');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Herbs');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '10l Chicken Stock');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Roast the bones in the oven, 45-50 minutes at 180°c.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'Meanwhile, cut the mire poix in walnut sized pieces and roast in a wide pot. Stir constantly on medium high heat till nicely coloured. About 25 minutes. Add tomato paste and keep roasting till nicely browned, making sure to not burn the bottom of the pan.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, 'Deglaze the pot with red wine. Scrap the pot bottom clean with a spatula. Reduce all the way down to a glaze. Add water.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 4, 'Once the bones are roasted, add everything to a big pot. Add hot water to the oven trays and scrap out everything and add to the pot as well. Cover with chicken stock, and ice water and slowly bring to a boil. Keep degreasing and taking of building foam. Just simmer all day. Take off the heat and pass through a cheese cloth. Keep the bones. Refrigerate the stock.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 5, 'The next day. Take the bones, add water and simmer for another 3-4 hours. Pass through a cheesecloth and refrigerate.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 6, 'The next day. Take the fat off the top of the stock. Put the stock on the stove and reduce to desired consistency and flavour. Refrigerate.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Green Peppercorn Sauce', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 Shallots finely Diced');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '100ml Brandy');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 Tbsp Cracked black peppercorn');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1l Gravy');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '450ml Cream');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 Tbsp Green peppercorns');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 Tbsp Dijon Mustard');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Guacamole', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 ripe avocados');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '12g fine sea salt');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '20ml lime juice');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Gyoza Dipping sauce', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1lt light Soy Sauce');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '150ml Sesame oil');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '30g Chilli Flakes');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '200g Miso Paste');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '200 Ginger Grated');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '250 ml Rice Vinegar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2lt water');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '30g Sesame Seeds mixed');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '500ml Honey');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Mix all together and store in fridge');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Harissa Ketchup', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1kg Ketchup');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '500g Rose Harissa');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Harissa Mayo', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1kg Mayo');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '500g Harissa');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'House Mayo', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '5 Egg yolks');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '30g White wine vinegar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1/2 Lemon juice');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '50g Dijon mustard');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '400ml Veg oil');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Salt');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Toffee Sauce', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2kg brown sugar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2kg unsalted butter');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2ltr double cream');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '15g maldon salt');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Vanilla essence to taste (optional)');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Melt Sugar slightly with salt and room temperature butter until dissolved. Once melted, take out of the heat and add double cream while whisking constantly.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'NAM FRIED CHICKEN', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '10kg chicken thigh');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 bunch x coriander');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '30x garlic cloves');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '300g x lemon grass');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '250g  fresh ginger');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '15x chillies');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '30g white pepper');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '120g caster sugar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '500ml soy');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '300 ml fish sauce');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '250 ml lime juice');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'let marinade over night');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'For breading, use 70% plain flour 30% corn flour');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'pre fry for 3 min at 175  and finish in the oven for about 5 min');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Korean BBQ Sauce', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1000g Gochujang');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '500g Ketchup');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '300g Soy Sauce');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '600g Honey/ Maple syrup');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '200g Brown Sugar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '30 cloves garlic');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '500ml Rice Vinegar');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Put everything together in a pot. Bring to a boil. After blend till smooth.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Lemon aioli', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '40gr eggs yolk');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '40gr dijon mustard');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '40 gr white vinegar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '375 ml veg oil');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '4 garlic cloves grated');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'salt to taste');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 lemon zest (peeled and finely chopped)');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Mac and Cheese', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Cheese sauce: (enough for 1kg of pasta)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1L Milk');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 Onion');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '80g flour');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '120g butter');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1tbsp onion powder');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 tbsp garlic powder');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1/2 tsp white pepper');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '100g Mozzarella');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '250g cheddar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '200g red leicester');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '100g parmesan');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '150g blue cheese sauce');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2tbsp dijon mustard');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Slowly heat up the Milk. In a pot, melt the butter and sweat the onions thinly sliced until soft.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'Once soft, add the flour and the spices and cook the flour for a few minutes. Slowly add the milk until you have a smooth béchamel sauce.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, 'Take off the heat, add all cheeses and dijon mustard and mix until everything is melted and smooth. Check for seasoning.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Mango Salsa', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Makes 400g');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 large ripe Mango( peeled and cut into 1cm dice)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'zest and juice of 1 lime');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 red onion, finely sliced');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 red chilli and finely chopped');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '20g coriander leaves and stalks roughly chopped');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2tsp olive oil');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'salt and freshly cracked pepper.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'MASHED POTATOES', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Potatoes for mash 5kg');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Milk 2,5kg');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Water To cover the potatoes');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Salt to taste.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Butter after the potatoes are cooked the butter have to be the same weight as the potatoes');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'Dont boil the potatoes. Leave always at simmer otherwise they break down and they loose all the amid and the mash will be like glue.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, 'Once you have them soft, peel from hot using a towel and weight and add the same amount of butter which have to be cold, add and mix well to incorporate it.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 4, 'Add salt to taste.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Swiss Meringue', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 egg white (make sure there is ZERO egg yolk in there)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '90g sugar');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Mix egg white and sugar. Put on a double boiler and heat up the mixture while you stir until about 62*c.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'Take off the heat, whip with a stand mixer on low to medium speed or a lot of elbow grease until cool.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, 'Spread on a tray or pipe and dry overnight at 50*c or in an Excalibur.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'MISO AIOLI', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '50g acqua faba');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '30g miso paste');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 garlic clove (grated)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '200ml olive oil');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 tbsp rice vinegar');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'blitz with hand blender acqua faba and garlic for seconds, then slowly start pouring olive oil, till emulsified.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'combine miso paste with 1 tbsp of watering the vinegar till smooth, then add to the aioli and blend again to combine together.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'NUT ROAST', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '(makes 2 loaf)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '500gr Lentils');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '500gr Mixed grains ( quinoa, frekkhe)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 Butternut Squash');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '120gr Harissa');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '250gr  Panko');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '200gr Smoked almonds');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Salt & Pepper to taste');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Start by prepping all the components,');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'Boill Lentils in salted water till mushy about 1 hour');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, 'Roast the Butternut Squash with Thyme, Sage & Garlic, salt pepper and olive oil, at 180* x about 30 min ( till soft, then scoop flash out of the skin)');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 4, 'Boill Grains in slightly salted water, about 15 to 20 min.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 5, 'Chop the smoked almonds.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 6, 'Mix all ingredients together, season to taste and then transfer into a double sides parchment lined mould , fill up until 3/4 of the mould.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 7, 'Bake at 180* x 45 minutes.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 8, 'Cool down overnight and slice 200gr x portion');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Onion Rings', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '6 italian white Onion, peeled and cut in thick slices and pulled into rings');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2L Buttermilk');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1.2L water');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '50g salt');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '40g white pepper');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '40g MSG');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '6g Cayenne');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '20g Tabasco');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Marinade the onion rings in the buttermilk mix for a minimum of 4 hours.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'To bread the onions, only use plain flour and panko. You need to double bread the onion rings.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Pesto Aioli', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1kg Mayonnaise');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '500g Pesto');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Piccalilly', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 Fennel bulb ( chopped into 2 cm cubes)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 Cauliflower(cut into small florettes)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 Onions, chopped into 2 cm cubes');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '200g green beans ( cut into small batons)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 red pepper, (cut into 2 cm dice)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 green pepper (cut into 2cm dice)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '300g salt');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '350ml apple cider vinegar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '200ml water');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '3tbsp hot mustard powder');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2tbsp corn flour');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1tbsp tumeric');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 tbsp cayenne pepper');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1tspchilli flakes');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 tsp mustard seeds');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2tbsp caster sugar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 teaspoon salt');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Put cubed vegetables in a large bowl.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'Heat 3 lt of water with 300g salt, whisk until salt dissolve. Poor the hot salted water over the veg and leave to salt for 4 hours.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, 'After 4 hours, drain and rinse in cold water. Leave to drain well.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 4, 'Meanwhile, make the piccalilly mixture, put all ingridients in a large sauce pan and whisk slowly, cook over low heat until thickened.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 5, 'Add the drained vegetables to the mixture and mix well.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Pizza Sauce', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 Cans of chopped tomatoes');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '60g of Salt');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Blend everything.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Pork Belly Braise', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 cup Sugar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '½  cup Table Salt');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '40g Peppercorn');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '40g Fennel Seeds');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1x Cinnamon Stick');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Water to cover pork belly');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'cook 3hrs on 175*, remove the bones and press for 1 night in the fridge.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'Dry the skin at 150* for 1h and leave to cool properly before cutting.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Ranch Dressing', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '130g Creme Fraiche');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '200g Mayonnaise');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '120g Buttermilk');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1.5 Tbsp chopped dill');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1.5 Tbsp chopped parsley');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1/2 bunch finely sliced chives');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '3 cloves garlic grated');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1/4 teaspoon onion powder');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 Tbsp lemon juice');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Salt and pepper to taste');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Red onion Chutney', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '10 Red Onion Sliced');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '500gr Dark Brown Sugar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '250ml Balsamic Vinegar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Olive oil');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'spice bag; (3 star anise,1 cinnamon, 2 bay leaves 4 cloves)');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'Caramelise the onion in the pan till they are sweet, then add in the sugar and vinegar, season to taste.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Pork Rib Stock', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '3ltr Coke');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '3ltr Beer');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '100g Coriander Seeds');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 x cinnamon');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 x Star anaise');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '100g Peppercorn');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 x Rib Sauce Bottle');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '100g Fennel Seeds');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '125g Paprika');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Water to cover ribs');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'ROAT PORK BELLY', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 Bonless Skin on Pork belly (about 5 kg)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '4 cooking onions (nicely diced)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '4 Granny Smith Apples ( green ones)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '6/8 leaves of Sage ( chopped)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 tbsp cooking oil');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'STUFFING');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Start by browning the diced onion in cooking oil, caramelised and soft add in the apples and sage and cook off till soft, season with salt and pepper to taste.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'ROLL');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, 'Put the stuffing in the meat side of the belly and roll it (nipples to be left outside. tight the roll with 8 to max 10 string pieces.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 4, 'Cut the roll in half');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 5, 'STEAM');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 6, 'Set the oven on 100* full steam, once heated transfer the pork bellys roll on oven rack and steam for 3 hours.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 7, 'COOL- DRY');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 8, 'Once cooled, transfer the rolls in the walking fridge, uncovered and as close to the fan possible, (on the oven rack) and leave over night.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 9, 'OVEN - DRY');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 10, 'Set oven temp to 120*, place rolls in the oven and dry for 1 hour, make sure juices dont fall on the skin, that will stop the crisping process.  Also be careful that the skin dont get too dark b y drying.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 11, 'Once out of the oven sprinkle table salt and let cool down.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 12, 'Let dry overnight in the walking fridge ( as close as possible to the fan)');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 13, 'ROAST');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 14, 'Before service, sprinkle more table salt over the skin, roast for 30 minutes at 180* and then 15 minutes at 220* (MAKE SURE SKIN DOESNT BURN) YOU ARE LOOKING FOR A POP COARN EFFECT.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 15, 'Let cool and slice');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Salsa', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 red onion diced');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '5 tomatoes diced');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 lime juice');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1/4 bunch coriander chopped');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'salt to taste');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'LAMB SHANK SHEPHERDS PIE', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Lamb shank 5kg');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Celery 1 bunch');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Carrots 15 number');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Onions 6 onions');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Bay leaf 5 leafs');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'White wine 500ml');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Black peppercorn 10 grains');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'CARROTS NDUJA AND LEEKS MIX');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'For 1 portion');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Carrot 1 carrot');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Leek 1/2 leek');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Lamb shank pulled 120g');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Nduja 20g');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Start from cooking the lamb:');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'Give to the lamb shanks a nice and gold colour pan frying them.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, 'Cut the carrots onion and celery and roast them in the oven with oil, black peppercorns and bay leafes.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 4, 'Once the veggie reach the nicest colour please deglaze them with white wine and cook until the alcohol is evaporated.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 5, 'Put all together into a gastro and braise them not covering the shanks as the result will be boiled instead.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 6, '175c x 2:45h.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 7, 'Plating the lamb:');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 8, 'Once the lamb are cooked, pull them from hot and be careful they might be some bones so please pay attention when do this step.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 9, 'Cut the carrots and leeks at brunoise and set them aside.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 10, 'In a pan fry the carrots until nice and gold and then add the leeks and nduja.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 11, 'Let melt the nduja and take out from the heat.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 12, 'Mix the veggie with the lamb shank and plate them adding a bit of lamb jus or veal jus.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 13, 'The portion of this mix is around 170/180g each plate.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 14, 'Once you plate and everything is set, pipe the mush potatoes on top and store in the fridge.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Sherry vinneigrette', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '300g dion mustard');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '500g sherry vinegar');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1lt veg oil');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Sriracha Ketchup', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 Bottle of sriracha');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1200g Ketchup');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Mix everything together.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Stanley´s hot chicken', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Prep chicken thighs and salt brine for 2 hours (see brine recipe). Leave in Buttermilk dip for frying.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'Buttermilk Dip:');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, '-	475ml Buttermilk');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 4, '-	30ml Hot Sauce');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 5, '-	30ml Pickle Juice');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 6, 'Flour Dredge: (6x for 10kg chicken)');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 7, '450g Plain flour');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 8, '450g Corn flour');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 9, '16g Table salt');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 10, '22g Garlic powder');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 11, '40g cayenne');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 12, '16g smoked paprika');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 13, 'Coat the chicken in the flour, make sure all wet spots are covered and dry. Fry for 4-5 minutes. Leave to cool');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Beef Stilton & Onion Pie', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Makes 6');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'For the crust;');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '300g Puff Pastry');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 egg yolk beaten with 1tsp of water');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'For the filling;');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '600g beef ( chuck or steak, cut 4cm thick)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '100g plain flour');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '40ml veg oil');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '4 spanish onion (peeled and halved, but with roots on)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '400g Paris mushrooms (halved)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1tbsp salt');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '300ml red wine');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 bay leaves');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '3 Thyme sprigs');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2lt beef stock');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '100g stilton');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1/2 tsp ground black pepper');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'To prepare the filling, put the beef in a roasting tray, dust with the floured toss the beef until all the flour has been absorbed by the meat. Add20 ml of the veg olio the tray and toss well tilll the meat is evenly coated. Put the tray in the oven at 220* and cook for 20 min till browned and liquid evaporated.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'While the beef is roasting, cut each onion half into 6 wedges. Put a large frying pan over medium heat, add the remaining 20ml of veg oiled warm up for 1 minute.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, 'Add the onions to the pan and cook, stirring frequently with a wooden spoon until brown. Add the mushrooms to the pan with half of the salt, and continue to cook fort about 4/5 minutes. Next add the wine, the herbs and bring to simmer.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 4, 'After the beef is been roasting for 20 minutes check if nicely browned. Once ready tip in the tray, onion, mushrooms, herbs and wine. top up with the beef stock, continue to cook for 10 minutes, at 240* then reduce to 180 for 1hour and 45 min.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 5, 'Once the beef falls a part, strain the liquid and toss it into a pot on medium heat, reduce until the liquid coats the back of a spoon. cool down then add the meat mixture, the crumbled stilton and voila.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Suet Pastry', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'MAKES 1kg');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '150g Butter (frozen)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '550g Self-Raising Flour');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '210g Suet (very cold)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '10g salt');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Half bunch tyme, leaves*');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '250ml ice-cold water');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Grate the frozen butter into a bowl and put back in the freezer until needed.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'Sift the flour into another bowl, whilst mixing slowly add; grated butter, suet, salt and thyme, mix for about 2 minutes, then slowly add in the cold water until the dough just comes together.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, 'Once happy with the consistency, flatten the dough slighytly, wrap in cling film and refrigerate for at least 30 min before using.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 4, 'Keep for up to 3 days  in the fridge, or 1 month in the freezer.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Sunday Carrots', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '10kg Carrots');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '4 Sticks Cinnamon');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '10 Star Anise');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1kg Butter');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '250ml White wine');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Stock');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Cut Carrots in the desired shape. Melt the butter in a large big pot. Add the cinnamon and Star Anise to release the aroma. Add carrots and slightly roast off.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'Deglaze with white wine, add stock till the carrots are just covered in enough liquid. Add a cartouche and cook until just tender.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, 'Colour the carrots in a hot pan for service, add a bit of cooking liquid and finish with butter. Garnish with chives.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'COD ROE EMULTION', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'INGREDIENTS:');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '500g of roe');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2or 3 lemon juice depend on the size');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 liter of veg oil');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '150ml water');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Remove the eggs from their bag, than start to blend them in the ROBOCUPE (please do not use vitamix), once the eggs are smooth start to add drop by drop the oil as you are doing a mayonnaise but slightly more gently, the oil will take longer than a normal mayo to absorb, if too much is added the mix WILL NOT emulsify.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'You will notice that the mix will start to act like a mayo, but becoming super thick straight away, in this moment you need to add some of the lemon juice  to loosen up than add again oil to thicken it up again. Once lemon juice is done start doing the same with the water (It may not need it all)');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, 'Once done store in the piping bags and let rest in the fridge for 1/2 hours before use as it will be warm.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Tartare Sauce', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '250g House Mayo');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '3 Shallots (thinly diced)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '50g capers');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '50g Cornichones');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1tbsp English mustard');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1tbsp Dill');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1tbsp Chives');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1/2 Lemon juice');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Triple Cooked Chips', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1st Cook:');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Cut potatoes and wash the starch off in cold water till the water runs clear. Put the chips into steaming trays. Dont overcrowd the trays! Steam in the oven for about 8 minutes. Leave in the trays and refrigerate overnight.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, '2nd Cook:');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 3, 'Heat oil to 140°c. Fry the chips for about 5 minutes in the oil. Refrigerate till completely cold.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 4, '3rd Cook: (for Service)');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 5, 'Fry at 190°c till nice golden brown, crispy and delicious. Season with Salt.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Vegetable Curry', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 White onions');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 Garlic Cloves ( finely sliced )');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1/3 Coriander  steams ( finely chopped )');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 match stick Ginger (grated)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '4 tbsp House Curry Powder');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1kg Chopped tomatoes');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1lt Coconut Milk');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1/2 Bunch of Coriander');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 Sweet potatoes ( peeled, diced and blunched )');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '500gr Chick peas ( cooked, no water )');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Salt to season');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'To serve Pan, coconut milk');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'Veggie Masala', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '3 tbsp house masala mix');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '3x cinnamon sticks');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 tbsp fennel seeds');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 tbsp coriander seeds');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 tbsp cumin');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '10x cardamom pods (cracked open, remove seeds)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Dry fry all spices together and set aside.');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '150g fresh ginger (peeled)');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '20 cloves garlic');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'Blend in thermomix and reserve.');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '6 large sliced onion');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 bunch coriander chopped');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 tsp tamarind paste, diluted in hot water and strained out the seeds');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 2,5kg tin chopped tomato');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 litres of Veg stock with 1 tbsp MSG');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '8 large potatoes peeled and chopped in good size chunks');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2x tins chickpeas with the water');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '2 aubergine chopped into cubes');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '1 400g tin tomato puree');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Fry Onions in Veg oil until golden. Add garlic and ginger paste. Fry until just cooked (dont burn). Add dry spices and Masala Mix. Cook out the Masala, stirring continuously. Add chopped tomato and cook out properly till dark and rich. Add tomato paste and cook, stirring till nice and golden.');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 2, 'Cover with Veg stock, add potatoes and Chickpeas. 5 Minutes before finishing the curry, add the aubergines. Once its cooked, reserve in the fridge.');
END $$;

DO $$
DECLARE
    v_recipe_id uuid;
BEGIN
    INSERT INTO public.recipes (user_id, name_es, description_es, created_from_ocr) 
    VALUES ('cf5ee75b-7182-4623-a8a0-fbeae25f4c61', 'YORKIE MIX', 'Importado desde Dropbox/RTF', true) 
    RETURNING id INTO v_recipe_id;

    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, 'X4 times:');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '4000g plain flour');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '4000g milk whole');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '4800g eggs whole');
    INSERT INTO public.ingredients (recipe_id, name_es) VALUES (v_recipe_id, '50g baking powder');
    INSERT INTO public.preparation_steps (recipe_id, step_number, instruction_es) VALUES (v_recipe_id, 1, 'Mix all together with hand blander and pass trough chinois.');
END $$;

