$ifthen not declared vegx
* make up some data to make things easy
alias (mixesa, mixesas);
set vegx/quickstat, farmservice/ ;
parameter  veg_all(county, vege_mix, irrigstatus, mixesa) vegetable mix data for all periods
           veg_temp(county, vege_mix, irrigstatus, mixesa, vegx) vegetable data to compare ;
$endif

* aggregate all vegetables to be vegetable then reallocate vegetable to different vegetables
vegetable_mix(county, vege_mix, irrigstatus, '2016')=0;

*get vegetable from USDA quickstat
  veg_temp(county, vege_mix, irrigstatus, mixesa, 'quickstat')=  cropmixdata(county, vege_mix,irrigstatus, mixesa );
*get vegetable data from USDA farm service
  veg_temp(county, vege_mix, irrigstatus, mixesa, 'farmservice')=vegetable_mix(county, vege_mix, irrigstatus, mixesa) ;
  veg_all(county, vege_mix, irrigstatus, mixesa)
     =smax( vegx,  veg_temp(county, vege_mix, irrigstatus, mixesa, vegx));

* clear up the vegetables in cropmix
 cropmixdata(county, vege_mix,irrigstatus, mixesa )=0;
cropmixdata(county, 'vegetables' ,irrigstatus, mixesa ) =0;
 cropmixdata(county, 'vegetables' ,irrigstatus, mixesa )
          $sum(crop_mix, cropmixdata(county, crop_mix,irrigstatus, mixesa ))
        = sum(vege_mix, veg_all(county, vege_mix, irrigstatus, mixesa)  );

display cropmixdata;



