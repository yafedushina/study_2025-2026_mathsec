---
## Front matter
lang: ru-RU
title: Лабораторная работа №3
subtitle: Шифрование граммированием
author: Федюшина Я. А. 
  - 
institute:
  - Российский университет дружбы народов, Москва, Россия
date: 1 октября 2025

## i18n babel
babel-lang: russian
babel-otherlangs: english

## Formatting pdf
toc: false
toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
---

# Информация

## Докладчик

:::::::::::::: {.columns align=center}
::: {.column width="70%"}

  * Федюшина Ярослава Андреевна
  * Студентка
  * Обучающийся на кафедре теории вероятностей и кибербезопасности
  * Российский университет дружбы народов

:::
::::::::::::::

# Вводная часть

## Цели и задачи

- Приобрести навыки шифрования граммированием на языке Julia

# Основная часть

## Задание

Реализовать алгоритм шифрования гаммированием конечной гаммой.

## Написание кода

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

Шифрование по гамме
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

## Выводы

В ходе выполнения данной лабораторной работы мы научились шифрованию граммировавнием на языке Julia. 
