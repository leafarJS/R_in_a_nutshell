#FACTORS
eye_colors <- c("brown", "blue", "blue", "blue", "green", "brown", "brown", "brown")
eye_colors


eye_colors <-factor(c("brown", "blue", "blue", "blue", "green", "brown", "brown", "brown"))
#The levels function shows all the levels from a factor:
eye_colors
levels(eye_colors)


#Para sortear estos problemas, puede usar un factor ordenado para representar 
#la respuesta de esta encuesta. Aquí hay un ejemplo:

survey_result <-factor(c("Disagree","Neutral","Strongly Disagree",
                       "Neutral","Agree","Strongly Agree",
                       "Disagree","Strongly Agree","Neutral",
                       "Strongly Disagree","Neutral","Agree"),
                       levels = c("Strongly Disagree", "Disagree",
                                  "Neutral", "Agree", "Strongly Agree"),
                       ordered = TRUE)
survey_result



#use the eye colors vector we used above
eye_colors
class(eye_colors)

#now create a vector by removing the class
eye_colors.integer.vector <- unclass(eye_colors)
eye_colors.integer.vector

#attr(,"levels")
class(eye_colors.integer.vector)

#t’s possible to change this back to a factor by setting the class attribute:
class(eye_colors.integer.vector) <- "factor"
eye_colors.integer.vector

class(eye_colors.integer.vector)
