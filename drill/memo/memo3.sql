--NULLの判定
--NULLであることを判定する
式 IS NULL 

--NULLでないことを判定する
式 IS NOT NULL

SELECT *
  FROM 家計簿
WHERE 出金額　IS NULL

--LIKE演算子

SELECT * FROM 家計簿
 WHERE メモ　LIKE '%1月%'

 --BETWEEN演算子

 --BETWEEN演算子は、ある範囲内に値が収まっているかを判定する

 SELECT *
   FROM 家計簿
 WHERE 出金額 BETWEEN 100 AND 3000 

 -- IN/NOT IN 演算子
IN 演算子は、値がかっこ内に列挙した複数の値のいずれか合致するかを判定する演算子です。

式 IN (値１、値２,値3)

SELECT * 
 FROM 家計簿
 WHERE 費目 IN ('食費','交際費')

SELECT *
 FROM 家計簿
 WHERE  費目 NOT IN ('食費','交際費')


--AND 演算子 OR演算子

条件式1 AND 条件式２
条件式１ OR 条件式2