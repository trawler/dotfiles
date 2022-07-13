# Azure Auth
# These sensitive variables are stored in the keychain.
# To stop new variables: security add-generic-password -a "$USER" -s 'name_of_your_key' -w 'passphrase'

unset ARM_ENVIRONMENT ARM_SUBSCRIPTION_ID ARM_CLIENT_ID ARM_CLIENT_SECRET ARM_TENANT_ID ARM_ACCESS_KEY

export ARM_SUBSCRIPTION_ID=$(security find-generic-password -a "$USER" -s 'ARM_SUBSCRIPTION_ID' -w)
export ARM_ACCESS_KEY=$(security find-generic-password -a "$USER" -s 'ARM_ACCESS_KEY' -w)

export ARM_TENANT_ID=$(security find-generic-password -a "$USER" -s 'ARM_TENANT_ID' -w)
export ARM_CLIENT_ID=$(security find-generic-password -a "$USER" -s 'ARM_CLIENT_ID' -w)
export ARM_CLIENT_SECRET=$(security find-generic-password -a "$USER" -s 'ARM_CLIENT_SECRET' -w)

# GITHUB
export GITHUB_PASSWORD=$(security find-generic-password -a "$USER" -s 'GITHUB_PASSWORD' -w)
export GITHUB_TOKEN=$(security find-generic-password -a "$USER" -s 'GITHUB_TOKEN' -w)
