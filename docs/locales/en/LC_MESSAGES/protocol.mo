��    	      d      �       �   �   �   �   �  ?  L  �   �  �   3  !   �  J     6   `  z  �  j     �   }  �  	  V   �
  r   6     �      �  )   �                      	                        В директории с конфигурацией nginx создайте каталог для хранения информации о SSL-шифровании: Внесите изменения в файл конфигурации ``ffsecurity``. В параметре ``EXTERNAL_ADDRESS`` измените приставку ``http://`` на ``https://``. Для заполнения полей сертификата вам будет предложено несколько вопросов. Ответьте на них, уделив особое внимание строке ``Common Name``. В ней нужно ввести имя или публичный IP-адрес домена, связанного с сервером.  Созданные файлы ключа ``my-example-domain.com.key`` и сертификата ``my-example-domain.com.crt`` будут сохранены в каталоге ``/etc/nginx/ssl``. Для обеспечения безопасности данных включите SSL-шифрование. Выполните следующие действия: Настройте nginx для использования SSL. Откройте файл конфигурации nginx. Скопируйте в него код из примера ниже. Перезапустите nginx. Приложение. Настройка шифрования данных Создайте ключ и сертификат SSL: Project-Id-Version: FindFace Security 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-08-24 17:48+0700
PO-Revision-Date: 2018-08-29 15:10+0700
Last-Translator: 
Language: en
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.3
X-Generator: Poedit 2.1.1
 Under the nginx configuration directory, create a directory that will be used to hold all of the SSL data: Edit the ``ffsecurity`` configuration file. In the ``EXTERNAL_ADDRESS`` parameter, substitute the ``http://`` prefix with ``https://``. You will be asked a few questions about your server in order to embed the information correctly in the certificate. Fill out the prompts appropriately. The most important line is the one that requests the ``Common Name``. You need to enter the domain name or public IP address that you want to be associated with your server. Both of the files you created (``my-example-domain.com.key`` and ``my-example-domain.com.crt``) will be placed in the ``/etc/nginx/ssl`` directory. To ensure data security, it is recommended to enable SSL encryption. Do the following: Configure nginx to use SSL. Open the nginx configuration file. Copy the code from the example below into the file. Restart nginx. Appendix. Enable Data Encryption Create the SSL key and certificate files: 