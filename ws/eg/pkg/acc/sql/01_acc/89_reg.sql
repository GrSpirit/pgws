/*

    Copyright (c) 2010, 2012 Tender.Pro http://tender.pro.

    This file is part of PGWS - Postgresql WebServices.

    PGWS is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    PGWS is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with PGWS.  If not, see <http://www.gnu.org/licenses/>.

    Регистрация методов и страниц
*/

/* ------------------------------------------------------------------------- */
INSERT INTO method (code, class_id , action_id, cache_id, rvf_id) VALUES
  ('acc.profile',         1, 2, 3, 3)
;

INSERT INTO method (code, class_id , action_id, cache_id, rvf_id, is_write) VALUES
  ('acc.sid_info',        2, 1, 3, 3, true)
, ('acc.login',           1, 8, 1, 3, true)
, ('acc.logout',          1, 2, 1, 2, true)
;

/* ------------------------------------------------------------------------- */
INSERT INTO i18n_def.page (code, up_code, class_id, action_id, sort, uri, tmpl, name) VALUES
  ('login',   'main', 1, 8, null, 'login$',     'acc/login',    'Вход')
, ('logout',  'main', 1, 2, null, 'logout$',    'acc/logout',   'Выход')
;

/* ------------------------------------------------------------------------- */
INSERT INTO i18n_def.error (code, id_count, message) VALUES
  (acc.const_error_password(),  0, 'неправильный пароль')
, (acc.const_error_login(),     0, 'неизвестный логин')
, (acc.const_error_status(),    1, 'статус пользователя (%s) не допускает авторизацию')
;

INSERT INTO job.handler (id, code, def_prio, arg_date_type, dust_days, is_sql, name) VALUES
  (4, 'mailtest', 20, 2, 31, false, 'Тест API')
;
--   ,('Y0051', 0, 'Указанный логин уже занят. Выберите другой логин')
