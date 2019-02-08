
mtcars <- mtcars

#Display the data
View(mtcars)

head(mtcars,10)
#select first row
N1_mtcars<- mtcars[2,]
#select first 10 rows
mtcars[5:10,]
#select first column
mtcars[,1]
#select first three column
slice <- mtcars[5:10,1:3]

#select records where mpg is > than 10
mpg_bigger_10 <- mtcars[mtcars$mpg > 10,]
#select records gear is equal 4
mtcars[mtcars$gear == 4,]
#select records gear is equal 5 AND mpg is > than 12
mtcars[mtcars$gear == 5 & mtcars$mpg > 12,]
#select records gear is not equal 3
mtcars[!mtcars$gear != 3,]
#OR
mtcars[!mtcars$gear != 3,]

