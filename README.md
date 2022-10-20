# Video-Game-Data-Analytics-with-SQL

Objective : The project extracts, transforms, and loads (ETL) live video game sales data from https://www.vgchartz.com into an SQL Database. Further we analyse this data using SQL to capture some important sales information.

Takeaways

At the end of the project, you will be able to :


Perform webscraping to extract data from given url

Perform data exploration, preprocessing

Connecting to a Postgres SQL database from python script

CRUD operations in database from script

querying the data in Postgres SQL

Information about VGchartz website

The VGChartz Network is a collection of five video game websites: VGChartz, gamrFeed, gamrReview, gamrTV, and gamrConnect. VGChartz sits at the center of the network and is a video game sales tracking website, providing weekly sales figures of console software and hardware by region

Extract:

Collect data from vgchartz (https://www.vgchartz.com/games/games.php?page=2&results=200&order=Sales&ownership=Both&direction=DESC&showtotalsales=1&shownasales=1&showpalsales=1&showjapansales=1&showothersales=1&showpublisher=1&showdeveloper=0&showreleasedate=1&showlastupdate=1&showvgchartzscore=1&showcriticscore=1&showuserscore=1&showshipped=1)

The data should be collected for first 3 pages in a csv file for the columns - ['Pos', 'Game.1', 'Console', 'Publisher', 'Developer', 'VGChartz Score', 'Critic Score', 'User Score', 'Total Shipped', 'Total Sales', 'NA Sales', 'PAL Sales', 'Japan Sales', 'Other Sales', 'Release Date', 'Genre']. (it might take some time to scrap all the three pages


The link for the extracted data is here - https://drive.google.com/file/d/1CWvgV4pLaMpJR2MmUnNdgbR7Gl4Sj5l5/view?usp=sharing

Transform:

This step is also called Data Preprocessing step

Do the following clean up and transformation steps to the raw video games data obtained from the Extraction process:

Delete games without sales data (delete only those rows where total shipped and total sales both are missing and not where only total sales is missing)

Remove unwanted columns and rename the columns

Add Release year column

Convert Release date values to date format and Sales values to float format

Write the transformed video games data into CSV file to be used for the Load process

Please use this notebook to complete the transform phase - https://colab.research.google.com/drive/1_bio05gGXaGzgAkhGLcMop_mpM6fu_dR?usp=sharing

LOAD:

Load the transformed video games data into PostgreSQL Database

We will complete the following steps in this phase:

Create a SQL script for table creation according to schema provided in ERD diagram in PostgreSQL
Split the transformed data based on the SQL schema designed above
Connect to PostgreSQL from Colab and dump the data from dataframes into respective tables .
Please use this notebook to complete the load phase - https://colab.research.google.com/drive/1tuhyVbcfSupsdeDUNoR2i4zQxj3_tSa4?usp=sharing


Data Analysis
Perform the following analysis in PostgreSQL after building the complete database:

1.Write a SQL query to determine the year in which North America had highest video games sales.

2.Write a SQL query to determine the year in which the global sales was highest.

3.Write a SQL query to determine the year in which the total shipped was highest.

4.Write a SQL query to determine the most popular video game console in North America.

5.Write a SQL query to determine the most popular video game console in PAL.

6.Write a SQL query to determine the most popular video game console in Japan.

7.Write a SQL query to determine the most popular video game console in Other regions.

8.Write a SQL query to determine the most popular video game console globally.

9.Write a SQL query to determine the most shipped video game console.

10.Write a SQL query to determine the most popular video game across various consoles.

11.Write a SQL query to determine the most popular video game across various genres.
