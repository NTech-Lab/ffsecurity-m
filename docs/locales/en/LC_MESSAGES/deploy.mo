��    =        S   �      8  �   9    +  �   G  2    �   :	  �   �	  �   �
  }   1  �  �  �   Y  ;  �     0  E   L  ,  �    �  l   �  Q  J  �   �  �   @  )   �  c     b   �  �   �  �   �  �     "   �    �  �  �  �   b  �       �  q     m  �    �!  /  �"  s  (%  �  �&  =   2(  -   p(  w   �(  �   )  �   �)  	  P*  �  Z+  �   �-  <   �.  T   �.  b  "/  t   �3  -   �3  ;   (4  j   d4  g   �4  �   75  :   �5    	6  L   7  b   [7  �   �7  E   �8  z  �8  �   r:  �   �:  o   �;  �   K<  S   �<  Q   ;=  W   �=  K   �=  �   1>  �   �>  �   Z?     5@  8   F@  �   @  �   >A  K   �A  �   B  Q   �B  K   �B     AC  9   VC  9   �C  h   �C  B   3D  X   vD     �D  �   �D  �  �E  h   *G  q   �G  i  H  B   oI  ^  �I  H   K  :  ZK  �   �L  �   mM  !   FN     hN  0   |N  U   �N  g   O  �   kO  H  �O  g   ;Q  #   �Q  3   �Q  W  �Q  ^   ST     �T  )   �T  W   �T  G   PU  �   �U     V  �   /V  	   �V  $   �V  �   W     �W     $                 +          "   (         1   7             -      0          &   /   )           2   '   8      5            
      	                                :           !   =                        *      %   ,       6              4   9       <             .   #             3         ;    :ref:`Минимальное качество лица <quality>` на фотографии в досье задается параметром ``MINIMUM_DOSSIER_QUALITY`` в файле конфигурации ``/etc/ffsecurity/config.py``. В консоли :program:`PostgreSQL` создайте пользователя ``ntech`` и базу данных ``ffsecurity``. Загрузите в базу данных расширение ``findface-postgres-9.5-facen`` с помощью метки ``facen-compare-bytea``. В параметре ``capacity`` укажите максимальное количество видеопотоков, обрабатываемых компонентом ``video-worker``. В параметре ``mgr-static`` укажите IP-адрес сервера с установленным компонентом ``videomanager-api``, у которого компонент ``video-worker`` будет запрашивать настройки и список видеопотоков. В параметре ``ntls -> url`` укажите IP-адрес локального сервера лицензирования NTLS, если он удаленный. В параметре ``ntls-addr`` укажите IP-адрес локального сервера лицензирования NTLS, если он удаленный. В результате файл конфигурации ``extraction-api`` должен выглядеть примерно следующим образом: В случае лицензирования в закрытой сети вставьте ключ Guardant в USB-порт. В файле конфигурации NTLS вы можете изменить папку для хранения файла лицензии и настроить удаленный доступ к веб-интерфейсу NTLS, используемому для управления лицензией. Для того чтобы открыть файл конфигурации NTLS, выполните команду:: В файле конфигурации ``extraction-api`` включите опцию ``quality_estimator`` для оценки качества лица. В файле конфигурации ``extraction-api`` выключите поиск моделей для распознавания пола, возраста, эмоций и страны, передав пустые значения в параметры ``gender``, ``age``, ``emotions`` и ``countries47``: В этом разделе: Вместе с ``ffsecurity`` будет установлен nginx. Вы получаете файл лицензии вместе с установочными пакетами FindFace Security. Для лицензирования в закрытой сети вам также будет предоставлен ключ аппаратной защиты Guardant. Данный раздел содержит сведения о пошаговом развертывании компонентов FindFace Security. Выполните приведенные ниже инструкции, придерживаясь заданного порядка. Для выхода из консоли ``PostgreSQL`` введите ``\q`` и нажмите :kbd:`Enter`. Для работы FindFace Security необходима система управления базами данных :program:`PostgreSQL`, сетевое хранилище :program:`Redis` и распределенное хранилище ключей :program:`ETCD`. Установите их из репозитория Ubuntu: Для того чтобы подготовить deb-пакеты FindFace Security к установке, выполните следующие действия: Для того чтобы установить и настроить локальный сервер лицензий NTLS, выполните следующие действия: Добавьте ключ подписи. Добавьте сервис ETCD в автозагрузку Ubuntu и запустите его. Добавьте сервис NTLS в автозагрузку и запустите сервис: Добавьте сервисы ``videomanager-api``, ``video-worker``, ``extraction-api`` в автозагрузку Ubuntu и запустите их. Если необходимо обеспечить безопасность данных, включите :ref:`SSL-шифрование <https>`. Загрузите файл лицензии в веб-интерфейсе NTLS по адресу ``http://<IP-адрес NTLS>:3185/#/``. Запустите сервисы. Используя команду ``pwgen -sncy 50 1|tr "'" "."``, сгенерируйте ключ подписи для шифрования сессии (используется :program:`Django`) и задайте его в параметре ``SECRET_KEY``. Компонент ``ffsecurity`` включает в себя сервисы ``findface-security-proto`` (отвечает за HTTP и web-сокет) и ``findface-security-worker`` (обеспечивает взаимодействие остальных компонентов системы). Количество экземпляров ``findface-security-worker`` рассчитывается по формуле N=(количество ядер CPU-1). Количество экземпляров задается после знака ``@``, например, ``findface-security-worker@{1,2,3}`` для активации 3-х экземпляров. Не удаляйте сами параметры, поскольку в этом случае будет выполняться поиск моделей по умолчанию. Отключите сервер nginx, используемый по умолчанию, и добавьте в список включенных серверов сервер ``ffsecurity``. Перезапустите nginx. Откройте для редактирования файл конфигурации ``/etc/findface-videomanager-api.conf``. В параметре ``router_url`` замените строку перед ``v0/frame``, указав IP-адрес и порт компонента ``ffsecurity`` (задаются в параметре ``EXTERNAL_ADDRESS`` файла ``/etc/ffsecurity/config.py``). Компонент ``video-worker`` будет отправлять обнаруженные лица по указанному адресу. Откройте для редактирования файл конфигурации ``/etc/video-worker.ini``. Откройте файл конфигурации ``/etc/ffsecurity/config.py``. В параметре ``EXTERNAL_ADDRESS`` укажите актуальный внешний IP-адрес или URL сервера установки, по которому будет доступен веб-интерфейс. Если компонент ``videomanager-api`` будет установлен на удаленном сервере, укажите его IP-адрес в параметре ``VIDEO_MANAGER_ADDRESS`` (установка компонента описана в разделе см. :ref:`identification`). Отличие назначаемого администратора от Супер Администратора в том, что последний не может лишиться прав администратора даже при смене роли. Перед развертыванием FindFace Security убедитесь, что корректно выставлены системное время и часовой пояс, а также включена синхронизация времени через ``ntpd``/``systemd-timesyncd``. При эксплуатации FindFace Security не допускайте резких скачков времени, чтобы исключить проблемы с работоспособностью сервисов после перезагрузки. Перенесите схему базы данных из FindFace Security в :program:`PostgreSQL`, создайте группы пользователей с :ref:`предустановленными правами <users>` и  первого пользователя с правами администратора (т. н. Супер Администратора). По умолчанию доступ в веб-интерфейс NTLS возможен с любого удаленного сервера в пределах сети (``ui = 0.0.0.0:3185``). Для того чтобы обеспечить доступ к веб-интерфейсу NTLS только с определенного IP-адреса, отредактируйте параметр ``ui``:: Подготовка deb-пакетов к установке Пошаговое развертывание Предварительно ознакомьтесь с разделами :ref:`requirements` и :ref:`architecture`. При необходимости раскомментируйте строку ``proxy`` и укажите IP-адрес прокси-сервера:: При необходимости также отредактируйте файл конфигурации ``/etc/nginx/sites-available/ffsecurity-nginx.conf``. При необходимости укажите в параметре ``license-dir`` другую папку для хранения файла лицензии. По умолчанию файл лицензии хранится в папке ``/ntech/license``:: При необходимости установите ``'IGNORE_UNMATCHED': True``, чтобы отключить запись события в базу данных, если обнаруженное лицо отсутствует в списках наблюдения (верификация дала отрицательный результат). Данную настройку рекомендуется использовать при большом количестве посетителей. Пороговая степень схожести при верификации лиц определяется параметром ``CONFIDENCE_THRESHOLD``. Разрешите авторизацию в :program:`PostgreSQL` по UID  клиента сокета. Перезапустите :program:`PostgreSQL`. Распакуйте пакет с компонентами. Распакуйте пакеты с моделями нейронных сетей. Рекомендуется отредактировать значение параметра ``MINIMUM_DOSSIER_QUALITY``. Данный параметр определяет минимальное качество лица на фотографии в досье. Если качество лица хуже минимального, пользователь не сможет загрузить такую фотографию в досье. Прямые изображения лиц анфас считаются наиболее качественными. Им соответствуют значения вблизи 0, как правило, отрицательные (такие как -0.00067401276, например). Перевернутые лица и лица, повернутые под большими углами, характеризуются отрицательным значениям от -5 и меньше. По умолчанию ``'MINIMUM_DOSSIER_QUALITY': -7``, что означает, что в досье могут быть загружены лица в любом качестве. Установите веб-интерфейс ``ffsecurity-ui`` из пакета :program:`<ffsecurity-repo>.deb`. Установите компонент NTLS: Установите компонент ``extraction-api``. Установите компонент ``ffsecurity`` из пакета :program:`<ffsecurity-repo>.deb`. Установите компоненты ``videomanager-api``, ``video-worker`` и ``extraction-api``. Установите расширение ``findface-postgres-9.5-facen`` к :program:`PostgreSQL` из пакета :program:`<ffsecurity-repo>.deb`: Установка базовой конфигурации Установка базовой конфигурации (базы данных c необходимыми расширениями, компонента ``ffsecurity`` и веб-интерфейса) выполняется следующим образом: Установка локального сервера лицензий NTLS Установка модуля биометрической видео-идентификации Установка модуля биометрической видео-идентификации (компонентов ``videomanager-api``, ``video-worker`` и ``extraction-api``) выполняется следующим образом: Установка необходимого стороннего ПО Project-Id-Version: FindFace Security 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-08-29 12:51+0700
PO-Revision-Date: 2018-08-29 20:02+0700
Last-Translator: 
Language: en
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.3
X-Generator: Poedit 2.1.1
 The :ref:`minimum face quality <quality>` in a dossier photo is set as ``MINIMUM_DOSSIER_QUALITY`` in ``/etc/ffsecurity/config.py``. Using the :program:`PostgreSQL` console, create a new user ``ntech`` and a database ``ffsecurity``. Upload the ``findface-postgres-9.5-facen`` extension to the ``ffsecurity`` database by using the ``facen-compare-bytea`` label. In the ``capacity`` parameter, specify the maximum number of video streams to be processed by ``video-worker``. In the ``mgr-static`` parameter, specify the ``videomanager-api`` host IP address, which provides ``video-worker`` with settings and the video stream list. In the ``ntls -> url`` parameter, specify the NTLS host IP address if it is remote. In the ``ntls-addr`` parameter, specify the NTLS host IP address if it is remote. As a result, the ``extraction-api`` configuration file should look something like this: For the on-premise licensing, insert a Guardant USB dongle into a USB port. In the NTLS configuration file, you can change the license folder and the NTLS web interface remote access settings. To open the NTLS configuration file, execute:: In the ``extraction-api`` configuration file, enable the ``quality_estimator`` to be able to estimate the face quality in a dossier. In the ``extraction-api`` configuration file, disable search for gender, age, emotions, and country recognition models by passing empty values to the ``gender``, ``age`` and ``emotions`` and ``countries47`` parameters: In this section: NginX will be automatically installed from dependencies. You receive a license file from your NTechLab manager along with the FindFace Security distributable packages. For on-premise licensing, you will be also provided with a Guardant USB dongle. This section will guide you through the FindFace Security step-by-step deployment process. Follow the instructions below minding the sequence. To quit from the ``PostgreSQL`` console, type ``\q`` и press :kbd:`Enter`. FindFace Security requires :program:`PostgreSQL`, :program:`Redis`, and :program:`ETCD`. Install them from the Ubuntu repository as such: To prepare the FindFace Security deb-packages for installation, do the following: To install and configure the local license server (NTLS), do the following: Add a signature key. Enable the ETCD service autostart and launch the service: Enable the NTLS service autostart and launch the service: Enable ``videomanager-api``, ``video-worker``, and ``extraction-api`` autostart and launch the services. If necessary, ensure data security by enabling :ref:`SSL <https>`. Upload the license file via the NTLS web interface ``http://<NTLS_IP_address>:3185/#/``. Start the services. Generate a signature key for the session encryption (used by :program:`Django`) by executing: ``pwgen -sncy 50 1|tr “’” “.”``. Specify this key as ``SECRET_KEY``. The ``ffsecurity`` service includes ``findface-security-proto`` (provides HTTP and web socket) and ``findface-security-worker`` (provides interaction of the other system components). The number of the ``findface-security-worker`` instances is calculated using the formula: N=(number of CPU cores-1). It is specified after the ``@`` character, for example, ``findface-security-worker@{1,2,3}`` for 3 instances. Do not remove the parameters themselves as in this case the system will be searching for default models. Disable the default nginx server and add the ``ffsecurity`` server to the list of enabled servers. Restart nginx. Open the ``/etc/findface-videomanager-api.conf`` configuration file for editing. In the ``router_url`` parameter, substitute the string that goes before ``v0/frame`` with the ``ffsecurity`` IP address and port (set as ``EXTERNAL_ADDRESS`` at ``/etc/ffsecurity/config.py``). The ``video-worker`` component will be posting detected faces to the specified address. Open the ``/etc/video-worker.ini`` configuration file for editing. Open the ``/etc/ffsecurity/config.py`` configuration file. In the ``EXTERNAL_ADDRESS`` parameter , specify the external IP address or URL that will be used to access the FindFace Security web interface. If ``videomanager-api`` is installed on a remote host, specify its IP address as ``VIDEO_MANAGER_ADDRESS`` (see :ref:`identification` for details). Super Administrator cannot be deprived of its rights, whatever the role. Before deploying FindFace Security, make sure that the system time and time zone are correct, and time synchronization via ``ntpd``/``systemd-timesyncd`` is enabled. When using FindFace Security, avoid any sudden changes in time, as they may result in unavailability of the FindFace Security services after reboot. Migrate the database architecture from FindFace Security to :program:`PostgreSQL`, create user groups with :ref:`pre-defined rights <users>` and the first user with administrator rights (a.k.a. Super Administrator). By default, you can access the NTLS web interface from any remote host (``ui = 0.0.0.0:3185``). To indicate that accessing the NTLS web interface must originate from a specific IP address, edit the ``ui`` parameter:: Prepare Packages for Installation Deploy Step-By-Step See :ref:`requirements` and :ref:`architecture`. If necessary, uncomment the ``proxy`` line and specify your proxy server IP address:: If necessary, edit the ``/etc/nginx/sites-available/ffsecurity-nginx.conf`` configuration file as well. If necessary, change the license folder in the ``license-dir`` parameter. By default, license files are stored at ``/ntech/license``:: If necessary, set ``’IGNORE_UNMATCHED’: True`` to disable logging events for faces which have no match in the dossiers (negative verification result). Enable this option if the system has to process a large number of faces. The face similarity threshold for verification is defined by the ``CONFIDENCE_THRESHOLD`` parameter. Allow authentication in :program:`PostgreSQL` by UID of a socket client. Restart :program:`PostgreSQL`. Unpack the package with components. Unpack the packages with the neural network models. It is recommended to change the ``MINIMUM_DOSSIER_QUALITY`` default value. This parameter determines the minimum quality of a face in a dossier photo. Photos containing faces of worse quality will be rejected when uploading to a dossier. Upright faces in frontal position are considered the best quality. They result in values around 0, mostly negative (such as -0.00067401276, for example). Inverted faces and large face angles are estimated with negative values some -5 and less. By default, ``’MINIMUM_DOSSIER_QUALITY’: -7`` which means that faces of any quality can be uploaded to a dossier. Install the ``ffsecurity-ui`` web interface from the :program:`<ffsecurity-repo>.deb` package. Install the NTLS component: Install the ``extraction-api`` component. Install the ``ffsecurity`` component from the :program:`<ffsecurity-repo>.deb` package. Install ``videomanager-api``, ``video-worker``, and ``extraction-api``. Install the ``findface-postgres-9.5-facen`` extension for :program:`PostgreSQL` from the :program:`<ffsecurity-repo>.deb` package: Basic Configuration The FindFace Security basic configuration includes a database, database extensions, the ``ffsecurity`` component and web interface. To install the basic configuration, do the following: Licensing Video-Based Biometric Identification To install ``videomanager-api``, ``video-worker``, and ``extraction-api`` components for video-based biometric identification, do the following: Prerequisites 