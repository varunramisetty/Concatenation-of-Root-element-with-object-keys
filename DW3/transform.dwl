//Concatenation of Root element with object keys
%dw 2.0
output csv

//in this particulary dataweave script im using function with flattenObject and mapObject to get the concatenation of root element with object key

fun flattenObject (parentKey,val) = val mapObject ((value, key, index) -> 
                                        if(typeOf(value) == Object) 
                                            flattenObject(parentKey++ '_' ++ key,value)
                                          else 
                                             (parentKey++ '_' ++ key):value
                                          )
 
---
payload mapObject ((value, key, index) -> if(typeOf(value) == Object) 
                                            flattenObject(key,value)
                                          else 
                                             (key):value
                                          )
                                          