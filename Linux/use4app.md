# <p align='center'>use4app说明文档及常见用法指北</p>

首先必须声明，替代软件不是必需品，但用了之后确实是比系统自带的软件更加好用。现写一篇简陋的教程，帮助快速上手这些软件（其实上手摸几把就知道了）

## htop

htop 作为top的替代软件可以说比top好用太多，就我个人认为的几点好处就是：
1. 界面清晰，各部分信息都能最直观地展现；
2. 可以在htop界面直接查看运行的命令且可以直接将其kill掉，同时支持不同的kill方式，一般用默认方式kill就行；
3. 显示命令及线程，以及它占用的内存情况，便于规划命令的运行。

使用很简单，我个人基本只用`htop`和`htop -u username`两个命令，因为具体的设置可以在htop界面进行，不一定需要在命令行进行


## axel
axel作为wget的替代工具，支持多线程下载，可以说是一大利器了。
```
Usage: axel [options] url1 [url2] [url...]

--max-speed=x           -s x    Specify maximum speed (bytes per second)
--num-connections=x     -n x    Specify maximum number of connections
--max-redirect=x                Specify maximum number of redirections
--output=f              -o f    Specify local output file
--search[=n]            -S[n]   Search for mirrors and download from n servers
--ipv4                  -4      Use the IPv4 protocol
--ipv6                  -6      Use the IPv6 protocol
--header=x              -H x    Add HTTP header string
--user-agent=x          -U x    Set user agent
--no-proxy              -N      Just don't use any proxy server
--insecure              -k      Don't verify the SSL certificate
--no-clobber            -c      Skip download if file already exists
--quiet                 -q      Leave stdout alone
--verbose               -v      More status information
--alternate             -a      Alternate progress indicator
--help                  -h      This information
--timeout=x             -T x    Set I/O and connection timeout
--version               -V      Version information

Visit https://github.com/axel-download-accelerator/axel/issues to report bugs

```
常见用法：
```bash
axel -a https://xxx.gz -n 12
# 默认情况下，整个屏幕都是进度条，加上-a参数，进度条类似wget
# -n 表示线程数
# -s 表示限制最大下载速度（不怕影响别人就不用管了）
# -o 设置下载文件保存目录及下载文件名
```


## tmux
tmux是一款GUN screen的替代软件，操作起来稍微有一点点麻烦，但是结合zsh其实也还好
常用命令：
```bash
# 新建会话
tmux new -s name

# 分割会话窗口 
## 左右分割会话窗口
tmux split-window -h
## 左右分割会话窗口
tmux split-window

# 设置鼠标
tmux set -g mouse on

# 退出会话
tmux detach

# 重新连接会话
tmux attach -t name
```
更多用法请移步阮一峰大佬处 -> [Tmux 使用教程](http://www.ruanyifeng.com/blog/2019/10/tmux.html)


## exa
exa替代ls，已经改了别名了，照着ls用就行


## duf
直接用duf即可

## ag
grep 替代软件，基本照着grep那么用
```
Usage: ag [FILE-TYPE] [OPTIONS] PATTERN [PATH]

  Recursively search for PATTERN in PATH.
  Like grep or ack, but faster.

Example:
  ag -i foo /bar/

Output Options:
     --ackmate            Print results in AckMate-parseable format
  -A --after [LINES]      Print lines after match (Default: 2)
  -B --before [LINES]     Print lines before match (Default: 2)
     --[no]break          Print newlines between matches in different files
                          (Enabled by default)
  -c --count              Only print the number of matches in each file.
                          (This often differs from the number of matching lines)
     --[no]color          Print color codes in results (Enabled by default)
     --color-line-number  Color codes for line numbers (Default: 1;33)
     --color-match        Color codes for result match numbers (Default: 30;43)
     --color-path         Color codes for path names (Default: 1;32)
     --column             Print column numbers in results
     --[no]filename       Print file names (Enabled unless searching a single file)
  -H --[no]heading        Print file names before each file's matches
                          (Enabled by default)
  -C --context [LINES]    Print lines before and after matches (Default: 2)
     --[no]group          Same as --[no]break --[no]heading
  -g --filename-pattern PATTERN
                          Print filenames matching PATTERN
  -l --files-with-matches Only print filenames that contain matches
                          (don't print the matching lines)
  -L --files-without-matches
                          Only print filenames that don't contain matches
     --print-all-files    Print headings for all files searched, even those that
                          don't contain matches
     --[no]numbers        Print line numbers. Default is to omit line numbers
                          when searching streams
  -o --only-matching      Prints only the matching part of the lines
     --print-long-lines   Print matches on very long lines (Default: >2k characters)
     --passthrough        When searching a stream, print all lines even if they
                          don't match
     --silent             Suppress all log messages, including errors
     --stats              Print stats (files scanned, time taken, etc.)
     --stats-only         Print stats and nothing else.
                          (Same as --count when searching a single file)
     --vimgrep            Print results like vim's :vimgrep /pattern/g would
                          (it reports every match on the line)
  -0 --null --print0      Separate filenames with null (for 'xargs -0')

Search Options:
  -a --all-types          Search all files (doesn't include hidden files
                          or patterns from ignore files)
  -D --debug              Ridiculous debugging (probably not useful)
     --depth NUM          Search up to NUM directories deep (Default: 25)
  -f --follow             Follow symlinks
  -F --fixed-strings      Alias for --literal for compatibility with grep
  -G --file-search-regex  PATTERN Limit search to filenames matching PATTERN
     --hidden             Search hidden files (obeys .*ignore files)
  -i --ignore-case        Match case insensitively
     --ignore PATTERN     Ignore files/directories matching PATTERN
                          (literal file/directory names also allowed)
     --ignore-dir NAME    Alias for --ignore for compatibility with ack.
  -m --max-count NUM      Skip the rest of a file after NUM matches (Default: 10,000)
     --one-device         Don't follow links to other devices.
  -p --path-to-ignore STRING
                          Use .ignore file at STRING
  -Q --literal            Don't parse PATTERN as a regular expression
  -s --case-sensitive     Match case sensitively
  -S --smart-case         Match case insensitively unless PATTERN contains
                          uppercase characters (Enabled by default)
     --search-binary      Search binary files for matches
  -t --all-text           Search all text files (doesn't include hidden files)
  -u --unrestricted       Search all files (ignore .ignore, .gitignore, etc.;
                          searches binary and hidden files as well)
  -U --skip-vcs-ignores   Ignore VCS ignore files
                          (.gitignore, .hgignore; still obey .ignore)
  -v --invert-match
  -w --word-regexp        Only match whole words
  -W --width NUM          Truncate match lines after NUM characters
  -z --search-zip         Search contents of compressed (e.g., gzip) files

File Types:
The search can be restricted to certain types of files. Example:
  ag --html needle
  - Searches for 'needle' in files with suffix .htm, .html, .shtml or .xhtml.

For a list of supported file types run:
  ag --list-file-types

ag was originally created by Geoff Greer. More information (and the latest release)
can be found at http://geoff.greer.fm/ag
```
下面介绍一些常用的场景：
```bash
ag -A 3 "string-to-search"
```
此时 ag 会遍历当前目录下的文本文件，在每个文件的每一行中查找 "string-to-search" 这种模式，把文件名、行号和匹配的内容高亮显示出来，同时显示了匹配行数的后3行。-C/--context [LINES] ，输出匹配内容前后[ LINES ]行内容（默认2行）

如果想在某个指定的目录下搜索，或只搜索某个文件的内容，在搜索的字符串后面加上路径就行：

```bash
ag "string-to-search" /path/to/directory
除此以外，ag -G 提供了强大的过滤功能，使搜索在特定的文件中进行。下面的例子只搜索 java 类型的文件：
```


```bash
ag -G ".+\.java" "string-to-search" /path/to/directory
```
ag 根据输入智能判定大小写的匹配方式。如果查询的字符串只含有小写字符，使用大小写不敏感的匹配方式；如果出现了大写字符，就改为大小写敏感的匹配方式。如果想要直接使用不敏感的匹配方式，请用 `ag -i` 选项。

另一个很有用的选项是 `ag -w` 的全词匹配，它要求匹配的字符串前后都需要有合适的分隔符。

如果想要搜索不满足特定模式的行，用 `ag -v` 对搜索结果取反。如果只关心有哪些文件匹配（而不在意文件的内容），可以用 `ag -l`显示有匹配的文件名，类似的`ag -L` 显示没有任何匹配的文件名。


## fd
fd算是find命令的优化吧
```
USAGE:
    fd [FLAGS/OPTIONS] [<pattern>] [<path>...]

FLAGS:
    -H, --hidden            Search hidden files and directories
    -I, --no-ignore         Do not respect .(git|fd)ignore files
    -s, --case-sensitive    Case-sensitive search (default: smart case)
    -i, --ignore-case       Case-insensitive search (default: smart case)
    -g, --glob              Glob-based search (default: regular expression)
    -a, --absolute-path     Show absolute instead of relative paths
    -l, --list-details      Use a long listing format with file metadata
    -L, --follow            Follow symbolic links
    -p, --full-path         Search full path (default: file-/dirname only)
    -0, --print0            Separate results by the null character
    -h, --help              Prints help information
    -V, --version           Prints version information

OPTIONS:
    -d, --max-depth <depth>            Set maximum search depth (default: none)
    -t, --type <filetype>...           Filter by type: file (f), directory (d), symlink (l),
                                       executable (x), empty (e), socket (s), pipe (p)
    -e, --extension <ext>...           Filter by file extension
    -x, --exec <cmd>                   Execute a command for each search result
    -X, --exec-batch <cmd>             Execute a command with all search results at once
    -E, --exclude <pattern>...         Exclude entries that match the given glob pattern
    -c, --color <when>                 When to use colors: never, *auto*, always
    -S, --size <size>...               Limit results based on the size of files.
        --changed-within <date|dur>    Filter by file modification time (newer than)
        --changed-before <date|dur>    Filter by file modification time (older than)
    -o, --owner <user:group>           Filter by owning user and/or group

ARGS:
    <pattern>    the search pattern (a regular expression, unless '--glob' is used; optional)
    <path>...    the root directory for the filesystem search (optional)

Note: `fd -h` prints a short and concise overview while `fd --help` gives all details.

```
常见用法如下：
```
# 查找当前文件夹下所有的jpg文件
fd -e jpg

# 在指定目录中查找jpg文件
fd jpg ./wp-content/

# 查找扩展名为php的文件，并在其中包含字符串"index"
fd -e php index

# 查找具有php扩展名的所有文件，其中包含字符串“ index ”，并将排除"wp-content"目录中的结果
fd -e php index -E wp-content
```









