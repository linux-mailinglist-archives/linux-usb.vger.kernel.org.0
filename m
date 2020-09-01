Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6F71258959
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 09:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgIAHhv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 03:37:51 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3148 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726006AbgIAHhu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 03:37:50 -0400
Received: from dggeme761-chm.china.huawei.com (unknown [172.30.72.53])
        by Forcepoint Email with ESMTP id 757BD14AB118D44A7E36;
        Tue,  1 Sep 2020 15:37:48 +0800 (CST)
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggeme761-chm.china.huawei.com (10.3.19.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Tue, 1 Sep 2020 15:37:48 +0800
Received: from dggeme759-chm.china.huawei.com ([10.7.64.73]) by
 dggeme759-chm.china.huawei.com ([10.7.64.73]) with mapi id 15.01.1913.007;
 Tue, 1 Sep 2020 15:37:48 +0800
From:   "tiantao (H)" <tiantao6@hisilicon.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     "andreas.noever@gmail.com" <andreas.noever@gmail.com>,
        "michael.jamet@intel.com" <michael.jamet@intel.com>,
        "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Linuxarm <linuxarm@huawei.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSB0aHVuZGVyYm9sdDogVXNlIGtvYmpfdG9fZGV2KCkg?=
 =?gb2312?Q?instead_of_container=5Fof()?=
Thread-Topic: [PATCH] thunderbolt: Use kobj_to_dev() instead of container_of()
Thread-Index: AQHWf/vRQ5ZAe+1asEu5FyNMPivDx6lS12SAgACOJGA=
Date:   Tue, 1 Sep 2020 07:37:48 +0000
Message-ID: <b7567a2dc486435c9e34e5f027d3664f@hisilicon.com>
References: <1598922090-39482-1-git-send-email-tiantao6@hisilicon.com>
 <20200901070847.GR1375436@lahna.fi.intel.com>
In-Reply-To: <20200901070847.GR1375436@lahna.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.57.60.129]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGk6DQoNCkRvZXNuJ3QgcmVhbGx5IG1hdHRlciBmb3IgYW4gaW5kaXZpZHVhbCBkcml2ZXIsIGJ1
dCBpdCBtYXkgZ2V0IGNvcHBpZWQgdG8gbG90cyBtb3JlLiANCkkgY29uc2lkZXIgaXQncyBhIGxp
dHRsZSB0aWR5IHVwLg0KDQoNCi0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBNaWthIFdlc3Rl
cmJlcmcgW21haWx0bzptaWthLndlc3RlcmJlcmdAbGludXguaW50ZWwuY29tXSANCreiy83Ksbzk
OiAyMDIwxOo51MIxyNUgMTU6MDkNCsrVvP7IyzogdGlhbnRhbyAoSCkgPHRpYW50YW82QGhpc2ls
aWNvbi5jb20+DQqzrcvNOiBhbmRyZWFzLm5vZXZlckBnbWFpbC5jb207IG1pY2hhZWwuamFtZXRA
aW50ZWwuY29tOyBZZWhlemtlbFNoQkBnbWFpbC5jb207IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5v
cmc7IExpbnV4YXJtIDxsaW51eGFybUBodWF3ZWkuY29tPg0K1vfM4jogUmU6IFtQQVRDSF0gdGh1
bmRlcmJvbHQ6IFVzZSBrb2JqX3RvX2RldigpIGluc3RlYWQgb2YgY29udGFpbmVyX29mKCkNCg0K
SGksDQoNCk9uIFR1ZSwgU2VwIDAxLCAyMDIwIGF0IDA5OjAxOjMwQU0gKzA4MDAsIFRpYW4gVGFv
IHdyb3RlOg0KPiBVc2Uga29ial90b19kZXYoKSBpbnN0ZWFkIG9mIGNvbnRhaW5lcl9vZigpDQoN
Ck9LLCBidXQgY2FuIHlvdSB3cml0ZSBoZXJlIHdoeSBpdCBpcyBiZXR0ZXI/IDopDQoNCj4gU2ln
bmVkLW9mZi1ieTogVGlhbiBUYW8gPHRpYW50YW82QGhpc2lsaWNvbi5jb20+DQo+IC0tLQ0KPiAg
ZHJpdmVycy90aHVuZGVyYm9sdC9kb21haW4uYyB8IDIgKy0NCj4gIGRyaXZlcnMvdGh1bmRlcmJv
bHQvc3dpdGNoLmMgfCAyICstDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RodW5kZXJib2x0L2Rv
bWFpbi5jIA0KPiBiL2RyaXZlcnMvdGh1bmRlcmJvbHQvZG9tYWluLmMgaW5kZXggYmJhNGNiZi4u
N2ExOTJiNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy90aHVuZGVyYm9sdC9kb21haW4uYw0KPiAr
KysgYi9kcml2ZXJzL3RodW5kZXJib2x0L2RvbWFpbi5jDQo+IEBAIC0yNzUsNyArMjc1LDcgQEAg
c3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmRvbWFpbl9hdHRyc1tdID0geyAgDQo+IHN0YXRpYyB1
bW9kZV90IGRvbWFpbl9hdHRyX2lzX3Zpc2libGUoc3RydWN0IGtvYmplY3QgKmtvYmosDQo+ICAJ
CQkJICAgICAgc3RydWN0IGF0dHJpYnV0ZSAqYXR0ciwgaW50IG4pICB7DQo+IC0Jc3RydWN0IGRl
dmljZSAqZGV2ID0gY29udGFpbmVyX29mKGtvYmosIHN0cnVjdCBkZXZpY2UsIGtvYmopOw0KPiAr
CXN0cnVjdCBkZXZpY2UgKmRldiA9IGtvYmpfdG9fZGV2KGtvYmopOw0KPiAgCXN0cnVjdCB0YiAq
dGIgPSBjb250YWluZXJfb2YoZGV2LCBzdHJ1Y3QgdGIsIGRldik7DQo+ICANCj4gIAlpZiAoYXR0
ciA9PSAmZGV2X2F0dHJfYm9vdF9hY2wuYXR0cikgeyBkaWZmIC0tZ2l0IA0KPiBhL2RyaXZlcnMv
dGh1bmRlcmJvbHQvc3dpdGNoLmMgYi9kcml2ZXJzL3RodW5kZXJib2x0L3N3aXRjaC5jIGluZGV4
IA0KPiBhOTIxZGU5Li4xNzNjZTNiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3RodW5kZXJib2x0
L3N3aXRjaC5jDQo+ICsrKyBiL2RyaXZlcnMvdGh1bmRlcmJvbHQvc3dpdGNoLmMNCj4gQEAgLTE2
NDksNyArMTY0OSw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpzd2l0Y2hfYXR0cnNbXSA9
IHsgIA0KPiBzdGF0aWMgdW1vZGVfdCBzd2l0Y2hfYXR0cl9pc192aXNpYmxlKHN0cnVjdCBrb2Jq
ZWN0ICprb2JqLA0KPiAgCQkJCSAgICAgIHN0cnVjdCBhdHRyaWJ1dGUgKmF0dHIsIGludCBuKSAg
ew0KPiAtCXN0cnVjdCBkZXZpY2UgKmRldiA9IGNvbnRhaW5lcl9vZihrb2JqLCBzdHJ1Y3QgZGV2
aWNlLCBrb2JqKTsNCj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBrb2JqX3RvX2Rldihrb2JqKTsN
Cj4gIAlzdHJ1Y3QgdGJfc3dpdGNoICpzdyA9IHRiX3RvX3N3aXRjaChkZXYpOw0KPiAgDQo+ICAJ
aWYgKGF0dHIgPT0gJmRldl9hdHRyX2RldmljZS5hdHRyKSB7DQo+IC0tDQo+IDIuNy40DQo=
