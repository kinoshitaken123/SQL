--インデックスの作成
CREATE INDEX インデゥクス名 ON テーブル名(列名)

--家計簿テーブルにインデックスを２つ作る
CREATE INDEX 費目IDインデックス oN 家計簿 (費目ID);
CREATE INDEX メモインデックス　ON 家計簿(メモ);

--DROP INDEX インデックス名

--WHERE句による絞り込み

--完全一致検索

SELECT * FROM 家計簿
　WHERE メモ = '不明'

--前方一致
SELECT * FROM 家計簿
 WHERE メモ　LIKE '一月の%'

 ビューの作成にはCREATE VIEW文、削除にはDROP VIEW文
 
 CREATE VIEW ビュー名 AS SEKECT文
 DROP VIEW ビュー名

 --各DBMSにおける連番の指定
 CREATE TABLE 費目(
     ID INTGEGER IDENTITY PRIMARY KEY,
     :
 )

--シーケンスの作成と削除
CREATE SEQUENCE シーケンス名
DROP SEQUENCE シーケンス名

--日付での並び替えや費目IDによる結合を行う家計簿テーブルの検索を高速に行う
CREATE INDEX 日付インデックス　ON 家計簿(日付);
CREATE INDEX 費目IDインデックス ON 家計簿(費目ID);

--費目テーブルと結合済みの家計簿をビューを利用して手軽に使えるようにしたい
CREATE VIEN 費目名付き家計簿 AS
SELECT * FROM 家計簿
　JOIN 費目
   ON  家計簿.費目ID = 費目.ID


