curl -LJO https://raw.githubusercontent.com/blogniladri/oracle-ecom/refs/heads/main/backend/src/main/resources/2_ora_data.sql
sqlplus -s QDev/Test123@//localhost/FREEPDB1 @2_ora_data.sql
rm 2_ora_data.sql
