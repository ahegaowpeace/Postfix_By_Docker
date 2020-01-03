## 手順
#### コンフィグテンプレ編集

- init/sed.sh編集
	- ホスト名
	- ドメイン名
	- プロトコル
- files/sasl_passwd
	- リレー先ホスト名
	- アカパス

#### ビルド/ラン
```
# docker build -t labo:postfix .
# docker run -itd -p 587:587 -p 25:25 -p 465:465 --name postfix 【イメージid】 /bin/bash
```

#### postfix起動
```
# docker exec -it postfix /bin/bash
# /sbin/postfix/start
```
構築完了.

#### 試験
```
# telnet localhost 25
helo 25
mail from:xxxx@yyyy.zz.jp
rcpt to:xxxx@yyyy.zz.jp
data
.
quit
```
