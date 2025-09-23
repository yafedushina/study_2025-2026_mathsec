---
## Front matter
title: "Лабораторная работа №1"
subtitle: "Шифры простой замены"
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
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Целью работы является изучение алгоритмов шифрования Цезаря и Атбаш, принцип работы, реализация на Julia. 

# Задание

1. Реализовать шифр Цезаря с произвольным ключом k
2. Реализовать шифр Атбаш

# Выполнение лабораторной работы

Суть шифра Цезаря заключается в том, что происходит смещение всех букв по алфавиту в сообщенгии на некоторый коэффициент k. Декодирование происходит путем смещения в обратную сторону.  (рис. [-@fig:001]).

![Шифр Цезаря](image/1.png){#fig:001 width=100%}

Шифр Атбаш похож на шифр Цезаря, но в данном алгоритме разворачивается весь алфавит, а не какой то маленький сдвиг.  (рис. [-@fig:002]).

![Шифр Атбаш](image/2.png){#fig:002 width=100%}

# Выводы

В результате выполнения лабораторной данной работы мы научились реализовывать два алгоритма шифрования - Цезарь и Атбаш. Оба алгоритма были реализованы на языке Julia. 