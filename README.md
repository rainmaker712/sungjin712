---
title: "Chp5"
output: html_document
---

```{r}
library("ggplot2"); library("recommenderlab"); library("data.table"); library("countrycode")

file_in <- "anonymous-msweb.test.txt"
table_in <- read.csv(file_in, header = F)
head(table_in)

table_users <- table_in[, 1:2] #Drop other col
table_users <- data.table(table_users) # 좀 더 편한 형태로 바꾸기 위한 table화
#테이블은 카테고리, value로 나누어짐

#테이블 이름명 변경
setnames(table_users, 1:2, c("category", "value"))
table_users <- table_users[category %in% c("C", "V")]
head(table_users)

#Rating Matrix 확인해보기
table_users[, chunk_user := cumsum(category == "C")]
head(table_users)

#구매한 인원을 찾아보기
table_long <- table_users[, list(user = value[1], item = value[-1]),
                          by ="chunk_user"]

table_long[, value := 1]
table_wide <- reshape(data = table_long,
                      direction = "wide",
                      idvar = "user",
                      timevar = "item",
                      v.names = "value")
head(table_wide[, 1:5, with = F])

##rating matrix를 만들기 위해서는 col이 rating을 포함하고 row 가 user이름을 포함해야함

vector_users <- table_wide[, user]
table_wide[, user := NULL]
table_wide[, chunk_user := NULL]

## col 이름이 item 이름과 같으려면, value prefix가 필요하다.
setnames(x = table_wide,
        old = names(table_wide),
        new = substring(names(table_wide), 7))

##recommenderlab에 저장하려면 matrix화 시켜야합니다. 그리고 Row 이름들을 User 이름들과 일치시켜야 함
matrix_wide <- as.matrix(table_wide)
rownames(matrix_wide) <- vector_users
head(matrix_wide[, 1:6])

##마지막으로 matrix_wide를 binary rating으로 변환시키기
matrix_wide[is.na(matrix_wide)] <- 0
ratings_matrix <- as(matrix_wide, "binaryRatingMatrix")
##이미지화 시키기
image(ratings_matrix[1:50, 1:50], main = "Binary rating matrix")

#구매한 User들의 분배 시각화
n_users <- colCounts(ratings_matrix)
qplot(n_users) + stat_bin(binwidth = 100) + ggtitle("Distribution of
                                                    the number of users")
qplot(n_users[n_users < 100]) + stat_bin(binwidth = 10)
      + ggtitle("Distribution of the number of users")

#Item들 중에 몇번 밖에 못 구매한 경우에는 무시한다.
ratings_matrix <- ratings_matrix[, colCounts(ratings_matrix) >= 5]

#모두에게 추천해주는 시스템으로 만드는 것. 
sum(rowCounts(ratings_matrix) == 0)
#15명의 user가 구매 기록이 없어 지워야 함 .+ 조금만 산 경우에 대해서는 다루기가 힘듬, 그래서 5개보다 더 크게 해라
ratings_matrix <- ratings_matrix[rowCounts(ratings_matrix) >= 5, ]

```

아이템 특성 뽑아내기

```{r}
table_in <- data.table(table_in)
table_items <- table_in[V1 == "A"]
head(table_items)

table_items <- table_items[, c(2,4,5), with = F]
setnames(table_items, 1:3, c("id", "description", "url"))
table_items <- table_items[order(id)]






```
```{r}

```
```{r}

```
```{r}

```




```{r, echo=FALSE}

```

