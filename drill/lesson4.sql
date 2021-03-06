--4-1
1　SELECT * 
   FROM 注文履歴　
   ORDER BY 注文番号、注文枝番

2  SELECT DISTINCT 商品名 
   FROM 注文履歴
   WHERE 日付>= '2018-01-01'
   AND 日付 <= '2018-01-31'
   ORDER BY 商品名

3  SELECT 注文番号, 注文枝番,注文金額 
   FROM 注文履歴
   WHERE 分類 = '1' 
   ORDER BY 注文金額
   OFSET 1 ROWS FETCH NEXT 3 ROWS ONLY

4  SELECT 日付,商品名、単価、数量、注文器楽 
   FROM 注文履歴
   WHERE 分類 = '3' 
   AND 数量 >=2 
   ORDER BY 日付、数量 DESC

5 SELECT DISTINCT 分類、商品名、サイズ、単価
　 FROM 注文履歴
   WHERE 分類 = '1' UNION
   SELECT DISTINCT 分類、商品名、NULL、単価
　 FROM 注文履歴
   WHERE 分類 = '2' UNION
   SELECT DISTINCT 分類、商品名、NULL、単価
　 FROM 注文履歴
   WHERE 分類 = '3'
   ORDER BY 1,2

--4-2
1和集合の結果、整数テーブルと等しくなる
 SELECT 値
 FROM　奇数
 UNION SELECT 値
 FROM　偶数

2差集合の結果、奇数テーブルと等しくなる
 SELECT 値
 FROM　整数
 EXCEPT SELECT 値
 FROM　偶数

3積集合の結果、偶数テーブルと等しくなる
 SELECT 値
 FROM　整数
 INTERSECT SELECT 値
 FROM　偶数

4検索結果なし
 SELECT 値
 FROM　奇数
 INTERSECT SELECT 値
 FROM　偶数