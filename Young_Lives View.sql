
---HEALTH INDICATOR OVERVIEW

CREATE VIEW Health_Indicators_Overview AS
SELECT DISTINCT [childid],[Country],[agemon]/12 AS Age,[bmi],
    CASE WHEN [underweight] = '0' THEN 'Not Underweight' WHEN [underweight] = '1' THEN 'Moderately' WHEN [underweight] = '2' THEN 'Severely' ELSE 'Not Known' END AS underweight,
    CASE WHEN [stunting] = '0' THEN 'Not Stunted' WHEN [stunting] = '1' THEN 'Moderately' WHEN [stunting] = '2' THEN 'Severely' ELSE 'Not Known' END AS stunting,
    CASE WHEN [thinness] = '0' THEN 'Not Thin' WHEN [thinness] = '1' THEN 'Moderately' WHEN [thinness] = '2' THEN 'Severely' ELSE 'Not Known' END AS thinness,
	CASE [chhealth] WHEN '1' THEN 'Very Poor' WHEN '2' THEN 'Poor' WHEN '3' THEN 'Average' WHEN '4' THEN 'Good' ELSE 'Very Good' END AS chhealth
FROM [dbo].[India]
WHERE [underweight] <> '' AND [stunting] <> '' AND [thinness] <> ''
      
UNION

SELECT DISTINCT [childid],[Country],[agemon]/12 AS Age,[bmi],
    CASE WHEN [underweight] = '0' THEN 'Not Underweight' WHEN [underweight] = '1' THEN 'Moderately' WHEN [underweight] = '2' THEN 'Severely' ELSE 'Not Known' END AS underweight,
    CASE WHEN [stunting] = '0' THEN 'Not Stunted' WHEN [stunting] = '1' THEN 'Moderately' WHEN [stunting] = '2' THEN 'Severely' ELSE 'Not Known' END AS stunting,
    CASE WHEN [thinness] = '0' THEN 'Not Thin' WHEN [thinness] = '1' THEN 'Moderately' WHEN [thinness] = '2' THEN 'Severely' ELSE 'Not Known' END AS thinness,
	CASE [chhealth] WHEN '1' THEN 'Very Poor' WHEN '2' THEN 'Poor' WHEN '3' THEN 'Average' WHEN '4' THEN 'Good' ELSE 'Very Good' END AS chhealth
FROM [dbo].[Peru]
WHERE [underweight] <> '' AND [stunting] <> '' AND [thinness] <> '';

SELECT*
FROM [dbo].[Health_Indicators_Overview]


---EDUCATION

create view Education as
SELECT DISTINCT [childid],[Country],
   CASE WHEN [yc] = 1 THEN 'Younger' ELSE 'Older' END as YC,
   CASE chsex WHEN '1' THEN 'Male' ELSE 'Female' END AS Sex,
   CASE [engrade] WHEN '0' THEN 'None' WHEN '1' THEN 'grade 1' WHEN '2' THEN 'grade 2' WHEN '3' THEN 'grade 3' WHEN '4' THEN 'grade 4' WHEN '5' THEN 'grade 5'      
        WHEN '6' THEN 'grade 6' WHEN '7' THEN 'grade 7' WHEN '8' THEN 'grade 8' WHEN '9' THEN 'grade 9' WHEN '10' THEN 'grade 10' WHEN '11' THEN 'grade 11'
		WHEN '12' THEN 'grade 12' WHEN '13' THEN 'Post-secondary/technological institute' WHEN '14' THEN 'Vocational' WHEN '15' THEN 'Graduate'
        WHEN '16' THEN 'Postgraduate' WHEN '100' THEN 'Pre-primary' WHEN '28' THEN 'Adult literacy' WHEN '29' THEN 'Religious education' ELSE 'nk' END AS [engrade],
    CASE [enrol] WHEN '0' THEN 'No' WHEN '1' THEN 'Yes' WHEN '99' THEN 'Missing' WHEN '88' THEN 'N/A' ELSE 'Not Known' END AS [enrol],
	CASE [literate] WHEN '0' THEN 'No' ELSE 'Yes' END AS [literate],
	[levlread],[levlwrit],[dadedu],[momedu]
FROM [dbo].[India]
WHERE [literate] <> '' AND [levlread] <> '' AND [levlwrit] <> '' AND [dadedu] > 10 AND [momedu] > 10

UNION

SELECT DISTINCT [childid],[Country],
   CASE WHEN [yc] = 1 THEN 'Younger' ELSE 'Older' END as YC,
   CASE chsex WHEN '1' THEN 'Male' ELSE 'Female' END AS Sex,
   CASE [engrade] WHEN '0' THEN 'None' WHEN '1' THEN 'grade 1' WHEN '2' THEN 'grade 2' WHEN '3' THEN 'grade 3' WHEN '4' THEN 'grade 4' WHEN '5' THEN 'grade 5'      
        WHEN '6' THEN 'grade 6' WHEN '7' THEN 'grade 7' WHEN '8' THEN 'grade 8' WHEN '9' THEN 'grade 9' WHEN '10' THEN 'grade 10' WHEN '11' THEN 'grade 11'
        WHEN '13' THEN 'Incomplete tec. or pedagogical institute' WHEN '14' THEN 'Complete tec. or pedagogical institute' WHEN '15' THEN 'Incomplete university'
        WHEN '16' THEN 'Complete university' WHEN '17' THEN 'Adult literacy program' WHEN '18' THEN 'Other(specify)' WHEN '19' THEN 'Msc. or Dr. at university'
        WHEN '20' THEN 'some form of formal or informal preschool' WHEN '21' THEN 'Incomplete Cent.' WHEN '22' THEN 'Complete Cent.' WHEN '88' THEN 'missing'
		WHEN '100' THEN 'Pre-primary' WHEN '79' THEN 'n/a' ELSE 'nk' END AS [engrade],
    CASE [enrol] WHEN '0' THEN 'No' WHEN '1' THEN 'Yes' WHEN '99' THEN 'Missing' WHEN '88' THEN 'N/A' ELSE 'Not Known' END AS [enrol],
	CASE [literate] WHEN '0' THEN 'No' ELSE 'Yes' END AS [literate],
	[levlread],[levlwrit],[dadedu],[momedu]
FROM [dbo].[Peru]
WHERE [literate] <> '' AND [levlread] <> '' AND [levlwrit] <> '' AND [dadedu] > 10 AND [momedu] > 10

SELECT*
FROM [dbo].[Education]


----BASIC SERVICES

CREATE VIEW Basic_Services AS
SELECT DISTINCT [childid],[Country],[agemon]/12 as Age,CASE [yc] WHEN '0' THEN 'Older' ELSE 'Younger' END AS [yc],
    CASE [chsex] WHEN '1' THEN 'Male' ELSE 'Female' END AS [chsex],
    CASE [typesite] WHEN '1' THEN 'Urban' WHEN '2' THEN 'Rural' ELSE 'Not Known' END AS [typesite],
	CASE [drwaterq] WHEN '0' THEN 'No' WHEN '1' THEN 'Yes' ELSE 'Not Known' END AS [drwaterq],
    CASE [toiletq] WHEN '0' THEN 'No' WHEN '1' THEN 'Yes' ELSE 'Not Known' END AS [toiletq],
    CASE [elecq] WHEN '0' THEN 'No' WHEN '1' THEN 'Yes' ELSE 'Not Known' END AS [elecq],
    CASE [cookingq] WHEN '0' THEN 'No' WHEN '1' THEN 'Yes' ELSE 'Not Known' END AS [cookingq]
FROM [dbo].[India]
WHERE [drwaterq] <> '' AND [toiletq] <> '' AND [elecq] <> '' AND [cookingq] <> '' 

UNION 

SELECT DISTINCT [childid],[Country],[agemon]/12 as Age,CASE [yc] WHEN '0' THEN 'Older' ELSE 'Younger' END AS [yc],
    CASE [chsex] WHEN '1' THEN 'Male' ELSE 'Female' END AS [chsex],
    CASE [typesite] WHEN '1' THEN 'Urban' WHEN '2' THEN 'Rural' ELSE 'Not Known' END AS [typesite],
	CASE [drwaterq] WHEN '0' THEN 'No' WHEN '1' THEN 'Yes' ELSE 'Not Known' END AS [drwaterq],
    CASE [toiletq] WHEN '0' THEN 'No' WHEN '1' THEN 'Yes' ELSE 'Not Known' END AS [toiletq],
    CASE [elecq] WHEN '0' THEN 'No' WHEN '1' THEN 'Yes' ELSE 'Not Known' END AS [elecq],
    CASE [cookingq] WHEN '0' THEN 'No' WHEN '1' THEN 'Yes' ELSE 'Not Known' END AS [cookingq]
FROM [dbo].[Peru]
WHERE [drwaterq] <> '' AND [toiletq] <> '' AND [elecq] <> '' AND [cookingq] <> '' 

SELECT*
FROM [dbo].[Basic_Services]

----Alcohol Consumption

CREATE VIEW Alcohol_Consumption AS
SELECT DISTINCT [childid],[Country],[agemon]/12 as Age,[chsmoke],[chhrel],[cladder],
    CASE WHEN [chalcohol] = 1 THEN 'Yes' ELSE 'No' END as Chalcohol,
	CASE [chhealth] WHEN '1' THEN 'Very Poor' WHEN '2' THEN 'Poor' WHEN '3' THEN 'Average' WHEN '4' THEN 'Good' ELSE 'Very Good' END AS chhealth ,
    CASE WHEN [yc] = 1 THEN 'Younger' ELSE 'Older' END as YC
FROM [dbo].[India]
WHERE [chsmoke] <> '' AND [chalcohol] <> '' AND [chhrel] <> ''
      
UNION

SELECT DISTINCT [childid],[Country],[agemon]/12 as Age,[chsmoke],[chhrel],[cladder],
    CASE WHEN [chalcohol] = 1 THEN 'Yes' ELSE 'No' END as Chalcohol,
	CASE [chhealth] WHEN '1' THEN 'Very Poor' WHEN '2' THEN 'Poor' WHEN '3' THEN 'Average' WHEN '4' THEN 'Good' ELSE 'Very Good' END AS chhealth ,
    CASE WHEN [yc] = 1 THEN 'Younger' ELSE 'Older' END as YC
FROM [dbo].[Peru]
WHERE [chsmoke] <> '' AND [chalcohol] <> '' AND [chhrel] <> ''

SELECT*
FROM [dbo].[Alcohol_Consumption]
