
$ ->
  $("#address_zipcode").jpostal({
    postcode : [ "#address_zipcode" ],
    address  : {
      
                  "#address_prefecture_id" : "%3",
                  "#address_city"            : "%4",
                  "#address_district"          : "%5%6%7"
                }
  })
  