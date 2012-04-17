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
\qecho '-- FD: app:app:90_test.sql / 23 --'

SELECT code, class_id, action_id, cache_id, rvf_id, is_write, is_i18n, is_sql, code_real
  , (ws.dt(arg_dt_id)).code as arg_dt, (ws.dt(rv_dt_id)).code as rv_dt, name, args_exam, args 
  FROM ws.method_by_code('info.add')
;

/* ------------------------------------------------------------------------- */
-- No end qecho
