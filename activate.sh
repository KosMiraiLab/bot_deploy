encrypt_env() {
    openssl enc -e -aes256 -pbkdf2 -iter 1000000 -in .env -out .env.enc
}

decrypt_env() {
    openssl enc -d -aes256 -pbkdf2 -iter 1000000 -in .env.enc -out .env
}
