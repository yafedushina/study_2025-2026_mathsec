---
## Front matter
title: "Шифры престановки"
subtitle: ""
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
#lot: true # List of tables
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

  Целью данной лабораторной работы является изучение алгоритмов шифрования перестановки, принцип работы и реализация на языке Julia. 

# Задание

Реализовать все шифры программно. 

## Выполнение лабораторной работы

#Маршрутное шифрование


![Маршрут](image/1.png){#fig:001 width=20%}

#Шифрование с помощью решеток

![Решетка](image/2.png){#fig:002 width=20%}
![Решетка](image/3.png){#fig:003 width=20%}

#Таблица Виженера

![Виженер](image/4.png){#fig:004 width=20%}
![Виженер](image/5.png){#fig:005 width=20%}

# Вывод

В ходе выполнения данной лабораторной работы были изучены три шифра перестановки, а так же были реализованы на языке Julia. 
