Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1074B9C0D
	for <lists+linux-usb@lfdr.de>; Thu, 17 Feb 2022 10:30:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236846AbiBQJaL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Feb 2022 04:30:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231520AbiBQJaL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Feb 2022 04:30:11 -0500
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9AF6F28A117
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 01:29:56 -0800 (PST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-214-3mWtShXsMl-RU1VFYObK_Q-1; Thu, 17 Feb 2022 09:29:53 +0000
X-MC-Unique: 3mWtShXsMl-RU1VFYObK_Q-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Thu, 17 Feb 2022 09:29:53 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Thu, 17 Feb 2022 09:29:52 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Sergey Shtylyov' <s.shtylyov@omp.ru>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: RE: [PATCH] usb: host: ehci-q: make qtd_fill() return 'u16'
Thread-Topic: [PATCH] usb: host: ehci-q: make qtd_fill() return 'u16'
Thread-Index: AQHYI3J5tDYSdJeLMki7dPOVoujuXqyWwjjAgAC2FQCAAAINAA==
Date:   Thu, 17 Feb 2022 09:29:52 +0000
Message-ID: <9ea390dfcfa8408c945e9a89f5c626a1@AcuMS.aculab.com>
References: <7f2e3194-c897-7ffd-756e-8a9c93d652cd@omp.ru>
 <db41f36420cc4d8585665bf586c1e26e@AcuMS.aculab.com>
 <bc3af329-85cf-4104-acd7-15d527db6810@omp.ru>
In-Reply-To: <bc3af329-85cf-4104-acd7-15d527db6810@omp.ru>
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

RnJvbTogU2VyZ2V5IFNodHlseW92DQo+IFNlbnQ6IDE3IEZlYnJ1YXJ5IDIwMjIgMDk6MjANCi4u
Lg0KPiA+PiBGb3VuZCBieSBMaW51eCBWZXJpZmljYXRpb24gQ2VudGVyIChsaW51eHRlc3Rpbmcu
b3JnKSB3aXRoIHRoZSBTVkFDRSBzdGF0aWMNCj4gPj4gYW5hbHlzaXMgdG9vbC4NCj4gPg0KPiA+
IFdoaWNoIGNsZWFybHkgZG9lc24ndCB1bmRlcnN0YW5kIHRoZSBpbXBsaWNhdGlvbnMgb2YgaXRz
IHJlcG9ydHMuDQo+IA0KPiAgICBUaGUgcmVwb3J0cyBhcmUgbW9zdCBwcm9iYWJseSBjb3JyZWN0
IChTVkFDRSBhY3R1YWxseSBjb21wbGFpbnMgYWJvdXQgYXNzaWduaW5nDQo+IGFuICppbnQqIHZh
cmlhYmxlIHRvICdzaXplX3QnIGZpZWxkKSwgaXQncyBteSBpbnRlcnByZXRhdGlvbiB3aGljaCBt
aWdodCBiZQ0KPiBhdCBmYXVsdCBoZXJlLi4uIDotKQ0KDQpXaGljaCBpcyBhYnNvbHV0ZWx5IGZp
bmUgcHJvdmlkZWQgdGhlIGRvbWFpbiBvZiB0aGUgdmFsdWUNCmZpdHMgaW4gYm90aCB0eXBlcy4N
Cg0KVGhlcmUgaXMgZGlkZGx5LXNxdWl0IHBvaW50IHJlcG9ydGluZyBlcnJvcnMgb24gYXNzaWdu
bWVudHMNCnVubGVzcyB0aGUgZG9tYWlucyBvZiB0aGUgdmFsdWVzIGNhbiBiZSB0cmFja2VkLg0K
DQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQs
IE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86
IDEzOTczODYgKFdhbGVzKQ0K

