#!/bin/bash

# создаём каталог task с вложенными директориями
# task
#   dir1
#   dir2
#   dir3
#       dir4
mkdir task
cd task/
mkdir dir1
mkdir dir2
mkdir dir3
cd dir3/
mkdir dir4

# изменяем текущую директорию на task
cd ../

# создаём пустой файл task/dir2/empty
touch dir2/empty

# создаём файл task/dir2/hello.sh с таким содержанием:
# #!/bin/bash
# echo "$1, привет!"
touch dir2/hello.sh
echo '#!/bin/bash
echo "$1, privet!"' > dir2/hello.sh #не работает кириллица :(

# устанавливаем для task/dir2/hello.sh права rwxrw-r--
chmod 764 dir2/hello.sh

# сохраняем список файлов task/dir2 в task/dir2/list.txt
touch dir2/list.txt
ls dir2 > dir2/'list.txt'

# копируем содержимое каталога task/dir2 в каталог task/dir3/dir4
cp -r dir2 dir3/dir4

# записываем в task/dir1/summary.txt список файлов с расширением *.txt
# находящихся в task, включая поддиректории
touch dir1/summary.txt
find -name "*.txt" > dir1/summary.txt

# дописываем в task/dir1/summary.txt содержимое task/dir2/list.txt
cat dir2/list.txt >> dir1/summary.txt

# определяем переменную окружения NAME со значением "Всем студентам"
# NAME="Всем студентам" – не работает кириллица :(
NAME="Vsem studentam"

# запускаем task/dir2/hello.sh с переменной окружения NAME в качестве аргумента
# вывод скрипта должен дописаться в файл task/dir1/summary.txt
dir2/hello.sh $NAME >> dir1/summary.txt

# перемещаем с переименованием task/dir1/summary.txt в task/Практическое задание
#mkdir 'Практическое задание'  – не работает кириллица :(
mkdir 'Prakticheskoe zadanie' 
mv dir1/summary.txt 'Prakticheskoe zadanie'

# выводим на консоль содержимое файла task/Практическое задание
cat Prakticheskoe\ zadanie/summary.txt
# ищем в файле "Практическое задание" строки, которые содержат слово "dir"
# и затем отсортировываем их
grep "dir" Prakticheskoe\ zadanie/summary.txt | sort

# меняем текущую директорию на родительскую для task
#мы уже здесь 

# удаляем директорию task со всем содержимым
cd ../
rm -rf task
