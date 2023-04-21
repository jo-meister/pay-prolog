pay('Jeremy', 'Greer', P) :- salaried('Jeremy', 'Greer', Salary), P is Salary.
pay('Jane', 'Brown', P) :- salaried('Jane', 'Brown', Salary), P is Salary.
pay('George', 'Miller', P) :- salaried('George', 'Miller', Salary), P is Salary.
pay('Robert', 'Johnson', P) :- salaried('Robert', 'Johnson', Salary), P is Salary.
pay('Maria', 'Garcia', P) :- hourly('Maria', 'Garcia', HoursWorked, Rate), (
    HoursWorked > 50 -> P is (HoursWorked-50)*Rate*2 + 10*Rate*1.5 + 40*Rate;
    HoursWorked > 40 -> P is (HoursWorked-40)*Rate*1.5 + 40*Rate;
    P is HoursWorked*Rate
).
pay('Carlton', 'West', P) :- hourly('Carlton', 'West', HoursWorked, Rate), (
    HoursWorked > 50 -> P is (HoursWorked-50)*Rate*2 + 10*Rate*1.5 + 40*Rate;
    HoursWorked > 40 -> P is (HoursWorked-40)*Rate*1.5 + 40*Rate;
    P is HoursWorked*Rate
).
pay('Viola', 'Jennings', P) :- hourly('Viola', 'Jennings', HoursWorked, Rate), (
    HoursWorked > 50 -> P is (HoursWorked-50)*Rate*2 + 10*Rate*1.5 + 40*Rate;
    HoursWorked > 40 -> P is (HoursWorked-40)*Rate*1.5 + 40*Rate;
    P is HoursWorked*Rate
).
pay('Mary', 'Smith', P) :- commission('Mary', 'Smith', MinSalary, Sales, Rate), (
    Sales*Rate < MinSalary -> P is MinSalary;
    P is Sales*Rate
).
pay('Floyd', 'Jenkins', P) :- commission('Floyd', 'Jenkins', MinSalary, Sales, Rate), (
    Sales*Rate < MinSalary -> P is MinSalary;
    P is Sales*Rate
).
pay('Rose', 'Harvey', P) :- commission('Rose', 'Harvey', MinSalary, Sales, Rate), (
    Sales*Rate < MinSalary -> P is MinSalary;
    P is Sales*Rate
).