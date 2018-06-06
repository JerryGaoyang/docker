### 第一步

> 修改 docker-compose.yml 配置文件中的密码


### 第二步：Redis 修改密码

> redis/redis.conf 搜索 requirepass root , 将 root 更改为自己的密码


### 第三步：

> ./run.sh


### MySQL 添加用户并开启远程链接


```
use mysql;

CREATE USER 'user'@'%' IDENTIFIED BY 'password';

grant all on *.* to 'user'@'%';

ALTER USER 'user'@'%' IDENTIFIED WITH mysql_native_password BY 'password';

```


### MongoDB 添加用户和数据库


```
db.auth('root', 'root')

use dbname

db.createUser({'user': 'user', 'pwd': 'pwd', roles: [{'role': 'dbOwner', 'db': 'dbname'}]})
```