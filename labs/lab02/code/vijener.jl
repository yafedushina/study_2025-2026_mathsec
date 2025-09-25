# Функция для генерации ключа нужной длины
function generate_key(plaintext::String, key::String)
    key_length = length(key)
    plain_length = length(plaintext)
    
    new_key = ""
    key_chars = collect(key)  # Преобразуем ключ в массив символов
    for i in 1:plain_length
        new_key *= key_chars[mod1(i, key_length)]
    end
    return new_key
end

# Функция шифрования
function vigenere_encrypt(plaintext::String, key::String)
    # Создаем полный русский алфавит (33 символа)
    alphabet = ['А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П',
               'Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я']
    
    plaintext = uppercase(plaintext)
    key = uppercase(generate_key(plaintext, key))
    
    ciphertext = ""
    for (p, k) in zip(plaintext, key)
        if isletter(p)
            # Находим позиции букв в алфавите
            p_pos = findfirst(x -> x == p, alphabet)
            k_pos = findfirst(x -> x == k, alphabet)
            
            if p_pos !== nothing && k_pos !== nothing
                shift = (p_pos + k_pos - 2) % 33  # Корректируем индексацию
                ciphertext *= alphabet[shift + 1]  # Возвращаем в диапазон 1-33
            else
                ciphertext *= p
            end
        else
            ciphertext *= p
        end
    end
    return ciphertext
end

# Функция дешифрования
function vigenere_decrypt(ciphertext::String, key::String)
    alphabet = ['А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П',
               'Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я']
    
    ciphertext = uppercase(ciphertext)
    key = uppercase(generate_key(ciphertext, key))
    
    plaintext = ""
    for (c, k) in zip(ciphertext, key)
        if isletter(c)
            c_pos = findfirst(x -> x == c, alphabet)
            k_pos = findfirst(x -> x == k, alphabet)
            
            if c_pos !== nothing && k_pos !== nothing
                shift = (c_pos - k_pos + 33) % 33
                plaintext *= alphabet[shift + 1]
            else
                plaintext *= c
            end
        else
            plaintext *= c
        end
    end
    return plaintext
end

# Пример использования
plaintext = "криптография серьезная наука"
key = "математика"

# Шифрование
encrypted = vigenere_encrypt(plaintext, key)
println("Зашифрованный текст: $encrypted")

# Дешифрование
decrypted = vigenere_decrypt(encrypted, key)
println("Расшифрованный текст: $decrypted")
