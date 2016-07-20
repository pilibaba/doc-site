##Enable Pilibaba Module in OpenCart back-office

[Pre-installed in Opencart 2.2 and above](install-pilibaba-in-opencart.md)
For Opencart 2.0 and 2.1, you can click [Here](http://www.opencart.com/index.php?route=extension/extension/info&token=4601e69c911d0f8af7bc17a08009d4e3&extension_id=27186) to download at marketplace.
If you have any questions, please contact us at developer@pilibaba.com Thanks.

##Step 1 : Log in to the admin panel of OpenCart.

##Step 2 : Upload download pilipay package to the server

![](http://api.pilibaba.com/doc/img/opencart/pre_step.png)

##Step 3 : Find the Pilibaba module in 'Extensions -> Payments’.

Click install (2.) and then click edit button(3.)

![](http://api.pilibaba.com/doc/img/opencart/step1.png)

![](http://api.pilibaba.com/doc/img/opencart/step2.png)

##Step 4 Create your Pilibaba account at Pilibaba registration page.

You need to

1. Use a email address as your login ID

2. Set your account login Password

3. Select one currency for your account

4. Select one of Pilibaba warehouses in your territory

5. Click Register button

![](http://api.pilibaba.com/doc/img/opencart/step3.png)

##Step 5: Configure your Shipping fee and mode at“settings”tab

1. After your account has been registered, you will get UNIQUE Merchant No. and Secret key from system automatically. See below RED square.

2. Environment -> “Live” mode

3. Setting Shipping fee (the shipping cost from your warehouse to Pilibaba warehouse.)

4. Order status -> “Processing”

5. Status ->”Enable”

6. Debug logging -> “Disabled”

7. Setting your order prefix (optional)

8. Click “Save” to complete configuration.

![](http://api.pilibaba.com/doc/img/opencart/step4.png)

To show the Pilibaba button at the basket and checkout, a couple of steps are necessary.

##Step 6 go to 'Extensions -> Modules' and install Edit -> “enable” the 'Pilibaba Checkout Button and “Save”

![](http://api.pilibaba.com/doc/img/opencart/step5-1.png)

![](http://api.pilibaba.com/doc/img/opencart/step5-2.png)

![](http://api.pilibaba.com/doc/img/opencart/step5-3.png)

##Step 7: Setting layouts

Add “Pilibaba checkout button”:

1. Please go to 'Design -> Layouts', edit the 'Checkout' layout and add the 'Pilibaba Checkout Button' module to it. (It's exactly the same process for PayPal Express).

2. Postion -> “Content TOP”

Add “Powered by Pilibaba badge”

1. Please go to 'Design -> Layouts', edit the 'Checkout' layout and add the 'Pilibaba Badge' module to it.

2. Postion -> “Content right” and “Save”

![](http://api.pilibaba.com/doc/img/opencart/step6-1.png)

![](http://api.pilibaba.com/doc/img/opencart/step6-2.png)

##Frontend view

![](http://api.pilibaba.com/doc/img/opencart/frontstep1.png)

`Congratulations! You have completed all settings and can take orders from China market right away.`
After you receive an order if you go to 'Sales -> Orders', click the 'View' button for the order and open the 'Pilibaba' tab you'll see a section where you can update the tracking number, as well as view more information about the order.
##Update Tracking Number And Print out barcode

1. You can see "TOTAL ORDERS" when you entry the Background system ,Click "View more" to see more orders.

2. Click "view" button to see order detail.

3. You can Update Tracking Number when you choose pilibaba for chinese Checkout and Click Update Tracking Number button in Order History

4. Cilck Generate Barcode Button to Print out barcode

![](http://api.pilibaba.com/doc/img/opencart/step7-1.png)

![](http://api.pilibaba.com/doc/img/opencart/step7-2.png)

![](http://api.pilibaba.com/doc/img/opencart/step7-3.png)

##Contact

If you have any other questions or concerns, please contact us via [email](mailto:developer@pilibaba.com) or Skype (developer@pilibaba.com).
