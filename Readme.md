Jobs Template for QB

made by Cpt_NoHand



# insert into @qb-core - shared.lua
```
["lscustoms"] = {
	label = "Los Santos Customs",
	defaultDuty = true,
	grades = {
        ['0'] = {
            name = "Help",
            payment = 0
        },
		['1'] = {
            name = "Office",
            payment = 50
        },
        ['2'] = {
            name = "Mechanic",
            payment = 75
        },
		['3'] = {
            name = "Mechanic",
            payment = 100
        },
        ['4'] = {
            name = "CEO",
            isboss = true,
            payment = 150
        },
    },
},		
```


## insert into @qb-bossmenu - config.lua
```
['lscustoms'] = vector3(x, y, z),
```