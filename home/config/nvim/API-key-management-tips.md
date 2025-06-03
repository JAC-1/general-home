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

## Storing and retrieving using pass and GnuPG (linux)

### Generating and storing

```bash
# Setup pass using gpg
gpg --gen-key
pass init <key-id>

# Insert the Api_key
pass insert <api_key_name_of_your_choosing>

# Showing

pass show <api_key_name_of_your_choosing>

```
