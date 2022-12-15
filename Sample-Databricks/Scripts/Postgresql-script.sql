DO $$
DECLARE
  directory_path VARCHAR(500);
    rec RECORD;
	tablename RECORD;
	tbl varchar(500);
	y varchar(500);
	fullpath varchar(500);
	
BEGIN
  directory_path := 'C:\\SampleData\\';
    FOR rec IN SELECT pg_ls_dir(directory_path) AS file_name
    LOOP		
	  tablename:=rec;
	  tbl:= replace(tablename.file_name,'.csv','');
	  y := concat('public.', tbl);
	  fullpath:= concat(directory_path,tbl,'.csv');
	  
	  IF(rec.file_name='ChannelType.csv') then
	  
	  IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name='channeltype' and table_type='BASE TABLE') then
        create table channeltype
        (
        ChannelTypeId integer,
        ChannelTypeName varchar(100)
        );
	    EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header';
	   ELSE	    
	    DELETE FROM channeltype;
		EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header';
	 END IF; 
	 END IF; 
	 
	 IF(rec.file_name='Country.csv') then
	  
	  IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name='country' and table_type='BASE TABLE') then
        create table public.country
         (
         CountryId integer,
         IsoCountryName varchar(100)
         );
	    EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header';
	   ELSE	    
	    DELETE FROM country;
		EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header';
	 END IF; 
	 END IF; 
	 
	 IF(rec.file_name='CustomerData.csv') then
	  
	  IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name='customerdata' and table_type='BASE TABLE') then
        create table public.customerdata
         (
         CustomerKey integer,
         CustomerId varchar(100),
         Customer   varchar(100),
         City       varchar(100),
         StateProvince  varchar(100),
         CountryRegion  varchar(100),
         PostalCode     varchar(100)
          );
	   EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header encoding ''windows-1251''';
	   ELSE	    
	    DELETE FROM customerdata;
		EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header encoding ''windows-1251''';
	 END IF; 
	 END IF; 
	 IF(rec.file_name='Date.csv') then
	  
	  IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name='date' and table_type='BASE TABLE') then
        create table date
        (
        DateKey integer,
        Date DATE,
		FiscalYear varchar(100),
		FiscalQuarter varchar(100),
		Month varchar(100),
		FullDate varchar(100),
		MonthKey integer
        );
	    EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header';
	   ELSE	    
	    DELETE FROM date;
		EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header';
	 END IF; 
	 END IF; 
	 IF(rec.file_name='Location.csv') then
	  
	  IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name='location' and table_type='BASE TABLE') then
        create table public.location 
         (
          LocationId integer,
          LocationZip varchar(100),
          LocationState   varchar(100),
          LocationCity  varchar(100),
          CountryId  integer  
         );
	   EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header encoding ''windows-1251''';
	   ELSE	    
	    DELETE FROM location;
		EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header encoding ''windows-1251''';
	 END IF; 
	 END IF; 
	 IF(rec.file_name='ProductData.csv') then
	  
	  IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name='productdata' and table_type='BASE TABLE') then
        create table public.productdata 
         (
          Category varchar(100),
          Subcategory varchar(100),
          Model   varchar(100),
          ListPrice  float,
          Color  varchar(100),
          StandardCost float,
          Product varchar(100),
          SKU     varchar(100),
          ProductKey integer  
         );
	   EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header encoding ''windows-1251''';
	   ELSE	    
	    DELETE FROM productdata;
		EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header encoding ''windows-1251''';
	 END IF; 
	 END IF; 
	 IF(rec.file_name='Reseller.csv') then
	  
	  IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name='reseller' and table_type='BASE TABLE') then
        create table public.reseller 
         (
          PostalCode varchar(100),
          CountryRegion varchar(100),
          StateProvince   varchar(100),
          City  varchar(100),
          Reseller  varchar(100),
          BusinessType varchar(100),
          ResellerKey  varchar(100),
          ResellerId   integer  
         );
	   EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header encoding ''windows-1251''';
	   ELSE	    
	    DELETE FROM reseller;
		EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header encoding ''windows-1251''';
	 END IF; 
	 END IF; 	 
	IF(rec.file_name='Sales.csv') then
	  
	  IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name='sales' and table_type='BASE TABLE') then
        create table public.sales 
         (
          SalesAmount float,
          TotalProductCost float,
		  ProductStandardCost   float,
		  UnitPriceDiscountPct  float,
		  ExtendedAmount  float,
		  UnitPrice float,
		  OrderQuantity  integer,
		  SalesTerritoryKey  integer,
		  ShipDateKey integer,
		  DueDateKey integer,
		  OrderDateKey integer,
		  ProductKey integer,
		  CustomerKey integer,
		  ResellerKey integer,
		  SalesOrderLineKey integer
         );
	   EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header encoding ''windows-1251''';
	   ELSE	    
	    DELETE FROM sales;
		EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header encoding ''windows-1251''';
	 END IF; 
	 END IF; 
	 IF(rec.file_name='SalesOrder.csv') then
	  
	  IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name='salesorder' and table_type='BASE TABLE') then
        create table public.salesorder 
         (
          SalesOrderLine varchar(100),
          SalesOrder varchar(100),
          SalesOrderLineKey integer,
          Channel  varchar(100)  
         );
	   EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header encoding ''windows-1251''';
	   ELSE	    
	    DELETE FROM salesorder;
		EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header encoding ''windows-1251''';
	 END IF; 
	 END IF; 
    IF(rec.file_name='SalesTerritory.csv') then
	  
	  IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name='salesterritory' and table_type='BASE TABLE') then
        create table public.salesterritory 
         (
          SalesTerritoryKey integer,
          Region varchar(100),
          Country varchar(100),
          GroupContinent  varchar(100)
  
         );
	   EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header encoding ''windows-1251''';
	   ELSE	    
	    DELETE FROM salesterritory;
		EXECUTE 'COPY ' || y || ' from ''' || fullpath || ''' with csv header encoding ''windows-1251''';
	 END IF; 
	 END IF; 

    END LOOP;
END; $$;


