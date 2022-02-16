Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AFD34B93E0
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 23:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237023AbiBPWdd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 17:33:33 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234060AbiBPWdc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 17:33:32 -0500
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6B58313C257
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 14:33:19 -0800 (PST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-310-sMSH5BhwNRiPKm8YGqgtsQ-1; Wed, 16 Feb 2022 22:33:16 +0000
X-MC-Unique: sMSH5BhwNRiPKm8YGqgtsQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Wed, 16 Feb 2022 22:33:16 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Wed, 16 Feb 2022 22:33:16 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Sergey Shtylyov' <s.shtylyov@omp.ru>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: RE: [PATCH] usb: host: ehci-q: make qtd_fill() return 'u16'
Thread-Topic: [PATCH] usb: host: ehci-q: make qtd_fill() return 'u16'
Thread-Index: AQHYI3J5tDYSdJeLMki7dPOVoujuXqyWwjjA
Date:   Wed, 16 Feb 2022 22:33:15 +0000
Message-ID: <db41f36420cc4d8585665bf586c1e26e@AcuMS.aculab.com>
References: <7f2e3194-c897-7ffd-756e-8a9c93d652cd@omp.ru>
In-Reply-To: <7f2e3194-c897-7ffd-756e-8a9c93d652cd@omp.ru>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RnJvbTogU2VyZ2V5IFNodHlseW92DQo+IFNlbnQ6IDE2IEZlYnJ1YXJ5IDIwMjIgMjA6MTkNCj4g
DQo+IEF0IHRoZSBlbmQgb2YgcXRkX2ZpbGwoKSwgd2UgYXNzaWduIHRoZSAnaW50IGNvdW50JyB2
YXJpYWJsZSB0byB0aGUgJ3NpemVfdA0KPiBsZW5ndGgnIGZpZWxkIG9mICdzdHJ1Y3QgZWhjaV9x
dGQnLiAgSW4gb3JkZXIgbm90IHRvIG1peCB0aGUgKnNpZ25lZCogYW5kDQo+ICp1bnNpZ25lZCog
dmFsdWVzIGxldCdzIG1ha2UgdGhhdCB2YXJpYWJsZSBhbmQgdGhlIGZ1bmN0aW9uJ3MgcmVzdWx0
ICd1MTYnDQo+IGFzIHFURCdzIG1heGltdW0gbGVuZ3RoIGlzIGEgMTUtYml0IHF1YW50aXR5IGFu
eXdheS4uLg0KDQpFeGNlcHQgdGhhdCB5b3UgcmVhbGx5IGRvbid0IHdhbnQgdG8gYmUgZG9pbmcg
YXJpdGhtZXRpYyBvbiBzdWItcmVnaXN0ZXINCnNpemVkIHZhbHVlcy4NCk9uIGV2ZXJ5dGhpbmcg
ZXhjZXB0IHg4NiB0aGUgY29tcGlsZXIgd2lsbCBoYXZlIHRvIGFkZCBpbnN0cnVjdGlvbnMNCnRv
IG1hc2sgdGhlIHZhbHVlIHRvIDE2IGJpdHMgKHVubGVzcyBpdHMgbG9naWMgY2FuIGRldGVjdCB0
aGF0IG92ZXJmbG93DQpjYW4gbmV2ZXIgaGFwcGVuKS4NCg0KVGhlcmUgaXMgYSBzaW1pbGFyIHBy
b2JsZW0gd2l0aCBwYXJhbWV0ZXJzIGFuZCByZXR1cm4gdmFsdWVzLg0KVGhleSBuZWVkIG1hc2tp
bmcgb25lIHNpZGUgb2YgdGhlIGNhbGwgKG9yIG1heWJlIGJvdGgpLg0KDQo+IEZvdW5kIGJ5IExp
bnV4IFZlcmlmaWNhdGlvbiBDZW50ZXIgKGxpbnV4dGVzdGluZy5vcmcpIHdpdGggdGhlIFNWQUNF
IHN0YXRpYw0KPiBhbmFseXNpcyB0b29sLg0KDQpXaGljaCBjbGVhcmx5IGRvZXNuJ3QgdW5kZXJz
dGFuZCB0aGUgaW1wbGljYXRpb25zIG9mIGl0cyByZXBvcnRzLg0KDQoJRGF2aWQNCg0KLQ0KUmVn
aXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRv
biBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

