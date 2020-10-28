QGIS-topo v0.1.20201027
================

Topographic rendering style for QGIS and data preparation scripts

QGIS-topo это набор инструментов, предназначенных для создания карт, пригодных для печати. Цель проекта **не** в автоматическом создании готовых карт, а в попытке максимально упростить этот процесс.

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

Проект состоит из двух частей:

1. Скрипты для подготовки данных для проекта ГИС [QGIS](https://qgis.org/ru/site/) из [OpenStreetMap](https://www.openstreetmap.org/#map=19/29.84546/-95.37745) и данных рельефа, локальный [Overpass API](https://wiki.openstreetmap.org/wiki/RU:Overpass_API) сервер.
2. Проект QGIS с топографическим картостилем.

В docker-контейнере запускаются скрипты для подготовки данных. Также возможно запустить QGIS прямо из контейнера. Скрипты получают данные OSM через Overpass API. Рекомендуется использовать Overpass сервер, встроенный в docker контейнер.

### 1. Установка
  1. [Установить docker](https://docs.docker.com/get-docker/)
     * Если у вас Linux то нужно настроить запуск *docker* из под обычного пользователя. Все дальнейшие действия **не требуют прав суперпользователя (root)**.
  2. Скачать образ проекта QGIS-topo с dockerhub
   ```
   docker pull xmd5a2/qgis-topo:latest
   ```
  3. _**Этот шаг нужен только для удобства запуска. Его можно пропустить если вы хотите запускать docker из командной строки**_.

     Команды выполняются в командной строке (терминал):
     ```
     mkdir -p qgis-topo&&a=(run prepare_data populate_db query_srtm_tiles_list exec_qgis clean)&&command -v wget >/dev/null 2>&1&&for f in "${a[@]}";do wget -nv -nc https://github.com/xmd5a2/qgis-topo/raw/master/docker_${f}.sh -P ./qgis-topo;done
     ```
     В текущем каталоге будет создан каталог **qgis-topo**, откуда необходимо запускать все последующие скрипты, либо использовать команды прямого запуска *docker* (приведены в справке как альтернативный вариант).
     
### 2. Инициализация
   1. Первичная инициализация.
      Для функционирования QGIS-topo необходимо:
      * **Каталог, в котором будут храниться данные проекта**. Его размер может достигать 10-20 Гб и более, в зависимости от размера обрабатываемой области, поэтому убедитесь что на устройстве достаточно свободного места. Перед следующим шагом вы должны создать этот каталог **самостоятельно**. Путь не должен содержать пробелов!
      * (опционально) **Каталог, в котором хранятся исходные данные рельефа (полный набор для всего мира)**. Если у вас уже скачаны эти данные то путь к этому каталогу необходимо указать при инициализации через `docker_run` ниже. Путь не должен содержать пробелов! Не уверены - пропускаете.
      
      Возможны два варианта. Вам необходимо выбрать один из них.
      * С помощью скрипта `docker_run` в каталоге **qgis-topo-master**, скачанном на шаге **1.3**. Подставьте свои пути к каталогам. Если вы не собираетесь использовать полный набор данных рельефа, то **путь_к_каталогу_с_данными_рельефа** можно не указывать.
        ```
        ./docker_run.sh путь_к_каталогу_с_проектами путь_к_каталогу_с_данными_рельефа
        ```
        Если каталог с проектами не существует то он будет создан.
      * Непосредственный запуск docker. Подставьте свои пути к каталогам. Если вы не используете **путь_к_каталогу_с_данными_рельефа** то **уберите** из следующей команды строчку `--mount type=bind,source=путь_к_каталогу_с_данными_рельефа,target=/mnt/terrain \`
      
         ```
         docker run -dti --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --name qgis-topo \
         --mount type=bind,source=путь_к_каталогу_с_проектами,target=/mnt/qgis_projects \
         --mount type=bind,source=путь_к_каталогу_с_данными_рельефа,target=/mnt/terrain \
         xmd5a2/qgis-topo:latest
         docker exec -it --user user qgis-topo /app/init_docker.sh
         ```
   2. Текстовым редактором отредактировать файл **путь_к_каталогу_с_проектами/qgistopo-config/config.ini** и указать имя проекта **project_name**. По умолчанию **automap**.
      ```
      project_name="имя_проекта"
      ```
   3. Для инициализации каталога конкретного проекта **путь_к_каталогу_с_проектами/имя_проекта/**, указанного в предыдущем шаге, нужно повторно запустить
      ```
      ./docker_run.sh
      ```
      
      или
      ```
      docker exec -it --user user qgis-topo /app/init_docker.sh
      ``` 
      Скрипт прочитает из файла **config.ini** указанное вами имя проекта и создаст в каталоге с проектами одноимённый каталог.
      В каталог c вашими проектами будет скопирован каталог **icons**, содержащий иконки для проекта QGIS. В подкаталог с именем вашего проекта будет скопирован проект QGIS (по умолчанию **automap.qgz**). `docker_run` не перезаписывает уже существующие данные, поэтому можно не опасаться что запуск команды что-то удалит.
### 3. Подготовка данных
   Если будет использоваться сервер Overpass внутри *docker* контейнера (рекомендуемый способ), то нужно заполнить его собственную базу данных данными, полученными из OSM. База данных хранится на вашем ПК в каталоге **путь_к_каталогу_с_проектами/overpass_db**. Она нужна только на время работы скрипта `prepare_data` в шаге **5**.
   1. Заполнить базу данных Overpass
      1. Скачать экстракт данных OSM. Чем обширнее область тем больше файл экстракта, что замедляет обработку данных. Поддерживаются форматы pbf, o5m, osm.bz2, osm.
         * Через [Protomaps](https://protomaps.com/extracts) **(рекомендуемый способ)**
           1. Выбрать интересующую область на карте с помощью кнопок **Rectangle Selection (Прямоугольное выделение)** либо **Polygon Selection (Полигональное выделение)**.
           2. Задать имя экстракта (поле **Name this area**) (опционально)
           3. После окончания подготовки данных сервером Protomaps нужно скачать их (**Download PBF**)
           
          или
         * Через [download.geofabrik.de](https://download.geofabrik.de/). Скачайте страну/область с наименьшим приемлемым охватом. Например: не стоит качать всю центральную Россию если вам нужна только Московская область.
         
          или
         * Через JOSM
      2. Поместить полученные файлы в каталог **путь_к_каталогу_с_проектами/имя_проекта/osm_data/**. Поддерживается несколько экстрактов одновременно.
      3. Заполнить базу данных Overpass в *docker*.
         * `./docker_populate_db.sh` **(рекомендуемый способ)**
         
         или
         * `docker exec -it --user user qgis-topo /app/populate_db.sh`
   2. Получить данные рельефа (опционально)
   
      Доступно два варианта использования данных:
      * Использовать фрагментарные данные (к примеру, несколько фрагментов нужной области). Их нужно поместить в каталог **путь_к_каталогу_с_проектами/имя_проекта/input_terrain/**.
        Некоторые из подходящих источников данных рельефа:
        * [CGIAR-CSI SRTM](http://srtm.csi.cgiar.org/srtmdata/) **(рекомендуется)**

        Для облегчения поиска данных возможно получить список необходимых тайлов для текущего проекта:
        ```
        ./docker_query_srtm_tiles_list.sh
        ```
        
          или
        ```
        docker exec -it --user user qgis-topo /app/query_srtm_tiles_list.sh
        ```
        предварительно задав в **config.ini** параметр **bbox** (шаг **4**).

      или
      * Использовать полный набор тайлов для всего мира. Поддерживаются только тайлы размером 1х1 градус. Они должны иметь имена, соответствующие общепринятым правилам наименования SRTM. Например: *N51E005.tif*. Поддерживаются форматы GeoTIFF (tif) и HGT (hgt), а также zip архивы с файлами в этих форматах (один архив на файл). Данные должны находиться в каталоге с данными рельефа, который был задан в шаге **2.1.** при запуске *docker* контейнера.
      
        Некоторые из подходящих источников данных рельефа:
        * [Рельеф Земли (DEM) (составлено из SRTM 30м,90м, EU-DEM, ASTER)](https://rutracker.org/forum/viewtopic.php?t=5393970) (torrent)

#### Если вы хотите использовать рельеф то не забудьте задать для опции **generate_terrain** значение **true** в **config.ini** (шаг **4**).

### 4. Настройка **config.ini**
  Это главный конфигурационный файл проекта. Он находится здесь: **путь_к_каталогу_с_проектами/qgistopo-config/config.ini**. В нём задаются параметры, которые используются в шаге **5**.
  
  Обычно требуется менять только переменные **project_name** и **bbox**. Но если вы хотите использовать рельеф (шаг **3.2**) то нужно для опции **generate_terrain** установить значение **true**.
  
   * **project_name**: имя каталога проекта. Не должно содержать пробелов. Уже должно быть настроено в шаге **2.2 (обязательно!)**
   * **bbox**: границы зоны охвата в формате **lon_min,lat_min,lon_max,lat_max**. Удобно получать **{bbox}** через https://boundingbox.klokantech.com/ В левом нижнем углу страницы нужно выбрать формат **CSV**. **(обязательно!)**
   * **array_queries**: список запросов к Overpass, которые будут выполнены в шаге **ХХХ**. По умолчанию указаны все возможные запросы, но вы можете сократить этот список по своему усмотрению. Обратите внимание что некоторые запросы зависят от других. Эти зависимости описаны в **путь_к_каталогу_с_проектами/qgistopo-config/config.ini** (Query dependencies). Обычно не требуется менять этот список.
   * **overpass_instance**: определяет какой сервер Overpass использовать **(обязательно!)**:
      * **docker** : внутри docker **(рекомендуется)**. Шаг **3.1** необходим только совместно с этой опцией.
      * **external** : находится в интернете и доступен по http(s)
        * **overpass_endpoint_external**: адрес сервера (в кавычках). Список доступных серверов здесь: [ссылка1](https://wiki.openstreetmap.org/wiki/Overpass_API#Public_Overpass_API_instances), [ссылка2](https://wiki.openstreetmap.org/wiki/RU:Overpass_API#.D0.92.D0.B2.D0.B5.D0.B4.D0.B5.D0.BD.D0.B8.D0.B5).
        Использование удалённого сервера является самым простым способом получить данные OSM. Однако из-за различных ограничений результат не всегда оказывается стабильным. Некоторые сервера не позволяют делать много запросов в течение короткого времени и блокируют вас. Можете попробовать следующие сервера:
          * "https://overpass.kumi.systems/api/interpreter"
      * **local** : установлен на локальной машине
        * **overpass_endpoint_local**: путь к файлу **osm3s_query**. Например: "/path/to/your/overpass/osm3s_query --db-dir=/path/to/overpass_db" (с кавычками)
      * **ssh** : через ssh. Например: "ssh user@server '/path/to/overpass/osm3s/bin/osm3s_query'" (с кавычками)
   * **generate_terrain=true/false**: обработка рельефа. Эта переменная влияет **на все вложенные переменные**. Если она установлена в **false** то рельеф обрабатываться не будет.
      * **get_terrain_tiles=true/false**: использовать каталог с данными рельефа, который был задан в шаге **2.1**. Если этот параметр установлен в **false** то будет использоваться каталог **путь_к_каталогу_с_проектами/имя_проекта/input_terrain/**, куда вы самостоятельно можете скопировать данные рельефа для области проекта. Их имена могут быть произвольными. Поддерживаются форматы GeoTIFF (tif) и HGT (hgt), а также zip архивы с файлами в этих форматах.
      * **generate_terrain_hillshade_slope=true/false**: создавать карту затенения рельефа и карту уклонов
        * **terrain_resample_method=cubicspline/lanczos**: метод масштабирования исходных данных рельефа. **cubicspline** даёт менее детальную картинку, но без артефактов, а **lanczos** напротив, более детальную, но с артефактами в виде колец
      * **generate_terrain_isolines=true/false**: создавать изолинии высот (изогипсы)
        * **isolines_step=10/25/50/100/200**: шаг изолиний
        * **smooth_isolines=true/false**: сглаживание изолиний. Обычно не требуется.
   * **manual_coastline_processing=true/false**: ручная обработка береговой линии (**coastline**) мирового океана. Дело в том что автоматическая обработка занимает достаточно много времени. Тем больше, чем более детальна береговая линия. Иногда требуется получить карту большой области со сложным берегом и ждать времени нет. В таком случае вы можете включить эту опцию и обработать береговую линию вручную в JOSM. Рекомендуется отдельно запросить её, оставив в массиве **array_queries** только **coastline** и запустить скрипт `docker_prepare_data` (шаг **5**). В нужный момент скрипт остановит выполнение и попросит вручную достроить береговую линию до полигона, включающего в себя мировой океан в пределах заданного **bbox**, избегая пересечений и неправильной геометрии. Путь к файлу: **путь_к_каталогу_с_проектами/имя_проекта/vector/coastline.osm**. После этого следует в окне выполнения `docker_prepare_data` нажать любую клавишу.

### 5. Получение и обработка данных OSM, обработка рельефа
  Сделав все необходимые приготовления нужно запустить скрипт
  ####    `./docker_prepare_data.sh`
  Он сгенерирует карту затенения рельефа, карту уклонов, изолинии высот. Также сделает необходимые запросы к серверу Overpass и обработает их с помощью алгоритмов QGIS и GRASS. Векторные данные (данные OSM и изолинии высот) находятся в **путь_к_каталогу_с_проектами/имя_проекта/vector**, а растровые (карта затенения рельефа, карта уклонов) в **путь_к_каталогу_с_проектами/имя_проекта/raster**

### 6. Запуск QGIS
  Полученный проект QGIS можно открыть двумя способами:
  * С помощью QGIS, установленной внутри docker контейнера (рекомендуется). Существует два варианта запуска:
    * `./docker_exec_qgis.sh`
    
      или
    * `xhost +local:docker && docker exec -it --user user qgis-topo qgis`
    
      Далее в меню **Project - Open - /home/user/qgis_projects/имя_проекта/имя_проекта.qgz**
  * Локально установленной QGIS
  
  ## Удаление QGIS-topo
   1. Остановка контейнера *docker* и удаление образа
      ```
      ./docker_clean.sh
      ```
      
      или
      ```
      docker stop qgis-topo
      docker rmi xmd5a2/qgis-topo
       ```
      Каталог с проектами не удаляется автоматически во избежание потери данных. Если он вам больше не нужен то удалите его вручную.
      
   2. Удалите каталог со скриптами, скачанный в шаге **1.3**.
   3. Удалите *docker* средствами вашей ОС
