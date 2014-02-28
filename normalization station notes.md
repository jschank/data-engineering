# Thoughts and Decisions

Seemed like using rails app composer would generate a lot of the basics. It may have been a poor choice because the app is beastly now. 

Note the latest rails is a little bit different than the previous versions I’ve used - for example, the composer generated directories for concerns. I am not sure how to leverage and use concerns yet.

# Notes

Should have an UploadController with New/Upload actions

## Models
**Purchaser:** name  
**Merchant:** name, address  
**Offer:** description, price  
**Purchase:** purchaser, item, count  

~~Upload Model to tie the other together and parse the uploaded data. I don’t want a lot of business logic in my models  
Upload class will have no database.  
Upload will be a module in Lib~~


Merchant has many offers
Purchaser has many purchases

Total is a query for all purchases, summing price * count

# Assumptions:

* Merchants might have more than one address. They will be separate rows in the database if they do.
* items (offers) are considered to belong to a merchant AT a specific address.
* Purchase counts are not fractional
* Item Prices might be fractional
* it is implied that merchants provide the items and purchasers purchase them
* gross revenue from the description is for the uploaded file only, not the current totals in the database


# Considerations:

These uploads might be very large, and thus cause a long running controller action to be executed.
The parsing and creation of the database records should be done in a background process.

We should protect against uploads being submitted twice. One way to do that would be to keep a table of uploads, with a hash of the file. Then each upload could be checked against the past uploads.

Creation of records in the data base might fail, for whatever reason, so we should treat the upload as atomic. Transactions should be set up at the start, and then committed or rolled back. Rails does the save operations in a transaction already, so there might be a problem with nested transactions.

I am thinking that using Sinatra might be better for this app. But I haven’t built any Sinatra apps, and I don’t think trying to figure it out now is a good idea. Once I get the Rails app working, I may try it though.


