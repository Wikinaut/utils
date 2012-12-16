#!/bin/sh

echo dump all databases
# http://serverfault.com/questions/331057/mysqldump-unknown-table-engine-performance-schema
NOW="$(date "+%Y%m%d")"
mysqldump -u root -p --all-databases \
--ignore-table=performance_schema.cond_instances \
--ignore-table=performance_schema.events_waits_current \
--ignore-table=performance_schema.cond_instances \
--ignore-table=performance_schema.events_waits_history \
--ignore-table=performance_schema.events_waits_history_long  \
--ignore-table=performance_schema.events_waits_summary_by_instance \
--ignore-table=performance_schema.events_waits_summary_by_thread_by_event_name \
--ignore-table=performance_schema.events_waits_summary_global_by_event_name \
--ignore-table=performance_schema.file_instances \
--ignore-table=performance_schema.file_summary_by_event_name \
--ignore-table=performance_schema.file_summary_by_instance  \
--ignore-table=performance_schema.mutex_instances \
--ignore-table=performance_schema.performance_timers \
--ignore-table=performance_schema.rwlock_instances \
--ignore-table=performance_schema.setup_consumers \
--ignore-table=performance_schema.setup_instruments \
--ignore-table=performance_schema.setup_timers \
--ignore-table=performance_schema.threads | gzip - > mysqldump-alldatabases_$NOW.gz
