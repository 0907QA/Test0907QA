#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Удаление картинки для тестирования элемента справочника Товары

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий
	И я закрываю все окна клиентского приложения

Сценарий: Подготовительный тест 1
* Открываем справочник Товары
	И Я открываю навигационную ссылку "e1cib/list/Справочник.Товары"
* Открываем элемент справочника			
	Когда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке
		| 'Наименование' |
		| 'Босоножки'    |
	И в таблице "Список" я выбираю текущую строку
* Проверяем заполнение реквизита Картинка
	Если элемент формы с именем 'ФайлКартинки' имеет значение 'Новая картинка' тогда
		И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
		Тогда открылось окно 'Файлы'
		И в таблице "Список" я перехожу к строке:
				| 'Наименование'   |
				| 'Новая картинка' |
		И в таблице "Список" я удаляю строку
		Когда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку с именем 'Button0'
		И Я закрываю окно 'Файлы'
		И я нажимаю кнопку очистить у поля с именем "ФайлКартинки"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Босоножки (Товар) *' в течение 20 секунд
	Иначе
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				
Сценарий: Подготовительный тест 2
* Открываем справочник Товары
	И Я открываю навигационную ссылку "e1cib/list/Справочник.Товары"
* Открываем элемент справочника			
	Когда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке
		| 'Наименование' |
		| 'Босоножки'    |
	И в таблице "Список" я выбираю текущую строку
* Проверяем заполнение реквизита Картинка
	Если элемент формы с именем 'ФайлКартинки' имеет значение 'Новая картинка' тогда
		И я нажимаю кнопку очистить у поля с именем "ФайлКартинки"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Босоножки (Товар) *' в течение 20 секунд
	Иначе
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'