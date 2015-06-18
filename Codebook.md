Codebook
========

Variable list and descriptions
------------------------------

Variable name    | Description
-----------------|------------
activity         | Activity (LAYING,SITTING,STANDING,WALKING,WALKING_DOWNSTAIRS,WALKING_UPSTAIRS)
subject          | The id of the subject (1-30)
variable         | The variable of study
mean             | The average of each variable for each activity and each subject.


The posible values for the variables are :

* Time Body Acceleration Mean X
* Time Body Acceleration Mean Y 
* Time Body Acceleration Mean Z
* Time Body Acceleration Standard Deviation X 
* Time Body Acceleration Standard Deviation Y
* Time Body Acceleration Standard Deviation Z 
* Time Gravity Acceleration Mean X 
* Time Gravity Acceleration Mean Y
* Time Gravity Acceleration Mean Z 
* Time Gravity Acceleration Standard Deviation X
* Time Gravity Acceleration Standard Deviation Y 
* Time Gravity Acceleration Standard Deviation Z
* Time Body Acceleration Jerk Mean X 
* Time Body Acceleration Jerk Mean Y
* Time Body Acceleration Jerk Mean Z 
* Time Body Acceleration Jerk Standard Deviation X
* Time Body Acceleration Jerk Standard Deviation Y 
* Time Body Acceleration Jerk Standard Deviation Z
* Time Body Gyroscope Mean X
* Time Body Gyroscope Mean Y
* Time Body Gyroscope Mean Z 
* Time Body Gyroscope Standard Deviation X
* Time Body Gyroscope Standard Deviation Y 
* Time Body Gyroscope Standard Deviation Z
* Time Body Gyroscope Jerk Mean X
* Time Body Gyroscope Jerk Mean Y 
* Time Body Gyroscope Jerk Mean Z
* Time Body Gyroscope Jerk Standard Deviation X 
* Time Body Gyroscope Jerk Standard Deviation Y
* Time Body Gyroscope Jerk Standard Deviation Z 
* Time Body Acceleration Magnetic Mean 
* Time Body Acceleration Magnetic Standard Deviation
* Time Gravity Acceleration Magnetic Mean
* Time Gravity Acceleration Magnetic Standard Deviation 
* Time Body Acceleration Jerk Magnetic Mean
* Time Body Acceleration Jerk Magnetic Standard Deviation 
* Time Body Gyroscope Magnetic Mean
* Time Body Gyroscope Magnetic Standard Deviation 
* Time Body Gyroscope Jerk Magnetic Mean 
* Time Body Gyroscope Jerk Magnetic Standard Deviation
* Frequency Body Acceleration Mean X 
* Frequency Body Acceleration Mean Y
* Frequency Body Acceleration Mean Z 
* Frequency Body Acceleration Standard Deviation X
* Frequency Body Acceleration Standard Deviation Y 
* Frequency Body Acceleration Standard Deviation Z
* Frequency Body Acceleration Jerk Mean X
* Frequency Body Acceleration Jerk Mean Y 
* Frequency Body Acceleration Jerk Mean Z
* Frequency Body Acceleration Jerk Standard Deviation X 
* Frequency Body Acceleration Jerk Standard Deviation Y
* Frequency Body Acceleration Jerk Standard Deviation Z 
* Frequency Body Gyroscope Mean X
* Frequency Body Gyroscope Mean Y 
* Frequency Body Gyroscope Mean Z
* Frequency Body Gyroscope Standard Deviation X 
* Frequency Body Gyroscope Standard Deviation Y
* Frequency Body Gyroscope Standard Deviation Z 
* Frequency Body Acceleration Magnetic Mean
* Frequency Body Acceleration Magnetic Standard Deviation 
* Frequency Body Acceleration Jerk Magnetic Mean 
* Frequency Body Acceleration Jerk Magnetic Standard Deviation
* Frequency Body Gyroscope Magnetic Mean 
* Frequency Body Gyroscope Magnetic Standard Deviation
* Frequency Body Gyroscope Jerk Magnetic Mean
* Frequency Body Gyroscope Jerk Magnetic Standard Deviation 


str(dataset) 
-----------------

```
'data.frame':	11880 obs. of  4 variables:
 $ activity: Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ subject : int  1 1 1 1 1 1 1 1 1 1 ...
 $ variable: Factor w/ 66 levels "Time Body Acceleration Mean X",..: 1 2 3 4 5 6 7 8 9 10 ...
 $ mean    : num  0.2216 -0.0405 -0.1132 -0.9281 -0.8368 ...
```

Tidy, f, quote=FALSE, sep="\t", row.names=FALSE)
```