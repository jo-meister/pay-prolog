# Execute program
gprolog

| ?- [facts].

| ?- [rules].

| ?- [functions].

| ?- pay('Rose', 'Harvey', Pay).
>   Pay = 3000.0

| ?- findall(Last, hourly(_, Last, _, _), List).
>   List = ['Garcia','West','Jennings']

| ?- list('>=', 0, List).
>   List = [['Jeremy','Greer',170],['Jane','Brown',5000],['George','Miller',1900],['R
obert','Johnson',3000],['Maria','Garcia',170.0],['Carlton','West',537.5],[
'Viola','Jennings',1312.5],['Mary','Smith',1900.0],['Rose','Harvey',3000.0
],['Floyd','Jenkins',500]]

| ?- count('>=', 0, Count).
>   Count = 10

| ?- max('<', 1900, Max).
>   Max = 1312.5

| ?- min('>', 1900, Min).
>   Min = 3000

| ?- list('==', 3000, List).
>   List = [['Robert','Johnson',3000],['Rose','Harvey',3000.0]]

| ?- total('>=', 700, Total).
>   Total = 16112.5

| ?- avg('<=', 5000, Avg).
>   Avg = 1749.0

| ?- halt.


# facts.pl
Uses predicated to represent all employees. There are three predicates, one for each type of employee. The format of employees is:
*   salaried: first name, last name, weekly salary
*   hourly: first name, last name, hours worked in a week, hourly wage
*   commission: first name, last name, minimal salary, amount of sales, commision rate


# rules.pl
Contains the rules for computing the pay of each employee. The pay is in the format: pay(First, Last, Pay)
*   salaried = weekly salary
*   hourly
    *   if(worked > 50) = rate\*40 + rate\*1.5\*10 + rate\*2\*(worked-50)
    *   elif(worked > 40) = rate\*40 + rate\*1.5\*10
    *   else = rate\*worked
*   commission = if the sales amount times the commission rate is less than the minimum salary, minimum salary instead of the commission.


# functions.pl
Contains 6 predicate functions Op (==, !=, >, >=, <, <=). Ref is a reference value for Pay. Pay Op Ref is used identify a sublist of employees that satisfy a condition
*   list(Op, Ref, List). % check whether the sublist is the same as List.
*   count(Op, Ref, Count). % Check whether Count is the number of employees in the sublist.
*   min(Op, Ref, Min). % Check whether Min is the minimum pay of the employees in the sublist.
*   max(Op, Ref, Max). % Check whether Max is the maximum pay of the employees in the sublist.
*   total(Op, Ref, Total). % Check whether Total is the total pay of the employees in the sublist.
*   avg(Op, Ref, Avg). % Check if Avg whether the average pay of the employees in the sublist.