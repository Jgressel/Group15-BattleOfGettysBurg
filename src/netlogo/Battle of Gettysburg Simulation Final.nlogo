extensions [time]

globals [
  number-of-confederate-soldiers
  number-of-union-soldiers
  confederate-starting-points
  confederate-infantry-starting-points
  confederate-cavalry-starting-points
  confederate-artillery-starting-points
  confederate-objective-points

  union-infantry-starting-points
  union-cavalry-starting-points
  union-artillery-starting-points
  union-ending-points
  current-date-time
  time-of-reinforcement
  turtle-troop-size
  initial-fight-point
  minutes-per-tick
  union-infantry-reinforcement_points
  union-artillery-reinforcement_points
  confederate-infantry-reinforcement_points
  confederate-artillery-reinforcement_points
]

breed [union-army union-soldiers]
breed [confederate-army confederate-soldiers]
turtles-own [union-target confederate-target]

breed [confederate-infantry Cinfantry]
;breed [confederate-cavalry Ccavalry]
breed [confederate-artillery Cartillery]
breed [union-infantry Uinfantry]
;breed [union-cavalry Ucavalry]
breed [union-artillery Uartillery]

confederate-army-own [
  health
  troop-type  ;
]

union-army-own [
  health
   troop-type  ;
]

to-report confederate-troop-count
  report count confederate-army * (turtle-troop-size)
end

to-report union-troop-count
  report count union-army * (turtle-troop-size)
end

to-report confederate-troop-killed
  report (number-of-confederate-soldiers - count confederate-army) * (turtle-troop-size)
end

to-report union-troop-killed
  report (number-of-union-soldiers - count union-army) * (turtle-troop-size)
end

to-report fight-started
  report union-troop-killed > 0 or confederate-troop-killed > 0
end

to LittleRoundTop_Historical
  clear-all
  historical-control-scenario
end

to LittleRoundTop_EarlyConfAttack_BothReinforcements
  clear-all
  battle_scenario1
end

to LittleRoundTop_HistoricalConfAttack_ConfReinforcementsOnly
  clear-all
  battle_scenario2
end

to LittleRoundTop_EarlyConfAttack_UnionReinforcementsOnly
  clear-all
  battle_scenario3
end

;=======================================================================================================================
to historical-control-scenario

  set minutes-per-tick 10
  ; day 2
  set turtle-troop-size 10
  set confederate-infantry-starting-points patches at-points [
    [-6 29][-6 30][-5 31][-6 31][-5 30][-4 30][-5 30][-7 30][-6 30]
    ]

  set confederate-cavalry-starting-points patches at-points [
    [-10 6]
  ]

  set confederate-artillery-starting-points patches at-points [
    [-6 29][-5 30][-4 30][-7 28]
  ]

;    set confederate-objective-points patches at-points [
;    [-1 24]
;    ]

    set union-infantry-starting-points patches at-points [
    [-1 29]; Main Hook
    [-5 27][-6 27][-5 26][-4 26][-3 26][-5 25][-4 27][-3 27][-3 25][-2 27][-2 28][-3 28][-4 28]; Peach Orchard
    ]

;  set union-cavalry-starting-points patches at-points [
;    [10 6]
;  ]

    set union-artillery-starting-points patches at-points [
    [-2 28][-1 29][-3 26][-1 30]
  ]

    set union-infantry-reinforcement_points patches at-points [
    [-2 26]
    ]

   set union-artillery-reinforcement_points patches at-points [
    [-2 26]
    ]

    set confederate-objective-points patches at-points [
    ;  [32 26][32 25][32 24]
    ;  [33 27][33 26][33 25][33 24]
    ;  [34 27][34 26][34 25][34 24]
    ;  [35 26][35 25]
  ]

    set union-ending-points patches at-points [
      [38 4][38 3]
     ; [37 4][37 3]
    ;  [36 4][36 3]
    ]

    ;set confederate-attack-strength 60
    ;set union-attack-strength 40
    ;set run-away-protection-bonus 32


    import-drawing "Gettysburg.png"
    set current-date-time time:create "1863/07/02 16:00"
    set time-of-day "4:00 PM"
    set number-of-confederate-soldiers int(15000 / (turtle-troop-size))
    set number-of-union-soldiers int(10000 / (turtle-troop-size))


  ask union-infantry-starting-points [
    set pcolor blue
  ]

;    ask union-cavalry-starting-points [
;    set pcolor blue
;  ]


    ask union-artillery-starting-points [
    set pcolor blue
  ]

    ask confederate-infantry-starting-points [
    set pcolor red
  ]

;    ask union-cavalry-starting-points [
;    set pcolor blue
;  ]

    ask confederate-artillery-starting-points [
    set pcolor red
  ]


  create-confederate-army (number-of-confederate-soldiers * 0.9965) [
    set shape "person"  ; Example shape for infantry
    set color red
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of confederate-infantry-starting-points
  ]
  create-confederate-army (number-of-confederate-soldiers * 0.004) [
    set shape "cannon"  ; Example shape for artillery
    set color red
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of confederate-artillery-starting-points
  ]
  create-union-army (number-of-union-soldiers * 0.99) [
    set shape "person"  ; Example shape for infantry
    set color blue
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of union-infantry-starting-points
  ]
  create-union-army (number-of-union-soldiers * 0.01) [
    set shape "cannon"  ; Example shape for artillery
    set color blue
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of union-artillery-starting-points
  ]
  reset-ticks
end
;=======================================================================================================================
to battle_scenario1

  set minutes-per-tick 10
  ; day 2
  set turtle-troop-size 10
  set confederate-infantry-starting-points patches at-points [
    [-6 29][-6 28][-6 28][-6 27][-5 29][-4 29][-5 28];[16 36][16 37][16 38][16 39]
    ]

  set confederate-cavalry-starting-points patches at-points [
    [-10 6]
  ]

  set confederate-artillery-starting-points patches at-points [
    [-6 29][-5 30][-4 30][-7 28]
  ]
;    set confederate-objective-points patches at-points [
;    [-1 24]
;    ]
 set confederate-infantry-reinforcement_points patches at-points [
    [-5 -5]
    ]

   set confederate-artillery-reinforcement_points patches at-points [
    [-7 -5]
    ]

    set union-infantry-starting-points patches at-points [
    [-1 29]; Main Hook
    [-5 27][-6 27][-5 26][-4 26][-3 26][-5 25][-4 27][-3 27][-3 25][-2 27][-2 28][-3 28][-4 28]; Peach Orchard
    ]

;  set union-cavalry-starting-points patches at-points [
;    [10 6]
;  ]

  set union-artillery-starting-points patches at-points [
   [-4 26][-4 27][-3 27][-5 27][-1 29]
  ]
    set union-infantry-reinforcement_points patches at-points [
    [-2 26]
    ]

   set union-artillery-reinforcement_points patches at-points [
    [-2 26]
    ]

    ;set confederate-objective-points patches at-points [
    ;  [32 26][32 25][32 24]
    ;  [33 27][33 26][33 25][33 24]
    ;  [34 27][34 26][34 25][34 24]
    ;  [35 26][35 25]
  ;]

    set union-ending-points patches at-points [
      [38 4][38 3]
     ; [37 4][37 3]
    ;  [36 4][36 3]
    ]

    ;set confederate-attack-strength 60
    ;set union-attack-strength 40
    ;set run-away-protection-bonus 32

    import-drawing "Gettysburg.png"
    set current-date-time time:create "1863/07/02 14:00"
    set time-of-day "2:00 PM"
    set number-of-confederate-soldiers 15000 / (turtle-troop-size)
    set number-of-union-soldiers 10000 / (turtle-troop-size)

  ask union-infantry-starting-points [
    set pcolor blue
  ]

;    ask union-cavalry-starting-points [
;    set pcolor blue
;  ]

    ask union-artillery-starting-points [
    set pcolor blue
  ]

    ask confederate-infantry-starting-points [
    set pcolor red
  ]

;    ask union-cavalry-starting-points [
;    set pcolor blue
;  ]

    ask confederate-artillery-starting-points [
    set pcolor red
  ]

  create-confederate-army (number-of-confederate-soldiers * 0.9965) [
    set shape "person"  ; Example shape for infantry
    set color red
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of confederate-infantry-starting-points
  ]
  create-confederate-army (number-of-confederate-soldiers * 0.004) [
    set shape "cannon"  ; Example shape for artillery
    set color red
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of confederate-artillery-starting-points
  ]
  create-union-army (number-of-union-soldiers * 0.995) [
    set shape "person"  ; Example shape for infantry
    set color blue
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of union-infantry-starting-points
  ]
  create-union-army (number-of-union-soldiers * 0.005) [
    set shape "cannon"  ; Example shape for artillery
    set color blue
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of union-artillery-starting-points
  ]

  reset-ticks
end
;=======================================================================================================================
to battle_scenario2
  set minutes-per-tick 10
  ; day 2

  set turtle-troop-size 10
  set confederate-infantry-starting-points patches at-points [
    [-6 29][-6 28][-6 28][-6 27][-5 29][-4 29][-5 28];[16 36][16 37][16 38][16 39]
    ]

  set confederate-cavalry-starting-points patches at-points [
    [-10 6]
  ]

  set confederate-artillery-starting-points patches at-points [
    [-6 29][-5 30][-4 30][-7 28]
  ]

;    set confederate-objective-points patches at-points [
;    [-1 24]
;    ]

   set confederate-infantry-reinforcement_points patches at-points [
    [-5 -5]
    ]

   set confederate-artillery-reinforcement_points patches at-points [
    [-7 -5]
    ]
    set union-infantry-starting-points patches at-points [
    [-1 29]; Main Hook
    [-5 27][-6 27][-5 26][-4 26][-3 26][-5 25][-4 27][-3 27][-3 25][-2 27][-2 28][-3 28][-4 28]; Peach Orchard
    ]

;  set union-cavalry-starting-points patches at-points [
;    [10 6]
;  ]

  set union-artillery-starting-points patches at-points [
   [-4 26][-4 27][-3 27][-5 27][-1 29]
  ]

    set confederate-objective-points patches at-points [
    ;  [32 26][32 25][32 24]
    ;  [33 27][33 26][33 25][33 24]
    ;  [34 27][34 26][34 25][34 24]
    ;  [35 26][35 25]
  ]

    set union-ending-points patches at-points [
      [38 4][38 3]
     ; [37 4][37 3]
    ;  [36 4][36 3]
    ]

    ;set confederate-attack-strength 60
    ;set union-attack-strength 40
    ;set run-away-protection-bonus 32

    import-drawing "Gettysburg.png"
    set current-date-time time:create "1863/07/02 16:00"
    set time-of-day "4:00 PM"
    set number-of-confederate-soldiers 15000 / (turtle-troop-size)
    set number-of-union-soldiers 10000 / (turtle-troop-size)

  ask union-infantry-starting-points [
    set pcolor blue
  ]

;    ask union-cavalry-starting-points [
;    set pcolor blue
;  ]

    ask union-artillery-starting-points [
    set pcolor blue
  ]

    ask confederate-infantry-starting-points [
    set pcolor red
  ]

;    ask union-cavalry-starting-points [
;    set pcolor blue
;  ]

    ask confederate-artillery-starting-points [
    set pcolor red
  ]

  create-confederate-army (number-of-confederate-soldiers * 0.9965) [
    set shape "person"  ; Example shape for infantry
    set color red
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of confederate-infantry-starting-points
  ]
  create-confederate-army (number-of-confederate-soldiers * 0.004) [
    set shape "cannon"  ; Example shape for artillery
    set color red
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of confederate-artillery-starting-points
  ]
  create-union-army (number-of-union-soldiers * 0.995) [
    set shape "person"  ; Example shape for infantry
    set color blue
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of union-infantry-starting-points
  ]
  create-union-army (number-of-union-soldiers * 0.005) [
    set shape "cannon"  ; Example shape for artillery
    set color blue
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of union-artillery-starting-points
  ]

  reset-ticks
end
;=======================================================================================================================
to battle_scenario3
  set minutes-per-tick 10
  ; day 2

  set turtle-troop-size 10
  set confederate-infantry-starting-points patches at-points [
    [-6 29][-6 28][-6 28][-6 27][-5 29][-4 29][-5 28];[16 36][16 37][16 38][16 39]
    ]

  set confederate-cavalry-starting-points patches at-points [
    [-10 6]
  ]

  set confederate-artillery-starting-points patches at-points [
    [-6 29][-5 30][-4 30][-7 28]
  ]

;    set confederate-objective-points patches at-points [
;    [-1 24]
;    ]

    set union-infantry-starting-points patches at-points [
    [-1 29]; Main Hook
    [-5 27][-6 27][-5 26][-4 26][-3 26][-5 25][-4 27][-3 27][-3 25][-2 27][-2 28][-3 28][-4 28]; Peach Orchard
    ]
    set union-infantry-reinforcement_points patches at-points [
    [-1 24]
    ]

   set union-artillery-reinforcement_points patches at-points [
    [-1 24]
    ]
;  set union-cavalry-starting-points patches at-points [
;    [10 6]
;  ]

  set union-artillery-starting-points patches at-points [
   [-4 26][-4 27][-3 27][-5 27][-1 29]
  ]

    set confederate-objective-points patches at-points [
    ;  [32 26][32 25][32 24]
    ;  [33 27][33 26][33 25][33 24]
    ;  [34 27][34 26][34 25][34 24]
    ;  [35 26][35 25]
  ]

    set union-ending-points patches at-points [
      [38 4][38 3]
     ; [37 4][37 3]
    ;  [36 4][36 3]
    ]

    ;set confederate-attack-strength 60
    ;set union-attack-strength 40
    ;set run-away-protection-bonus 32

    import-drawing "Gettysburg.png"
    set current-date-time time:create "1863/07/02 14:00"
    set time-of-day "2:00 PM"
    set number-of-confederate-soldiers 15000 / (turtle-troop-size)
    set number-of-union-soldiers 10000 / (turtle-troop-size)

  ask union-infantry-starting-points [
    set pcolor blue
  ]

;    ask union-cavalry-starting-points [
;    set pcolor blue
;  ]

    ask union-artillery-starting-points [
    set pcolor blue
  ]

    ask confederate-infantry-starting-points [
    set pcolor red
  ]

;    ask union-cavalry-starting-points [
;    set pcolor blue
;  ]

    ask confederate-artillery-starting-points [
    set pcolor red
  ]

  create-confederate-army (number-of-confederate-soldiers * 0.9965) [
    set shape "person"  ; Example shape for infantry
    set color red
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of confederate-infantry-starting-points
  ]
  create-confederate-army (number-of-confederate-soldiers * 0.004) [
    set shape "cannon"  ; Example shape for artillery
    set color red
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of confederate-artillery-starting-points
  ]
  create-union-army (number-of-union-soldiers * 0.995) [
    set shape "person"  ; Example shape for infantry
    set color blue
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of union-infantry-starting-points
  ]
  create-union-army (number-of-union-soldiers * 0.005) [
    set shape "cannon"  ; Example shape for artillery
    set color blue
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of union-artillery-starting-points
  ]

  reset-ticks
end
;=======================================================================================================================
to HistoricalBattle
    ; if one army is wiped out, end the battle
  if not any? confederate-army or not any? union-army [
    stopSimulation
    stop
  ]
    ask turtles [
    ifelse breed = confederate-army
    [confederateTroopAction]
    [unionTroopAction]
   ]
    ; Code to create new Union soldiers and add them to the simulation
   if time-of-day = "4:00 PM"
  [
    add-union-reinforcements
  ]

  set current-date-time time:plus current-date-time minutes-per-tick "minutes"
  set time-of-day time:show current-date-time "hh:mm a"
  tick
end
;=======================================================================================================================
to Battle1
    ; if one army is wiped out, end the battle
  if not any? confederate-army or not any? union-army [
    stopSimulation
    stop
  ]
    ask turtles [
    ifelse breed = confederate-army
    [confederateTroopAction]
    [unionTroopAction]
   ]

  if ticks = 12 ;if time-of-day = "4:00 PM"
  [
    add-confederate-reinforcements
    add-union-reinforcements
  ]

  set current-date-time time:plus current-date-time minutes-per-tick "minutes"
  set time-of-day time:show current-date-time "hh:mm a"
  tick
end
;=======================================================================================================================
to Battle2
    ; if one army is wiped out, end the battle
  if not any? confederate-army or not any? union-army [
    stopSimulation
    stop
  ]
    ask turtles [
    ifelse breed = confederate-army
    [confederateTroopAction]
    [unionTroopAction]
   ]

  if ticks = 12 ;time-of-day = "4:00 PM"
  [
    add-confederate-reinforcements
  ]

  set current-date-time time:plus current-date-time minutes-per-tick "minutes"
  set time-of-day time:show current-date-time "hh:mm a"
  tick
end
;=======================================================================================================================
to Battle3
    ; if one army is wiped out, end the battle
  if not any? confederate-army or not any? union-army [
    stopSimulation
    stop
  ]
    ask turtles [
    ifelse breed = confederate-army
    [confederateTroopAction]
    [unionTroopAction]
   ]

  ;if time-of-day = "4:00 PM"
  if ticks = 12 ;
  [
    add-union-reinforcements
  ]

  set current-date-time time:plus current-date-time minutes-per-tick "minutes"
  set time-of-day time:show current-date-time "hh:mm a"
  tick
end
;=======================================================================================================================
to add-union-reinforcements
  ; Code to create new Union soldiers and add them to the simulation
  create-union-army (number-of-union-soldiers * .52) [
    set shape "person"  ; Example shape for infantry
    set color blue
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of union-infantry-reinforcement_points
    unionTroopAction
    ]
  create-union-army (number-of-union-soldiers * 0.005) [
    set shape "cannon"  ; Example shape for artillery
    set color blue
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of union-artillery-reinforcement_points
    unionTroopAction
    ]
end

to add-confederate-reinforcements
  ; Code to create new Union soldiers and add them to the simulation
  create-confederate-army (number-of-confederate-soldiers * .367) [
    set shape "person"  ; Example shape for infantry
    set color red
    set troop-type "infantry"
    set health 100
    set size .5
    move-to one-of confederate-infantry-reinforcement_points
    confederateTroopAction
    ]
  create-confederate-army (number-of-confederate-soldiers * 0.001) [
    set shape "cannon"  ; Example shape for artillery
    set color red
    set troop-type "artillery"
    set health 300
    set size 1
    move-to one-of confederate-artillery-reinforcement_points
    confederateTroopAction
    ]
end
;=======================================================================================================================
to confederateTroopAction
  ifelse troop-type = "infantry" [
    ifelse any? union-army [
      let target one-of union-army with [health > 0]
      if target != nobody [
        face target
        ifelse distance target <= 3 [
          fight-turtle self target
        ]
        [
          ifelse xcor = -1 and ycor = 24 [
            ; If the troop has reached its destination, it continues to fight
            fight-turtle self target
          ]
          [
            ; If the troop hasn't reached its destination, it moves forward
            face patch -1 24
            forward .5
          ]
        ]
      ]
    ][
      face patch -1 24
      forward .5
    ]
  ]
  [
    if any? union-army [
      let target one-of union-army with [health > 0]
      if target != nobody [
        face target
        ifelse distance target <= 5 [
          fight-turtle-artillery self target
        ] [
          ifelse xcor = -1 and ycor = 24 [
            ; If the troop has reached its destination, it continues to fight
            fight-turtle-artillery self target
          ]
          [
            ; If the troop hasn't reached its destination, it moves forward
            face patch -1 24
            forward .5
          ]
        ]
      ]
    ]
  ]
end


to unionTroopAction
  ifelse troop-type = "infantry" [
    ifelse any? confederate-army [
      let target one-of confederate-army with [health > 0]
      if target != nobody [
        face target
        ifelse distance target <= 3 [
          fight-turtle self target
          forward .5
        ]
        [
           ifelse any? confederate-army with [distance patch -1 24 <= 2][
              face patch -1 24 ; Move towards patch -1 24 if no enemy nearby
              forward .5]
          []
        ]
      ]
    ][

    ]

  ]
    [
   if any? confederate-army [
      let target one-of confederate-army with [health > 0]
      if target != nobody [
        face target
        ifelse distance target <= 5 [
          fight-turtle-artillery self target
          forward .5
        ] [
              ifelse any? confederate-army with [distance patch -1 24 <= 2][
              face patch -1 24 ; Move towards patch -1 24 if no enemy nearby
              forward .5]
          []
        ]
      ]
    ]
  ]
end


to slow-down-turtles
  ask turtles [
    forward 1  ; Move forward by 1 step
    let slowdown-patches patches with [
                                       pxcor = -2 and pycor = -6 or
                                       pxcor = -2 and pycor = -7 or
                                       pxcor = -2 and pycor = -8 or
                                       pxcor = -2 and pycor = -9 or
                                       pxcor = -2 and pycor = -10 or
                                       pxcor = -3 and pycor = -6 or
                                       pxcor = -3 and pycor = -10 or
                                       pxcor = -5 and pycor = -6 or
                                       pxcor = -5 and pycor = -7
    ]
    ifelse patch-here = one-of slowdown-patches [
      wait 0.2  ; Wait for 2 minutes (0.2 ticks) - to slow down by waiting for X ticks if on a patch within the specified patches
    ] [
      wait 0.1  ; Wait for 1 minutes (0.1 ticks) - normal
    ]
  ]
end

;;=======================================================================================================================

to fight-turtle [attacker target]
let hit? (random-float 100 < 20)
  if hit? [
    let damage 40
    ask target [
      set health health - damage
      if health <= 0 [
        die
      ]
    ]
  ]

end;

to fight-turtle-artillery [attacker target]
  let hit? (random-float 100 < 50)
  if hit? [
    let damage 80
    ask target [
      set health health - damage
      if health <= 0 [
        die
      ]
    ]
  ]

end;
;=======================================================================================================================
to stopSimulation
  ask confederate-army [
    let target one-of union-army
    if target != nobody [
      face target
    ]
  ]
  ask union-army [
    let target one-of confederate-army
    if target != nobody [
      face target
    ]
  ]
end
@#$#@#$#@
GRAPHICS-WINDOW
330
10
1328
1009
-1
-1
30.0
1
10
1
1
1
0
1
1
1
-16
16
-16
16
0
0
1
ticks
30.0

MONITOR
1526
617
1734
666
Confederate Troops Remaining
confederate-troop-count
0
1
12

MONITOR
1527
677
1683
726
Confederate Casualties
confederate-troop-killed
0
1
12

MONITOR
1348
618
1513
667
Union Troops Remaining
union-troop-count
0
1
12

MONITOR
1354
679
1467
728
Union Casualties
union-troop-killed
0
1
12

BUTTON
1332
167
1791
200
Early Confederate Attack w/ Reinforcements & Union Reinforcements @ 4 PM
LittleRoundTop_EarlyConfAttack_BothReinforcements
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1332
215
1561
248
Start Battle Scenario 1
Battle1
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

INPUTBOX
2125
258
2344
318
time-of-day
06:20 p.m.
1
0
String

SLIDER
2089
421
2298
454
confederate-attack-strength
confederate-attack-strength
0
100
62.0
1
1
NIL
HORIZONTAL

SLIDER
2094
486
2266
519
union-attack-strength
union-attack-strength
0
100
35.0
1
1
NIL
HORIZONTAL

SLIDER
2098
560
2437
593
confederate-army-retreats-after-losing-this-percent
confederate-army-retreats-after-losing-this-percent
0
100
12.0
1
1
NIL
HORIZONTAL

SLIDER
2132
654
2433
687
union-army-retreats-after-losing-this-percent
union-army-retreats-after-losing-this-percent
0
100
14.0
1
1
NIL
HORIZONTAL

SLIDER
2149
737
2351
770
run-away-protection-bonus
run-away-protection-bonus
0
100
32.0
1
1
NIL
HORIZONTAL

MONITOR
1468
556
1602
601
Time
time-of-day
17
1
11

BUTTON
1336
300
1791
333
Historical Confederate Attack w/ Reinforcements & No Union Reinforcements
LittleRoundTop_HistoricalConfAttack_ConfReinforcementsOnly
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1337
344
1567
377
Start Battle Scenario 2
Battle2
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1332
43
1828
76
Historical Control Scenario - 4 PM Confederate Attack w/ Union Reinforcements Only
LittleRoundTop_Historical
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1332
82
1566
115
Start Control Scenario
HistoricalBattle
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1336
417
1802
450
Early Confederate Attack w/o Reinforcements & Union Reinforcements @ 4 PM
LittleRoundTop_EarlyConfAttack_UnionReinforcementsOnly
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1336
460
1567
493
Start Battle Scenario 3
Battle3
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

cannon
true
0
Polygon -7500403 true true 165 0 165 15 180 150 195 165 195 180 180 195 165 225 135 225 120 195 105 180 105 165 120 150 135 15 135 0
Line -16777216 false 120 150 180 150
Line -16777216 false 120 195 180 195
Line -16777216 false 165 15 135 15
Polygon -16777216 false false 165 0 135 0 135 15 120 150 105 165 105 180 120 195 135 225 165 225 180 195 195 180 195 165 180 150 165 15

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

chess knight
false
0
Line -16777216 false 75 255 225 255
Polygon -7500403 true true 90 255 60 255 60 225 75 180 75 165 60 135 45 90 60 75 60 45 90 30 120 30 135 45 240 60 255 75 255 90 255 105 240 120 225 105 180 120 210 150 225 195 225 210 210 255
Polygon -16777216 false false 210 255 60 255 60 225 75 180 75 165 60 135 45 90 60 75 60 45 90 30 120 30 135 45 240 60 255 75 255 90 255 105 240 120 225 105 180 120 210 150 225 195 225 210
Line -16777216 false 255 90 240 90
Circle -16777216 true false 134 63 24
Line -16777216 false 103 34 108 45
Line -16777216 false 80 41 88 49
Line -16777216 false 61 53 70 58
Line -16777216 false 64 75 79 75
Line -16777216 false 53 100 67 98
Line -16777216 false 63 126 69 123
Line -16777216 false 71 148 77 145
Rectangle -7500403 true true 90 255 210 300
Rectangle -16777216 false false 90 255 210 300

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.4.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
