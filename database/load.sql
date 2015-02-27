load data infile "/tmp/dbdump/users.data" into table users fields terminated by "\t";
load data infile "/tmp/dbdump/stories.data" into table stories fields terminated by "\t";
load data infile "/tmp/dbdump/comments.data" into table comments fields terminated by "\t";
load data infile "/tmp/dbdump/old_stories.data" into table old_stories fields terminated by "\t";
load data infile "/tmp/dbdump/old_comments.data" into table old_comments fields terminated by "\t";
load data infile "/tmp/dbdump/submissions.data" into table submissions fields terminated by "\t";
load data infile "/tmp/dbdump/moderator_log.data" into table moderator_log fields terminated by "\t";

