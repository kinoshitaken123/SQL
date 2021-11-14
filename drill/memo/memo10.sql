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