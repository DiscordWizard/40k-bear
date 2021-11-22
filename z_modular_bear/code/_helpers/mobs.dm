
// from code\_helpers\mobs.dm


proc/skintone2racedescription(tone)
	switch (tone)
		if(30 to INFINITY)		return "albino"
		if(20 to 30)			return "pale"
		if(5 to 15)				return "light skinned"
		if(-10 to 5)			return "white"
		if(-25 to -10)			return "tan"
		if(-45 to -25)			return "darker skinned"
		if(-65 to -45)			return "brown"
		if(-INFINITY to -65)	return "black"
		else					return "unknown"

proc/age2agedescription(age)
	switch(age)
		if(0 to 1)			return "invalid age, please tell Bear"
		if(1 to 3)			return "invalid age, please tell Bear"
		if(3 to 13)			return "invalid age, please tell Bear"
		if(13 to 19)		return "teenager"
		if(19 to 30)		return "young adult"
		if(30 to 45)		return "adult"
		if(45 to 60)		return "middle-aged"
		if(60 to 70)		return "aging"
		if(70 to INFINITY)	return "elderly"
		else				return "unknown"

proc/ageAndGender2Desc(age, gender)//Used for the radio
	if(gender == FEMALE)
		switch(age)
			if(0 to 17)			return "Lass"
			if(18 to 29)		return "Young Woman"
			if(30 to 44)		return "Woman"
			if(45 to 59)		return "Middle Aged Woman"
			if(60 to INFINITY)	return "Old Woman"
			else				return "Unknown"
	else
		switch(age)
			if(0 to 18)			return "Lad"
			if(18 to 29)		return "Young Man"
			if(30 to 44)		return "Man"
			if(45 to 59)		return "Middle Aged Man"
			if(60 to INFINITY)	return "Old Man"
			else				return "Unknown"