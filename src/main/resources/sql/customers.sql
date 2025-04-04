-- Used by the CustomersByZipCode servlet
select * from APP.CUSTOMER
where (:zipcode = '' or ZIP = :zipcode)
and (:state = '' or STATE = :state)
and (:discountCode = '' or DISCOUNT_CODE = :discountCode)
