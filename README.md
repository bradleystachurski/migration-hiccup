# Migration 11 Recovery

## Steps

Install Docker

Copy LND data directory from Zap to `./data`

On Mac, the default is

```
~/Library/Application\ Support/Zap/lnd/bitcoin/mainnet/<zap-wallet-name>/data/
```

Build and start the Docker container

```
docker-compose build

docker-compose up -d

docker-compose exec lnd_btc bash
```

Once inside the container, get all invoices that are in an `ACCEPTED` state.

```
lncli --tlscertpath=/shared/lnd-tls-btc.cert --macaroonpath=/shared/lnd-admin-btc.macaroon listinvoices --pending_only | grep -i 'state'
```

Copy the `r_hash` of the invoice

Convert the `r_hash` from base64 to hex (see `main.js` for example)

Run

`lncli --tlscertpath=/shared/lnd-tls-btc.cert --macaroonpath=/shared/lnd-admin-btc.macaroon cancelinvoice $r_hash`

If the invoice was successfully cancelled, stdout will print `{}`

Stop the Docker container

`docker-compose down`

Backup `channel.db` in Zap directory (to `channel.db.bak`)

Copy `channel.db` from docker shared directory to Zap directory

Start Zap

Celebrate
