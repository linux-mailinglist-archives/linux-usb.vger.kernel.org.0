Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3BE6C1E25
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2019 11:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730543AbfI3JhT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Sep 2019 05:37:19 -0400
Received: from mail-eopbgr150048.outbound.protection.outlook.com ([40.107.15.48]:14304
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730424AbfI3JhT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Sep 2019 05:37:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4/SO2340hnRM6t6B1V7X0Ie52jV+LWn84oP6dbVE/hCXYBgwotvy+fVrKFtQkXfKSMh+x6KAwIVuKF3pGOdG1uIj/8t6D8plF6sdLmOU66KLWmnOBoLKwmwDv3eKTs52L8rJsK1yBdb+j4l9KfgQTiBtpmdUUNJK0LNPhJYE0kakrP96Gx+48jgdsj3tW1ajopa2TDjKJEF4UCsZw+YTWMhYXt6ZhnUxHrIU4a2wi3YkpQjH2R2WJj6VXslGKZ0sAQ2us0gBqpdksmas3Dgr9XtbVc5qpbCWF6FzhhUzEcejoW+EiPvwlRhdXpWKNDy5mqrWxSrJKv28k+oJdS5wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=my9KOx8GWsSt1ZJItPWMzp+0aYeVC6f6izKgy/trGEM=;
 b=NVQ9NRWbx+7WVXVRRkSDwVE1nh6aKSueDwavaA5HeFgg82UIXnFCwtRQzUyfFt3jgQTfuOT919KcMI/esAgOfc3w6lAvZ4zPZ2ufiQkAV5lOOX+B4r+znZ3V6YOMPMrcgMVSPWYp/0U4IDVXcJGvx4TMOzFGSvcqOKR1ApRclXNlexfm1fY9Kj65ZwMpjekvMzVwFE7TxhUfVHt360eijj0UEFol57YKsEliV85nbnp5p7CbIPWOnmJe99nQhziuD3CeuxL4gUuCmL+U2JgOYY3xqes5PfM8gOBXpoYA7JKpJR8hejjSZ03MPYon6oJhEx9IbjIkX4h7ksARDlYW2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=my9KOx8GWsSt1ZJItPWMzp+0aYeVC6f6izKgy/trGEM=;
 b=KzC9vnwUlCXGVACQ0PeV16KsC8PHkdkpifDgmcRnyhblDm+da8TlUKq12i6noSkbocAjDM1RkHYFzjTyJAY7+9u7lX7Cotk6PxPpxMCWioC8duFXHcAojbdgOZzOXqnj5bJ3CU1gP7e9JbEtfSQnT9AJAxX5h8lTXrPvErXhnME=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB2974.eurprd04.prod.outlook.com (10.170.228.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 09:37:10 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::1da:26dc:6373:4ab0]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::1da:26dc:6373:4ab0%3]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 09:37:10 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH v2 1/1] usb: host: xhci: update event ring dequeue pointer
 on purpose
Thread-Topic: [PATCH v2 1/1] usb: host: xhci: update event ring dequeue
 pointer on purpose
Thread-Index: AQHVdowy3KvqKrVg+E+m3SFwaVQ3l6dD7cYAgAAKNiA=
Date:   Mon, 30 Sep 2019 09:37:10 +0000
Message-ID: <VI1PR04MB532798317E040488FBEC9FC28B820@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20190929060556.24182-1-peter.chen@nxp.com>
 <befbb09e-cb05-c0dc-42ab-ad8ddedb9b49@linux.intel.com>
In-Reply-To: <befbb09e-cb05-c0dc-42ab-ad8ddedb9b49@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e7a3375-ea64-403c-f260-08d74589c448
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR04MB2974:|VI1PR04MB2974:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB29742DC29561DF160C0850078B820@VI1PR04MB2974.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(199004)(189003)(86362001)(25786009)(74316002)(9686003)(54906003)(5660300002)(55016002)(316002)(2906002)(64756008)(478600001)(99286004)(8936002)(7696005)(14454004)(26005)(76116006)(66946007)(66476007)(66556008)(7736002)(102836004)(66446008)(110136005)(305945005)(186003)(81166006)(44832011)(6436002)(446003)(6246003)(11346002)(33656002)(66066001)(76176011)(476003)(71190400001)(71200400001)(6506007)(229853002)(4326008)(81156014)(8676002)(15650500001)(14444005)(6116002)(256004)(3846002)(52536014)(486006)(2501003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB2974;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J0nRq9F7Jz7wnXT9DdtpCrfseNK5o2Lt4vX7WIYZ7k8hM+jcAim2dV5vqOTLb0XPQo5hqAXQ/jfEfpkHcdxCSw2LOJp3A5cxShbr6RkK85u76G4TXUV7M+W5DhTKsfwWDOhjArMvoqMgNTwPQzh3CXMw5d9ML3RRIMIalE30LzCj1rt0tUnC0k6KY+Q4lRFMnjVz51ctbo49By6TVkxk2T0L0JMi1mzv/1nrESEMVNffv9iVRFglBzB6tAAgDnSWc/bDnTf+4+lRQE65t4mQ8pMkyYiIPGdFHcWCDLc/DR6yArufbclRLTu2br5yWvZjM1u9NPwUKGQNdiyCUofjcT/JcYMSgD8JOFFVyhVflx75NR3lSmihhi4ybsPLIItS7BCNjTQRNNEphiBb1TMIE4dJTvLu7x+zbBsd1iwj7ew=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7a3375-ea64-403c-f260-08d74589c448
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 09:37:10.0996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wKAVmOFoN61S5M5bYMndt3P5C+xZ6Mft9XjmHJQ111VDESV9JHXCFobHJ01wYs6Ah2UOvLZ9VKr39ldVr66QNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2974
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiBPbiAyOS45LjIwMTkgOS4wNywgUGV0ZXIgQ2hlbiB3cm90ZToNCj4gPiBPbiBzb21lIHNp
dHVhdGlvbnMsIHRoZSBzb2Z0d2FyZSBoYW5kbGVzIFRSQiBldmVudHMgc2xvd2VyIHRoYW4gYWRk
aW5nDQo+ID4gVFJCcywgdGhlbiB4aGNpX2hhbmRsZV9ldmVudCBjYW4ndCByZXR1cm4gemVybyBs
b25nIHRpbWUsIHRoZSB4SEMgd2lsbA0KPiA+IGNvbnNpZGVyIHRoZSBldmVudCByaW5nIGlzIGZ1
bGwsIGFuZCB0cmlnZ2VyICJFdmVudCBSaW5nIEZ1bGwiIGVycm9yLA0KPiA+IGJ1dCBpbiBmYWN0
LCB0aGUgc29mdHdhcmUgaGFzIGFscmVhZHkgZmluaXNoZWQgbG90cyBvZiBldmVudHMsIGp1c3Qg
bm8NCj4gPiBjaGFuY2UgdG8gdXBkYXRlIEVSRFAgKGV2ZW50IHJpbmcgZGVxdWV1ZSBwb2ludGVy
KS4NCj4gPg0KPiA+IEluIHRoaXMgY29tbWl0LCB3ZSBmb3JjZSB1cGRhdGUgRVJEUCBpZiBoYWxm
IG9mIFRSQlNfUEVSX1NFR01FTlQNCj4gPiBldmVudHMgaGF2ZSBoYW5kbGVkIHRvIGF2b2lkICJF
dmVudCBSaW5nIEZ1bGwiIGVycm9yLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgQ2hl
biA8cGV0ZXIuY2hlbkBueHAuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgZm9yIHYyOg0KPiA+
IC0gSWYgY3VycmVudCBFUkRQIHZhbHVlIGlzIHRoZSBzYW1lIHdpdGggaW50ZW5kZWQgd3JpdHRl
biBvbmUsDQo+ID4gICAgZ2l2ZSB1cCB0aGlzIHdyaXR0ZW4uDQo+ID4NCj4gPiAgIGRyaXZlcnMv
dXNiL2hvc3QveGhjaS1yaW5nLmMgfCA2MiArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlv
bnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcmluZy5j
DQo+ID4gYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcmluZy5jIGluZGV4IGUyMjBiY2JlZTE3My4u
MmMwYTE1YzNiM2E3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1yaW5n
LmMNCj4gPiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcmluZy5jDQo+ID4gQEAgLTI3Mzcs
NiArMjczNyw0NCBAQCBzdGF0aWMgaW50IHhoY2lfaGFuZGxlX2V2ZW50KHN0cnVjdCB4aGNpX2hj
ZCAqeGhjaSkNCj4gPiAgIAlyZXR1cm4gMTsNCj4gPiAgIH0NCj4gPg0KPiA+ICsvKg0KPiA+ICsg
KiBVcGRhdGUgRXZlbnQgUmluZyBEZXF1ZXVlIFBvaW50ZXI6DQo+ID4gKyAqIC0gV2hlbiBhbGwg
ZXZlbnRzIGhhdmUgZmluaXNoZWQNCj4gPiArICogLSBUbyBhdm9pZCAiRXZlbnQgUmluZyBGdWxs
IEVycm9yIiBjb25kaXRpb24gICovIHN0YXRpYyB2b2lkDQo+ID4gK3hoY2lfdXBkYXRlX2Vyc3Rf
ZGVxdWV1ZShzdHJ1Y3QgeGhjaV9oY2QgKnhoY2ksDQo+ID4gKwkJdW5pb24geGhjaV90cmIgKmV2
ZW50X3JpbmdfZGVxKQ0KPiA+ICt7DQo+ID4gKwl1NjQgdGVtcF82NDsNCj4gPiArCWRtYV9hZGRy
X3QgZGVxOw0KPiA+ICsNCj4gPiArCXRlbXBfNjQgPSB4aGNpX3JlYWRfNjQoeGhjaSwgJnhoY2kt
PmlyX3NldC0+ZXJzdF9kZXF1ZXVlKTsNCj4gPiArCS8qIElmIG5lY2Vzc2FyeSwgdXBkYXRlIHRo
ZSBIVydzIHZlcnNpb24gb2YgdGhlIGV2ZW50IHJpbmcgZGVxIHB0ci4gKi8NCj4gPiArCWlmIChl
dmVudF9yaW5nX2RlcSAhPSB4aGNpLT5ldmVudF9yaW5nLT5kZXF1ZXVlKSB7DQo+ID4gKwkJZGVx
ID0geGhjaV90cmJfdmlydF90b19kbWEoeGhjaS0+ZXZlbnRfcmluZy0+ZGVxX3NlZywNCj4gPiAr
CQkJCXhoY2ktPmV2ZW50X3JpbmctPmRlcXVldWUpOw0KPiA+ICsJCWlmIChkZXEgPT0gMCkNCj4g
PiArCQkJeGhjaV93YXJuKHhoY2ksICJXQVJOIHNvbWV0aGluZyB3cm9uZyB3aXRoIFNXIGV2ZW50
ICINCj4gPiArCQkJCQkicmluZyBkZXF1ZXVlIHB0ci5cbiIpOw0KPiA+ICsNCj4gPiArCQkvKg0K
PiA+ICsJCSAqIFBlciA0LjkuNCwgU29mdHdhcmUgd3JpdGVzIHRvIHRoZSBFUkRQIHJlZ2lzdGVy
IHNoYWxsDQo+ID4gKwkJICogYWx3YXlzIGFkdmFuY2UgdGhlIEV2ZW50IFJpbmcgRGVxdWV1ZSBQ
b2ludGVyIHZhbHVlLg0KPiA+ICsJCSAqLw0KPiA+ICsJCWlmICgodGVtcF82NCAmICh1NjQpIH5F
UlNUX1BUUl9NQVNLKSA9PQ0KPiA+ICsJCQkJKCh1NjQpIGRlcSAmICh1NjQpIH5FUlNUX1BUUl9N
QVNLKSkNCj4gPiArCQkJcmV0dXJuOw0KPiA+ICsNCj4gPiArCQkvKiBVcGRhdGUgSEMgZXZlbnQg
cmluZyBkZXF1ZXVlIHBvaW50ZXIgKi8NCj4gPiArCQl0ZW1wXzY0ICY9IEVSU1RfUFRSX01BU0s7
DQo+ID4gKwkJdGVtcF82NCB8PSAoKHU2NCkgZGVxICYgKHU2NCkgfkVSU1RfUFRSX01BU0spOw0K
PiA+ICsJfQ0KPiA+ICsNCj4gPiArCS8qIENsZWFyIHRoZSBldmVudCBoYW5kbGVyIGJ1c3kgZmxh
ZyAoUlcxQykgKi8NCj4gPiArCXRlbXBfNjQgfD0gRVJTVF9FSEI7DQo+ID4gKwl4aGNpX3dyaXRl
XzY0KHhoY2ksIHRlbXBfNjQsICZ4aGNpLT5pcl9zZXQtPmVyc3RfZGVxdWV1ZSk7IH0NCj4gPiAr
DQo+ID4gICAvKg0KPiA+ICAgICogeEhDSSBzcGVjIHNheXMgd2UgY2FuIGdldCBhbiBpbnRlcnJ1
cHQsIGFuZCBpZiB0aGUgSEMgaGFzIGFuIGVycm9yIGNvbmRpdGlvbiwNCj4gPiAgICAqIHdlIG1p
Z2h0IGdldCBiYWQgZGF0YSBvdXQgb2YgdGhlIGV2ZW50IHJpbmcuICBTZWN0aW9uIDQuMTAuMi43
DQo+ID4gaGFzIGEgbGlzdCBvZiBAQCAtMjc0OCw5ICsyNzg2LDkgQEAgaXJxcmV0dXJuX3QgeGhj
aV9pcnEoc3RydWN0IHVzYl9oY2QgKmhjZCkNCj4gPiAgIAl1bmlvbiB4aGNpX3RyYiAqZXZlbnRf
cmluZ19kZXE7DQo+ID4gICAJaXJxcmV0dXJuX3QgcmV0ID0gSVJRX05PTkU7DQo+ID4gICAJdW5z
aWduZWQgbG9uZyBmbGFnczsNCj4gPiAtCWRtYV9hZGRyX3QgZGVxOw0KPiA+ICAgCXU2NCB0ZW1w
XzY0Ow0KPiA+ICAgCXUzMiBzdGF0dXM7DQo+ID4gKwlpbnQgZXZlbnRfbG9vcCA9IDA7DQo+ID4N
Cj4gPiAgIAlzcGluX2xvY2tfaXJxc2F2ZSgmeGhjaS0+bG9jaywgZmxhZ3MpOw0KPiA+ICAgCS8q
IENoZWNrIGlmIHRoZSB4SEMgZ2VuZXJhdGVkIHRoZSBpbnRlcnJ1cHQsIG9yIHRoZSBpcnEgaXMg
c2hhcmVkDQo+ID4gKi8gQEAgLTI4MDQsMjQgKzI4NDIsMTQgQEAgaXJxcmV0dXJuX3QgeGhjaV9p
cnEoc3RydWN0IHVzYl9oY2QgKmhjZCkNCj4gPiAgIAkvKiBGSVhNRSB0aGlzIHNob3VsZCBiZSBh
IGRlbGF5ZWQgc2VydmljZSByb3V0aW5lDQo+ID4gICAJICogdGhhdCBjbGVhcnMgdGhlIEVIQi4N
Cj4gPiAgIAkgKi8NCj4gPiAtCXdoaWxlICh4aGNpX2hhbmRsZV9ldmVudCh4aGNpKSA+IDApIHt9
DQo+ID4gLQ0KPiA+IC0JdGVtcF82NCA9IHhoY2lfcmVhZF82NCh4aGNpLCAmeGhjaS0+aXJfc2V0
LT5lcnN0X2RlcXVldWUpOw0KPiA+IC0JLyogSWYgbmVjZXNzYXJ5LCB1cGRhdGUgdGhlIEhXJ3Mg
dmVyc2lvbiBvZiB0aGUgZXZlbnQgcmluZyBkZXEgcHRyLiAqLw0KPiA+IC0JaWYgKGV2ZW50X3Jp
bmdfZGVxICE9IHhoY2ktPmV2ZW50X3JpbmctPmRlcXVldWUpIHsNCj4gPiAtCQlkZXEgPSB4aGNp
X3RyYl92aXJ0X3RvX2RtYSh4aGNpLT5ldmVudF9yaW5nLT5kZXFfc2VnLA0KPiA+IC0JCQkJeGhj
aS0+ZXZlbnRfcmluZy0+ZGVxdWV1ZSk7DQo+ID4gLQkJaWYgKGRlcSA9PSAwKQ0KPiA+IC0JCQl4
aGNpX3dhcm4oeGhjaSwgIldBUk4gc29tZXRoaW5nIHdyb25nIHdpdGggU1cgZXZlbnQgIg0KPiA+
IC0JCQkJCSJyaW5nIGRlcXVldWUgcHRyLlxuIik7DQo+ID4gLQkJLyogVXBkYXRlIEhDIGV2ZW50
IHJpbmcgZGVxdWV1ZSBwb2ludGVyICovDQo+ID4gLQkJdGVtcF82NCAmPSBFUlNUX1BUUl9NQVNL
Ow0KPiA+IC0JCXRlbXBfNjQgfD0gKCh1NjQpIGRlcSAmICh1NjQpIH5FUlNUX1BUUl9NQVNLKTsN
Cj4gPiArCXdoaWxlICh4aGNpX2hhbmRsZV9ldmVudCh4aGNpKSA+IDApIHsNCj4gPiArCQlpZiAo
ZXZlbnRfbG9vcCsrIDwgVFJCU19QRVJfU0VHTUVOVCAvIDIpDQo+ID4gKwkJCWNvbnRpbnVlOw0K
PiA+ICsJCXhoY2lfdXBkYXRlX2Vyc3RfZGVxdWV1ZSh4aGNpLCBldmVudF9yaW5nX2RlcSk7DQo+
ID4gKwkJZXZlbnRfbG9vcCA9IDA7DQo+ID4gICAJfQ0KPiA+DQo+ID4gLQkvKiBDbGVhciB0aGUg
ZXZlbnQgaGFuZGxlciBidXN5IGZsYWcgKFJXMUMpOyBldmVudCByaW5nIGlzIGVtcHR5LiAqLw0K
PiA+IC0JdGVtcF82NCB8PSBFUlNUX0VIQjsNCj4gPiAtCXhoY2lfd3JpdGVfNjQoeGhjaSwgdGVt
cF82NCwgJnhoY2ktPmlyX3NldC0+ZXJzdF9kZXF1ZXVlKTsNCj4gPiArCXhoY2lfdXBkYXRlX2Vy
c3RfZGVxdWV1ZSh4aGNpLCBldmVudF9yaW5nX2RlcSk7DQo+ID4gICAJcmV0ID0gSVJRX0hBTkRM
RUQ7DQo+ID4NCj4gPiAgIG91dDoNCj4gPg0KPiANCj4gVGhpcyBzaG91bGQgd29yaywgYWRkaW5n
IHRvIHF1ZXVlDQogDQpUaGFua3MsIEkgaGF2ZSB0ZXN0ZWQgdGhlc2UgZGF5cywgbm8gaXNzdWUg
aGFzIGZvdW5kIHNvIGZhci4NCg0KUGV0ZXINCg==
