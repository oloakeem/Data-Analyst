/* Simple Cleaning
Irrelevant observations,
*/
--Check for Nulls,
SELECT * FROM [top_1000]
WHERE [Title]  IS  NULL
  AND [Rank] IS  NULL
  AND [Memebers] IS  NULL; 
 
 --Checking for Duplicates 
SELECT [Title], COUNT(*)
FROM [top_1000]
GROUP BY [Title]
HAVING COUNT(*) > 1
-- Certain Duplicates where genuine 
-- However some just had the wrong Title 
SELECT *
FROM [top_1000] a
JOIN  (SELECT [Title] 
FROM [top_1000] 
GROUP BY [Title] 
HAVING COUNT(*) > 1 ) b
ON a.[Title] = b.[Title]
ORDER BY a.[Title]

--Deleted Duplicates with same Sysnopsis
DELETE FROM [top_1000] WHERE [column1] IN (651,50,800,825,650,835);

--Delete the other duplicates based on title.
WITH CTE AS(
   SELECT [Title],
       RN = ROW_NUMBER()OVER(PARTITION BY [Title] ORDER BY [Title])
   FROM [dbo].[top_1000]
)
DELETE FROM CTE WHERE RN > 1
--Irrelevant observations,
ALTER TABLE [top_1000]
DROP COLUMN [Title_Japanese],[Title_Synonym],[Synopsis],[Publish_period],[Publishing];

SELECT TOP (1000) [column1]
      ,[Title]
      ,[Status]
      ,[Volumns]
      ,[Chapters]
      ,[Rank]
      ,[Score]
      ,[Scored_by]
      ,[Popularity]
      ,[Memebers]
      ,[Favorites]
      ,[Genre]
  FROM [Manga].[dbo].[top_1000]
  ORDER BY [Rank] ASC;

/***Change DataTypes of multiple columns ***/
--ALTER TABLE [top_1000] ADD RealRank int;
--UPDATE [dbo].[top_1000] SET RealRank = CAST([Rank] AS int);
--ALTER TABLE [top_1000] ADD [Popular] int;
--UPDATE [dbo].[top_1000] SET [Popular] = CAST([Popularity] AS int);
--ALTER TABLE [top_1000]
--DROP COLUMN [Rank];
--DROP COLUMN [Popularity];
--DROP COLUMN [column1];
