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
-- 21_main.sql - Таблицы API
/* ------------------------------------------------------------------------- */
\qecho '-- FD: wiki:wiki:40_auth.sql / 23 --'

/* ------------------------------------------------------------------------- */
CREATE OR REPLACE VIEW account_info AS SELECT
  a.*
  , ag.name AS group_name
  FROM wiki.account a
  JOIN wiki.account_group ag ON (a.group_id = ag.id)
;

/* ------------------------------------------------------------------------- */
CREATE OR REPLACE VIEW account_info_pub AS SELECT
  a.id
  , group_id
  , status_id
  , a.name
  , created_at
  , ag.name AS group_name
  FROM wiki.account a
  JOIN wiki.account_group ag ON (a.group_id = ag.id)
;

/* ------------------------------------------------------------------------- */
\qecho '-- FD: wiki:wiki:40_auth.sql / 46 --'