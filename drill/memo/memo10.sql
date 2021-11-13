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