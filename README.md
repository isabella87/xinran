# banhuitong

一，准备阶段：

1，git bash 中运行命令：

ssh-keygen -t rsa -C "429509577@qq.com"

2，并将生成的钥匙文件内容上传到git官网创建的用户下，用于设置远程登录权限。

3，测试本地能否正常连接远程git命令：

ssh -T git@github.com

4，运行以下命令查询基本配置： vi .git/config

调整配置文件url内容为以下：

​	url = https://用户名：密码@github.com/用户名/仓库名.git

​	例如：url=	https://isabella87:760810ssg@github.com/isabella87/xrsrv.git

5，设置配置文件中用户基本信息

git config --global user.name "isabella87"

git config --global user.email  429509577@qq.com



二，同步文件阶段：

1,右击要同步的文件夹选择-Git Bash Here

2，运行以下命令，完成初始化工作，此时在目录里会对个.git文件

git init

3，运行以下命令与远程仓库建立连接，其中isabella87是我再git官网的用户名，xrsrv是某个仓库的名称。

git remote add origin git@github.com:isabella87/xrsrv.git

4，运行以下命令，同步一次本地与远程仓库中的内容。运行完本地会多一个README.md文件。

1）将远程仓库中的内容拉取到本地：  git pull git@github.com:isabella87/xrsrv.git

2） 本地与远程仓库中代码合并（应用于同步出现问题时）： git pull --rebase origin master

5，运行以下命令，标记哪些文件是要被同步到官网的

1）标记某个文件：git commit -m "文件名"

2）标记所有文件： git commit  -a   （修改文件）

6，运行以下命令推送本地文件到git官网，实现文件同步。

git push -u origin master



------

7，git status 列出项目文件中的文件状态

8，git add 目录或者文件（将文件设置为可提交状态）



注意：7,8步后重复5,6步。



三，获取github上项目仓库内容（在本地建立一个项目仓库）

1，现在本地新建一个文件夹，把该文件夹作为一个本地仓库，然后使用终端命令进入该文件夹。

2，初始化版本仓库：git init

3，复制github中项目的的url，使用以下命令进行以下仓库代码的同步

​	git clone url  

例如 git clone https://github.com/isabella87/banhuitong.git



