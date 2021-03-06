��          |      �          .   !  %   P  _   v     �  u   �    `  |   t  �   �  M  r  �   �  �   �  O  M  6   �  %   �  ,   �  
   '	  L   2	  �   	     
  C   -
  �   q
  v     U   �        	   
                                                ``REQUEST_DATA``: данные запроса. ``REQUEST_PATH``: URL запроса; ``REQUEST_USER``: пользователь, который выполнил изменения; Аудит-логи В следующем примере для досье с ``id=1879`` запрашивается список лиц. Для того чтобы включить хранение аудит-логов на жестком диске, в файле ``etc/systemd/journald.conf`` раскомментируйте и измените параметр ``Storage`` следующим образом: Для того чтобы просмотреть аудит-логи, выполните следующую команду: Ниже приведен пример лога создания досье с ``id=1879`` пользователем ``admin``. При необходимости также раскомментируйте и измените значение параметра ``SystemMaxUse``. Данный параметр определяет в процентах максимальный объем логов на жестком диске (по умолчанию 10%). При разборе нештатных ситуаций используйте аудит-логи, содержащие подробную деталировку всех событий, произошедших в системе. При расшифровке аудит-логов в первую очередь обращайте внимание на следующие параметры: Project-Id-Version: FindFace Security 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-06-26 16:46+0700
PO-Revision-Date: 2018-06-26 16:49+0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.3
Last-Translator: 
Language-Team: 
Language: en
X-Generator: Poedit 2.0.7
 ``REQUEST_DATA``: detailed information of the request. ``REQUEST_PATH``: URL of the request; ``REQUEST_USER``: user who made the changes; Audit-logs In the next log, the list of faces is requested for the dossier ``id=1879``. In order to enable saving audit logs to your hard drive, uncomment and edit the ``Storage`` parameter in the ``etc/systemd/journald.conf`` file: To view audit logs, execute: In the log below, the ``admin`` user creates a dossier ``id=1879``. If necessary, uncomment and edit the ``SystemMaxUse`` parameter as well. This parameter determines the maximum volume of log files on your hard drive (10% by default). Audit logs contain detailed information about all the events occurred in the system and are great for troubleshooting. When interpreting audit logs, first of all pay attention on the following parameters: 