---
## Front matter
lang: ru-RU
title: "Лабораторная работа 4"

subtitle: Алгоритм Евклида
author: Федюшина Ярослава Андреевна
  - 
institute:
  - Российский университет дружбы народов, Москва, Россия

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

::::::::::::::

## Цель лабораторной работы

Целью данной лабораторной работы является реализация разных вариантов алгоритма Евклида

## Выполнение лабораторной работы

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

## Вывод

В ходе выполнения данной лабораторной работы мы реализовали разные виды алгоритма Евклида
