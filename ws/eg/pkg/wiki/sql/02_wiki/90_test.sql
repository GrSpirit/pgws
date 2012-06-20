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

*/
-- 90_test.sql - Тесты
/* ------------------------------------------------------------------------- */

-- TODO: insert into wiki.account

\set SID '\'; \''

SELECT login, status_id, email, psw FROM acc.login(:SID,'127.0.0.1','admin', (SELECT psw FROM acc_data.account WHERE login='admin'));

SELECT wiki.group_id_by_code('wk') IS NOT NULL AS group_exists;

SELECT wiki.can_create(:SID, wiki.group_id_by_code('wk'), 'definitely/new/page');

SELECT wiki.doc_create(:SID, wiki.group_id_by_code('wk'), 'definitely/new/page','==test title\n\ntest body','New test page') IS NOT NULL AS doc_created;

SELECT ((wiki.ids_by_code('wk', 'definitely/new/page')).id IS NOT NULL) AS doc_exists;

SELECT wiki.doc_update_src(:SID, (wiki.ids_by_code('wk', 'definitely/new/page')).id, 1,'==test title\n\ntest body2','New test page updated', NULL, NULL, NULL, '>\n<2') = (wiki.ids_by_code('wk', 'definitely/new/page')).id AS src_updated;

SELECT wiki.doc_update_attr(:SID, (wiki.ids_by_code('wk', 'definitely/new/page')).id, 2, NULL, NULL, NULL, '{{test,page}}') = (wiki.ids_by_code('wk', 'definitely/new/page')).id AS attr_updated;

SELECT status_id, group_id, up_id, code, revision, name, group_name, updated_by_name
  FROM wiki.doc_info((wiki.ids_by_code('wk', 'definitely/new/page')).id)
;

SELECT * FROM wiki.doc_keyword((wiki.ids_by_code('wk', 'definitely/new/page')).id);

-- TODO: delete doc

SELECT acc.logout(:SID,'127.0.0.1');
-- TODO: delete account ?

/* ------------------------------------------------------------------------- */
-- No end qecho
