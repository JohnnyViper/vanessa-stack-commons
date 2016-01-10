﻿#encoding: utf-8
#language: ru

Функционал: Построчное получение feature файла                                                                                                            
	Как пользователь библиотек Commons                                                                                                                    
	Я хочу построчное чтение feature файла                                                                                                                
	Чтобы иметь возможность построчно забирать и обрабатывать данные, в том числе получить определенную строку                                            
	
Контекст:
	Дано Обработка использующая библиотеки Commons

Сценарий: Построчное чтение всего feature-файла 
	Когда Существуют feature-файлы
	И я посылаю команду библиотеке Commons "ПолучитьПострочноТекстFeatureФайла" с массивом feature-файлов
	Тогда в ответ получаю JSON файл 
	И в файле существует массив переданных feature-файлов
	И каждому feature-файлу соответствует вложенная информация
	И во вложенной информации существует "Имя" feature-файла
	И во вложенной информации существует "Служебные данные" feature-файла
	И во вложенной информации существует вложенная структура "Заголовок" feature-файла
	И во вложенной информации существует вложенная структура "Контекст" feature-файла
	И во вложенной информации существует вложенная структура "Сценарий" feature-файла

Сценарий: Получение строки feature-файла по номеру
	Когда
	И
	Тогда

Сценарий: Получение отрывка feature-файла между номерами строк
	Когда
	И
	Тогда
