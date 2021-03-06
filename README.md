# vanessa-stack-commons

[![Join the chat at https://gitter.im/silverbulleters/vanessa-stack-commons](https://badges.gitter.im/silverbulleters/vanessa-stack-commons.svg)](https://gitter.im/silverbulleters/vanessa-stack-commons?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![Build Status](http://ci.silverbulleters.org/buildStatus/icon?job=Vanessa-Stack-Commons-Develop)](http://ci.silverbulleters.org/job/Vanessa-Stack-Commons-Develop/)


Проект по созданию коллекции полезных библиотек для использования в рамках инструментария **Vanessa Stack**

#### Шаблон-алгоритм использования @писателей"

```
Процедура ???() Экспорт
	КаталогИнструментов = ПолучитьКаталогИнструментовНаСервере();
	
	ПолноеИмяФайлаРезультата = КаталогИнструментов + "examples\test.json";
	ПолноеИмяФайлаИнструмента = КаталогИнструментов + "sbFixturesWriter.epf";
	
	АдресФайлаВоВременномХранилище = "";
	
	ВыгрузитьФикстуруНаСервере(АдресФайлаВоВременномХранилище, ПолноеИмяФайлаИнструмента);
	
	Если Не ПустаяСтрока(АдресФайлаВоВременномХранилище) Тогда
		ПолучитьФайл(АдресФайлаВоВременномХранилище, ПолноеИмяФайлаРезультата, Ложь);
	КонецЕсли;
КонецПроцедуры

&НаСервереБезКонтекста
Функция ПолучитьКаталогИнструментовНаСервере()
	КаталогStackCommons = Константы.КаталогStackCommons.Получить();
	
	Возврат КаталогStackCommons;
КонецФункции

&НаСервере
Процедура ВыгрузитьФикстуруНаСервере(АдресФайлаВоВременномХранилище, ПолноеИмяФайлаИнструмента)
	ИмяВременногоФайла = ПолучитьИмяВременногоФайла("json");
	
	//-----------------------------------------------------
	Инструмент = ВнешниеОбработки.Создать(ПолноеИмяФайлаИнструмента, Ложь);

	Инструмент.ВыгрузитьФикстуру(ИмяВременногоФайла, Новый Массив);
	//-----------------------------------------------------

	Файл = Новый Файл(ИмяВременногоФайла);
	Если Файл.Существует() Тогда
		ДвоичныеДанные = Новый ДвоичныеДанные(ИмяВременногоФайла);
		АдресФайлаВоВременномХранилище = ПоместитьВоВременноеХранилище(ДвоичныеДанные, УникальныйИдентификатор);
		УдалитьФайлы(ИмяВременногоФайла);
	КонецЕсли;
КонецПроцедуры
```

[![ZenHub](https://raw.githubusercontent.com/ZenHubIO/support/master/zenhub-badge.png)] (https://zenhub.io)
