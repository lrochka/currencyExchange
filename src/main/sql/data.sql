use currencyexchange;

INSERT INTO `currencyexchange`.`role`(`scode`,`sname`)VALUES('ROLE_USER','пользователь');

INSERT INTO `currencyexchange`.`role`(`scode`,`sname`)VALUES('ROLE_ADMON','администратор');

INSERT INTO `currencyexchange`.`companies`(`scode`,`sname`,`scity`)VALUES('Kyiv-1','Печерск','Киев');

INSERT INTO `currencyexchange`.`classes`(`scode`,`sname`)VALUES('ua.com.currencyexchange.domain.Account','userlist');
INSERT INTO `currencyexchange`.`classes`(`scode`,`sname`)VALUES('ua.com.currencyexchange.domain.Client','clients');
INSERT INTO `currencyexchange`.`classes`(`scode`,`sname`)VALUES('ua.com.currencyexchange.domain.Company','companies');
INSERT INTO `currencyexchange`.`classes`(`scode`,`sname`)VALUES('ua.com.currencyexchange.domain.Currency','currencies');

-- todo прописать нормальные запросы с переменными идентификаторами нужных таблиц
INSERT INTO `currencyexchange`.`sections`(`scode`,`sname`,`nclass`)VALUES('registration','регистрация пользователя',1); -- класс account
INSERT INTO `currencyexchange`.`sections`(`scode`,`sname`,`nclass`)VALUES('create','создание организации',3); -- companies
INSERT INTO `currencyexchange`.`sections`(`scode`,`sname`,`nclass`)VALUES('add','добавление валюты',4); -- currencies

-- todo прописать нормальные запросы с переменными идентификаторами нужных таблиц. nsection = 1 : sections.scode = 'registration'
INSERT INTO `currencyexchange`.`properties`(`nsection`,`spropCode`,`spropNameEN`,`spropNameUA`,`spropNameRU`)VALUES(1,'pageTitle','Registration','Регістрація','Регистрация');
INSERT INTO `currencyexchange`.`properties`(`nsection`,`spropCode`,`spropNameEN`,`spropNameUA`,`spropNameRU`)VALUES(1,'message.allFieldsRequired','All fields are required','Усі поля необхідно заповнити','Все поля обязательны для заполнения');
INSERT INTO `currencyexchange`.`properties`(`nsection`,`spropCode`,`spropNameEN`,`spropNameUA`,`spropNameRU`)VALUES(1,'label.username','Username:','Логін:','Логин:');
INSERT INTO `currencyexchange`.`properties`(`nsection`,`spropCode`,`spropNameEN`,`spropNameUA`,`spropNameRU`)VALUES(1,'label.password','Password:','Пароль:','Пароль:');
INSERT INTO `currencyexchange`.`properties`(`nsection`,`spropCode`,`spropNameEN`,`spropNameUA`,`spropNameRU`)VALUES(1,'label.confirmPassword','Confirm password:','Підтвердження паролю:','Подтверждение пароля:');
INSERT INTO `currencyexchange`.`properties`(`nsection`,`spropCode`,`spropNameEN`,`spropNameUA`,`spropNameRU`)VALUES(1,'label.firstName','First name:','Ім\'я:','Имя:');
INSERT INTO `currencyexchange`.`properties`(`nsection`,`spropCode`,`spropNameEN`,`spropNameUA`,`spropNameRU`)VALUES(1,'label.lastName','Last name:','Прізвище:','Фамилия:');
INSERT INTO `currencyexchange`.`properties`(`nsection`,`spropCode`,`spropNameEN`,`spropNameUA`,`spropNameRU`)VALUES(1,'label.email','E-mail:','E-mail:','E-mail:');
INSERT INTO `currencyexchange`.`properties`(`nsection`,`spropCode`,`spropNameEN`,`spropNameUA`,`spropNameRU`)VALUES(1,'label.phone','Phone:','Телефон:','Телефон:');
INSERT INTO `currencyexchange`.`properties`(`nsection`,`spropCode`,`spropNameEN`,`spropNameUA`,`spropNameRU`)VALUES(1,'label.role','Roles:','Ролі:','Роли:');
INSERT INTO `currencyexchange`.`properties`(`nsection`,`spropCode`,`spropNameEN`,`spropNameUA`,`spropNameRU`)VALUES(1,'label.company','Company:','Організація:','Организация:');
INSERT INTO `currencyexchange`.`properties`(`nsection`,`spropCode`,`spropNameEN`,`spropNameUA`,`spropNameRU`)VALUES(1,'label.register','Register','Підтвердити','Подтвердить');
INSERT INTO `currencyexchange`.`properties`(`nsection`,`spropCode`,`spropNameEN`,`spropNameUA`,`spropNameRU`)VALUES(1,'registrationOk.pageTitle','Registration confirmed','Регістрація підтверджена','Регистрация подтверждена');
INSERT INTO `currencyexchange`.`properties`(`nsection`,`spropCode`,`spropNameEN`,`spropNameUA`,`spropNameRU`)VALUES(1,'registrationOk.message.thanks','Thank you for registering.','Дякуємо за регістрацію','Спасибо за регистрацию');
INSERT INTO `currencyexchange`.`properties`(`nsection`,`spropCode`,`spropNameEN`,`spropNameUA`,`spropNameRU`)VALUES(1,'registrationOk.label.registerAnother','Register another','Зареєструвати ще одного користувача','Зарегистрировать еще одного пользователя');
INSERT INTO `currencyexchange`.`properties`(`nsection`,`spropCode`,`spropNameEN`,`spropNameUA`,`spropNameRU`)VALUES(1,'error.global','Please fix the problems below.','Будь-ласка виправьте проблеми','Пожалуйста, исправьте возникшие проблемы');
INSERT INTO `currencyexchange`.`properties`(`nsection`,`spropCode`,`spropNameEN`,`spropNameUA`,`spropNameRU`)VALUES(1,'error.mismatch.account.password','Your passwords do not match. Please try again.','Ваш пароль не підходить. Будь-ласка спробуйте ще раз','Ваш пароль не подходит. Пожалуйста попробуйте еще раз');

INSERT INTO `currencyexchange`.`clninsrc`(`scode`,`sname`)VALUES('none','не известно');
INSERT INTO `currencyexchange`.`clninsrc`(`scode`,`sname`)VALUES('friend','друг');
INSERT INTO `currencyexchange`.`clninsrc`(`scode`,`sname`)VALUES('advertising','реклама');

INSERT INTO `currencyexchange`.`clnstats`(`scode`,`sname`)VALUES('reliable','надежный');
INSERT INTO `currencyexchange`.`clnstats`(`scode`,`sname`)VALUES('unreliable','ненадежный');
INSERT INTO `currencyexchange`.`clnstats`(`scode`,`sname`)VALUES('banned','реклама');

INSERT INTO `currencyexchange`.`clndescr`(`scode`,`sname`)VALUES('intime','вовремя');
INSERT INTO `currencyexchange`.`clndescr`(`scode`,`sname`)VALUES('late','опоздал');
INSERT INTO `currencyexchange`.`clndescr`(`scode`,`sname`)VALUES('absent','не явился');

INSERT INTO `currencyexchange`.`clntypecontact`(`scode`,`sname`)VALUES('skype','skype');
INSERT INTO `currencyexchange`.`clntypecontact`(`scode`,`sname`)VALUES('email','почта');
INSERT INTO `currencyexchange`.`clntypecontact`(`scode`,`sname`)VALUES('phone','доп. телефон');