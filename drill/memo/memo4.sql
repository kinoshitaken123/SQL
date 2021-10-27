--SELECT 列名 FROM テーブル名

--UPDATE テーブル名 SET 列名　= 値

--DELETE FROM テーブル名

--INSERT INTO テーブル名(列名・・・)
--VALUES(値・・・)

--DISTINCT 重複行を除外する
SELECT文に付加すると、結果ひょうの中で内容が重複している行があれば、その重複を取り除く。

SELECT DISTINCT 列名・・・
 FROM テーブル名

 --ORDER BY 指定した列の値を基準として、検索結果を並べて取得することができる。
  SELECT 列名・・・　FROM テーブル名
  　ORDER BY 列名　並び順

  --昇順 ASC 降準 DESC
  --ORDER BY 句の初期値は昇順

  --出金額で昇順となるよう並び替えて取得する
  SELECT * FROM 家計簿
  　ORDER BY 出金額

  --複数の列で並び替える

  SELECT * FROM 家計簿
   ORDER BY 入金額 DESC, 出金額 DESC

   --OFFSET FETCH 先頭から数行だけ取得する
   SELECT　列名
   FROM　テーブル名
   ORDER BY　列名
   OFFSET 先頭から除外する行数　ROWS
   (FETCH NEXT 取得行数 ROWS ONLY)

   MYSQL,MariaDB,SQLiteではサポートされていない。

   --出金がくの高い順に３件取得する
   SELECT 費目、出金額
   FROM　家計簿
   ORDER BY 出金額　DESC
   OFFSET 0 ROWS
    FETCH NEXT 3 ROWS ONLY

    --OFFSET句には、先頭から除外したい行数を記述する。省略はできず、
    --除外せずに１件目から取得したい場合には0を指定する

    --3番目に高い出金額だけを取得する
    SELECT 費目、出金額
    FROM　家計簿
    ORDER BY 出金額　DESC
    OFFSET 2 ROWS
    FETCH NEXT 1 ROWS ONLY

    --UNION 和集合　２つの検索結果を足し合わせたもの

    --EXCEPT 差集合　最初の検索結果から次の検索結果と重複する部分を取り除いたもの

    --INTERSECT 積集合　２つの検索結果で重複するもの

    --2つのSELECT文の結果を足し合わせる
    SELECT 文１
     UNION (ALL)
    SELECT 文2

    --和集合を取得
    SELECT 費目,入金額,出金額
    FROM 家計簿
    UNION
    SELECT 費目,入金額,出金額
    FROM 家計簿アーカイブ
    ORDER BY 2,3,1

    --2つのSELECT文の結果の差を得る

    --EXCEPT / MINUS -差集合を求める
    SELECT 文１
    EXCEPT (ALL)
    SELECT 文2

    Oracle DBではEXCEPTの代わりにMINUSというキーワードを使う。

    --差集合を取得する
    SELECT 費目 FROM 家計簿
    EXCEPT
    SELECT 費目 FROM 家計簿アーカイブ