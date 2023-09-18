## git 进行版本回退（文件恢复，恢复误提交，已提交） https://blog.csdn.net/qing040513/article/details/109150075 [引用]
1. 介绍
2. git的4个区
3. git 文件的5钟状态
4. 回退命令
   - git reset 命令
   - git log 命令
   - git relog 命令
   - 进行回退操作
   - 各种版本回退举例
   - git 远程覆盖本地

5. 结束

1. 介绍
git 是我们代码管理必备不可少的工具，平常我们使用时可能会遇到以下的问题，有时候我们提交代码后，发现提交错误，比如本地修改了不想提交的文件提交上去了，或者提交了不完善的代码，这时候怎么把代码回退呢。
2. git的4个区
在介绍如何进行git版本回退前，我们需要先了解git中的4个区
- 工作区（workking area）
   相当我们的工作空间的目录，我们的代码本地存放的地方
- 暂存区
   也称作index,用来跟踪已暂存的文件，一般是存在.git下的index文件，所以有时也称作暂存区的索引
- 本地仓库(local repository)
- 远程仓库(remote repository)

3. git 文件的5钟状态

   我们还需要了解下git文件中的5中状态
   - 未修改(origin)
   - 已修改(modified)
   - 已暂存(staged)
   - 已提交(commitetd)
   - 已推送(pushed)

   他们之间的关系
   ```mermaid
   sequenceDiagram
   工作区 ->> 暂存区: git add
   Note right of 工作区: git diff(已修改,未暂存)
   Note right of 暂存区: git diff --checked(已暂存，未提交)
   暂存区 ->> 本地仓库: git commit
   Note right of 本地仓库: git diff master origin/master(已提交，未推送)
   本地仓库 ->>远程仓库: git push
   
   ```

   - 工作区中的文件初始化的状态是未修改，当我们修改文件后，其状态变为已修改，git diff可以查看已经修改但未暂存的文件.(git diff 后输入q可以退出)
   - 通过git add 命令可以把已修改的文件添加到暂存区，git diff --cached 可以查看已暂存，但未提交的文件
   - 通过git commit 进行代码提交到本地仓库， git diff {本地分支} {远程分支}可以查看已提交本地，但未推送到远程的分支
   - 通过git push 命令将本地分支推送到远程分支。

4. 回退命令