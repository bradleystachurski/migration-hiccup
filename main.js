const hashes = []

for (const hash of hashes) {
  const buf = Buffer.from(hash, 'base64')
  const hex = buf.toString('hex')
  console.log(hex)
}
