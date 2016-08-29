# Install Pilibaba Payment Gateway In Shopify
(English Version | [中文版](install-pilipay-in-shopify.zh_CN.html))

## Step 1: Install The APP

### A. Get Pilibaba Payment Gateway APP

Get Pilibaba APP from here:  https://apps.shopify.com/pilibaba-payment-gateway

![](http://api.pilibaba.com/doc/img/pilipay-app.gif)

### B. Confirm installation

![](http://api.pilibaba.com/doc/img/shopify-install-pilipay-app-confirm.gif)

### C. Get merchant information
New to Pilibaba? [Click here to SIGN UP.](http://en.pilibaba.com/regist)
After [login Pilibaba](http://en.pilibaba.com/account/login), you can get    `Merchant number` and `Secret key` from [Member Information page](http://en.pilibaba.com/account/myMemberInfo).

![](http://api.pilibaba.com/doc/img/member-info-page-fields.jpg)

D. Submit your merchant information to the APP

The following form would be shown after you confirm installation. Fill the form with the merchant number and secret key from [Member Information page](http://en.pilibaba.com/account/myMemberInfo). After submit the form, the APP has been installed.

![](http://api.pilibaba.com/doc/img/shopify-fill-merchant-info.jpg)

## Step 2: Add Pilibaba Payment Option In Shopify back-end

GO TO: shopify admin -> settings -> payment(`https://***.myshopify.com/admin/settings/payments`)

Copy and paste following contents in RED into "2", "3" and "4" fieds:

2: `Pilibaba 支付（支持银联卡支付，直邮中国）` (Accept China bank cards, direct ship to China)

3: `请点击完成付款，支持银联卡，直邮至中国大陆全境。` (Please click to complete payment, accept China bank cards, directly ship to any address in China mainland)

4: `感谢您选择Pilibaba进行支付，正在为您跳转到Pilibaba的支付页面，请稍候... `(Thank you for choosing pilibaba. Redirecting to Pilibaba's pay page. Please wait...)

![](http://api.pilibaba.com/doc/img/shopify-payment-settings.gif)

## Setp 3: Verify installation

There are two methods to check whether the Pilibaba APP is installed successfully:

A. Check the installed apps.

GO TO: shopify admin -> apps -> installed apps (`https://***.myshopify.com/admin/apps`)

Pilibaba will be displayed in "Installed apps":

![](http://api.pilibaba.com/doc/img/shopify-installed-apps.gif)

B. Check the payment methods

Make an order. Then see whether there is a Pilibaba Checkout option in your payment methods.

![](http://api.pilibaba.com/doc/img/shopify-payment-options.gif)

Click “Complete order” button to redirect to Pilibaba login page, if
you've not logged in as a customer:

![](http://api.pilibaba.com/doc/img/pilibaba-customer-login.gif)

After logged in, the order's detail will be shown:

![](http://api.pilibaba.com/doc/img/pilibaba-order.jpg)

Then, as a customer, you can fill the form, and pay...

## Step 4: Last and most important thing: Check Payment Status!

Check Payment Status -- once Pilibaba received payment, your order status will become “Paid” from “Pending”. Please deliver the parcels to one of Pilibaba’s designated warehouse in your country. Pilibaba will handle the rest thing.

![](http://api.pilibaba.com/doc/img/shopify-orders-management.png)

With regarding of the shipment, all you need to do is to ship the parcels to one of our designated warehouse in your home-country. Pilibaba will
do the rest things. For example:international shipment, customs clearance and last mile delivery.To find our warehouses in your country, please    visit:http://en.pilibaba.com/addressList

## Step 5: Place our logo in the bottom of your site

Placing our logo in the bottom of your site will inform customers that pilibaba is available, which could improve user experience.

Download our logo:

![](http://api.pilibaba.com/doc/img/pilipay.svg)

## Contact Us

If you have any questions please send us an email to:[developer@pilibaba.com](mailto:developer@pilibaba.com). Or Online chat via Skype:developer@pilibaba.com.
