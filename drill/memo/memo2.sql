--ASによる別名の定義
SELECT 費目 AS ITEM , 入金額 AS RECEIVE, 出金額 AS PAY
  FROM 家計簿　AS MONEYBOOK
  WHERE 費目 = '給料'

  --条件付きのUPDATE文
  UPDATE 家計簿 
   SET　入金額 = 99999
   WHERE 日付　= '2018-02-03'

   --WHEREのないUPDATE文は全権更新

   --DELETE文の基本構文

   DELETE 
    FROM テーブル名
   (WHERE) 

    --WHEREのないUPDATE文は全権更新

--INSERT文の基本構文
--テーブルに新しいデータを追加するための命令。テーブルの行を指定する仕組みWHEREはない
--その代わり、どこに、どのようなデータを追加するのかをしてする構造

INSERT INTO テーブル名
 VALUES　(値１、値２、値３)

 --SQL文の中に直接記述されるデータのことをリテラルという。