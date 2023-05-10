Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 549706FD415
	for <lists+linux-usb@lfdr.de>; Wed, 10 May 2023 05:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235289AbjEJDQ4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 May 2023 23:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234959AbjEJDQy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 May 2023 23:16:54 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E572C2D43
        for <linux-usb@vger.kernel.org>; Tue,  9 May 2023 20:16:51 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 34A3GbsU6018529, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 34A3GbsU6018529
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
        Wed, 10 May 2023 11:16:37 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 10 May 2023 11:16:44 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 10 May 2023 11:16:43 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d]) by
 RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d%5]) with mapi id
 15.01.2375.007; Wed, 10 May 2023 11:16:43 +0800
From:   =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= 
        <stanley_chang@realtek.com>
To:     Klaus Kudielka <klaus.kudielka@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v1] usb: xhci: plat: Add USB 3.0 phy support
Thread-Topic: [PATCH v1] usb: xhci: plat: Add USB 3.0 phy support
Thread-Index: AQHZgpxahnzl8orY+UeyUbz1LSchZ69S0Kaw
Date:   Wed, 10 May 2023 03:16:43 +0000
Message-ID: <f9f4c477a5a64687900d5a68feb8a586@realtek.com>
References: <20230407060731.20537-1-stanley_chang@realtek.com>
 <519bc128c0ded61b64d26c6e9260bc1fd7c6dea3.camel@gmail.com>
In-Reply-To: <519bc128c0ded61b64d26c6e9260bc1fd7c6dea3.camel@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.190.159]
x-kse-serverinfo: RTEXMBS04.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgS2xhdXMsDQoNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQu
Yw0KPiA+IGIvZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuYyBpbmRleCBiOWY5NjI1NDY3ZDYu
LjYxYzk1MzQ5Yjk5OCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxh
dC5jDQo+ID4gKysrIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuYw0KPiA+IEBAIC0yOTEs
NiArMjkxLDIxIEBAIGludCB4aGNpX3BsYXRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldiwNCj4gc3RydWN0IGRldmljZSAqc3lzZGV2LCBjb25zdCBzDQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgZ290byBkZWFsbG9jX3VzYjJfaGNkOw0KPiA+ICAgICAgICAgICAgICAgICB9
DQo+ID4NCj4gPiArICAgICAgICAgICAgICAgeGhjaS0+c2hhcmVkX2hjZC0+dXNiX3BoeSA9DQo+
IGRldm1fdXNiX2dldF9waHlfYnlfcGhhbmRsZShzeXNkZXYsDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJ1c2ItcGh5IiwgMSk7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChJU19F
UlIoeGhjaS0+c2hhcmVkX2hjZC0+dXNiX3BoeSkpIHsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBpZiAoUFRSX0VSUih4aGNpLT5zaGFyZWRfaGNkLT51c2JfcGh5KSAhPQ0KPiAtRU5PREVW
KQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihzeXNkZXYsICIl
cyBnZXQgdXNiM3BoeSBmYWlsDQo+ID4gKyAocmV0PSVkKVxuIiwNCj4gDQo+IEhlbGxvLA0KPiAN
Cj4gSSdtIGJvb3RpbmcgNi40LXJjMSBvbiBhIFR1cnJpcyBPbW5pYQ0KPiAoYXJtL2Jvb3QvZHRz
L2FybWFkYS0zODUtdHVycmlzLW9tbmlhLmR0cykNCj4gYW5kIGdldCB0aG9zZSBlcnJvciBtZXNz
YWdlczoNCj4gWyAgICAwLjIzMTYwOV0geGhjaS1oY2QgZjEwZjAwMDAudXNiMzogeGhjaV9wbGF0
X3Byb2JlIGdldCB1c2IzcGh5IGZhaWwNCj4gKHJldD0tNikNCj4gWyAgICAwLjIzOTcxNl0geGhj
aS1oY2QgZjEwZjgwMDAudXNiMzogeGhjaV9wbGF0X3Byb2JlIGdldCB1c2IzcGh5IGZhaWwNCj4g
KHJldD0tNikNCj4gDQo+IEl0IGxvb2tzIGxpa2UgYSBjb3NtZXRpYyBpc3N1ZSB3aXRoIGVycm9y
IGNvZGVzLCBidXQgbWF5YmUgaXQgY2FuIGJlIGZpeGVkPw0KPiANCg0KMS4gSSBjaGVja2VkIGFy
bS9ib290L2R0cy9hcm1hZGEtMzg1LXR1cnJpcy1vbW5pYS5kdHMuDQpUaGUgeGhjaSBub2RlIGRv
ZXNuJ3Qgc2VlbSB0byBoYXZlIHVzYi1waHkuDQpJbiB0aGlzIGNhc2UgaXQgc2hvdWxkIGdldCBl
cnJvciBjb2RlIC1FTk9ERVYgKC0xOSkuDQpJJ20gbm90IHN1cmUgd2h5IHRoZSBlcnJvciBjb2Rl
IGlzIC1FTlhJTyAoLTYpLg0KQ2FuIHlvdSBwcm92aWRlIG1vcmUgZGV0YWlscz8NCg0KMi4gVGhp
cyBlcnJvciBtZXNzYWdlIHdpbGwgYmUgcHJpbnRlZCBvbmx5IHdoZW4gZ2V0dGluZyB0aGUgdXNi
MyBwaHkgZmFpbHMuDQpBbmQgdXNiX3BoeSBzZXQgdG8gTlVMTCwgSXQgZG9lcyBub3QgYWZmZWN0
IHRoZSBvcmlnaW5hbCBiZWhhdmlvci4NCk1heWJlIEknbSBtaXNzaW5nIGNoZWNraW5nIC1FTlhJ
TyBvciBzb21lIG90aGVyIGVycm9yIGNvZGUuDQpJIGNhbiBkZWxldGUgdGhpcyBsb2cgYWNjb3Jk
aW5nIHRvIHVzYjIgcGh5IHNpdHVhdGlvbi4NCg0KVGhhbmtzLA0KU3RhbmxleQ0K
