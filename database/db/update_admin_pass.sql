UPDATE `sp_users` SET `fullname` = 'Admin', `username` = 'admin-ss-sm', `email` = 'admin@ss-sm.pk', `password` = MD5('SS@Admin*Pass') WHERE `sp_users`.`id` = 1;
