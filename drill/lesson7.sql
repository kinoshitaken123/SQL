--7-1
A　単一行副問い合わせ
B SELECT
C SET
D n
E 1
F 複数行副問い合わせ
G ANY
H ALL
I FROM
J 表
K INSERT

--7-3
INSERT INTO 頭数集計
SELECT 飼育県,COUNT(個体識別番号)
  FROM 個体識別
GROUP BY 飼育県  