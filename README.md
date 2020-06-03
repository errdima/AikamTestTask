# TestTaskAikam

Описание:
Данный сервис, на основании входных параметров(аргументы командной строки), типа операции и входного файла – 
извлекает необходимые данные из БД и формирует результат обработки в выходной файл.

Общий пример запуска  java -jar program.jar search input.json output.json 


В корне проекта лежит:
1. DB.sql - дамп БД
2. Файлы JSON для демонстрации: - inputSearch.json для запроса "search"
								- inputSearch2.json для запроса "search"
								- inputStat.json для запроса "stat"
3. connection.properties - информация для доступа к БД (В нем нужно указать свои данные для соединения с БД)

Для запуска:
1. Собрать проект:
~~~
mvn package
~~~
2. В папку target\ скопировать файлы примеров запросов (.json) и connection.properties
3. Экспортировать данные из DB.sql

Запуск из командной строки в папке target\:
~~~
java -jar TestTaskAikam-1.0.jar search inputSearch.json output.json
~~~
где search (или stat) - тип операции 
inputSearch.json - имя файла с входными данными в формате json
output.json - имя файла для записи результата работы программы (создается сам при первом запуске)
