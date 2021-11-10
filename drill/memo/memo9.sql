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

 --トランザクション分離レベル
 SET TRANSACTION ISOLATION LEVEL 分離レベル名
 SET CURRENT ISOLATION 分離レベル名

--明示的な行ロックの取得
SELECT ~ FROM UPDATE 

--デッドロックを予防する方法
--①トランザクションの時間を短くする
--②同じ順番でロックするようにする

BEGIN;
INSERT INTO 家計簿
VALUES('2018-03-20','居住費','4月の家賃',0,60000);
INSERT INTO 家計簿
VALUES('2018-03-20','手数料','4月の家賃振り込み',420);
COMMIT;

BEGIN;
DELETE FROM 家計簿 WHERE 日付 = '2018-03-20';
ROLLBACK;

BIGIN;
LOCK TABLE 家計簿 IN EXCLUSIVE MODE;
INSERT INTO 統計結果
SELECT 'データ件数',COUNT(*) FROM 家計簿;
INSERT INTO 統計結果
SELECT '出金がく平均',AVG(出金額) FROM 家計簿;
COMMIT;



