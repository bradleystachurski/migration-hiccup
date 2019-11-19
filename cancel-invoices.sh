hashes=(
  "vbFDmGfr0BugQYq2dlTGSgEAtz7q/SXaPSH27BZxt9Q="
  "se4JGRM71EzVQWRQKtUXAL8SAR0HsfwRunJqzsELMSU="
  "joU8ARVthaDLqWSGkFu2rz14edBBAm8wk0Chj6n+frk="
  "ri2+AhRR+UrLdrMn/DB6FaLAKBCXZxJtA0fEjlZ/j/c="
  "UgjJEfnyb0tO/bXa9ep5YhzHdSJl02bgRZmwwkiAKT4="
  "FBoYndQkzqsWIbL8rBM9zzmV4op7lm0QV6sWO3A35OY="
  "r+lyk/GwL/45OARx0mCdZagAuNNKqGbgESc77/7/gN4="
  "KlumT0ZwTt+dD5A/StJkKYwQOEc642cA5RqQ6Aqc5p0="
  "GMIbKuFJVh4nj18YU8kmI+2L5Vd1Si20kNE591NuaQI="
  "6zWKL2c8GkuxO6Svr9dNhCcGUrS7bKLUdKbnQ5QY7ro="
  "P9O4tBEhrSx1rbC6XBm9/Q5I6buoHAuSXYOPYRW1lXo="
  "kcQrjTrKGerFB+ezuyRzFzzJkcBZ6DfbOxWshzH/mSQ="
  "WoESg+HGmQYxNMLZ7gFEYi62QA0nj5DR8wr/KOgdMSQ="
  "RooxtQXbPfgdpsEOARR6Jw259U8JoVt3I35grnWK5Is="
  "/NeQtqviOuSMoFFa1WVC5DZBps57lGb3voLQs3wfxEM="
  "U6kxiTL0Xd1FLYGKsQu5YRmCvAIya7fStXB253ubSsc="
  "qaWYm/iTrrOe6LdCJHx6J7Nq5ARgRAqdO8/uH/vxdg8="
  "wcqabOWATlbO/ud2bfpJn3og0rphulkiQaR6RTin4zo="
  "V4w+wBMmj01uXCBF7TrIbl9KrVFQq4g/23qJ3pef774="
  "rHM8zBjQwI61NZyobgVk8c336NgzxJcxFaFfe+pbtvI="
  "ROWHu2WJA2hULNfqUawfnm4ENyDJ/XEcwibEgQCkXsU="
  "lec5IXLEcbtDVSHSY6m7zWFnBiBXnWBQh3K51yJ1j4M="
  "vb6s/yF2ZbgxhftcjkERQEhKw1QZv87ACbX+w0ut9sU="
  "liiPvpdgI38iaQN/OEK3UeuqkIc8KXCxC7nM94hPojA="
  "XOmfDqONV4FbbNdiN8ux9FH2R04xTdiNsmNgtZ6t5n8="
  "Wj7FDchOHA/BlW6rbq2GPRvFOlkRyf54/5bNxOOap5k="
  "NvTit0+laDpxT4Bs15NeI1uAqAMnstJFNc2NYbdNsOQ="
)

for rhash in "${hashes[@]}"; do
  lncli --tlscertpath=/shared/lnd-tls-btc.cert --macaroonpath=/shared/lnd-admin-btc.macaroon cancelinvoice $rhash
done
exit 0

