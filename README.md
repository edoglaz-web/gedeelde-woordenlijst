# Gedeelde woordenlijst

Een simpele realtime woordenlijst. Meerdere mensen kunnen dezelfde lijst gebruiken. Dubbele woorden worden in de interface én via een unieke database-index tegengehouden.

## Direct proberen
Open `index.html` in een browser. Zonder Supabase draait de app in demo-modus en bewaart hij woorden lokaal in de browser.

## Online gedeeld maken
De meegeleverde `supabase.sql` maakt de tabel, unieke index, RLS-policies en realtime-publicatie aan.

1. Maak een project bij Supabase.
2. Run `supabase.sql` in SQL Editor.
3. Open `index.html` en vul bovenaan in het script `SUPABASE_URL` en `SUPABASE_KEY` in met je projectgegevens.
4. Host de map op bijvoorbeeld GitHub Pages, Netlify of Vercel. Omdat dit een statische app is, is geen eigen server nodig.

Voor productie is het aan te raden Supabase Auth toe te voegen als je wilt bepalen wie woorden mag toevoegen of verwijderen.
