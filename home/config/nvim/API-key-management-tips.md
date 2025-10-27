# Storing and Managing API Keys

## Storing an API key using Macos keychain

### Storing

```bash
security add-generic-password -s "MistralAPI" -a "Justin" -w

```

### Retrieving

```bash
security find-generic-password -w -s "MistralAPI"
```

## Storing and retrieving using GnuPG (linux)

### Generating and storing

```bash
# Generate a random password
password=$(openssl rand -base64 32)

# Encrypt the password using GPG
echo "$password" | gpg --batch --yes --passphrase-fd 0 --output /path/to/api_key.gpg --symmetric

# Verify the encryption
gpg --batch --quiet --decrypt /path/to/api_key.gpg
```

### Decrypting

```bash
cmd: gpg --batch --quiet --decrypt /path/to/api_key.gpg
```
