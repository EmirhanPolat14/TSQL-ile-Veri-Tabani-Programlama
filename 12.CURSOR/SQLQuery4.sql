EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'SQLMAIL',
    @recipients = 'sqlcalis14@gmail.com',
    @body = 'Bu bir deneme mailidir. Bu mail SQL Serverdan g�nderilmi�tir.',
    @subject = 'sql test mail';