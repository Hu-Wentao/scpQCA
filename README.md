# scpQCA

scpQCA is a new and more powerful algorithm. QCA(Qualitative Comparative Analysis), a kind of configurational comparative method, follows after [Ragin](https://books.google.com/books?hl=zh-CN&lr=&id=PnI-DQAAQBAJ&oi=fnd&pg=PP1&dq=QCA+Ragin&ots=ZLKBNEMpEy&sig=Kg9oQrTzez3HkMguKEUOaAtCXEw).

The source code could find in https://github.com/Kim-Q/scpQCA.git, please obey the [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.html) license.

Here follows the tutorial of scpQCA:

## a common usage of scpQCA

### initial a object

```
data=[[random.randint(0,100) for _ in range(6)] for _ in range(30)]
data=pd.DataFrame(data)
data.columns=['A','B','C','D','F','cases']
obj=scpQCA(data,decision_name='F',caseid='cases')
```


### prepare/calibrate your dataset(if necessary)

```
feature_list=['A','B','C','D','F','cases']
obj.indirect_calibration(feature_list,2,100,0)
```


### print the truth table

```
obj.raw_truth_table(decision_label=1, feature_list=feature_list, cutoff=1,consistency_threshold=0.6,sortedby=False)

###
      A    B    C    D  number            caseid  consistency  coverage
0  0.0  0.0  1.0  1.0       4  [69, 47, 27, 58]     1.000000  0.210526
1  1.0  0.0  0.0  0.0       2          [13, 89]     1.000000  0.105263
2  1.0  0.0  1.0  1.0       2          [41, 10]     1.000000  0.105263
3  1.0  0.0  0.0  1.0       1              [31]     1.000000  0.052632
4  0.0  1.0  1.0  0.0       1             [100]     1.000000  0.052632
5  1.0  1.0  1.0  0.0       4  [96, 69, 75, 33]     0.750000  0.157895
6  0.0  0.0  0.0  1.0       3      [84, 73, 14]     0.666667  0.105263
```

However the scpQCA's candidate rule list should run after the sufficiency analysis:

```
obj.scp_truth_table(rules, feature_list=feature_list,decision_label=1)

###
Running...please wait. There are 16 factor combinations.
There are 13 candidate rules in total.
      A    B    C    D  number consistency coverage
0     -    -  1.0    -      14      0.6429   0.5294
1     -  0.0    -    -      15      0.6000   0.5294
2     -  0.0    -  1.0       9      0.7778   0.4118
3     -  1.0    -  0.0      10      0.7000   0.4118
4     -  0.0  1.0    -       7      0.7143   0.2941
5     -    -  1.0  0.0       8      0.6250   0.2941
6     -  0.0  1.0  1.0       4      1.0000   0.2353
7     -  1.0  1.0  0.0       5      0.8000   0.2353
8     -    -  1.0  1.0       6      0.6667   0.2353
9     -  0.0  0.0  1.0       5      0.6000   0.1765
10    -  1.0  0.0  0.0       5      0.6000   0.1765
11  0.0  0.0  1.0  1.0       1      1.0000   0.0588
12  0.0    -  1.0  1.0       1      1.0000   0.0588
```

### search necessity conditions

```
obj.search_necessity(decision_label=1, feature_list=feature_list,consistency_threshold=0.8)

###
B==1.0 is a necessity condition
C==1.0 is a necessity condition
```


### search candidate rules

```
rules=obj.candidate_rules(decision_label=1, feature_list=feature_list, consistency=0.8,cutoff=1)
```


### simplification

```
configuration,issue_set=obj.greedy(rules=rules,decision_label=1,unique_cover=2)
print(configuration)
print(issue_set)

###
A==0.0 is a necessity condition
Running...please wait. There are 16 factor combinations.
There are 27 candidate rules in total.
['B==0.0 & A==0.0', 'D==1.0 & A==0.0', 'D==0.0 & C==0.0 & A==0.0']
{5, 8, 10, 12, 13, 17, 20, 22, 23, 24, 26, 28}
```

### evaluate the solution

```
obj.cov_n_con(decision_label=1, configuration=configuration,issue_sets=issue_set)

###
consistency = 0.6 and coverage = 0.7058823529411765
```


Otherwises, we also recommand you to use a more convenience function to test the best parameters.

## runQCA

```
    data=[[random.randint(0,100) for _ in range(6)] for _ in range(30)]
    data=pd.DataFrame(data)
    data.columns=['A','B','C','D','F','cases']
    obj=scpQCA(data,decision_name='F',caseid='cases')

    feature_list=['A','B','C','D','F','cases']
    obj.indirect_calibration(feature_list,2,100,0)

    configuration,issue_set=obj.runQCA(decision_label=1, feature_list=feature_list, necessary_consistency=[0.8,0.9],sufficiency_consistency=[0.75,0.8],cutoff=[1,2],rule_length=5,unique_cover=[1])

    print(configuration)
    print(issue_set)
    print(obj.cov_n_con(decision_label=1, configuration=configuration,issue_sets=issue_set))

###
Running...please wait. There are 16 factor combinations.
There are 20 candidate rules in total.
processing the simplification with para: necessary consistency=0.8, sufficiency consistency=0.75, cutoff=1, unique cover=1
consistency = 0.7894736842105263 and coverage = 0.9375
processing the simplification with para: necessary consistency=0.8, sufficiency consistency=0.75, cutoff=2, unique cover=1
consistency = 0.7894736842105263 and coverage = 0.9375
processing the simplification with para: necessary consistency=0.8, sufficiency consistency=0.8, cutoff=1, unique cover=1
consistency = 0.8666666666666667 and coverage = 0.8125
processing the simplification with para: necessary consistency=0.8, sufficiency consistency=0.8, cutoff=2, unique cover=1
consistency = 0.8666666666666667 and coverage = 0.8125
processing the simplification with para: necessary consistency=0.9, sufficiency consistency=0.75, cutoff=1, unique cover=1
consistency = 0.7894736842105263 and coverage = 0.9375
processing the simplification with para: necessary consistency=0.9, sufficiency consistency=0.75, cutoff=2, unique cover=1
consistency = 0.7894736842105263 and coverage = 0.9375
processing the simplification with para: necessary consistency=0.9, sufficiency consistency=0.8, cutoff=1, unique cover=1
consistency = 0.8666666666666667 and coverage = 0.8125
processing the simplification with para: necessary consistency=0.9, sufficiency consistency=0.8, cutoff=2, unique cover=1
consistency = 0.8666666666666667 and coverage = 0.8125
The best opt parameter of scpQCA is: necessary consistency=0.8, sufficiency consistency=0.75, cutoff=1, unique cover=1
['C==0.0 & B==0.0', 'D==0.0 & A==1.0', 'C==1.0 & B==1.0 & A==1.0', 'D==0.0 & C==1.0 & B==1.0', 'D==1.0 & C==0.0 & A==0.0']
{1, 4, 7, 8, 9, 10, 11, 14, 15, 17, 20, 25, 26, 28, 29}

```

The input of `necessary_consistency`, `sufficiency_consistency`, `cutoff` and `unique_cover` are `list` datatype. Function will find the best parameter combination and output the one.
