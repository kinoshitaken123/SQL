--1-1
A ファイル
B DBMS
C データ　→　SQL
D　リレーショナルデータベース
E　行 →　列
F　テーブル　→　行

--1-2

Amazon　ショッピングシステム　本、商品、etc

--1-3

--1.入金額が50,000円に等しい行を検索して全ての列を表示する。
SELECT *
FROM 家計簿
 WHERE 入金額 = 50,000 

--2.出金額が4,000円を超える行を全て削除する
DELETE FROM 家計簿
 WHERE 出金額 > 4,000 

--3.2018年2月3日のメモを「カフェラテを購入」に変更する
UPDATE 家計簿
 SET メモ　= 'カフェラテ購入'
 WHERE 日付 = '2018-02-03'