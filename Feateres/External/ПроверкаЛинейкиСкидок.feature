#language: ru
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Проверка начисления скидки

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект> 
Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Создание Заказа клиента
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы клиентов'
	Тогда открылось окно 'Заказы клиентов'
	И в таблице "Список" я нажимаю на кнопку с именем 'СписокСоздать'
	Тогда открылось окно 'Заказ клиента (создание)'
* Заполняем вкладку основное 
	И из выпадающего списка с именем "Партнер" я выбираю точное значение '12 ИСТОРИЙ'
	И из выпадающего списка с именем "ХозяйственнаяОперация" я выбираю точное значение 'Реализация'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'КЭТ ООО'
	И я нажимаю кнопку выбора у поля с именем "Соглашение"
	Тогда открылось окно 'Соглашения об условиях продаж'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'   |
		| 'Продажа товара' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ клиента (создание) *'
	И я нажимаю кнопку выбора у поля с именем "Договор"
	Тогда открылось окно 'Договоры с контрагентами'
	И в таблице "Список" я активизирую поле с именем "СписокНаименование"
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ клиента (создание) *'
* Корректируем вкладку Дополнительно
	И я перехожу к закладке с именем "ГруппаДополнительно"
	И из выпадающего списка с именем "НалогообложениеНДС" я выбираю точное значение 'Продажа не облагается НДС'
* Заполняем вкладку Товары
	И я перехожу к закладке с именем "ГруппаТовары"
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыНоменклатура"
	Тогда открылось окно 'Номенклатура'
	И в таблице "СписокСтандартныйПоискНоменклатура" я перехожу к строке:
		| 'Наименование'                           |
		| 'Белье верха UN-UT-0006-02-2221 (Белый)' |
	И в таблице "СписокСтандартныйПоискНоменклатура" я выбираю текущую строку
	Тогда открылось окно 'Заказ клиента (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыХарактеристика"
	И в таблице "Товары" из выпадающего списка с именем "ТоварыХарактеристика" я выбираю по строке 'L'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличествоУпаковок"
	И в таблице "Товары" в поле с именем 'ТоварыКоличествоУпаковок' я ввожу текст '1,000'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '700,00'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыРассчитатьСкидкиНаценки'

Сценарий: Проверка линейки скидок: сумма от 0 до 1000 (исключая 1000)
* Проверяем, что если сумма от 0 до 1000 (исключая 1000) скидки нет
	И я запоминаю значение поля с именем 'ТоварыКоличествоУпаковок' таблицы 'Товары' как 'Количество'
	И я запоминаю значение выражения '?($Количество$ = "", 0, Число(СтрЗаменить($Количество$, " ", "")))' в переменную "КоличествоЧ"
	И я запоминаю значение поля с именем 'ТоварыЦена' таблицы 'Товары' как 'Цена'
	И я запоминаю значение выражения '?($Цена$ = "", 0, Число(СтрЗаменить($Цена$, " ", "")))' в переменную "ЦенаРуб"
	И я запоминаю значение поля с именем 'ТоварыПроцентАвтоматическойСкидки' таблицы 'Товары' как 'ПроцентСкидки'
	И я запоминаю значение выражения '?($ПроцентСкидки$ = "", 0, Число(СтрЗаменить($ПроцентСкидки$, " ", "")))' в переменную "ПроцентСкидкиПроц"
	И я запоминаю значение поля с именем 'ТоварыСуммаАвтоматическойСкидки' таблицы 'Товары' как 'СуммаСкидки'
	И я запоминаю значение выражения '?($СуммаСкидки$ = "", 0, Число(СтрЗаменить($СуммаСкидки$, " ", "")))' в переменную "СуммаСкидкиРуб"
	И я запоминаю значение поля с именем 'ТоварыСумма' таблицы 'Товары' как 'Сумма'
	И я запоминаю значение выражения '?($Сумма$ = "", 0, Число(СтрЗаменить($Сумма$, " ", "")))' в переменную "СуммаРуб"
	И я запоминаю значение поля с именем 'СуммаСкидки' как 'СуммаСкидкиПод'
	И я запоминаю значение выражения '?($СуммаСкидки$ = "", 0, Число(СтрЗаменить($СуммаСкидки$, " ", "")))' в переменную "СуммаСкидкиП"
* Расчитываем сумму скидки и сравниваем с полями  ТоварСкидка, ТоварСумма и СуммаСкидки в подвале формы
	И выражение внутреннего языка '$ЦенаРуб$ / 100 * $ПроцентСкидкиПроц$ = $СуммаСкидкиРуб$' Истинно
	И выражение внутреннего языка '$КоличествоЧ$ * $ЦенаРуб$ - $СуммаСкидкиРуб$ = $СуммаРуб$' Истинно
	И выражение внутреннего языка '$СуммаСкидкиРуб$ = $СуммаСкидкиП$' Истинно

Сценарий: Проверка линейки скидок: сумма 1000
* Изменяем значение суммы. Проверяем, что если сумма 1000 скидка 5%
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '1000,00'
	И я завершаю редактирование строки
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыРассчитатьСкидкиНаценки'
	И я запоминаю значение поля с именем 'ТоварыКоличествоУпаковок' таблицы 'Товары' как 'Количество'
	И я запоминаю значение выражения '?($Количество$ = "", 0, Число(СтрЗаменить($Количество$, " ", "")))' в переменную "КоличествоЧ"
	И я запоминаю значение поля с именем 'ТоварыЦена' таблицы 'Товары' как 'Цена'
	И я запоминаю значение выражения '?($Цена$ = "", 0, Число(СтрЗаменить($Цена$, " ", "")))' в переменную "ЦенаРуб"
	И я запоминаю значение поля с именем 'ТоварыПроцентАвтоматическойСкидки' таблицы 'Товары' как 'ПроцентСкидки'
	И я запоминаю значение выражения '?($ПроцентСкидки$ = "", 0, Число(СтрЗаменить($ПроцентСкидки$, " ", "")))' в переменную "ПроцентСкидкиПроц"
	И я запоминаю значение поля с именем 'ТоварыСуммаАвтоматическойСкидки' таблицы 'Товары' как 'СуммаСкидки'
	И я запоминаю значение выражения '?($СуммаСкидки$ = "", 0, Число(СтрЗаменить($СуммаСкидки$, " ", "")))' в переменную "СуммаСкидкиРуб"
	И я запоминаю значение поля с именем 'ТоварыСумма' таблицы 'Товары' как 'Сумма'
	И я запоминаю значение выражения '?($Сумма$ = "", 0, Число(СтрЗаменить($Сумма$, " ", "")))' в переменную "СуммаРуб"
	И я запоминаю значение поля с именем 'СуммаСкидки' как 'СуммаСкидкиПод'
	И я запоминаю значение выражения '?($СуммаСкидки$ = "", 0, Число(СтрЗаменить($СуммаСкидки$, " ", "")))' в переменную "СуммаСкидкиП"
* Расчитываем сумму скидки и сравниваем с полями  ТоварСкидка, ТоварСумма и СуммаСкидки в подвале формы
	И выражение внутреннего языка '$ЦенаРуб$ / 100 * $ПроцентСкидкиПроц$ = $СуммаСкидкиРуб$' Истинно
	И выражение внутреннего языка '$КоличествоЧ$ * $ЦенаРуб$ - $СуммаСкидкиРуб$ = $СуммаРуб$' Истинно
	И выражение внутреннего языка '$СуммаСкидкиРуб$ = $СуммаСкидкиП$' Истинно

Сценарий: Проверка линейки скидок: сумма от 1000 до 2000 (исключая 2000)
* Изменяем значение суммы. Проверяем, что если сумма 1000 скидка 5%
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '1300,00'
	И я завершаю редактирование строки
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыРассчитатьСкидкиНаценки'
	И я запоминаю значение поля с именем 'ТоварыКоличествоУпаковок' таблицы 'Товары' как 'Количество'
	И я запоминаю значение выражения '?($Количество$ = "", 0, Число(СтрЗаменить($Количество$, " ", "")))' в переменную "КоличествоЧ"
	И я запоминаю значение поля с именем 'ТоварыЦена' таблицы 'Товары' как 'Цена'
	И я запоминаю значение выражения '?($Цена$ = "", 0, Число(СтрЗаменить($Цена$, " ", "")))' в переменную "ЦенаРуб"
	И я запоминаю значение поля с именем 'ТоварыПроцентАвтоматическойСкидки' таблицы 'Товары' как 'ПроцентСкидки'
	И я запоминаю значение выражения '?($ПроцентСкидки$ = "", 0, Число(СтрЗаменить($ПроцентСкидки$, " ", "")))' в переменную "ПроцентСкидкиПроц"
	И я запоминаю значение поля с именем 'ТоварыСуммаАвтоматическойСкидки' таблицы 'Товары' как 'СуммаСкидки'
	И я запоминаю значение выражения '?($СуммаСкидки$ = "", 0, Число(СтрЗаменить($СуммаСкидки$, " ", "")))' в переменную "СуммаСкидкиРуб"
	И я запоминаю значение поля с именем 'ТоварыСумма' таблицы 'Товары' как 'Сумма'
	И я запоминаю значение выражения '?($Сумма$ = "", 0, Число(СтрЗаменить($Сумма$, " ", "")))' в переменную "СуммаРуб"
	И я запоминаю значение поля с именем 'СуммаСкидки' как 'СуммаСкидкиПод'
	И я запоминаю значение выражения '?($СуммаСкидки$ = "", 0, Число(СтрЗаменить($СуммаСкидки$, " ", "")))' в переменную "СуммаСкидкиП"
* Расчитываем сумму скидки и сравниваем с полями  ТоварСкидка, ТоварСумма и СуммаСкидки в подвале формы
	И выражение внутреннего языка '$ЦенаРуб$ / 100 * $ПроцентСкидкиПроц$ = $СуммаСкидкиРуб$' Истинно
	И выражение внутреннего языка '$КоличествоЧ$ * $ЦенаРуб$ - $СуммаСкидкиРуб$ = $СуммаРуб$' Истинно
	И выражение внутреннего языка '$СуммаСкидкиРуб$ = $СуммаСкидкиП$' Истинно

Сценарий: Проверка линейки скидок: сумма 2000
* Изменяем значение суммы. Проверяем, что если сумма 2000 скидка 10%
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '2000,00'
	И я завершаю редактирование строки
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыРассчитатьСкидкиНаценки'
	И я запоминаю значение поля с именем 'ТоварыКоличествоУпаковок' таблицы 'Товары' как 'Количество'
	И я запоминаю значение выражения '?($Количество$ = "", 0, Число(СтрЗаменить($Количество$, " ", "")))' в переменную "КоличествоЧ"
	И я запоминаю значение поля с именем 'ТоварыЦена' таблицы 'Товары' как 'Цена'
	И я запоминаю значение выражения '?($Цена$ = "", 0, Число(СтрЗаменить($Цена$, " ", "")))' в переменную "ЦенаРуб"
	И я запоминаю значение поля с именем 'ТоварыПроцентАвтоматическойСкидки' таблицы 'Товары' как 'ПроцентСкидки'
	И я запоминаю значение выражения '?($ПроцентСкидки$ = "", 0, Число(СтрЗаменить($ПроцентСкидки$, " ", "")))' в переменную "ПроцентСкидкиПроц"
	И я запоминаю значение поля с именем 'ТоварыСуммаАвтоматическойСкидки' таблицы 'Товары' как 'СуммаСкидки'
	И я запоминаю значение выражения '?($СуммаСкидки$ = "", 0, Число(СтрЗаменить($СуммаСкидки$, " ", "")))' в переменную "СуммаСкидкиРуб"
	И я запоминаю значение поля с именем 'ТоварыСумма' таблицы 'Товары' как 'Сумма'
	И я запоминаю значение выражения '?($Сумма$ = "", 0, Число(СтрЗаменить($Сумма$, " ", "")))' в переменную "СуммаРуб"
	И я запоминаю значение поля с именем 'СуммаСкидки' как 'СуммаСкидкиПод'
	И я запоминаю значение выражения '?($СуммаСкидки$ = "", 0, Число(СтрЗаменить($СуммаСкидки$, " ", "")))' в переменную "СуммаСкидкиП"
* Расчитываем сумму скидки и сравниваем с полями  ТоварСкидка, ТоварСумма и СуммаСкидки в подвале формы
	И выражение внутреннего языка '$ЦенаРуб$ / 100 * $ПроцентСкидкиПроц$ = $СуммаСкидкиРуб$' Истинно
	И выражение внутреннего языка '$КоличествоЧ$ * $ЦенаРуб$ - $СуммаСкидкиРуб$ = $СуммаРуб$' Истинно
	И выражение внутреннего языка '$СуммаСкидкиРуб$ = $СуммаСкидкиП$' Истинно

Сценарий: Проверка линейки скидок: сумма свыше 2000
* Изменяем значение суммы. Проверяем, что если больше 2000 скидка 10%
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '3000,00'
	И я завершаю редактирование строки
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыРассчитатьСкидкиНаценки'
	И я запоминаю значение поля с именем 'ТоварыКоличествоУпаковок' таблицы 'Товары' как 'Количество'
	И я запоминаю значение выражения '?($Количество$ = "", 0, Число(СтрЗаменить($Количество$, " ", "")))' в переменную "КоличествоЧ"
	И я запоминаю значение поля с именем 'ТоварыЦена' таблицы 'Товары' как 'Цена'
	И я запоминаю значение выражения '?($Цена$ = "", 0, Число(СтрЗаменить($Цена$, " ", "")))' в переменную "ЦенаРуб"
	И я запоминаю значение поля с именем 'ТоварыПроцентАвтоматическойСкидки' таблицы 'Товары' как 'ПроцентСкидки'
	И я запоминаю значение выражения '?($ПроцентСкидки$ = "", 0, Число(СтрЗаменить($ПроцентСкидки$, " ", "")))' в переменную "ПроцентСкидкиПроц"
	И я запоминаю значение поля с именем 'ТоварыСуммаАвтоматическойСкидки' таблицы 'Товары' как 'СуммаСкидки'
	И я запоминаю значение выражения '?($СуммаСкидки$ = "", 0, Число(СтрЗаменить($СуммаСкидки$, " ", "")))' в переменную "СуммаСкидкиРуб"
	И я запоминаю значение поля с именем 'ТоварыСумма' таблицы 'Товары' как 'Сумма'
	И я запоминаю значение выражения '?($Сумма$ = "", 0, Число(СтрЗаменить($Сумма$, " ", "")))' в переменную "СуммаРуб"
	И я запоминаю значение поля с именем 'СуммаСкидки' как 'СуммаСкидкиПод'
	И я запоминаю значение выражения '?($СуммаСкидки$ = "", 0, Число(СтрЗаменить($СуммаСкидки$, " ", "")))' в переменную "СуммаСкидкиП"
* Расчитываем сумму скидки и сравниваем с полями  ТоварСкидка, ТоварСумма и СуммаСкидки в подвале формы
	И выражение внутреннего языка '$ЦенаРуб$ / 100 * $ПроцентСкидкиПроц$ = $СуммаСкидкиРуб$' Истинно
	И выражение внутреннего языка '$КоличествоЧ$ * $ЦенаРуб$ - $СуммаСкидкиРуб$ = $СуммаРуб$' Истинно
	И выражение внутреннего языка '$СуммаСкидкиРуб$ = $СуммаСкидкиП$' Истинно
* Заполняю оставшиеся реквизиты
	И Я запоминаю значение выражения 'Строка(ТекущаяДата())' в переменную 'Дата'
	И в поле с именем 'ДатаОтгрузки' я ввожу текст '$Дата$'
* Провожу созданный документ
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Заказ клиента *' в течение 20 секунд