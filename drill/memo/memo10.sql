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

--制約
あえて制限することで安全性を高める
予期しない値を格納できないように制限をかけることで、
人為的みすによるデータ破壊の可能性を減らすことができる。

--CREATE TABLE 文中における制約の指定
CREATE TABLE テーブル名(
    列名　型　制約の指定,
    :
)

--基本的な３つの制約を活用
CREATE TABLE 家計簿　(
    日付　DATE
    費目ID INTEGER,
    メモ　　VARCHAR(100) DEFAULT '不明'　NOT NULL,
    入金額　DEFAULT 0 CHECK(入金爆 >= 0),
    出金額　DEFAULT 0 CHECK(入金爆 >= 0),
);
CREATE TABLE 費目 (
    ID INTEGER,
    名前　VARCHAR(40) UNIQUE
);


--デフォルト値が設定されていなければ、エラーにならない
INSERT INTO 家計簿　(日付,費目ID,メモ,入金額,出金額)
　　　VALUES ('2018-04-04',2,'家賃',0,60000);

INSERT INTO 家計簿(日付、費目ID,入金額、出金額)
     VALUES ('2018-04-05',3,0,1350);
