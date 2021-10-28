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