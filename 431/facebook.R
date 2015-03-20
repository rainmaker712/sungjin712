install.packages('Rfacebook')
library(devtools)
install_github("pablobarbera/Rfacebook/Rfacebook")
require(Rfacebook)
fb_oauth <- fbOAuth(app_id="808403775894190", app_secret="da2713e1a6b6e5d595b0d6d48d3595e4",extended_permissions = TRUE)

ave(fb_oauth, file="fb_oauth")

load("fb_oauth")





# token generated here: https://developers.facebook.com/tools/explorer 
token <- "10155021898335402"
me <- getUsers("ryanshin", token, private_info = TRUE)
me$name # my name

