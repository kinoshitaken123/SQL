--DCL
--誰に、どのようなデータ操作やテーブル操作を許すかといった権限を設定するためのSQL命令の総称。
--権限を付与するGRANT文と剥奪するREVOKE文

--GRANT文とREVOKE文
GRANT 権限名　TO ユーザー名
REVOVE 権限名　FROM ユーザー名

--テーブル作成
CREATE TABLE テーブル名 (
    列名１　列１の型名,
    列名2　列2の型名,
    :
    列名X 列Xの型名
)

--家計簿テーブルを作成する
CREATE TABLE 家計簿 (
    日付　DATE,
    費目ID INTEGER,
    メモ　VARCHAR(100),
    入金額　INTEGER,
    出金額　INTEGER
)

--デフォルト値の指定

--家計簿テーブルに対する行の追加
INSERT INTO 家計簿(日付,メモ,出金額)
　　　VALUES ('2018-04-12','詳細は後で',60000)

--デフォルト値の指定を含むテーブル
CREATE TABLE テーブル名(
    列名　列名 DEFAULT デフォルト値,
    :
)

--家計簿テーブルを作成する（デフォルト値を活用）
CREATE TABLE 家計簿(
    日付　DATE,
    費目ID INTEGER,
    メモ　VARCHER(100) DEFAULT '不明',
    入金額 INTEGER DEFAULT 0,
    出金額 INTEGER DEFAULT 0
)

--DROP TABLE文
DROP TABLE テーブル名

--ALTER TABLE文
テーブル定義の内容を変更するには、ALTER TABLE文
このテーブルの「何を」「どう」帰るのかを指定する必要がある。

--列の追加
ALTER TABLE テーブル名　ADD 列名　型　制約

--列の削除
ALTER TABLE テーブル名　DROP 列名　型　制約

列の追加と削除

--追加するとき
ALTER TABLE 家計簿　ADD 関連日　DATE;

--削除するとき
ALTER TABLE 家計簿　DROP 関連日;


--全権のデータを高速に削除する
TRUNCATE TABLE文







