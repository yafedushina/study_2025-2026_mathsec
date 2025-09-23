function atbash_cipher(text::String)
    alphabet = 'A':'Z'
    encrypted_text = ""
    for char in uppercase(text)
        if char in alphabet
            pos = findfirst(isequal(char), alphabet)
            new_char = alphabet[length(alphabet) - pos + 1]
            encrypted_text *= new_char
        else
          encrypted_text *= char
        end
    end
    return encrypted_text
end

text = "hello world"
println("зашифрованный текст: ", atbash_cipher(text))