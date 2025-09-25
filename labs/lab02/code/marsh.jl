function route_encryption(text::String, password::String, n::Int)
    text = replace(lowercase(text), " " => "")
    m = ceil(Int, length(text) / n)
    text = text * "а"^(m*n - length(text))
    table = reshape(collect(text), m, n) 
    sorted_indices = sortperm(collect(password))
    cipher = Char[]
    for j in sorted_indices
        for i in 1:m
            push!(cipher, table[i, j])
        end
    end
    
    return join(cipher)
end

text = "нельзя недооценивать противника"
password = "пароль"
n = 6
println(route_encryption(text, password, n))
