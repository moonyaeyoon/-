
#학생들의 점수 (국어, 수학, 영어, 사회, 과학)
student.A<- c(80, 32, 95, 69, 50)
student.B <- c(60, 48, 79, 87, 90)
student.C <- c(75, 88, 90, 71, 69)
student.D <- c(45, 28, 100, 62, 97)
subject <-c("국어", "수학", "영어", "사회", "과학")
student.score <- data.frame(student.A, student.B, student.C, student.D)
rownames(student.score) <- subject
student.score

#student.A의 성적 60점 초과인 과목에 Good 이하는 Bad
norow <- nrow(student.score)
score.good.bad <- c()
for(i in 1:norow) {
  if(student.score$student.A[i] > 60) {
    score.good.bad[i] <- 'Good'
  } else {
    score.good.bad[i] <- 'Bad'
  }
}
good.bad <- data.frame(student.score$student.A, score.good.bad)
print(good.bad)

#각 학생의 점수 평균 구하기
avg.all <- apply(student.score, 2, mean)
print(avg.all)

#등급 부여 함수 grade
grade <- function(avg) {
  if(avg > 80) {
    print("성적은 A입니다.")
  } else if(avg > 70) {
    print("성적은 B입니다.")
  } else if(avg > 60) {
    print("성적은 C입니다.")
  } else {
    print("성적은 D입니다.")
  }
}

grade(avg.all[3]) #C학생의 성적


library(svDialogs)

# 데이터 프레임으로 만들기
student.score <- data.frame(student.A, student.B, student.C, student.D)
student.score <- t(student.score)
colnames(student.score) <- subject
rownames(student.score) <- student

getSubjectScores <- function() {
  # 콘솔에서 과목 이름 입력 받기
  subject_name <- readline(prompt = "원하는 과목을 입력하세요: ")
  
  if (subject_name %in% colnames(student.score)) {
    # subset을 사용하여 해당하는 열 추출
    subject_column <- student.score[, subject_name, drop = FALSE]
    print(subject_column)
  } else {
    cat("오류: 일치하는 과목을 찾을 수 없습니다.\n")
  }
}

# 함수 호출
getSubjectScores()


# 학생 수 입력 받기

while (TRUE) {
  num_students <- as.numeric(readline(prompt = "학생 수를 입력하시오 : "))
  if (is.na(num_students) || num_students <= 0) {
    cat("타당하지 않은 숫자(혹은 문자)입니다. 다시 입력하세요.\n")
  } else {
    break
  }
}

# 학생들의 점수를 저장할 벡터 초기화
scores <- as.numeric(num_students)

# 학생별로 점수 입력 받기
for (i in 1:num_students) {
  score <- as.numeric(readline(prompt = paste("학생의 점수를 입력하시오.", i, ": ")))
  scores[i] <- score
}

# 입력된 학생들의 점수 출력
cat("학생의 점수 :\n")
for (i in 1:num_students) {
  cat("Student", i, ":", scores[i], "\n")
}

# 평균 계산
average <- mean(scores)

# 특정 학생의 점수 입력 받기
student_number <- -1
repeat {
  student_number <- as.integer(readline(prompt = paste("Enter student number to check (1-", num_students, "): ")))
  if (!is.na(student_number) && student_number > 0 && student_number <= num_students) {
    break
  } else {
    cat("타당하지 않은 숫자(혹은 문자)입니다.\n")
  }
}
student_score <- scores[student_number]

# 평균 이상인지 이하인지 확인하여 출력
if (student_score >= average) {
  cat("해당 학생의 점수는", student_number, "평균 이상입니다.")
} else {
  cat("해당 학생의 점수는는", student_number, " 평균보다 아래입니다.")
}


#학생들의 점수 (국어, 수학, 영어, 사회, 과학)
student.A<- c(80, 32, 95, 69, 50)
student.B <- c(60, 48, 79, 87, 90)
student.C <- c(75, 88, 90, 71, 69)
student.D <- c(45, 28, 100, 62, 97)
subject <-c("국어", "수학", "영어", "사회", "과학")
student.score <- data.frame(student.A, student.B, student.C, student.D)
rownames(student.score) <- subject
student.score

#student.A의 성적 60점 초과인 과목에 Good 이하는 Bad
norow <- nrow(student.score)
score.good.bad <- c()
for(i in 1:norow) {
  if(student.score$student.A[i] > 60) {
    score.good.bad[i] <- 'Good'
  } else {
    score.good.bad[i] <- 'Bad'
  }
}
good.bad <- data.frame(student.score$student.A, score.good.bad)
print(good.bad)

#각 학생의 점수 평균 구하기
avg.all <- apply(student.score, 2, mean)
print(avg.all)

#등급 부여 함수 grade
grade <- function(avg) {
  if(avg > 80) {
    print("성적은 A입니다.")
  } else if(avg > 70) {
    print("성적은 B입니다.")
  } else if(avg > 60) {
    print("성적은 C입니다.")
  } else {
    print("성적은 D입니다.")
  }
}

grade(avg.all[3]) #C학생의 성적


