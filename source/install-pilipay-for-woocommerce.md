# Install Pilibaba Payment For WooCommerce

## 1.Dowload Plugin

Recommended: you can search `Pilibaba`, find and install it online.

![](http://api.pilibaba.com/doc/media/14496505868327/14498064847980.jpg)

You can also [download it from wordpress.org](https://wordpress.org/plugins/pilibaba-payment-for-woocommerce/)

If wordpress.org is not available to you, please dowload the latest plugin from here:

[![](http://api.pilibaba.com/doc/media/logos/woocommerce.png)](http://api.pilibaba.com/product/downloads/pilibaba-payment-for-woocommerce-latest.zip)

## 2.Install Plugin From Downloaded zip Package

Note: this step is necessary only if you cannot install it online. The installation is as usual as other Wordpress's plugins:

1) Go to the `Plugins` page in the admin backend. Then click the `Add New` button.

![](http://api.pilibaba.com/doc/media/14496505868327/14497124725478.jpg)

2) Click the Upload `Plugin button` to go to the upload plugin page.

![](http://api.pilibaba.com/doc/media/14496505868327/14497126880943.jpg)

3) Click the `select file` button, whose text depending on your locale, to choose the downloaded plugin file.

![](http://api.pilibaba.com/doc/media/14496505868327/14497127440180.jpg)

4) Click the `Install Now` button to install it.

![](http://api.pilibaba.com/doc/media/14496505868327/14497128432506.jpg)

5) Finally, after installing, click the `Activate Plugin` to activate it.

![](http://api.pilibaba.com/doc/media/14496505868327/14497128514820.jpg)

## 3.Admin Settings
After installation, there're serveral configurations must be done. Please go to`WooCommerce` -> `Settings`page in the admin backend, goto `Checkout` tab, and open `Pilibaba Payment` section. Then fill and save the fields in the form following the instructions belove each field:

![](http://api.pilibaba.com/doc/media/14496505868327/14509371872419.jpg)

## 4.Managing Orders
4.Managing Orders

A. Check orders checked out via Pilibaba Payment

1) Orders checked out via Pilibaba Payment would have a note `Via Pilibaba 支付（支持银联卡支付，直邮中国）` which is the same with title field in the configurations.

![](http://api.pilibaba.com/doc/media/14496505868327/14497135558361.jpg)

![](http://api.pilibaba.com/doc/media/14496505868327/14497136091333.jpg)

2) When a customer has already paid, the order status would be Processing. Otherwise, the order status would be On Hold:

![](http://api.pilibaba.com/doc/media/14496505868327/14497141243640.jpg)

![](http://api.pilibaba.com/doc/media/14496505868327/14497138191869.jpg)

B. Ship out the parcel and update tracking number

After the customer has paid, the shop owner should do like this: 1) Download the barcode, and print it. Then paste it on the parcel before shipping. 2) Ship the parcel out to one of [Pilibaba's warehouses](http://en.pilibaba.com/addressList), and update the tracking number in the Edit Order page:

![](http://api.pilibaba.com/doc/media/14496505868327/14497457206929.jpg)

Note: The barcode and tracking number are used to matching the parcel shipped to the warehouse. So if they were blank or incorrect, the parcel would NOT be distinguished out and would NOT be shipped to the customer.

## 5.An Example Order Paid Via Pilibaba Payment

1) Customer: Add a product to the cart

A customer go to your shop, and click the ADD TO CART button below a product.

![](http://api.pilibaba.com/doc/media/14496505868327/14497147284288.jpg)

2) Customer: Checkout via Pilibaba Payment

The customer go to the cart page. There are two ways to checkout via Pilibaba Payment:

One way, click the Pilibaba 支付 button right on the cart page:

![](http://api.pilibaba.com/doc/media/14496505868327/14497148700102.jpg)

The other way, after clicked "Proceed to Checkout" and went to checkout page, choose `Pilibaba 支付（支持银联卡支付，直邮中国）` and go `PLACE ORDER:`

![](http://api.pilibaba.com/doc/media/14496505868327/14497149821422.jpg)

3) Customer: Complete payment

The customer would be redirected to Pilibaba's checkout page, which is in Chinese. There he could fill his name, his addresses, his post code and other information in Chinese. Finally, he can choose a China's bank or UnionPay to pay for the order.

![](http://api.pilibaba.com/doc/media/14496505868327/14497151389936.jpg)

![](http://api.pilibaba.com/doc/media/14496505868327/14497153190858.jpg)

![](http://api.pilibaba.com/doc/media/14496505868327/14497153299569.jpg)

4) Merchant: Check processing orders

After the customer has paid, the shop owner can find the order in Processing status:

![](http://api.pilibaba.com/doc/media/14496505868327/14509369453353.jpg)

5) Merchant: Ship out the product to one of [Pilibaba's warehouses](http://en.pilibaba.com/addressList)

Then, the shop owner should ship out the product to one of [Pilibaba's warehouses.](http://en.pilibaba.com/addressList)

6) Merchant: Update tracking number

After shipped out the product, the shop owner should update the tracking number:

![](http://api.pilibaba.com/doc/media/14496505868327/14497457206929.jpg)

7) Merchant: Mark the order as completed
After all done, the shop owner could mark the order as completed:

![](http://api.pilibaba.com/doc/media/14496505868327/14509368606221.jpg)

8) Pilibaba: Ship the product from the warehouse to the customer

After the product arrived the warehouse, Pilibaba will ship the product from the ware house to China, then to the customer.

9) Customer: Receive the product

Finally, the customer received the product.

FAQ

1) How to update Pilibaba Payment For WooCommerce?

The updating process is like other plugins:

1.Go to `Plugins` -> `Installed Plugins` in your Wordpress admin;
2.Click the `Update Available`;
3.Find Pilibaba Payment For WooCommerce
4.Click the `update now` link in the right.

![](http://api.pilibaba.com/doc/media/14496505868327/14509361484734.jpg)

5.Then fill your FTP account info and click Proceed button to continue;

![](http://api.pilibaba.com/doc/media/14496505868327/14509365170010.jpg)

6.After a while, the Pilibaba Payment For WooCommerce would be successfully updated.

![](http://api.pilibaba.com/doc/media/14496505868327/14509378000296.jpg)

2) What is express checkout?

"Express checkout" means the function that customer could express checkout on the Cart page. A "Pilibaba Payment" button will be add to the right of "Proceed to Checkout" button on the Cart page:

![](http://api.pilibaba.com/doc/media/14496505868327/14509372670824.jpg)

3) What is production mode?

In version 1.0.12, production mode is available in the settings:

![](http://api.pilibaba.com/doc/media/14496505868327/14510283971558.jpg)

Production mode  means to use the production environment of Pilibaba. All orders must to be actually paid. It is enabled by default. Only when you wanna run a test and you don't want to actually pay for the test order, you can disable production mode.

Warning: If the production mode is not enabled, orders will NOT be actually paid!
