-- Run this in Supabase > SQL Editor.
create table if not exists public.words (
  id uuid primary key default gen_random_uuid(),
  word text not null,
  created_at timestamptz not null default now()
);

-- Prevent duplicates at database level, even if two people submit at exactly the same time.
create unique index if not exists words_word_unique on public.words (word);

alter table public.words enable row level security;

drop policy if exists "Anyone can read words" on public.words;
create policy "Anyone can read words" on public.words
for select using (true);

drop policy if exists "Anyone can add words" on public.words;
create policy "Anyone can add words" on public.words
for insert with check (true);

-- Needed for realtime updates in the app.
do $$
begin
  if not exists (
    select 1
    from pg_publication_tables
    where pubname = 'supabase_realtime'
      and schemaname = 'public'
      and tablename = 'words'
  ) then
    alter publication supabase_realtime add table public.words;
  end if;
end $$;

-- Allow users to delete words from the shared list.
drop policy if exists "Anyone can delete words" on public.words;
create policy "Anyone can delete words" on public.words
for delete using (true);
