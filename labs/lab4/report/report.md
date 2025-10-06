---
## Front matter
title: "Лабораторная работа №4"
subtitle: "Алгоритм Евклида"
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
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Целью данной лабораторной работы является реализация разных вариантов алгоритма Евклида

## Выполнение лабораторной
# Алгоритм Евклида

a, b = 10, 20
print(a,b)

def euclid(a: int, b: int) -> int:
    while a != 0 and b != 0:
        if a >= b:
            a %= b
        else:
            b %= a
    return a or b

euclid(a, b)

# Бинарный алгоритм Евклида

ef euclid_bin(a: int, b: int) -> int:
    g = 1
    while a % 2 == 0 and b % 2 == 0:
        a /= 2
        b /= 2
        g *= 2
    u, v = a, b
    while u != 0:
        if u % 2 == 0:
            u /= 2
        if v%2 == 0:
            v /= 2
        if u>=v:
            u -= v
        else:
            v -= u
    return g*v

euclid_bin(a, b)

# Расширенный алгоритм Евклида

def euclid_ext(a: int, b: int) -> tuple[int]:
    if a == 0:
        return (b, 0, 1)
    else:
        div, x, y = euclid_ext(b % a, a)
    return (div, y - ( b // a ) * x, x)

euclid_ext(a, b)

#Расширенный бинарный алгоритм Евклида

def euclid_bin_ext(a: int, b: int) -> tuple[int]:
    g = 1
    while a % 2 == 0 and b % 2 == 0:
        a /= 2
        b /= 2
        g *= 2
    u, v = a, b
    A, B, C, D = 1, 0, 0, 1
    while u != 0:
        if u % 2 == 0:
            u /= 2
            if A % 2 == 0 and B % 2 == 0:
                A /= 2
                B /= 2
            else:
                A = (A + b)/2
                B = (B - a)/2
        if v % 2 == 0:
            v /= 2
            if C % 2 == 0 and D % 2 == 0:
                C /= 2
                D /= 2
            else:
                C = (C + b)/2
                D = (D - a)/2
        if u>=v:
            u -= v
            A -= C
            B -= D
        else:
            v -= u
            C -= A
            D -= B
    return (g * v, C, D)

euclid_bin_ext(a, b)

# Вывод

В ходе выполнения данной лабораторной работы мы реализовали разные виды алгоритма Евклида
