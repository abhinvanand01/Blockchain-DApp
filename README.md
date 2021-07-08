# Blockchain Dapp

A decentralized application to solve problems related to supply chain management system.
Ever Wondered in a supply chain , there are so many participants , and so much of data sharing from one participant to another takes place ? 
What it the data in between is manipulated by a participant ?  If at all that happens , the final consumer might not receive the authentic and quality product.
Example of such incident is , Premium Wine.

Suppose a manufacturer , manufactures a very premium and high quality Wine and while going through supply chain , a certain participant decides to manipulate data 
within their database and change Wine bottles , and exports the product to next participant . At the end, Consumer will receive the fake Wine bottle and they wont even 
come to know . So to solve this problem , Blockchain can be taken into account.


# Brief Description about this app :
-> At Manufacturer's end , it generates a barcode (QR code) of the product entered ,and add the details of that product like  (who manufactured , when manufactured , and what was the location ) . \
-> At Shiper's end, the shipper can scan the QR code of a given product and marked it as shipped and the last location will be updated as per the location fetched by the device. \
-> At Consumer's end ,the consumer can Scan the QR code of a product to fetch the details from blockchain and show all the information of the product and hence verify if the          product is authentic or not. \
-> key feature ( whenever we update  the product details , it automatically detects the current geolocation of the mobile phone and updates the location, we dont have to   
   manually add the location) . \
   
   

# Tech stack used : 
 Flutter for App designing, 
 Rinkybi test net as the test blockchain network, 
 firebase to store users details and their role in the supply chain.
 SmartContracts written on Remix IDE ,
 and Metamask as a wallet to  verify transcations on the blockchain.



#Login and SignUp Page

![](https://github.com/abhinvanand01/Blockchain-DApp/blob/a595e9bcb1c2c21417aa80bf39d5eebc3c54278d/loginFast.gif)


# Manufacturer side
![](https://github.com/abhinvanand01/Blockchain-DApp/blob/a595e9bcb1c2c21417aa80bf39d5eebc3c54278d/manufacturer.gif)




# Shipper side
![](https://github.com/abhinvanand01/Blockchain-DApp/blob/a595e9bcb1c2c21417aa80bf39d5eebc3c54278d/shipper_page.gif)



# Consumer side
![](https://github.com/abhinvanand01/Blockchain-DApp/blob/a595e9bcb1c2c21417aa80bf39d5eebc3c54278d/consumer.gif)




## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference
