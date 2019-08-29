data casuser.query;
   set locallib.hmeq_train;
   if _N_ = 20;
run;

data casuser.hmeq_train;
set locallib.hmeq_train;
run;

proc cas;
   loadactionset "decisionTree";
   decisionTree.forestTrain   result    = r
                            / table     = 'HMEQ_TRAIN'
                              seed      = 1234
                              saveState = {name    = 'FOREST_ASTORE',
                                           replace = True}
                              target    = 'bad'
                              maxLevel  = 5
                              inputs    = {{name   = "loan"},
                                           {name   = "mortdue"},
                                           {name   = "value"},
                                           {name   = "yoj"},
                                           {name   = "derog"},
                                           {name   = "delinq"},
                                            {name   = "clage"},
                                           {name   = "debtinc"},
                                           {name   = "ninq"},
                                           {name   = "clno"},
                                           {name = "reason"},
                                           {name = "job"}}
                              nominals  = {{name   = "REASON"},
                                           {name   = "job"}}
                              ;
   run;
quit;


proc cas;
   loadactionset "explainModel";
   explainModel.linearExplainer / table            = "HMEQ_TRAIN"
                                  query            = "QUERY"
                                  modelTable       = "FOREST_ASTORE"
                                  modelTableType   = "ASTORE"
                                  predictedTarget  = "P_bad"
                                  seed             = 1234
                                  preset           = "KERNELSHAP"
                                  datageneration={binaryEncoding="NONE"}
                                 inputs    = {{name   = "loan"},
                                           {name   = "mortdue"},
                                           {name   = "value"},
                                           {name   = "yoj"},
                                           {name   = "derog"},
                                           {name   = "delinq"},
                                            {name   = "clage"},
                                           {name   = "debtinc"},
                                           {name   = "ninq"},
                                           {name   = "clno"},
                                           {name = "reason"},
                                           {name = "job"}}
                              nominals  = {{name   = "REASON"},
                                           {name   = "job"}}
                              ;
   run;
quit;

