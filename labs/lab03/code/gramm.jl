const RUS_ALPHABET = ['а','б','в','г','д','е','ж','з','и','й','к','л','м',
                      'н','о','п','р','с','т','у','ф','х','ц','ч','ш','щ',
                      'ъ','ы','ь','э','ю','я']

function char_to_index(c::Char)
    idx = findfirst(==(c), RUS_ALPHABET)
    return idx === nothing ? nothing : idx - 1
end

function index_to_char(i::Int)
    return RUS_ALPHABET[i+1]
end

# Шифрование по гамме
function gamma_cipher_mod33(text::String, gamma::String)
    text_chars = collect(lowercase(text))   
    gamma_chars = collect(lowercase(gamma))  
    n = length(text_chars)
    k = length(gamma_chars)
    result = IOBuffer()

    for i in 1:n
        t_idx = char_to_index(text_chars[i])
        g_idx = char_to_index(gamma_chars[(i - 1) % k + 1])
        if t_idx === nothing
            print(result, text_chars[i]) 
        else
            enc_idx = (t_idx + g_idx) % 33
            print(result, index_to_char(enc_idx))
        end
    end

    return String(take!(result))
end

println("Введите текст для шифрования:")
plaintext = readline()

println("Введите гамму:")
gamma = readline()

cipher_text = gamma_cipher_mod33(plaintext, gamma)
println("Зашифрованный текст: ", cipher_text)
