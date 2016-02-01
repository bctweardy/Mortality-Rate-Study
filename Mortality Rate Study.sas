proc import datafile = "C:\Users\Brad_2\Desktop\ex1217.csv"
     out = mortality1
     dbms = csv
     replace;
     getnames = yes;
run;
proc print;
run;
data mortality2;
set mortality1;
logmort = log(mortality);
loghc = log(HC);
logso2 = log(SO2);
lognox = log(NOX);
logpoor = log(Poor);
logover65 = log(Over65);
lognw = log(NonWhite);
run;
proc reg data = mortality2;
model Mortality = Over65 logso2 lognox / cli clb clm vif;
run;
