��          L      |       �   E  �      �  6   �  z  4  D  �  z  �  F  o     �      �  �   �  �   �	                                         FindFace Security принимает решение о совпадении (положительной верификации) обнаруженного лица с лицом из досье на основании предустановленной пороговой степени схожести. По умолчанию установлено оптимальное пороговое значение, равное 0.75. При необходимости вы можете изменить данное значение на вкладке :guilabel:`Настройки`. |settings_ru| Настройка порога верификации Систему можно настроить таким образом, что событие будет записываться и отображаться в веб-интерфейсе только в том случае, если лица совпадают (параметр ``IGNORE_UNMATCHED`` в файле ``/etc/ffsecurity/config.py``, см. :ref:`basic-deployment`). Чем выше пороговая степень схожести, тем меньше шансов на положительную ложную верификацию человека, однако некоторые подходящие фотографии могут также не пройти верификацию. Project-Id-Version: FindFace Security 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-08-24 17:48+0700
PO-Revision-Date: 2018-08-29 13:53+0700
Last-Translator: 
Language: en
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.3
X-Generator: Poedit 2.1.1
 FindFace Security verifies that a detected face and some face from the dossiers belong to the same person (i. e. the faces match), based on the pre-defined similarity threshold. The default threshold is set to 0.75 which can be considered as optimum. If necessary, you can change the threshold on the :guilabel:`Settings` tab. |settings_en| Configuring Confidence Threshold You can configure your system to save and display an event only if the faces match (the ``IGNORE_UNMATCHED`` option at ``/etc/ffsecurity/config.py``, see :ref:`basic-deployment`). The higher is the threshold, the less are chances that a wrong person will be positively verified, however, some valid photos may also fail verification. 