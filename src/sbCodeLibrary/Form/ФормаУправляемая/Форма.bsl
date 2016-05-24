﻿
&НаКлиенте
Перем Ванесса;

&НаКлиенте
Перем КонтекстСохраняемый;

&НаКлиенте
Функция ПолучитьПутьКФайлОтносительноКаталогоFeatures(ИмяФайлаСРасширением)
	ПутьКФайлу = "";
	
	СостояниеVanessaBehavior = Ванесса.ПолучитьСостояниеVanessaBehavior();

	ПутьКТекущемуFeatureФайлу = СостояниеVanessaBehavior.ТекущаяФича.ПолныйПуть;

	ПутьКФайлу = Лев(ПутьКТекущемуFeatureФайлу, СтрНайти(ПутьКТекущемуFeatureФайлу, "features") - 1) + ИмяФайлаСРасширением;
	
	Возврат ПутьКФайлу;
КонецФункции

//---------------------------------------------------------------------------------------------------------------------

&НаКлиенте
//Допустим конфигурация запущена в режиме тестирования
//@КонфигурацияЗапущенаВРежимеТестирования()
Процедура КонфигурацияЗапущенаВРежимеТестирования() Экспорт
	ПутьКОтчету = ПолучитьПутьКФайлОтносительноКаталогоFeatures("ОтчетОСправочнике1.erf");
	Если ПустаяСтрока(ПутьКОтчету) Тогда
		ВызватьИсключение "Не удалось определить путь к отчету";		
	КонецЕсли;

	ИмяВременногоФайла = ПолучитьИмяВременногоФайла("txt");
	Если Не Ванесса.ОткрытьНовыйСеансTestClientИлиПодключитьУжеСуществующий("/out""" + ИмяВременногоФайла + """ /Execute " + ПутьКОтчету + "") Тогда
		ВызватьИсключение "Не смог подключить TestClient!";
	КонецЕсли;
	
	Сообщение = Новый СообщениеПользователю;
	Сообщение.Текст = "/out""" + ИмяВременногоФайла + """ /Execute " + ПутьКОтчету + "";
	Сообщение.Сообщить();	
	
КонецПроцедуры

&НаКлиенте
//И удалось подключиться к конфигурации запущеной в режиме тестирования
//@УдалосьПодключитьсяККонфигурацииЗапущенойВРежимеТестирования()
Процедура УдалосьПодключитьсяККонфигурацииЗапущенойВРежимеТестирования() Экспорт
	ТестКлиент = Новый ТестируемоеПриложение();
	
	ВремяОкончанияОжидания = ТекущаяДата() + 60;
	Подключен = Ложь;
	ОписаниеОшибкиСоединения = "";
	
	Пока Не ТекущаяДата() >= ВремяОкончанияОжидания Цикл
		Попытка
			ТестКлиент.УстановитьСоединение();
			Подключен = Истина;
			
			КонтекстСохраняемый.Вставить("ТестКлиент", ТестКлиент);
			
			Прервать;
		Исключение
			ОписаниеОшибкиСоединения = ОписаниеОшибки();
		КонецПопытки;
	КонецЦикла;
	
	Если Не Подключен Тогда
		ТестКлиент = Неопределено;
		
		ВызватьИсключение ОписаниеОшибкиСоединения;
	КонецЕсли;
КонецПроцедуры

//---------------------------------------------------------------------------------------------------------------------
