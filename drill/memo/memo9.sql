--トランザクションに含まれる複数のSQL文が、DBMSによって不可分なもととして
--扱われる性質のことをトランザクションの原子生という

--トランザクションを使うための指示
BEGIN
開始の指示。この指示以降のSQL文を一つのトランザクションとする。
COMMIT
終了の指示。この指示までを一つのトランザクションとし、変更を確定する
ROLLBACK
終了の指示。この指示までを一つのトランザクションとし、変更の取り消しをする

--2月以降の行をロックして集計する
SELECT ~ FOR UPDATE (NOWAIT)

BEGIN ;
SELECT * FROM 家計簿
 WHERE 日付 >= '2018-02-01'
  FOR UPDATE ;
 SELECT ~ ;
 SELECT ~ ;
 SELECT ~ ;
 COMMIT ; 

 --明示的な表ロックの取得
 LOCK TABLE テーブル表 IN モード名 MODE

 --MODE名はEXCLUSVE で排他ロック,SHAREで共有ロック

 BEGIN;
 LOCK TABLE 家計簿　IN EXCLUSIVE MODE ;
 SELECT ~ ;
 SELECT ~ ;
 SELECT ~ ;
 COMMIT;