# upload_shell

配合[萌咖](https://moeclub.org/)大佬的onedrive上传脚本，实现指定文件夹的上传。

萌咖大佬的脚本其实有上传文件夹的功能，但是精简版脚本上传后再次上传时不知道哪些文件是已经上传过了的。由于上传到onedrive的延迟很高，如果不判断是否已经上传、而是统统再次上传的话，会很消耗服务器和时间，所以我现学了shell，写了这个小脚本。

每次上传单个文件后都将绝对路径写入/root/sh/uploaded.log中，下次上传时先判断是否已经上传过了。

刚学shell，代码丑，大佬轻喷。

上传的目标文件夹设定在`uploads`数组中。

其他问题可戳[VPS指定文件夹自动上传到OneDrive](http://blog.iyzyi.com/index.php/archives/120/)

