# Функция шифрования рельсовым методом
function rails_encrypt(text::String, key::String, k::Int)
    # Проверяем корректность размера ключа
    if length(key) > 2k
        error("Длина ключа не должна превышать 2k")
    end
    
    # Создаем сетку и матрицу
    grid_size = 2k
    grid = fill(' ', grid_size, grid_size)
    matrix = fill(' ', k, k)
    index = 1
    new_message = ""
    
    # Удаляем пробелы и приводим к верхнему регистру
    text = replace(uppercase(text), " " => "")
    
    # Заполняем начальную матрицу индексами
    for i in 1:k
        for j in 1:k
            matrix[i, j] = Char(index + 48) # Преобразуем число в символ
            index += 1
        end
    end
    
    # Заполняем основную сетку
    for i in 1:grid_size
        for j in grid_size:-1:1
            if grid[i, j] == ' '
                matrix = rotr90(matrix) # Поворачиваем матрицу
                # Проверяем границы при заполнении
                start_i = min(i+k-1, grid_size)
                end_i = max(i, 1)
                start_j = max(j-k+1, 1)
                end_j = min(j, grid_size)
                grid[end_i:start_i, start_j:end_j] = matrix[k:-1:1, k:-1:1]
            end
        end
    end
    
    index = 1
    arr = String[]
    
    # Размещаем текст в сетке
    for r in text
        checker = false
        for i in 1:grid_size
            for j in 1:grid_size
                if grid[i, j] == Char(index + 48) && !checker
                    if !(string(i+1, j) in arr) && !(string(i-1, j) in arr) && 
                       !(string(i, j-1) in arr) && !(string(i, j+1) in arr)
                        grid[i, j] = r
                        push!(arr, string(i, j))
                        checker = true
                    end
                end
            end
            if checker
                index += 1
                if index > k^2
                    index = 1
                    empty!(arr)
                end
                break
            end
        end
    end
    
    # Считываем зашифрованный текст по ключу
    for j in sort(collect(key))
        for i in 1:grid_size
            # Проверяем существование позиции
            if findfirst(j, key) ≤ grid_size
                char = grid[i, findfirst(j, key)]
                if isdigit(char)
                    char = ' ' # Заменяем цифры на пробелы
                end
                new_message *= char
            end
        end
    end
    
    return new_message
end

# Пример использования
text = "договор подписали"
key = "шифр"
k = 3 # Размер базовой матрицы

# Проверка корректности параметров
if length(text) > (2k)^2
    error("Текст слишком длинный для выбранной матрицы")
end

# Шифрование
encrypted = rails_encrypt(text, key, k)
println("Зашифрованный текст: $encrypted")
