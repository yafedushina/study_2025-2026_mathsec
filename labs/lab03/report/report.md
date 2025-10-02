---
## Front matter
title: "Лабораторная работа №3"
subtitle: "Шифрование граммированием"
author: "Федюшина Ярослава Андреевна"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Приобрести навыки шифрования граммированием на языке Julia

# Задание

Реализовать алгоритм шифрования гаммированием конечной гаммой.

# Выполнение лабораторной работы

Пишем код на языке Julia:

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


# Выводы

В ходе выполнения данной лабораторной работы мы научились шифрованию граммировавнием на языке Julia. 
