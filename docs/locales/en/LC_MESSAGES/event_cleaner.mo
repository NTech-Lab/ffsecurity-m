��          L      |       �   [   �   �      �  t   �  G     z  ^  6   �  �     �   �  I   �     �                                         Cправка по утилите вызывается следующей командой: Для автоматического удаления событий создайте задание в планировщике ``cron``. Команда в примере ниже добавляет в ``cron`` файл скрипта ``/etc/cron.d/cleanup``, который удаляет события старше 60 дней. Скрипт выполняется ежедневно в 00:05. Для удаления событий старше определенного количества дней используйте опцию ``--age``. Например, для удаления событий старше 5 дней выполните команду: Для удаления устаревших событий используйте утилиту ``event-cleaner``. Очистка базы данных событий c ``event-cleaner`` Project-Id-Version: FindFace Security 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-04-17 17:24+0700
PO-Revision-Date: 2018-04-17 17:52+0700
Last-Translator: 
Language: en
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.3
X-Generator: Poedit 2.0.6
 To invoke the ``event-cleaner`` help message, execute: To automatically remove events, add a scheduled job to Ubuntu’s ``cron``. The command in the example below adds a script file ``/etc/cron.d/cleanup`` that removes events older than 60 days. The script is executed daily at 00:05. In order to remove events older than a given number of days, use the ``--age`` option. For example, to remove events older than 5 days, execute: Use the ``event-cleaner`` utility to remove old events from the database. Purge Old Events from Database 