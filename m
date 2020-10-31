Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0F162A1353
	for <lists+linux-usb@lfdr.de>; Sat, 31 Oct 2020 04:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbgJaD3g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Oct 2020 23:29:36 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2051 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgJaD3g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Oct 2020 23:29:36 -0400
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CNPmp2j93zVjc3;
        Sat, 31 Oct 2020 11:29:30 +0800 (CST)
Received: from dggema706-chm.china.huawei.com (10.3.20.70) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Sat, 31 Oct 2020 11:29:31 +0800
Received: from dggema755-chm.china.huawei.com (10.1.198.197) by
 dggema706-chm.china.huawei.com (10.3.20.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Sat, 31 Oct 2020 11:29:31 +0800
Received: from dggema755-chm.china.huawei.com ([10.1.198.197]) by
 dggema755-chm.china.huawei.com ([10.1.198.197]) with mapi id 15.01.1913.007;
 Sat, 31 Oct 2020 11:29:31 +0800
From:   zhangqilong <zhangqilong3@huawei.com>
To:     Bastien Nocera <hadess@hadess.net>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIFVTQjogYXBwbGUtbWZpLWZhc3RjaGFyZ2U6IGZp?=
 =?utf-8?B?eCByZWZlcmVuY2UgbGVhayBpbiBhcHBsZV9tZmlfZmNfc2V0X3Byb3BlcnR5?=
Thread-Topic: [PATCH] USB: apple-mfi-fastcharge: fix reference leak in
 apple_mfi_fc_set_property
Thread-Index: AQHWrtU+FgDMggzbUkWKHEHOnIu8PamxCHtw
Date:   Sat, 31 Oct 2020 03:29:31 +0000
Message-ID: <02c9ff38b0c246c498a5e80dde5fb62b@huawei.com>
References: <20201030154534.98294-1-zhangqilong3@huawei.com>
 <0145bd8636cb9f384e5e9b7149a7d9a90bc56825.camel@hadess.net>
In-Reply-To: <0145bd8636cb9f384e5e9b7149a7d9a90bc56825.camel@hadess.net>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.179.28]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiANCj4gT24gRnJpLCAyMDIwLTEwLTMwIGF0IDIzOjQ1ICswODAwLCBaaGFuZyBRaWxvbmcgd3Jv
dGU6DQo+ID4gcG1fcnVudGltZV9nZXRfc3luYygpIHdpbGwgaW5jcmVtZW50IHBtIHVzYWdlIGNv
dW50ZXIgZXZlbiBpdCBmYWlsZWQuDQo+ID4gRm9yZ2V0dGluZyB0byBjYWxsIHBtX3J1bnRpbWVf
cHV0X25vaWRsZSB3aWxsIHJlc3VsdCBpbiByZWZlcmVuY2UgbGVhaw0KPiA+IGluIGFwcGxlX21m
aV9mY19zZXRfcHJvcGVydHksIHNvIHdlIHNob3VsZCBmaXggaXQuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBaaGFuZyBRaWxvbmcgPHpoYW5ncWlsb25nM0BodWF3ZWkuY29tPg0KPiANCj4gSXQg
bG9va3MgY29ycmVjdCwgYnV0IEkgZG9uJ3Qga25vdyB3aGV0aGVyIGl0J3MgbmVjZXNzYXJ5Lg0K
PiBUaGVyZSdzIGEgYm9hdGxvYWQgb2YgdXNlcnMgb2YgdGhhdCBBUEkgdGhhdCBkb24ndCBldmVu
IGNoZWNrIGZvciB0aGUNCj4gZ2V0X3N5bmMoKSByZXR2YWwsIGFuZCBsb2FkcyBtb3JlIHdoZXJl
IGl0J3MgY2hlY2tlZCBidXQgbmV2ZXIgYWN0ZWQgdXBvbi4NCj4gDQo+IERvIHlvdSBpbnRlbmQg
dG8gZml4IGFsbCB0aG9zZSBhcyB3ZWxsPw0KPiANCg0KcG1fcnVudGltZV9nZXRfc3luYyB3aWxs
IGluY3JlYXNlIHRoZSByZWZlcmVuY2UgY291bnQgYXQgZmlyc3QsIGFuZCBpdCB3aWxsIHJlc3Vt
ZSB0aGUgZGV2aWNlDQpsYXRlci4gSWYgcnVudGltZSBvZiB0aGUgZGV2aWNlIGlzIGFjdGl2ZSBv
ciBoYXMgZXJyb3Ioc29tZXRoaW5nIGVsc2UuLi4uKSwgcmVzdW1lIHdpbGwgZmFpbGVkLiBJZiB3
ZQ0KZG8gbm90IGNhbGwgcHV0IG9wZXJhdGlvbiB0byBkZWNyZWFzZSB0aGUgcmVmZXJlbmNlLCB0
aGUgcmVzdWx0IGlzIHRoYXQgdGhpcyBkZXZpY2UgY2Fubm90IGVudGVyDQp0aGUgaWRsZSBzdGF0
ZSBhbmQgYWx3YXlzIHN0YXkgYnVzeSBvciBvdGhlciBub24taWRsZSBzdGF0ZSwgbWF5YmUgaXQg
Y29uc3VtZXMgbW9yZSBwb3dlciBvcg0KcmFpc2UgYWRkaXRpb25hbCBlcnJvcnMuLi4gQW5kIEkn
bGwgdHJ5IHRvIGZpeCB0aGVtIDogKQ0KDQpUaGFua3MsIGJlc3Qgd2lzaCENCg0KWmhhbmcgUWls
b25nDQoNCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvdXNiL21pc2MvYXBwbGUtbWZpLWZhc3RjaGFy
Z2UuYyB8IDQgKysrLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL21pc2MvYXBwbGUt
bWZpLWZhc3RjaGFyZ2UuYw0KPiA+IGIvZHJpdmVycy91c2IvbWlzYy9hcHBsZS1tZmktZmFzdGNo
YXJnZS5jDQo+ID4gaW5kZXggYjQwMzA5NGE2YjNhLi45ZTFhZDQ1MzZlMzYgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy91c2IvbWlzYy9hcHBsZS1tZmktZmFzdGNoYXJnZS5jDQo+ID4gKysrIGIv
ZHJpdmVycy91c2IvbWlzYy9hcHBsZS1tZmktZmFzdGNoYXJnZS5jDQo+ID4gQEAgLTEyMCw4ICsx
MjAsMTAgQEAgc3RhdGljIGludCBhcHBsZV9tZmlfZmNfc2V0X3Byb3BlcnR5KHN0cnVjdA0KPiA+
IHBvd2VyX3N1cHBseSAqcHN5LA0KPiA+IMKgwqDCoMKgwqDCoMKgwqBkZXZfZGJnKCZtZmktPnVk
ZXYtPmRldiwgInByb3A6ICVkXG4iLCBwc3ApOw0KPiA+DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHJl
dCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoJm1maS0+dWRldi0+ZGV2KTsNCj4gPiAtwqDCoMKgwqDC
oMKgwqBpZiAocmV0IDwgMCkNCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAocmV0IDwgMCkgew0KPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwbV9ydW50aW1lX3B1dF9ub2lkbGUoJm1m
aS0+dWRldi0+ZGV2KTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVy
biByZXQ7DQo+ID4gK8KgwqDCoMKgwqDCoMKgfQ0KPiA+DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHN3
aXRjaCAocHNwKSB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoGNhc2UgUE9XRVJfU1VQUExZX1BST1Bf
Q0hBUkdFX1RZUEU6DQo+IA0KDQo=
