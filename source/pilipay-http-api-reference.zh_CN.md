# HTTP API 参考(V2.0.01)
[English Version](pilipay-http-api-reference.md) | 中文版

## 概览
下面的时序图是霹雳爸爸（Pilibaba）订单的整个流程。这个文档主要描述下图中三个有颜色的步骤（2、4和5）中的接口。

![](http://api.pilibaba.com/doc/media/14497188316511/ED9D3A20-20D8-4E90-9144-A4C0D34E6C1B.png)

说明：

1. 一个顾客在你的网店中提交了一个订单；
2. 你的网店将订单详情推送到霹雳爸爸，其中包括产品列表、总重量和总价格等信息；
3. 霹雳爸爸会引导顾客填写个人信息（地址、手机号和邮箱等），然后顾客支付订单；
4. 霹雳爸爸将支付的数据（支付的金额、付款状态、订单ID和霹雳爸爸的交易ID等信息）推送到你的网店和中转仓；
5. 你的店铺将配送的信息推送到霹雳爸爸；
6. 霹雳爸爸将配送信息推送到中转仓；
7. 你的店铺将商品配送到中转仓；
8. 中转仓确认收货；
9. 霹雳爸爸将收货状态推送到你的网店；
最后，顾客接收到了商品。

## 1 提交订单接口

对应流程图中的2. push order detail

请求类型: `POST`

URL: `https://<pilibaba-domain>/pilipay/payreq`
(生成环境的域名是www.pilibaba.com, 测试环境的域名是pre.pilibaba.com）


### 1.1 参数
M/O: 必要 / 可选

| 字段        |M/O           | 类型  | 最大长度    | 描述 |
|----------- |:-------------:|:-----:|:--------:|:----------- |
| version       |M           | String   | 20    | 版本号，当前是 "V2.0.01"   |
| merchantNo    |M           | String   | 50    | 商户编号|
|currencyType	|M	         |String    |3	     |	货币类型的三字码，目前支持USD, EUR, GBP, AUD, CAD 和 JPY 等。|
|orderNo	    |M	         |String	|50	     |订单编号，由你的网店生成的订单编号|
|orderAmount	|M	         |Integer	|20	     |订单总价（含税）。单位：分|
|deductibleAmount |O	     |Integer	|20	     |订单优惠。单位：分|
|orderTime	    |M	         |String	|20	     |下单时间，格式如2001-12-13 14:15:16|
|sendTime	    |M	         |String	|20	     |发送时间，格式如2001-12-13 14:15:16|
|pageUrl	    |M	         |String	|255	 |结账页面的URL|
|serverUrl	    |M	         |String	|255	 |支付结果的回调URL。当顾客支付后，这个URL将被回调，详情请参考3. 支付结果回调接口|
|redirectUrl	|M	         |String	|255	 |消费者支付完成后返回的那个页面的URL|
|notifyType  	|M	         |String	|255	 |返回代码的类型。值:html、json。
|shipper	    |M	         |Integer	|20	     |运费，从你的商店到中转仓的运费（含税）。单位：分|
|tax	        |M	         |Integer	|20	     |额外的税，这取决于你所在国家的政策。单位：分|
|signType	    |M	         |String	|3	     |签名类型，目前只支持"MD5"|
|signMsg	    |M	         |String	|50	     |签名，用于校验该请求的合法性，这样生成的：`md5(version + merchantNo + currencyType + orderNo + orderAmount + orderTime + pageUrl + serverUrl + redirectUrl + notifyType + shipper + tax + signType + appSecret)`|
|goodsList	    |M	         |String	|1000	 |商品信息，这是一个用URL编码后的JSON数组，数组中的每一个元素代表一个商品。|

商品信息的JSON对象的字段：

|字段	    |M/O	|类型	  |	最大长度	|描述|
|----------- |:-------------:|:-----:|:--------:|:----------- | 
|attr	    |O	    |Object	  |2000	        |商品的属性，比如颜色、大小等|
|name	    |M	    |String	  |255	        |商品的名称|
|pictureUrl	|M	    |string	  |255	        |商品图片的URL|
|price	    |M	    |Integer  |20	        |商品的单价（含税），单位：分|
|productUrl	|M	    |String	  |255	        |商品详情的URL|
|productId	|M	    |String	  |50	        |商品的ID|
|quantity	|M	    |Integer  |20	        |这个订单中这个商品的个数|
|weight	    |M	    |Integer  |10	        |单个此商品的重量，单位：克|

### 1.2  应答

针对一个有效的请求，应答会是`HTTP 302 Found`，并将会把顾客重定向到霹雳爸爸的结账页面。（如果顾客尚未登录，则重定向到登录页面。） 而针对一个无效的请求，则应答会是一个错误信息页面，具体的错误信息以及错误码将会显示在这个错误页面上。

### 1.3 示例

    // REQUEST:
    POST https://www.pilibaba.com/pilipay/payreq

    // with form data: (decoded)
    version:V2.0.01
    merchantNo:0210000202
    currencyType:CNY
    orderNo:1930914372
    orderAmount:4664
    orderTime:2015-11-25 15:52:51
    pageUrl:http://api.pilibaba.com/shopify_app/pilibaba/return_url.php
    serverUrl:http://api.pilibaba.com/shopify_app/pilibaba/notify_url.php
    redirectUrl:http://api.pilibaba.com/shopify_app/pilibaba/redirect_back.php?order=1930914372
    notifyType:html
    shipper:2000
    tax:0
    signType:MD5
    signMsg:06b361046890cdad4f068b2a1fad3804
    goodsList:%5B%7B%22name%22%3A%22Jeans+of+Julies%28Large+%5C%2F+Black%29%22%2C%22pictureURL%22%3A%22https%3A%5C%2F%5C%2Fcdn.shopify.com%5C%2Fs%5C%2Ffiles%5C%2F1%5C%2F1065%5C%2F1088%5C%2Fproducts%5C%2FIMG_0083.JPG%3Fv%3D1447840533%22%2C%22price%22%3A%22888%22%2C%22productURL%22%3A%22https%3A%5C%2F%5C%2Flocatar.myshopify.com%5C%2Fproducts%5C%2Fjeans-of-july%22%2C%22productId%22%3A%223668277764%22%2C%22quantity%22%3A%223%22%2C%22weight%22%3A%22650%22%2C%22attr%22%3A%22%22%2C%22category%22%3A%22%22%2C%22height%22%3A%220%22%2C%22length%22%3A%220%22%2C%22width%22%3A%220%22%7D%5D
    
    // RESPONSE:
    // headers:
    HTTP/1.1 302 Found
    Location: http://www.pilibaba.com/pilipay/checkout?orderId=606
    
    // body:
    // if there is an error, the error will be shown in html.
    
### 1.4 支付结果回调接口

对应流程图中的4. push payment status

这个回调将在顾客支付后被霹雳爸爸调用，你的网店在收到这个接口的请求时应更新订单的支付状态。

`NOTE`：如果顾客未支付或支付失败，则此回调将不会被调用。

请求类型: `GET`

URL：提交订单接口中的`serverUrl`

 请求参数

|字段	      |类型     |	描述|
|-------------|:--------:|:------|
|merchantNo	  |String	|商户编号|
|orderNo	  |String	|订单编号，是曾使用提交订单接口推送到霹雳爸爸的订单|
|orderAmount  |String	|订单总金额，单位：分|
|signType	  |String	|签名类型，目前只支持"MD5"|
|signMsg	  |String	|签名，用于校验该请求的合法性，是这样生成的：md5(merchantNo + orderNo + orderAmount + sendTime + appSecret)，其中的+表示字符串连接操作|
|fee	      |String	|霹雳爸爸的费用|
|orderTime	  |String	|订单创建时间，格式如2001-12-13 14:15:16|
|customerMail |String   |顾客的邮箱地址|

应答的格式

这个回调处理完成后应返回字符串OK.

示例：

    ok
如果返回的应答内容不是`OK`，霹雳爸爸则认为此接口调用失败。霹雳爸爸稍后将会重新调用这个接口。

### 1.5通知商户
在客户支付出错后

|字段	         |类型     |	描述|
|---------------|------|----------|
|errorCode  	|Integer|	        |
|errorMessage   |String |           |

如果你的notifyType返回的是`html`,pilibaba将返回这些参数一个html页面。

如果你的notifyType返回的是`json`,pilibaba将返回这些参数。现在你可以重定向页面。

### 1.6 错误代码

|错误代码	|请求参数	|错误信息|
|:------------|:--------:|:-------|
|20001	|version	            |version is null|
|20002	|version	            |version value is error|
|20003	|merchantNo         	|version value is error|
|20004	|merchantNo	            |merchantNo not exists|
|20005	|currencyType	        |currencyType is null|
|20006	|currencyType	        |currencyType not exists|
|20007	|orderNo	            |orderNo is null|
|20008	|orderNo	            |orderNo length is more than 50|
|20009	|orderAmount	        |orderAmount is null|
|20010	|orderAmount	        |orderAmount length is more than 50|
|20011	|orderAmount	        |orderAmount is not a integer value|
|20012	|orderTime	            |orderTime is null|
|20013	|orderTime	            |orderTimeformat error,for example:2015-08-18 16:08:39|
|20014	|pageUrl	            |pageUrl is null|
|20015	|pageUrl	            |pageUrl length is more than 255|
|20016	|serverUrl	            |serverUrl is null|
|20017	|serverUrl	            |serverUrllength is more than 255|
|20018	|redirectUrl	        |redirectUrlis null|
|20019	|redirectUrl	        |redirectUrllength is more than 255|
|20020	|notifyType         	|notifyTypeis null|
|20021	|notifyType	            |notifyTypeis not “html” or “json”|
|20022	|shipper	            |shipper is null|
|20023	|shipper	            |shipper is null|
|20024	|shipper	            |shipperis not a integer value|
|20025	|tax	                |tax is null|
|20026	|tax	                |tax length is more than 20|
|20027	|tax	                |tax is not a integer value|
|20028	|signType	            |signType is null|
|20029	|signType	            |signType is not equals "MD5"|
|20030	|signMsg	            |signMsg is null|
|20031	|signMsg	            |signMsg length is more than 50|
|20032	|goodsList	            |goodsList is null|
|20040	|name	                |goods name is null|
|20041	|name	                |goods name length is more than 255|
|20042	|pictureUrl	            |goods pictureUrl is null|
|20043	|pictureUrl	            |goods pictureUrl length is more than 255|
|20044	|price	                |goods price is null|
|20045	|price	                |goods price length is more than 20|
|20046	|price	                |goods price is not a integer value|
|20047	|productUrl	            |goods productUrl is null|
|20048	|productUrl         	|goods productUrl length is more than 255|
|20049	|productId	            |goods productId is null|
|20050	|productId	            |goods productId length is more than 50|
|20051	|quantity	            |goods quantity is null|
|20052	|quantity	            |goods quantity length is more than 20|
|20053	|quantity	            |goods quantity is not a integer value|
|20054	|weight	                |goods weight is null|
|20055	|weight	                |goods weight length is more than 10|
|20056	|quantity	            |goods weight is not a integer value|
|20057	|deductibleAmount	    |deductibleAmount length is more than 20|
|20058	|deductibleAmount	    |deductibleAmount is not a integer value|
|10001	|	                    |System error|
|10000	|	                    |success|
|10002	|	                    |currency rate not exists|
|10003	|	                    |order amount more than 1000CNY|
|10004	|	                    |order exists|
|10005	|	                    |sign error|

## 2 更新物流编号接口

对应流程图中的5. push ship detail

请求类型： `GET`

URL: `https://<pilibaba-domain>/pilipay/updateTrackNo` (生成环境的域名是www.pilibaba.com, 测试环境的域名是pre.pilibaba.com）

这接口用于更新某订单对应的物流编号。此接口应在发货后被调用。

### 2.1 参数

M/O:必要 / 可选

|字段	      |M/O	|类型	  |最大长度|描述|
|------------|:----:|:--------:|:---------:|:-----------|
|orderNo	  |M	|String	  |50	     |	订单编号，必须是曾使用提交订单接口推送到霹雳爸爸的订单|
|logisticsNo  |M	|String	  |50	     |	物流编号，物流公司发货的时候会提供这个编号，用于追踪物流|
|merchantNo   |M	|String	  |50	     |	商户编号|
|signMsg	  |M	|String	  |50	     |	签名, 通过 `md5(orderNo + logisticsNo + merchantNo + appSecrect)` 生成|

### 2.2 应答

这个接口的应答可以被忽略。

### 2.3 示例

    // REQUEST:
    GET https://www.pilibaba.com/pilipay/updateTrackNo?orderNo=123123&logisticsNo=87782481231231&merchantNo=201023123&signMsg=6a299536258afad2db5e21d92bc9a429
    
    // RESPONSE:
    // headers
    HTTP/1.1 200 OK
    // body:
    // nothing...
    
## 3  条形码接口
这个接口将返回一张条形码的图片。这个条形码是用于追踪物流来使用的。商户在寄送包裹前应该将这个条形码打印出来，并粘贴到包裹的显著位置。

请求类型: `GET`

URL: `https://<pilibaba-domain>/pilipay/barCode` (生成环境的域名是www.pilibaba.com, 测试环境的域名是pre.pilibaba.com）

### 3.1 请求参数

|字段	    |类型	|描述|
|:-------------|:-------:|:----------|
|orderNo	|M	    |订单编号，是曾使用提交订单接口推送到霹雳爸爸的订单|
|merchantNo	|M	    |商户编号|

### 3.2 应答

这个接口返回的直接就是一张图片。在网页上可以通过<img>标签将其显示出来。

示例:

    <img src="https://www.pilibaba.com/pilipay/barCode?orderNo=XXXX&merchantNo=XXXXX" />
![](http://api.pilibaba.com/static/img/bar-code.jpg)

## 4消费者信息

### 4.1 通路地址

生产环境:https://www.pilibaba.com/pilipay/consumerInfo

### 4.2 参数描述

M/O

|字段	    |选项	|类型	|最大程度	   |值	        |描述
|-----------|:----------:|:-------:|:-----------:|:--------------:|:-------------|
|merchantNo	|M	        |String	|50	           |	商户编号	    |注册成为商户，并登录霹雳爸爸后可以在成员信息页面查到这个编号
|orderNo	|M	        |String	|50            |订单编号	    |由你的网店生成的订单编号
|signType	|M	        |String	|3	           |加密类型	    |MD5
|signMsg	|M	        |String	|50	           |译密文件	|签名，用于校验该请求的合法性，是这样生成的：md5(merchantNO + orderNo + orderAmount + sendTime + appSecret)，其中的+表示字符串连接操作



### 4.3 Return to merchant

|Field	       |Type	|Description |
|------------|:--------:|:------------|
|code	       |String|	             |
|message	   |String|	             |
|name	       |String|	在中国，姓和名是不能分开的|
|mobile	       |String	|            |
|zipcode	   |String  |	         |
|country	   |String	|            |
|province	   |String	|            |
|city	       |String	|            |
|district	   |String	|            |
|address	   |String|	              |
|innerOrderNo	|String	|             |

举例

    {
       "address" : "苏茂大厦228号9楼I座",
       "city" : "长沙市",
       "country" : "中国",
       "district" : "宁乡县",
       "code" :  "0",
       "message"  :  "success",  
       "email" : "qs@pilibaba.com",
       "innerOrderNo" : "20160121103621100001926166",
       "mobile" : "+8618651859698",
       "name" : "张三",
       "province" : "湖南省",
       "zipcode" : "000000"
    }

## 5 获取所有的中转仓的地址接口

这个接口提供了一种可编程的方式去获取[霹雳爸爸的中转仓地址列表](http://en.pilibaba.com/addressList). 在网店中，如需填写配送地址，则可以填写这个地址列表中的某一个。

请求类型： `GET`

URL：`https://<pilibaba-domain>/pilipay/getAddressList` (生成环境的域名是www.pilibaba.com, 测试环境的域名是pre.pilibaba.com）

参数：无

应答：中转仓地址信息的数组（JSON编码）

其中中转仓的地址信息包括以下内容：

字段	类型	描述

|country	|String	|中转仓所在的国家|
|-----------|-------|:-----------|
|firstName	|String	|收货人的名称|
|lastName	|String	|收货人的姓|
|address	|String	|中转仓的详细地址|
|city	    |String	|中转仓所在的城市|
|state	    |String	|中转仓所在的州|
|zipcode	|String	|中转仓所在地的邮编|
|tel	    |String	|收货人的电话号码|

示例：

    [
        {
            "country": "German",
            "firstName": "Postfach JXPNC",
            "lastName": "c/o Zebra Logistics GmbH",
            "address": "Nordersand 1, #Z0367",
            "city": "Hamburg",
            "state": "Hamburg",
            "zipcode": "20457",
            "tel": "040-57130336"
        },
        {
            "country": "Greate Britain",
            "firstName": "JXPNC",
            "lastName": "Pilibaba",
            "address": "Unit 13, Trident Way, Southall, London, #Z0367",
            "city": "Southall",
            "state": "GREATER LONDON",
            "zipcode": "UB2 5LF",
            "tel": "44 (020) 8571 0218"
        },
        // ...
    ]
    
## 6 获取所支持的货币类型接口

请求类型： `GET`

URL：`https://<pilibaba-domain>/pilipay/getCurrency` (生成环境的域名是`www.pilibaba.com`, 测试环境的域名是`pre.pilibaba.com`）

参数：无

应答：货币类型的三字码的数组（JSON编码）

示例：

    [
        "USD",
        "EUR",
        "GBP",
        "JPY",
        "AUD",
        "CAD",
        "CHF",
        "CNY",
        "TWD"
    ]
    
## 附：常见的问题
 
1.商户编号是什么？怎么获取？
 
 商户编号（`merchantNO`），是霹雳爸爸分配给商户的编号，每个商户均不相同，用于区分商户。
 
 [注册](http://en.pilibaba.com/regist)成为商户，并[登录](http://en.pilibaba.com/account/login)霹雳爸爸后可以在成员信息页面查到这个[编号](http://en.pilibaba.com/account/myMemberInfo)： 
 
 ![](http://api.pilibaba.com/doc/media/14504112333980/14506774532148.jpg)
 
2.什么是`appSecret`？`appSecret`有什么用？
 
 `appSecret`是霹雳爸爸分配给商户的秘钥，每个商户均不相同，用于保障交易的安全性。
 
 [注册](http://en.pilibaba.com/regist)成为商户，并[登录](http://en.pilibaba.com/account/login)霹雳爸爸后可以在[成员信息页面](http://en.pilibaba.com/account/myMemberInfo)查到这个`appSecret`（Secret key)： 
 
 ![](http://api.pilibaba.com/doc/media/14504112333980/14506779021380.jpg)
 
3.为什么价格的单位是分？
 
 为了防止出现使用浮点数带来的[舍入误差](https://en.wikipedia.org/wiki/Round-off_error)，接口中所有与数字相关的字段，统一都使用整数，而单位也相应地使用最小单位。对于金钱相关的价格、税、运费和订单总价等都统一使用分作为最小单位。 比如，在以美元为单位时，某商品价格为 `1.89` 美元，那么对应的价格则需要传 `189` (美分)。 其他币种，以此类推。
 
4.如何嵌入霹雳爸爸支付？
 
 如果您使用的网站是通过以下方式创建的，则请浏览对应的安装指导即可将霹雳爸爸支付嵌入到您的网站中：
 
. [Shopify](install-pilipay-in-shopify.md)
. [Magento](pilibaba-kit-for-magento.md)
. [WooCommerce in Wordpress](install-pilipay-for-woocommerce.md)
. [Prestashop](install-pilipay-in-prestashop.md)

 否则，那就需要对您的网站进行二次开发，请联系您的开发者。亦或者[联系霹雳爸爸](http://en.pilibaba.com/contact)来协助开发。
 
 此外，针对网站开发者，要嵌入霹雳爸爸支付，得从两个方面来看：
 
 一方面，在管理后台（Admin backend / back office）：
 
 增加一个配置页面，让商户可以配置 merchantNo 和 appSecret，这两个字段分别用于识别商户和提升交易的安全性，需要保存到数据库或配置文件中，以备后用；
 增加一个回调接口，这个接口需要赋值给 提交订单接口 的参数中的serverUrl；这个接口被调用的时候表示用户已经支付了，请参考 支付结果回调接口 处理支付结果。一般来说，在支付结果是『成功』的时候，需要将订单标记为『已支付』，否则将订单标记为『支付失败』
 在订单的物流编号更新的时候，调用 更新物流编号接口 接口，将这个 物流编号推送给霹雳爸爸，以便对接物流
 在订单详情页面，将 条形码接口 返回的条形码图片显示出来，并提示商户在配送前将这个条形码打印出来并贴到包裹上，以便对接物流
 另一方面，在网店前台（storefront）：
 
 在结账的页面上增加『霹雳爸爸支付』按钮；
 在『霹雳爸爸支付』按钮点击的时候，收集用户的购物车信息，调用 提交订单接口 将订单推送到霹雳爸爸。
 5.有没有测试环境可供使用？
 
 有的。我们的支付接口的测试环境的域名是`pre.pilibaba.com`. 如果需要登录商户账号，则请到`preen.pilibaba.com`上登录。

