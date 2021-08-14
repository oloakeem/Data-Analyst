/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [value]
     ,[Count]
  FROM [Manga].[dbo].[GenrePercent]
  ORDER BY [Count] DESC

--SELECT [value], [Count], 
--[Count] * 100 / (SELECT SUM([Count]) AS s FROM [Manga].[dbo].[GenrePercent]) AS [Percent of Total]
--FROM [Manga].[dbo].[GenrePercent]
--ORDER BY [value];
/** Required alittle bit more cleaning**/
--UPDATE [Manga].[dbo].[GenrePercent]
--SET [value] = REPLACE([value], '''', '')

--UPDATE [Manga].[dbo].[GenrePercent]
--SET [value] = REPLACE([value], ' ', '')
--SELECT [value], COUNT(*)
--FROM [Manga].[dbo].[GenrePercent]
--GROUP BY [value]
--HAVING COUNT(*) > 1

SELECT
   [Value],
   SUM([Count]) AS [Count]
FROM [Manga].[dbo].[GenrePercent]
GROUP BY [Value]
ORDER BY [COUNT] DESC