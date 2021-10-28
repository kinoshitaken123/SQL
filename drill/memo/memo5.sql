--選択列リストへのさまざまな指定
SELECT 出金額,
       出金額 + 100,
	   'SQL'
FROM 家計簿

--計算式に別名をつける
SELECT 出金額,
       出金額 + 100 AS 百円増しの出金額
FROM   家計簿       

--INSERT文での計算式の利用
INSERT INTO 家計簿(出金額)
 VALUES (1000 + 105)

 --UPDATE文での計算式の利用
 UPDATE 家計簿
   SET 出金額 = 出金額 + 100

--CASE演算子(1)
列の値や条件式を評価し、その結界に応じて好きな値に変換することができる。

SELECT 費目,出金額,
       CASE 費目 WHEN '居住費' THEN '固定費'
       　　　　　 WHEN '水道光熱費' THEN '固定費'
                ELSE  '変動費'
        END AS 出費の分類
FROM 家計簿　WHERE 出金額 > 0               

--CASE演算子(2)
SELECT 費目, 入金額
 CASE WHEN 入金額 < 5000 THEN 'お小遣い'
      WHEN 入金額 < 100000 THEN '一時収入'
      WHEN 入金額 < 300000 THEN '給料でた！'
      ELSE '想定外の収入です！'
 END AS 収入の分類
FROM 家計簿
WHERE 入金額 > 0   

--LENGTH関数
SELECT メモ、 LENGTH(メモ) AS メモの長さ
 FROM 家計簿

--文字列を置換する関数
REPLACE(置換対象の文字列、置換前の部分文字列、置換後の部分文字列)

--メモの一部を置換する
UPDATE 家計簿
 SET メモ = REPLACE(メモ, '購入','買った')

 --SUBSTRING/SUBSTR 一部を抽出する
 文字列の一部分だけを取り出したい場合にはSUBSTRING関数またはSUBSTR関数を利用する。

 SELECT * FROM 家計簿
  WHERE SUBSTRING(費目,1,3) LIKE '%費%'

--CONTACT 文字列を連結する
SELECT CONTACT(費目, ':' || メモ) FROM 家計簿

SELECT 出金額, ROUND (出金額,-2) AS 百円単位の出金額
 FROM 家計簿

 --出金額の下２桁目、つまり１０の位で四捨五入される

 --TRUNC 指定桁で切り捨てる
 TRUNC(数値を表す列、有効とする桁数)

 --POWER ある値のべき条を計算したい場合、*演算子でも実装可能だがPOWER関数を用いると便利
 POWER (数値を表す列、何乗するかを指定する数値)
 POWER(出金額,3)

 --現在の日時を得る関数
 CURRENT_DATE 現在の日付
 CURRENT_TIME 現在の時刻

 --日付を自動的に取得して登録する
 INSERT INTO 家計簿
 VALUES (CURRENT_DATE, '食費', 'ドーナツを買った', 0, 260)

 --COALSESCE 最初に登場するNULLでない値を返す

 SELECT COALSESCE('A','B','C');
 SELECT COALSESCE('NULL','B','C');
 SELECT COALSESCE('NULL','B','NULL');

 --NULLを明示的に表示する
 SELECT 日付,費目、
        COALSESCE(メモ、'(メモはNULLです)') AS メモ,
        入金額, 出金額
 FROM 家計簿       