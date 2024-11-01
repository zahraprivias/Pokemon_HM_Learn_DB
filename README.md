# Pokemon_HM_Learn_DB
Simple Bash program to find which HMs a Pokemon (Black/White) can learn.

Steps:
1. Data scraping with BeautifulSoup
   Data for Pokemon Black/White taken from [PokemonDB](https://pokemondb.net/black-white/hms).
2. Creating pokemon_hm database and table ([create.sql](https://github.com/zahraprivias/Pokemon_HM_Learn_DB/blob/main/create.sql)).
3. Inserting scraped data from [pokemon_hm.csv](https://github.com/zahraprivias/Pokemon_HM_Learn_DB/blob/main/pokemon_hm.csv) to table ([insert_data.sh](https://github.com/zahraprivias/Pokemon_HM_Learn_DB/blob/main/insert_data.sh)).
4. Running the program ([script.sh](https://github.com/zahraprivias/Pokemon_HM_Learn_DB/blob/main/script.sh)).
