function caesar_cipher(text::String, shift::Int)
    alphabet = 'A':'Z'
    encrypted_text = ""

    for char in uppercase(text)
        if char in alphabet
            pos = findfirst(isequal(char), alphabet)
            new_pos = mod(pos + shift - 1, length(alphabet)) + 1
            encrypted_text *= alphabet[new_pos]
        else
            encrypted_text *= char 
        end
    end
    return encrypted_text
end

text = "hello"
shift = 3
println("зашифрованный текст: ", caesar_cipher(text, shift))