QGIS-xtopo v0.2.20201213
================
![GitHub Logo](/docs/splash.png)

Topographic rendering style for QGIS and data preparation scripts

QGIS-xtopo это набор инструментов, предназначенных для создания карт, пригодных для печати. Цель проекта **не** в автоматическом создании готовых карт, а в попытке максимально упростить этот процесс.

### Системные требования

  Сильно зависят от объёма загружаемых данных. Для области размером 20х20 км в среднем будет достаточно ПК, удовлетворяющего минимальным требованиям.
  
  * Минимальные
     * Процессор: Intel Core-i5 / AMD Ryzen 5
     * Оперативная память: 8 Гб
     * Свободное место на диске: 5 Гб
   
  * Рекомендуемые
     * Процессор: Intel Core-i7 / AMD Ryzen 7
     * Оперативная память: 16+ Гб
     * Свободное место на диске: 20+ Гб
  
  * **Windows 10 x64** версия 1903 или более поздняя со сборкой 18362 или более поздней версии, или **Linux x64** любой (в теории) версии, где запустится **docker**.

**Проект состоит из трёх частей:**

1. Проект [QGIS](https://qgis.org/ru/site/) с топографическим картостилем.
2. Скрипты для подготовки данных для проекта [QGIS](https://qgis.org/ru/site/) на основе [OpenStreetMap](https://www.openstreetmap.org/) и данных рельефа, локальный [Overpass API](https://wiki.openstreetmap.org/wiki/RU:Overpass_API) сервер.
3. Графический интерфейс

Всё необходимое для работы находится в контейнере [Docker](https://ru.wikipedia.org/wiki/Docker), размещённом на [DockerHub](https://hub.docker.com/repository/docker/xmd5a2/qgis-xtopo). В нём запускаются скрипты для подготовки данных. Также возможно запустить QGIS прямо из контейнера. Скрипты получают данные OSM через Overpass API.

[Docker](https://ru.wikipedia.org/wiki/Docker) — программное обеспечение для автоматизации развёртывания и управления приложениями в средах с поддержкой контейнеризации

[QGIS](https://ru.wikipedia.org/wiki/QGIS) — свободная кроссплатформенная [геоинформационная система (ГИС)](https://ru.wikipedia.org/wiki/%D0%93%D0%B5%D0%BE%D0%B8%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%B0%D1%8F_%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0)

[OpenStreetMap (OSM)](https://ru.wikipedia.org/wiki/OpenStreetMap) — некоммерческий веб-картографический проект по созданию силами сообщества участников — пользователей Интернета подробной свободной и бесплатной географической карты мира

[Overpass API](https://wiki.openstreetmap.org/wiki/RU:Overpass_API) — доступный только для чтения [API](https://ru.wikipedia.org/wiki/API), который позволяет извлекать выборочные данные из базы OSM по пользовательскому запросу



### Содержание
   1. [Установка](https://github.com/xmd5a2/qgis-xtopo#1-%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0)
   2. [Инициализация](https://github.com/xmd5a2/qgis-xtopo#2-%D0%B8%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F)
   3. [Подготовка данных](https://github.com/xmd5a2/qgis-xtopo#3-%D0%BF%D0%BE%D0%B4%D0%B3%D0%BE%D1%82%D0%BE%D0%B2%D0%BA%D0%B0-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85)
   4. [Настройка](https://github.com/xmd5a2/qgis-xtopo#4-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0)
   5. [Получение и обработка данных OSM, обработка рельефа](https://github.com/xmd5a2/qgis-xtopo#5-%D0%BF%D0%BE%D0%BB%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B8-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85-osm-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D1%80%D0%B5%D0%BB%D1%8C%D0%B5%D1%84%D0%B0)
   6. [Запуск QGIS](https://github.com/xmd5a2/qgis-xtopo#6-%D0%B7%D0%B0%D0%BF%D1%83%D1%81%D0%BA-qgis)
   7. [Работа с QGIS](https://github.com/xmd5a2/qgis-xtopo#7-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0-%D1%81-qgis)
   8. [Удаление QGIS-xtopo](https://github.com/xmd5a2/qgis-xtopo#8-%D1%83%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-qgis-xtopo)

### 1. Установка
#### Windows:
  1. [Установить docker](https://docs.docker.com/get-docker/)
  
     Если после перезагрузки появится окно *"WSL 2 installation is incomplete"* то, не закрывая его, перейдите [по ссылке](https://aka.ms/wsl2kernel) в сообщении. В разделе **"Скачивание пакета обновления ядра Linux"** скачайте и установите файл по ссылке **"Скачайте последнюю версию пакета обновления ядра Linux в WSL 2"**. После этого в окне *"WSL 2 installation is incomplete"* нажмите *Restart* либо перезагрузите компьютер. После запуска убедитесь что *docker* работает:
     * В области системных уведомлений слева от часов найдите скрытый (над стрелочкой) значок с белым корабликом, откройте окно менеджера *docker* и убедитесь что слева внизу окна есть надпись с зелёным кругом: *"Docker running"*. Если круг красный то возможно требуется переустановить *docker*, либо доустановить компоненты *WSL 2*.
     
     ![docker tray](/docs/docker_tray.png)   ![docker status](/docs/docker_status.png)
 
 2. [Установить VcXsrv X Server](https://sourceforge.net/projects/vcxsrv/) (Next -> Install -> Close) для запуска QGIS (проще говоря графического интерфейса для подготовки карты) из *docker* контейнера.
 
 3. [Скачать графический интерфейс для подготовки данных](https://github.com/xmd5a2/qgis-xtopo/releases/latest): **qgis-xtopo-gui.exe**. Как таковой установки программа не требует. Её нужно просто запустить.
 
 
  
#### Linux:
  1. [Установить docker](https://docs.docker.com/get-docker/)
  
       Нужно настроить запуск *docker* из под обычного пользователя: [инструкция](https://docs.docker.com/engine/install/linux-postinstall/). Все дальнейшие действия **не требуют прав суперпользователя (root)**.

  2. [Скачать графический интерфейс для подготовки данных](https://github.com/xmd5a2/qgis-xtopo/releases/latest): **qgis-xtopo-gui**. Установки не требует. Нужно просто запустить.

     или (для работы из командной строки)

       ```
       docker pull xmd5a2/qgis-xtopo:latest&&mkdir -p qgis-xtopo&&a=(run prepare_data populate_db exec_qgis clean)&&rm -f qgis-xtopo/*.*&&for f in "${a[@]}";do wget -nv -nc https://github.com/xmd5a2/qgis-xtopo/raw/master/docker_${f}.sh -P ./qgis-xtopo;done&&cd qgis-xtopo&&chmod +x *.sh
       ```
     
      В текущем каталоге будет создан каталог **qgis-xtopo**, откуда необходимо запускать все последующие скрипты, либо использовать команды `прямого запуска docker` (приведены в справке как альтернативный вариант). _**Этот шаг нужен только для удобства запуска. Его можно пропустить если вы хотите запускать docker из командной строки**_. Требуется **wget**.

     
### 2. Инициализация
   Для инициализации QGIS-xtopo необходимы:
   * **Каталог, в котором будут храниться данные проекта**. Его размер может достигать 10-20 Гб и более, в зависимости от размера обрабатываемой области, поэтому убедитесь что на устройстве достаточно свободного места.
   * **(опционально) Каталог, в котором хранятся исходные данные рельефа (полный набор для всего мира)**. Если у вас уже скачаны эти данные то путь к этому каталогу необходимо указать при инициализации через `docker_run` ниже. Путь не должен содержать пробелов! Не уверены - пропускайте.
      
     Запустите скрипт `docker_run` в каталоге **qgis-xtopo**, скачанном на **[шаге 1.2](https://github.com/xmd5a2/qgis-xtopo#1-%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0)**, с параметрами. Их имена (-n, -d и т.п.) и значения разделяются пробелами. Нужно указать минимум **1** параметр: **путь_к_каталогу_с_проектами**.

      **Пример:**
      ```
      ./docker_run.sh -d ~/qgis_projects -b "https://www.openstreetmap.org/#map=15/-8.9/-140.1" -o external -g -s -x
      ```
      Эта команда создаст в домашнем каталоге пользователя каталог проектов с именем *qgis_projects*, а внутри него каталог проекта *automap* (значение по умолчанию). Скопирует в каталог с проектами файл [**config.ini**](https://github.com/xmd5a2/qgis-xtopo#4-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0) и прочие служебные файлы, задаст в config.ini область охвата из ссылки с сайта OpenStreetMap, а также автоматическую загрузку рельефа и данных OSM с внешнего Overpass сервера. [Подготовка данных](https://github.com/xmd5a2/qgis-xtopo#3-%D0%BF%D0%BE%D0%B4%D0%B3%D0%BE%D1%82%D0%BE%D0%B2%D0%BA%D0%B0-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85) будет запущена автоматически. После её завершения будет запущен QGIS, который откроет полученный проект.
      * `-d [путь_к_каталогу_с_проектами]`
      
        Путь к каталогу с проектами.  Если каталог не существует то он будет создан. **обязательный параметр**

      * `-n [имя_проекта]`
      
        Имя проекта. По умолчанию **automap**.

      Поддерживаются **необязательные** параметры (их можно задать позже):
      * `-b [lon_min,lat_min,lon_max,lat_max | "https://www.openstreetmap.org/#map={z}/{x}/{y}"]`
      
        **Границы зоны охвата (bbox)**: здесь вы можете указать зону охвата в географических координатах, а также можно **подставить в значение этого параметра ссылку с [OpenStreetMap](https://www.openstreetmap.org/). Важно: ссылка должна быть заключена в двойные кавычки!** Использование ссылки в качестве границы зоны охвата даёт приблизительные границы. Советы по формированию строки с помощью географических координат находятся в [**разделе 4**](https://github.com/xmd5a2/qgis-xtopo#4-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0).
      * `-o [external | docker]`
        
        Задаёт тип сервера Overpass.
          * external: если вы хотите использовать **внешний Overpass сервер**, то добавьте в конец команды параметр `-o external`. Преимущества и недостатки такого использования рассмотрены в [**разделе 3**](https://github.com/xmd5a2/qgis-xtopo#3-%D0%BF%D0%BE%D0%B4%D0%B3%D0%BE%D1%82%D0%BE%D0%B2%D0%BA%D0%B0-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85). Будет задана опция [**config.ini**](https://github.com/xmd5a2/qgis-xtopo#4-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0) `overpass_instance=external` и использован сервер [Kumi Systems](https://overpass.kumi.systems/).
          * docker: сервер Overpass внутри *docker* (значение по умолчанию)
      * `-x`
      
        Процесс подготовки данных для проекта состоит из нескольких шагов ([инициализация](https://github.com/xmd5a2/qgis-xtopo#2-%D0%B8%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F), [подготовка данных](https://github.com/xmd5a2/qgis-xtopo#3-%D0%BF%D0%BE%D0%B4%D0%B3%D0%BE%D1%82%D0%BE%D0%B2%D0%BA%D0%B0-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85), [получение и обработка данных OSM, обработка рельефа](https://github.com/xmd5a2/qgis-xtopo#5-%D0%BF%D0%BE%D0%BB%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B8-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85-osm-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D1%80%D0%B5%D0%BB%D1%8C%D0%B5%D1%84%D0%B0), [запуск QGIS, открытие проекта](https://github.com/xmd5a2/qgis-xtopo#6-%D0%B7%D0%B0%D0%BF%D1%83%D1%81%D0%BA-qgis-%D0%BE%D1%82%D0%BA%D1%80%D1%8B%D1%82%D0%B8%D0%B5-%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B0)). Параметр `-x` запускает эти шаги друг за другом автоматически. Если вы не задали опцию `-o external` то по умолчанию будет использоваться значение `-o docker`, то есть сервер Overpass внутри *docker*. Скрипт остановится перед получением данных из OSM и попросит вас выполнить пункты из **[раздела 3](https://github.com/xmd5a2/qgis-xtopo#3-%D0%BF%D0%BE%D0%B4%D0%B3%D0%BE%D1%82%D0%BE%D0%B2%D0%BA%D0%B0-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85): 3.1.i (скачать экстракт данных OSM), 3.1.ii (поместить полученные файлы в каталог путь_к_каталогу_с_проектами/имя_проекта/osm_data/)** (Please download OSM extract from https://protomaps.com/extracts or http://download.geofabrik.de and place it into osm_data_dir). Выполните запрос и нажмите любую клавишу для продолжения. Если всё пройдёт успешно то откроется QGIS с вашим проектом, запущенный из *docker*.
      * `-g`
      
        Обработка рельефа. Если не указано то рельеф обрабатываться **не будет**. Будет задана опция [**config.ini**](https://github.com/xmd5a2/qgis-xtopo#4-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0) `generate_terrain=true`.
      * `-s`
      
        **Автоматически загрузить данные рельефа** SRTM 30m. В целом эти данные не являются самыми лучшими из доступных (особенно в лесистых районах), но подходят для большинства областей мира. Если результат вас не устраивает то вы можете использовать другие данные, что описано в [**разделе 3.2**](https://github.com/xmd5a2/qgis-xtopo#3-%D0%BF%D0%BE%D0%B4%D0%B3%D0%BE%D1%82%D0%BE%D0%B2%D0%BA%D0%B0-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85). Будут задана опция [**config.ini**](https://github.com/xmd5a2/qgis-xtopo#4-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0) `download_terrain_tiles=true`.
      * `-t [путь_к_каталогу_с_данными_рельефа]`
      
        Если вы собираетесь использовать уже загруженный самостоятельно **полный набор данных рельефа**, то нужно добавить в конец команды строку `-t путь_к_каталогу_с_данными_рельефа`

     **Непосредственный запуск docker**
   
     Альтернативный вариант запуска. Не требуется выполнять если вы выполнили команду `docker_run`. Подставьте переменные описанные выше в следующую команду. Если вы не используете **путь_к_каталогу_с_данными_рельефа** то **уберите** из следующей команды строчку `--mount type=bind,source=**путь_к_каталогу_с_данными_рельефа**,target=/mnt/terrain \`.

     ```
     docker run -dti --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -e LANG=ru_R.UTF-8 \
      --name qgis-xtopo \
      -e PROJECT_NAME_EXT=**имя_проекта** \
      -e BBOX_STR=**границы зоны охвата** \
      -e OVERPASS_INSTANCE=**overpass_сервер[external | docker]** \
      -e GENERATE_TERRAIN=**обрабатывать рельеф[true | false]** \
      -e DOWNLOAD_TERRAIN_DATA=**загрузить_данные_рельефа[true | false]** \
      -e RUN_CHAIN=**запустить_все_шаги_подготовки_данных[true | false]** \
      --mount type=bind,source=**путь_к_каталогу_с_проектами**,target=/mnt/qgis_projects \
      --mount type=bind,source=**путь_к_каталогу_с_данными_рельефа**,target=/mnt/terrain \
      xmd5a2/qgis-xtopo:latest
     docker exec -it --user user qgis-xtopo /app/init_docker.sh
     ```
  Скрипт создаст в каталоге с проектами каталог с указанным именем. В каталог c вашими проектами будет скопирован каталог **icons**, содержащий иконки для проекта QGIS. В подкаталог с именем вашего проекта будет скопирован проект QGIS. `docker_run` не перезаписывает уже существующие данные, поэтому можно не опасаться что запуск команды что-то удалит. Поэтому если вы хотите **восстановить данные проекта по умолчанию**, то удалите их и выполните инструкции в [**разделе 2**](https://github.com/xmd5a2/qgis-xtopo#2-%D0%B8%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F) снова.

### 3. Подготовка данных
   Поддерживается два основных варианта получения данных от сервера Overpass:
   1. С помощью сервера внутри *docker* контейнера **(рекомендуемый способ)**
   2. С помощью внешнего сервера

   Работа с **Overpass сервером, установленным внутри *docker***, является самым надёжным вариантом подготовки данных для QGIS-xtopo. Для больших и детализированных областей это наилучший вариант. Однако он требует ручного получения данных OSM и заполнения БД. Этот процесс может занимать существенное время.
   
   Существует возможность получения данных OSM с **внешних серверов Overpass**. Такой вариант не требует подготовки БД и может обеспечить быстрый старт, но на большие запросы сервер может отвечать отказом или выдавать неполные данные. Подробная настройка этого варианта использования описана в [**разделе 4**](https://github.com/xmd5a2/qgis-xtopo#4-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0) (переменные **overpass_instance=external** и **overpass_endpoint_external**).

   **Если будет использоваться сервер Overpass внутри *docker* контейнера**, то нужно заполнить его собственную базу данных (БД) данными, полученными из OSM. БД хранится на вашем ПК в каталоге **путь_к_каталогу_с_проектами/overpass_db**. Она нужна только на время работы скрипта `docker_prepare_data` в [**разделе 5**](https://github.com/xmd5a2/qgis-xtopo#5-%D0%BF%D0%BE%D0%BB%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B8-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85-osm-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D1%80%D0%B5%D0%BB%D1%8C%D0%B5%D1%84%D0%B0).
   1. **Заполнить БД Overpass**
      1. Скачать экстракт данных OSM. Чем обширнее область тем больше файл экстракта, что замедляет обработку данных. Поддерживаются форматы *pbf, o5m, osm.bz2, osm*.
         * [Protomaps](https://protomaps.com/extracts) (область выгрузки сильно ограничена)
           1. Выбрать интересующую область на карте с помощью кнопок **Rectangle Selection (Прямоугольное выделение)** либо **Polygon Selection (Полигональное выделение)**.
           2. Задать имя экстракта (поле **Name this area**) (опционально)
           3. После окончания подготовки данных сервером Protomaps нужно скачать их (**Download PBF**)
         * [http://osm.sbin.ru/osm_dump/](http://osm.sbin.ru/osm_dump/) Данные по России и ближнему зарубежью.
         * [download.geofabrik.de](https://download.geofabrik.de/). Скачайте страну/область с наименьшим приемлемым охватом. Например: не стоит качать всю центральную Россию если вам нужна только Московская область.
         * [BBBike extracts](https://extract.bbbike.org)
         * [OSMaxx](https://osmaxx.hsr.ch)
         * JOSM
      2. Поместить полученные файлы в каталог **путь_к_каталогу_с_проектами/имя_проекта/osm_data/**. Поддерживается несколько экстрактов одновременно.
      3. Заполнить БД Overpass в *docker*.
        ```
        ./docker_populate_db.sh
        ```
        
         Скрипт попросит вас выполнить пункты **3.1.i (скачать экстракт данных OSM), 3.1.ii (поместить полученные файлы в каталог путь_к_каталогу_с_проектами/имя_проекта/osm_data/)** (Please download OSM extract from https://protomaps.com/extracts or http://download.geofabrik.de and place it into osm_data_dir). Выполните запрос и нажмите любую клавишу для продолжения.
         
         или `docker exec -it --user user qgis-xtopo /app/populate_db.sh`
         
   2. **Получить данные рельефа (опционально)**
   
      **Если вы хотите использовать рельеф то не забудьте задать опцию **generate_terrain=true** в **config.ini** ([**раздел 4**](https://github.com/xmd5a2/qgis-xtopo#4-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0)).**

      Доступно три варианта использования данных:
      
      * **Автоматически загрузить данные SRTM30m (рекомендуется)**. Для этого нужно при инициализации указать опцию `-s true` ([**раздел 2**](https://github.com/xmd5a2/qgis-xtopo#2-%D0%B8%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F)), или задать в **config.ini** опцию **download_terrain_tiles=true** ([**раздел 4**](https://github.com/xmd5a2/qgis-xtopo#4-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0)).

      или
      * **Использовать полный набор тайлов для всего мира**, скачанный вручную. Поддерживаются только тайлы размером 1х1 градус. Они должны иметь имена, соответствующие общепринятым правилам наименования SRTM. Например: *N51E005.tif*. Поддерживаются форматы GeoTIFF (tif) и HGT (hgt), а также zip архивы с файлами в этих форматах (один архив на файл). Данные должны находиться в каталоге, который был задан в [**шаге 2**](https://github.com/xmd5a2/qgis-xtopo#2-%D0%B8%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F) (опция `-t`) при запуске *docker* контейнера. Необходимо задать в **config.ini** опцию **get_terrain_tiles=true** ([**раздел 4**](https://github.com/xmd5a2/qgis-xtopo#4-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0)).
      
      или
      * **Использовать фрагментарные данные** (несколько тайлов рельефа, покрывающих только нужную область), скачанные вручную. Если предыдущие два способа вам не подходят, то на [**шаге 5**](https://github.com/xmd5a2/qgis-xtopo#5-%D0%BF%D0%BE%D0%BB%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B8-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85-osm-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D1%80%D0%B5%D0%BB%D1%8C%D0%B5%D1%84%D0%B0) скрипт `docker_prepare_data` попросит вас вручную скачать и поместить файлы в каталог **путь_к_каталогу_с_проектами/имя_проекта/input_terrain/**.

        Некоторые из подходящих источников данных рельефа:
        * [Рельеф Земли (составлено из SRTM 30м,90m, EU-DEM, LIDAR data, ALOS DEM, ArcticDEM, MERIT DEM) [2020]](https://rutracker.org/forum/viewtopic.php?t=5393970) (torrent) **(рекомендуется)**
        * [MERIT DEM](http://hydro.iis.u-tokyo.ac.jp/~yamadai/MERIT_DEM/)
        * [ALOS DEM](https://www.eorc.jaxa.jp/ALOS/en/aw3d30/index.htm)
        * [Lidar Europe Data](https://data.opendataportal.at/dataset/dtm-europe)
        * [CGIAR-CSI SRTM](http://srtm.csi.cgiar.org/srtmdata/)
        * [ArcticDEM](https://www.pgc.umn.edu/data/arcticdem/)

### 4. Настройка
  Конфигурационный файл проекта называется **config.ini**. Он находится здесь: **путь_к_каталогу_с_проектами/qgisxtopo-config/config.ini**. В нём задаются параметры, которые используются в [**шаге 3**](https://github.com/xmd5a2/qgis-xtopo#3-%D0%BF%D0%BE%D0%B4%D0%B3%D0%BE%D1%82%D0%BE%D0%B2%D0%BA%D0%B0-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85) и [**шаге 5**](https://github.com/xmd5a2/qgis-xtopo#5-%D0%BF%D0%BE%D0%BB%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B8-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85-osm-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D1%80%D0%B5%D0%BB%D1%8C%D0%B5%D1%84%D0%B0). **true** - да, **false** - нет.
  
  Обычно менять файл вручную не требуется, но если вы хотите использовать рельеф без указания опции `-s` в [**шаге 2**](https://github.com/xmd5a2/qgis-xtopo#2-%D0%B8%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F) то нужно для опции **generate_terrain** установить значение **true** (см. [**раздел 3.2**](https://github.com/xmd5a2/qgis-xtopo#3-%D0%BF%D0%BE%D0%B4%D0%B3%D0%BE%D1%82%D0%BE%D0%B2%D0%BA%D0%B0-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85))
  
   * **project_name=имя_каталога_проекта**: имя каталога проекта. Не должно содержать пробелов. Задаётся [**в разделе 2**](https://github.com/xmd5a2/qgis-xtopo#2-%D0%B8%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F) при запуске *docker* контейнера.
   * **bbox=[lon_min,lat_min,lon_max,lat_max | "https://www.openstreetmap.org/#map={z}/{x}/{y}"]**: границы зоны охвата в географических координатах системы [WGS 84](https://ru.wikipedia.org/wiki/WGS_84). Координаты записываются в градусах в формате десятичной дроби (например 41.12) через запятую (*минимальная долгота, минимальная широта, максимальная долгота, максимальная широта*, то есть *лево,низ,право,верх*). Удобно получать **bbox** через https://boundingbox.klokantech.com/ . В левом нижнем углу страницы нужно выбрать формат **CSV**. Также можно задать ссылку с сайта [OpenStreetMap](https://www.openstreetmap.org/). Ссылка должна быть заключена в двойные кавычки.  **(обязательный параметр!)**
   * **array_queries=(список запросов)**: список запросов к Overpass, которые будут выполнены на [**шаге 5**](https://github.com/xmd5a2/qgis-xtopo#5-%D0%BF%D0%BE%D0%BB%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B8-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85-osm-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D1%80%D0%B5%D0%BB%D1%8C%D0%B5%D1%84%D0%B0). По умолчанию указаны все возможные запросы, но вы можете сократить этот список по своему усмотрению. Обратите внимание что некоторые запросы зависят от других. Эти зависимости описаны в **config.ini (Query dependencies)**. Обычно не требуется менять этот список.
   * **overpass_instance=[docker | external | local | ssh]**: определяет какой сервер Overpass будем использовать **(важный параметр!)**. По умолчанию: **docker**.
      * **docker**: внутри *docker* **(рекомендуется)**. Самый надёжный вариант. Для использования необходимо выполнить [**шаг 3.1**](https://github.com/xmd5a2/qgis-xtopo#3-%D0%BF%D0%BE%D0%B4%D0%B3%D0%BE%D1%82%D0%BE%D0%B2%D0%BA%D0%B0-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85) (заполнить БД Overpass).
      * **external**: находится в интернете и доступен по http(s). Как правило не обеспечивает достаточной надёжности при значительных объёмах запрашиваемых данных.
        * **overpass_endpoint_external="адрес_сервера"**. Список доступных серверов здесь: [ссылка1](https://wiki.openstreetmap.org/wiki/Overpass_API#Public_Overpass_API_instances), [ссылка2](https://wiki.openstreetmap.org/wiki/RU:Overpass_API#.D0.92.D0.B2.D0.B5.D0.B4.D0.B5.D0.BD.D0.B8.D0.B5).
        Использование удалённого сервера является самым простым способом получить данные OSM. Однако из-за различных ограничений результат не всегда оказывается стабильным. Некоторые сервера не позволяют делать много запросов в течение короткого времени и блокируют вас. Можете попробовать следующие сервера:
          * "https://overpass.kumi.systems/api/interpreter"
      * **local**: установлен на локальной машине
        * **overpass_endpoint_local="путь_к_файлу_osm3s_query**. Например: "/path/to/your/overpass/osm3s_query --db-dir=/path/to/overpass_db" (с кавычками)
      * **ssh**: через ssh. Например: "ssh user@server '/path/to/overpass/osm3s/bin/osm3s_query'" (с кавычками).
   * **overpass_endpoint_docker_use_bbox=[true | false]**: обрезать экстракт OSM по границам зоны охвата (**bbox**) перед заполнением БД Overpass при использовании **overpass_instance=docker**. По умолчанию **true**. Может быть полезно выключить эту опцию если вы хотите заполнить БД бОльшей областью, чем требуется для одного проекта, и вы хотите сделать много проектов, использующих одну и ту же БД.
   * **overpass_endpoint_docker_clean_db=[true | false]**: очищать БД Overpass перед её заполнением при использовании **overpass_instance=docker**. Если **false** то БД будет дополнена. По умолчанию **true**.

   * **generate_terrain=[true | false]**: обработка рельефа. Эта переменная влияет **на все вложенные переменные**, относящиеся к рельефу. Если она установлена в **false** то рельеф обрабатываться не будет.
      * **download_terrain_tiles=[true | false]**: автоматически загрузить данные рельефа SRTM 30m
      * **get_terrain_tiles=[true | false]**: использовать каталог с данными рельефа, который был задан в [**шаге 2**](https://github.com/xmd5a2/qgis-xtopo#2-%D0%B8%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F). Если этот параметр установлен в **false** то будет использоваться каталог **путь_к_каталогу_с_проектами/имя_проекта/input_terrain**, куда вы самостоятельно можете скопировать данные рельефа для области проекта. Их имена могут быть произвольными. Поддерживаются форматы GeoTIFF (tif) и HGT (hgt), а также zip архивы с файлами в этих форматах. Опция несовместима с опцией **get_terrain_tiles**.
      * **generate_terrain_hillshade_slope=[true | false]**: создавать карту затенения рельефа (отмывку) и карту уклонов
        * **terrain_resample_method=[cubicspline | lanczos]**: метод масштабирования исходных данных рельефа. **cubicspline** даёт менее детальную картинку без артефактов, а **lanczos** напротив, более детальную, но с артефактами в виде колец
      * **generate_terrain_isolines=[true | false]**: создавать изолинии высот (изогипсы)
        * **isolines_step=[10 | 25 | 50 | 100 | 200]**: шаг изолиний. Из данных рельефа будут извлечены линии с одинаковой высотой с заданным шагом.
        * **smooth_isolines=[true|false]**: сглаживание изолиний. Обычно не требуется.
   * **manual_coastline_processing=[true | false]**: ручная обработка береговой линии (**coastline**) мирового океана. Дело в том что автоматическая обработка занимает достаточно много времени. Тем больше, чем более детальна береговая линия. Иногда требуется получить карту большой области со сложным берегом и ждать времени нет. В таком случае вы можете включить эту опцию и обработать береговую линию вручную в JOSM. Рекомендуется отдельно запросить её, оставив в массиве **array_queries** только **coastline** и запустить скрипт `docker_prepare_data` ([**шаг 5**](https://github.com/xmd5a2/qgis-xtopo#5-%D0%BF%D0%BE%D0%BB%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B8-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85-osm-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D1%80%D0%B5%D0%BB%D1%8C%D0%B5%D1%84%D0%B0)). В нужный момент скрипт остановит выполнение и попросит вручную достроить береговую линию до полигона, включающего в себя мировой океан в пределах заданного **bbox**, избегая пересечений и неправильной геометрии. Путь к файлу: **путь_к_каталогу_с_проектами/имя_проекта/vector/coastline.osm**. После этого следует в окне выполнения `docker_prepare_data` нажать любую клавишу.

### 5. Получение и обработка данных OSM, обработка рельефа
  Сделав все необходимые приготовления нужно запустить скрипт
  ```
  ./docker_prepare_data.sh
  ```
  
  или
  ```
  docker exec -it --user user qgis-xtopo /app/prepare_data.sh
  ```
  Он сгенерирует карту затенения рельефа, карту уклонов, изолинии высот. Также сделает необходимые запросы к серверу Overpass и обработает их с помощью алгоритмов QGIS и GRASS. Векторные данные (данные OSM и изолинии высот) находятся в каталоге **путь_к_каталогу_с_проектами/имя_проекта/vector**, а растровые (карта затенения рельефа, карта уклонов) в каталоге **путь_к_каталогу_с_проектами/имя_проекта/raster**.
  
  Если какой-то запрос выполняется слишком долго либо завершается с ошибкой, то вы можете пропустить его, вручную отредактировав **config.ini** ([**раздел 4**](https://github.com/xmd5a2/qgis-xtopo#4-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0)). Массив запросов называется **array_queries**. Узнать имя проблемного запроса просто - в выводе `docker_prepare_data` есть строчки вида **=== (4 / 143) Downloading water...**. **water** и есть искомое имя. Уберите его из массива **array_queries** в **config.ini** и запустите `./docker_prepare_data.sh` снова.

### 6. Запуск QGIS, открытие проекта
  Полученный проект QGIS можно открыть двумя способами:
  * С помощью QGIS, установленной внутри *docker* контейнера **(рекомендуется)**:
    * `./docker_exec_qgis.sh`
    
      или
    * `xhost +local:docker && docker exec -it --user user qgis-xtopo /app/exec_qgis.sh`

  * Локально установленной QGIS. Требуется QGIS последней версии и GRASS 7.x+.

  QGIS сообщит что не все слои были найдены и предложит вам выбрать что с ними делать (**Handle Unavailable Layers**). Наличие таких слоёв как правило означает что в данной области в базе OSM отсутствуют объекты такого типа. Нужно нажать кнопку **Удалить недоступные слои**, а затем **OK**. Пустые слои будут удалены из проекта и не будут мешать.

### 7. Работа с QGIS
#### 1. Настройка внешнего вида карты
   1. **Слои**
   
         Проект QGIS состоит из слоёв. Панель с их списком находится в левой части окна QGIS. Каждый слой содержит различные классы объектов (дороги, леса, дома и т.п.). Чем выше слой тем позднее он отрисовывается, т.е. находится "выше" нижележащих слоёв.
         
         Чтобы вписать слой целиком на экран, откройте его контекстное меню правой кнопкой мыши и выберите **Увеличить до слоя**.

         Вероятно вам потребуется выключить либо включить некоторые слои (галочка слева от имени слоя). Это зависит от ваших требований к карте, а также от количества и качества данных OSM в загруженной области. Слоёв больше сотни и визуальный поиск их затруднён, поэтому для поиска проще всего воспользоваться строкой поиска, находящейся под панелью слоёв (**Type to locate**). Наберите часть названия слоя и выберите слой в списке результатов.
         
         Есть возможность приостановить отрисовку карты. Для этого уберите галочку **Отрисовка**, которая находится в правом нижнем углу. Не забудьте про неё!
         1. **Рельеф**
            1. **Изолинии высот (изогипсы)**
            
                 По умолчанию изолинии высот выключены т.к. их отрисовка занимает много времени. Рекомендуется включать их для отладки и перед экспортом.
               * Обычные: *[TERRAIN] isolines regular*
               * На ледниках: *[TERRAIN] isolines glacier*
               
                 Если раскрыть свойства слоя изолиний в списке слоёв (стрелочка слева от имени слоя) то появится список подслоёв: *1000, 200, 100, 50, 25, 10*. Эти подслои отвечают за то, насколько часто будут рисоваться изолинии. Кроме того, их частота зависит от крутизны склонов и масштаба карты.
                 
                 -----------------
                 
                 **Для равнин** подходят подслои *10, 50, 100, 1000* (**остальные выключить!**)
                 
                 **Для горной местности** обычно подходят подслои *50, 100, 1000* или *100, 1000* (**остальные выключить!**)
 
                 **Для горной местности с очень крутыми склонами при масштабе 1:50000 и выше** обычно подходят подслои *200, 1000* (**остальные выключить!**)
                 
                 -----------------
                 
                 <details>
                 <summary>Подслои включают в себя изолинии со следующими высотами (в метрах) (нажмите чтобы развернуть):</summary>
  
                 * 1000: *1000, 2000, 3000* и т.п.
                 * 200: *200, 400, 600* и т.п, исключая *1000*. Сочетается **только с подслоем 1000**.
                 * 100: *100, 200, 300* и т.п, исключая *1000*. **Не сочетается с подслоем 200**.
                 * 50: *50, 150, 250* и т.п., исключая *100, 1000*. **Не сочетается с подслоем 200**.
                 * 25: *25, 75, 125, 175* и т.п., исключая *50, 100, 1000*. **Не сочетается с подслоем 10 и 200**.
                 * 10: *10, 20, 30, 40* и т.п, исключая *50, 100, 1000*. **Не сочетается с подслоем 200**.
                 </details>
                 
                 По умолчанию **шаг изолиний** (параметр **isolines_step** в [**config.ini**](https://github.com/xmd5a2/qgis-xtopo#4-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0)) равен **10**. Это означает что **будут подготовлены** все подслои, **кратные 10**, и можно будет включить подслои *10, 50, 100, 200, 1000*. А если **шаг изолиний** равен **25**, то можно включить подслои *25, 50, 100, 200, 1000*.
                 
                 Если вы хотите изменить шаг изолиний которые **будут подготовлены** для проекта, то нужно отредактировать параметр **isolines_step** в [**config.ini**](https://github.com/xmd5a2/qgis-xtopo#4-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0), убедившись что опции **generate_terrain**,**generate_terrain_isolines** включены (**=true**). Затем следует повторно запустить [**шаг 5**](https://github.com/xmd5a2/qgis-xtopo#5-%D0%BF%D0%BE%D0%BB%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B8-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85-osm-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D1%80%D0%B5%D0%BB%D1%8C%D0%B5%D1%84%D0%B0). Можно очистить массив запросов **array_queries** чтобы не тратить время на повторную их обработку (**array_queries=()**). Чтобы вернуть массив к первоначальному состоянию, нужно заменить его **полным массивом запросов**, который находится в **config.ini** (**# Complete list of available queries**).
                 
                 Если обработка изолиний на [**шаге 5**](https://github.com/xmd5a2/qgis-xtopo#5-%D0%BF%D0%BE%D0%BB%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B8-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85-osm-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D1%80%D0%B5%D0%BB%D1%8C%D0%B5%D1%84%D0%B0) (`docker_prepare_data`) занимает слишком много времени (горный район/большой охват/слабый ПК), то увеличьте шаг изолиний **isolines_step** (например до *50*), [**регенерируйте данные**](https://github.com/xmd5a2/qgis-xtopo#5-%D0%BF%D0%BE%D0%BB%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B8-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85-osm-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D1%80%D0%B5%D0%BB%D1%8C%D0%B5%D1%84%D0%B0) и включите соответствующие подслои.

            2. **Затенение рельефа (отмывка)**
            
                 Доступно 2 немного отличающихся друг от друга варианта слоя затенения рельефа:
                 
                 * [TERRAIN] hillshade variant 1
                 * [TERRAIN] hillshade variant 2
            
            3. **Склоны**
               * Крутые
               
                 *[TERRAIN] slope (steep)*
               * Пологие
               
                 *[TERRAIN] slope (slight)*
         3. **Основные слои**
           <details>
           <summary>Нажмите чтобы развернуть</summary>
             1. Населённые пункты, места
                * places main
                * place locality
                * island polygon, island point names
                * cape
             2. Дороги, транспортные пути
                * highway main
                  * highway main bridge
                  * highway main tunnel
                * railway all
                  * railway bridge
                  * rail tunnel
                  * railway disused
                * track
                  * track bridge
                * path
                  * path bridge
                * steps
             3. Природные площадные объекты
                * wood
                * scrub
                * grass
                * wetland
                * bare rock
                * scree
                * shingle
                * sand
                * glacier
             4. Природные линейные объекты
                * ridge, arete
                * valley
                * cliff
                * earth bank gully
             5. Гидрография
                * water
                * water intermittent
                * river
                * river intermittent
                * stream
                * stream intermittent
                * drystream
                * dam
                * weir
                * waterfall
                * ford
                * stait line, strait polygon skel
                * bay polygon skel, bay point
                * reef
                * shoal
             6. Рукотворные объекты
                * landuse residential
                * industrial
                * quarry
                * military
                * building
                * allotments
                * orchard
                * vineyard
                * farmland
                * farmyard
                * plant nursery
                * greenhouse horticulture
                * logging
                * landfill
                * beach
                * pier
                * embankment
                * cutline
           </details>

   2. Переменные

#### 2. Подготовка к печати
   1. Настройка макета
   2. Создание атласа
   3. Экспорт в изображение(я)

### 8. Удаление QGIS-xtopo
#### Windows:
   1. Удалите *docker* средствами Windows (Пуск - Параметры - Приложения)
   2. Удалите *VcXsrv* (там же)
   3. Удалите файл **qgis-xtopo-gui.exe**, скачанный при установке в [**шаге 1.3**]

#### Linux:
   1. Остановка контейнера *docker* и удаление образа
      ```
      ./docker_clean.sh
      ```
      
      или
      ```
      docker stop qgis-xtopo
      docker rm qgis-xtopo
      docker rmi xmd5a2/qgis-xtopo
       ```
      Каталог с проектами не удаляется автоматически во избежание потери данных. Если он вам больше не нужен то удалите его вручную.
      
   2. Удалите каталог со скриптами, скачанный в [**шаге 1.2**](https://github.com/xmd5a2/qgis-xtopo#1-%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0).
   3. Удалите *docker* средствами вашей ОС
