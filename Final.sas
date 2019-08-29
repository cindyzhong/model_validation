/*Assign CAS libraries*/
cas;  
caslib _all_ assign; 

/*Define local library including PUBLIC*/
libname locallib '/home/sasadmin/sasuser.viya';

/*Load local data to CAS library*/
data public.tr;
	set locallib.tr;
run;

/* Specify a folder path to write the temporary output files */
%let outdir = &USERDIR;

/*Specify target, class and interval inputs*/
%let target=target;

%let Classvar=CODE_GENDER FLAG_OWN_CAR FLAG_OWN_REALTY NAME_TYPE_SUITE 
		NAME_INCOME_TYPE NAME_EDUCATION_TYPE NAME_FAMILY_STATUS NAME_HOUSING_TYPE 
		OCCUPATION_TYPE WEEKDAY_APPR_PROCESS_START /*ORGANIZATION_TYPE */
		FONDKAPREMONT_MODE HOUSETYPE_MODE WALLSMATERIAL_MODE EMERGENCYSTATE_MODE;

%let IM_Classvar=IM_CODE_GENDER IM_FLAG_OWN_CAR IM_FLAG_OWN_REALTY IM_NAME_TYPE_SUITE 
		IM_NAME_INCOME_TYPE IM_NAME_EDUCATION_TYPE IM_NAME_FAMILY_STATUS IM_NAME_HOUSING_TYPE 
		IM_OCCUPATION_TYPE IM_WEEKDAY_APPR_PROCESS_START /*IM_ORGANIZATION_TYPE */
		IM_FONDKAPREMONT_MODE IM_HOUSETYPE_MODE IM_WALLSMATERIAL_MODE
		IM_EMERGENCYSTATE_MODE;		
		
%let IntVar=
 CNT_CHILDREN AMT_INCOME_TOTAL AMT_CREDIT AMT_ANNUITY 
		AMT_GOODS_PRICE REGION_POPULATION_RELATIVE DAYS_BIRTH DAYS_EMPLOYED 
		DAYS_REGISTRATION OWN_CAR_AGE FLAG_MOBIL FLAG_EMP_PHONE FLAG_WORK_PHONE 
		FLAG_CONT_MOBILE FLAG_PHONE FLAG_EMAIL CNT_FAM_MEMBERS REGION_RATING_CLIENT 
		REGION_RATING_CLIENT_W_CITY HOUR_APPR_PROCESS_START APARTMENTS_AVG 
		BASEMENTAREA_AVG YEARS_BEGINEXPLUATATION_AVG YEARS_BUILD_AVG COMMONAREA_AVG 
		ELEVATORS_AVG ENTRANCES_AVG FLOORSMAX_AVG FLOORSMIN_AVG LANDAREA_AVG 
		LIVINGAPARTMENTS_AVG LIVINGAREA_AVG NONLIVINGAPARTMENTS_AVG NONLIVINGAREA_AVG 
		APARTMENTS_MODE BASEMENTAREA_MODE YEARS_BEGINEXPLUATATION_MODE 
		YEARS_BUILD_MODE COMMONAREA_MODE ELEVATORS_MODE ENTRANCES_MODE FLOORSMAX_MODE 
		FLOORSMIN_MODE LANDAREA_MODE LIVINGAPARTMENTS_MODE LIVINGAREA_MODE 
		NONLIVINGAPARTMENTS_MODE NONLIVINGAREA_MODE APARTMENTS_MEDI BASEMENTAREA_MEDI 
		YEARS_BEGINEXPLUATATION_MEDI YEARS_BUILD_MEDI COMMONAREA_MEDI ELEVATORS_MEDI 
		ENTRANCES_MEDI FLOORSMAX_MEDI FLOORSMIN_MEDI LANDAREA_MEDI 
		LIVINGAPARTMENTS_MEDI LIVINGAREA_MEDI NONLIVINGAPARTMENTS_MEDI 
		NONLIVINGAREA_MEDI TOTALAREA_MODE OBS_30_CNT_SOCIAL_CIRCLE 
		DEF_30_CNT_SOCIAL_CIRCLE OBS_60_CNT_SOCIAL_CIRCLE DEF_60_CNT_SOCIAL_CIRCLE 
		DAYS_LAST_PHONE_CHANGE FLAG_DOCUMENT_2 FLAG_DOCUMENT_3 FLAG_DOCUMENT_4 
		FLAG_DOCUMENT_5 FLAG_DOCUMENT_6 FLAG_DOCUMENT_7 FLAG_DOCUMENT_8 
		FLAG_DOCUMENT_9 FLAG_DOCUMENT_10 FLAG_DOCUMENT_11 FLAG_DOCUMENT_12 
		FLAG_DOCUMENT_13 FLAG_DOCUMENT_14 FLAG_DOCUMENT_15 FLAG_DOCUMENT_16 
		FLAG_DOCUMENT_17 FLAG_DOCUMENT_18 FLAG_DOCUMENT_19 FLAG_DOCUMENT_20 
		FLAG_DOCUMENT_21 AMT_REQ_CREDIT_BUREAU_HOUR AMT_REQ_CREDIT_BUREAU_DAY 
		AMT_REQ_CREDIT_BUREAU_WEEK AMT_REQ_CREDIT_BUREAU_MON 
		AMT_REQ_CREDIT_BUREAU_QRT AMT_REQ_CREDIT_BUREAU_YEAR  CS
		;
		
		
%let IM_IntVar=	IM_CS IM_CNT_CHILDREN IM_AMT_INCOME_TOTAL IM_AMT_CREDIT IM_AMT_ANNUITY 
		IM_AMT_GOODS_PRICE IM_REGION_POPULATION_RELATIVE IM_DAYS_BIRTH IM_DAYS_EMPLOYED 
		IM_DAYS_REGISTRATION IM_OWN_CAR_AGE IM_FLAG_MOBIL IM_FLAG_EMP_PHONE IM_FLAG_WORK_PHONE 
		IM_FLAG_CONT_MOBILE IM_FLAG_PHONE IM_FLAG_EMAIL IM_CNT_FAM_MEMBERS IM_REGION_RATING_CLIENT 
		IM_REGION_RATING_CLIENT_W_CITY IM_HOUR_APPR_PROCESS_START IM_APARTMENTS_AVG 
		IM_BASEMENTAREA_AVG IM_YEARS_BEGINEXPLUATATION_AVG IM_YEARS_BUILD_AVG IM_COMMONAREA_AVG 
		IM_ELEVATORS_AVG IM_ENTRANCES_AVG IM_FLOORSMAX_AVG IM_FLOORSMIN_AVG IM_LANDAREA_AVG 
		IM_LIVINGAPARTMENTS_AVG IM_LIVINGAREA_AVG IM_NONLIVINGAPARTMENTS_AVG IM_NONLIVINGAREA_AVG 
		IM_APARTMENTS_MODE IM_BASEMENTAREA_MODE IM_YEARS_BEGINEXPLUATATION_MODE 
		IM_YEARS_BUILD_MODE IM_COMMONAREA_MODE IM_ELEVATORS_MODE IM_ENTRANCES_MODE IM_FLOORSMAX_MODE 
		IM_FLOORSMIN_MODE IM_LANDAREA_MODE IM_LIVINGAPARTMENTS_MODE IM_LIVINGAREA_MODE 
		IM_NONLIVINGAPARTMENTS_MODE IM_NONLIVINGAREA_MODE IM_APARTMENTS_MEDI IM_BASEMENTAREA_MEDI 
		IM_YEARS_BEGINEXPLUATATION_MEDI IM_YEARS_BUILD_MEDI IM_COMMONAREA_MEDI IM_ELEVATORS_MEDI 
		IM_ENTRANCES_MEDI IM_FLOORSMAX_MEDI IM_FLOORSMIN_MEDI IM_LANDAREA_MEDI 
		IM_LIVINGAPARTMENTS_MEDI IM_LIVINGAREA_MEDI IM_NONLIVINGAPARTMENTS_MEDI 
		IM_NONLIVINGAREA_MEDI IM_TOTALAREA_MODE IM_OBS_30_CNT_SOCIAL_CIRCLE 
		IM_DEF_30_CNT_SOCIAL_CIRCLE IM_OBS_60_CNT_SOCIAL_CIRCLE IM_DEF_60_CNT_SOCIAL_CIRCLE 
		IM_DAYS_LAST_PHONE_CHANGE IM_FLAG_DOCUMENT_2 IM_FLAG_DOCUMENT_3 IM_FLAG_DOCUMENT_4 
		IM_FLAG_DOCUMENT_5 IM_FLAG_DOCUMENT_6 IM_FLAG_DOCUMENT_7 IM_FLAG_DOCUMENT_8 
		IM_FLAG_DOCUMENT_9 IM_FLAG_DOCUMENT_10 IM_FLAG_DOCUMENT_11 IM_FLAG_DOCUMENT_12 
		IM_FLAG_DOCUMENT_13 IM_FLAG_DOCUMENT_14 IM_FLAG_DOCUMENT_15 IM_FLAG_DOCUMENT_16 
		IM_FLAG_DOCUMENT_17 IM_FLAG_DOCUMENT_18 IM_FLAG_DOCUMENT_19 IM_FLAG_DOCUMENT_20 
		IM_FLAG_DOCUMENT_21 IM_AMT_REQ_CREDIT_BUREAU_HOUR IM_AMT_REQ_CREDIT_BUREAU_DAY 
		IM_AMT_REQ_CREDIT_BUREAU_WEEK IM_AMT_REQ_CREDIT_BUREAU_MON 
		IM_AMT_REQ_CREDIT_BUREAU_QRT IM_AMT_REQ_CREDIT_BUREAU_YEAR  
		;	

/*Explore data*/
ods noproctitle;
libname _tmpcas_ cas caslib="CASUSER";
proc cardinality data=PUBLIC.tr outcard=_tmpcas_.varSummaryTemp 
		out=_tmpcas_.levelDetailTemp;
run;

proc print data=_tmpcas_.varSummaryTemp label;
	var _varname_ _fmtwidth_ _type_ _rlevel_ _more_ _cardinality_ _nmiss_ _min_ 
		_max_ _mean_ _stddev_;
	title 'Variable Summary';
run;

proc print data=_tmpcas_.levelDetailTemp (obs=20) label;
	title 'Level Details';
run;

proc delete data=_tmpcas_.varSummaryTemp _tmpcas_.levelDetailTemp;
run;

libname _tmpcas_;


/*Partition data. 65% train; 35% validate*/
proc partition data=PUBLIC.tr partind samppct=65 seed=1;
	by TARGET;
	output out=CASUSER.APP_DEV;
run;

/*Replace missing values. Generate score code*/

ods noproctitle;
proc varimpute data=CASUSER.APP_DEV;
		input &intvar. / ctech=median;
	input &classvar. / ntech=mode;
	output out=CASUSER.IMPUTED copyvars=(_all_);
	*code file="&outdir./impute_score.sas";
run;


/*Imputation scoring*/ 
/*data casuser.imputed;
set casuser.app_dev;
%include "&outdir./impute_score.sas"/source2;
run;*/

/*Unsupervised Variable Reduction*/n
proc varreduce data=CASUSER.IMPUTED;
	reduce unsupervised &IM_Intvar. / varianceexplained=0.95;
	ods output SelectedEffects=selected;
run;


/*Supervised variable reduction*/ 
/*proc varreduce data=CASUSER.IMPUTED;
	class &IM_classvar. target;
	reduce supervised TARGET=&IM_classvar. &IM_Intvar./aic;
	ods output SelectedEffects=selected;
run;*/


/*Store selected variables in macro variables*/
proc sql /*noprint*/;
  select variable into :IntSelected 
  from selected where type='INTERVAL';
   select variable into :ClassSelected 
  from selected where type='CLASS';
  quit; 
  
/*Run various Regression models*/   
title 'Stepwise with SL';
proc logselect data=CASUSER.IMPUTED ;
partition role=_PartInd_ (validate='0');
  class TARGET &Im_classvar.;
  model TARGET(event='1')= /*&IM_classvar &IM_IntVar*/ cs &IM_classvar. &intSelected./type3;
  selection method=stepwise  (select=sl slentry=0.25 slstay=0.05 /*choose=sbc*/);
  code file="&outdir./SL_reg.sas" pcatall;
run;

/*Score data*/
data casuser._scored_SL;
set casuser.imputed;
%include "&outdir./SL_reg.sas"/source2;
run;

  title 'AIC';
proc logselect data=CASUSER.IMPUTED ;
partition role=_PartInd_ (validate='0');
  class TARGET &Im_classvar.;
  model TARGET(event='1')= /*&IM_classvar &IM_IntVar*/ cs &IM_classvar. &intSelected./type3;
  selection method=stepwise  (select=AIC stop=AIC choose=aic);
  code file="&outdir./AIC_reg.sas" pcatall;
run;

title;
data casuser._scored_AIC;
set casuser.imputed;
%include "&outdir./AIC_reg.sas"/source2;
run;


  title 'SBC';
proc logselect data=CASUSER.IMPUTED ;
partition role=_PartInd_ (validate='0');
  class TARGET &Im_classvar.;
  model TARGET(event='1')= /*&IM_classvar &IM_IntVar*/ cs &IM_classvar. &intSelected./type3;
  selection method=stepwise  (select=SBC stop=SBC choose=SBC);
  code file="&outdir./SBC_reg.sas" pcatall;
run;

title;
data casuser._scored_SBC;
set casuser.imputed;
%include "&outdir./SBC_reg.sas"/source2;
run;

title 'AIC VAL';
proc logselect data=CASUSER.IMPUTED ;
partition role=_PartInd_ (validate='0');
  class TARGET &Im_classvar.;
  model TARGET(event='1')= /*&IM_classvar &IM_IntVar*/ cs &IM_classvar. &intSelected./type3;
  selection method=stepwise  (select=SBC choose=validate);
  code file="&outdir./VAIC_reg.sas" pcatall;
run;

title;
data casuser._scored_VAIC;
set casuser.imputed;
%include "&outdir./VAIC_reg.sas"/source2;
run;



/*
title 'LAR';
proc logselect data=CASUSER.IMPUTED ;
partition role=_PartInd_ (validate='0');
  class TARGET &Im_classvar.;
  model TARGET(event='1')=   &IM_classvar. &intSelected./type3;
  selection method=lar(stop=SBC);
  code file="&outdir./LAR_reg.sas" pcatall;
run;*/

/************************************************************************/
/* Assess                                                               */
/************************************************************************/
%macro assess_model(prefix=, var_evt=, var_nevt=);
proc assess data=casuser._scored_&prefix.(where=(_partind_=0));
    input &var_evt.;
    target &target. / level=nominal event='1';
    fitstat pvar=&var_nevt. / pevent='0';
  
    ods output
      fitstat=&prefix._fitstat 
      rocinfo=&prefix._rocinfo 
      liftinfo=&prefix._liftinfo;
run;
%mend assess_model;

ods exclude all;
%assess_model(prefix=SL, var_evt=p_&target.1, var_nevt=p_&target.0);
%assess_model(prefix=AIC, var_evt=p_&target.1, var_nevt=p_&target.0);
%assess_model(prefix=SBC, var_evt=p_&target.1, var_nevt=p_&target.0);
%assess_model(prefix=VAIC, var_evt=p_&target.1, var_nevt=p_&target.0);
ods exclude none;


/************************************************************************/
/* ROC and Lift Charts using validation data                            */
/************************************************************************/
ods graphics on;

data all_rocinfo;
  set SL_rocinfo(in=s)
      AIC_rocinfo(in=g)
      SBC_rocinfo(in=n)
      VAIC_rocinfo(in=f);
      
  length model $ 16;
  select;
    when (s) model='SL';
    when (f) model='VAIC';
    when (g) model='AIC';
    when (n) model='SBC';
  end;
run;

data all_liftinfo;
  set SL_liftinfo(in=s)
      AIC_liftinfo(in=g)
      SBC_liftinfo(in=n)
      VAIC_liftinfo(in=f);
      
  length model $ 16;
  select;
   when (s) model='SL';
    when (f) model='VAIC';
    when (g) model='AIC';
    when (n) model='SBC';
  end;
run;

data test;
set all_rocinfo;
format ks 8.6 ks2 8.6;
run;

/* Print AUC (Area Under the ROC Curve) */
title "AUC (using validation data) ";
proc sql;
  select distinct model, c from all_rocinfo order by c desc;
quit;

/* Draw ROC charts */         
proc sgplot data=all_rocinfo aspect=1;
  title "ROC Curve (using validation data)";
  xaxis values=(0 to 1 by 0.25) grid offsetmin=.05 offsetmax=.05; 
  yaxis values=(0 to 1 by 0.25) grid offsetmin=.05 offsetmax=.05;
  lineparm x=0 y=0 slope=1 / transparency=.7;
  series x=fpr y=sensitivity / group=model;
run;

/* Draw lift charts */         
proc sgplot data=all_liftinfo; 
  title "Lift Chart (using validation data)";
  yaxis label=' ' grid;
  series x=depth y=cumlift / group=model markers markerattrs=(symbol=circlefilled);
run;

title;
ods graphics off;


/*Promote Data tables so they can be seen by VA */ 
/*proc casutil;
promote casdata="tr" incaslib="PUBLIC" outcaslib="PUBLIC" CASOUT="TR"; 
quit; */ 

/*proc partition data=PUBLIC.application_train samppct=11 seed=1;
	output out=PUBLIC.Train;
run;*/


/*data public.tr;
 set public.train;
 if target=1 then do;
 CS = 481+30*rannor(1);
 end;
 else if target=0 then do;
 cs = 500+30*rannor(1);
 end;
  run;*/
