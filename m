Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD5AC3BBFC
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 20:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387805AbfFJSrP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 14:47:15 -0400
Received: from mail-eopbgr80075.outbound.protection.outlook.com ([40.107.8.75]:13078
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387643AbfFJSrP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jun 2019 14:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CjNYuR6L3iLMjrX6E0rxHbLNK5YpHpC9znG3xZ6igM=;
 b=PgB8Ck6JzAxbXTTE5Z0buCprr/RDVXf/c7afHCCwrEiSTkdXvxeZ51umzqCXp8rOWtGBxUoXanq8YYT43S/Ym88xoJ2/HfWVcR1TE9B4dI00lrbLhSSPRvibb0ARv08yKA2YlzveOaHExWG6iCELO9zJTN+VqNGFEwmJtd+dlK4=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (20.179.235.152) by
 VE1PR04MB6639.eurprd04.prod.outlook.com (20.179.235.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.21; Mon, 10 Jun 2019 18:47:11 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::9e6:e136:4c09:fe67]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::9e6:e136:4c09:fe67%5]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 18:47:11 +0000
From:   Leo Li <leoyang.li@nxp.com>
To:     "jocke@infinera.com" <joakim.tjernlund@infinera.com>,
        Ran Wang <ran.wang_1@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: fsl_udc status?
Thread-Topic: fsl_udc status?
Thread-Index: AQHVH2FeViVekb5FTkyBYafYtN/FkaaVHuBQgAAMpYCAAAsmUA==
Date:   Mon, 10 Jun 2019 18:47:10 +0000
Message-ID: <VE1PR04MB6687A5BB18C776C3164822198F130@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <95d5902538997e340ccf7784406832904d512b51.camel@infinera.com>
         <VE1PR04MB6687C0AD101BF0747EB0077D8F130@VE1PR04MB6687.eurprd04.prod.outlook.com>
 <067978c60a918e55bfa59f0928dc014f7967a774.camel@infinera.com>
In-Reply-To: <067978c60a918e55bfa59f0928dc014f7967a774.camel@infinera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leoyang.li@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48b604c1-0588-4c9b-7777-08d6edd40c06
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VE1PR04MB6639;
x-ms-traffictypediagnostic: VE1PR04MB6639:
x-ms-exchange-purlcount: 1
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <VE1PR04MB6639EAF53D2A2DEF523D96118F130@VE1PR04MB6639.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(366004)(346002)(136003)(39860400002)(13464003)(189003)(199004)(3846002)(6436002)(53546011)(478600001)(486006)(86362001)(26005)(33656002)(2906002)(68736007)(76176011)(2501003)(476003)(256004)(6246003)(71200400001)(25786009)(110136005)(8936002)(966005)(81166006)(14454004)(11346002)(446003)(45080400002)(99286004)(102836004)(5660300002)(8676002)(7116003)(14444005)(81156014)(74316002)(316002)(66066001)(71190400001)(76116006)(6506007)(9686003)(229853002)(6306002)(66946007)(52536014)(186003)(64756008)(73956011)(305945005)(55016002)(53936002)(7736002)(66476007)(66446008)(66556008)(6116002)(7696005)(491001);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6639;H:VE1PR04MB6687.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Bj117g/eVySD/YdXzFjSp5XmBi0IRCHuuol/dDeYVCPuL9dJRE8qsCjVFBI+MkAUhNzKgnb5hpeHTNU1UFyTJaoxuTdCIRoslouEj7l7m1euwzSXGo2fnyCzVWIQMDrzsXdXJcFLwNK3SSGCB7rufI3f0cQxHxM79kPFOkIX4PAQXYmr19wW0TaZu35W6mh9hrPFsARquLR4IuyyM10V2Es8zbSKMXEf0htSNBlFMVNIqwJpDCUSAm2cGmlYoRIhqCCEta54PG5kWvplSqL+3cRdCrCo3Ph5RjlBufpANVyngajT/qd1Osy8bIk1XCAKLkm2iBhd3yKapQLwx2GeRZUL1a/n0oSj/xqxuoJiWkohOcHUtTeHTE9zFY9RG/dDMYq8ZZRc4J0FVMAmr65nGWR12JEsvqPUZIXvB+ajgZE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b604c1-0588-4c9b-7777-08d6edd40c06
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 18:47:10.9364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leoyang.li@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6639
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9ha2ltIFRqZXJubHVu
ZCA8Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAx
MCwgMjAxOSAxMjo1MiBQTQ0KPiBUbzogTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+OyBSYW4g
V2FuZyA8cmFuLndhbmdfMUBueHAuY29tPjsgbGludXgtDQo+IHVzYkB2Z2VyLmtlcm5lbC5vcmcN
Cj4gU3ViamVjdDogUmU6IGZzbF91ZGMgc3RhdHVzPw0KPiANCj4gT24gTW9uLCAyMDE5LTA2LTEw
IGF0IDE3OjEyICswMDAwLCBMZW8gTGkgd3JvdGU6DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+ID4gRnJvbTogSm9ha2ltIFRqZXJubHVuZCA8Sm9ha2ltLlRqZXJubHVuZEBp
bmZpbmVyYS5jb20+DQo+ID4gPiBTZW50OiBNb25kYXksIEp1bmUgMTAsIDIwMTkgMjo1MiBBTQ0K
PiA+ID4gVG86IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPjsgbGludXgtdXNiQHZnZXIua2Vy
bmVsLm9yZw0KPiA+ID4gU3ViamVjdDogZnNsX3VkYyBzdGF0dXM/DQo+ID4gPg0KPiA+ID4gV2Ug
YXJlIHRyeWluZyB0byBnZXQgZnNsX3VkYyB1cCBhbmQgcnVubmluZyBvbiBhIFQxMDQyIHdpdGgg
d2l0aG91dA0KPiBzdWNjZXNzLg0KPiA+ID4gU2VlbXMgbGlrZSB0aGlzIGRyaXZlciBpcyBsYWdn
aW5nIGJlaGluZCB0aGUgY29ycmVzcG9uZGluZyBob3N0DQo+IGRyaXZlcihtcGgpLg0KPiA+ID4g
VGhlIG1waCBkcml2ZXIgaGFzIGEgbnVtYmVyIG9mIFVTQiBlcnJhdGEgd29ya2Fyb3VuZHMgd2hp
bGUgdWRjIGhhcw0KPiBub25lLg0KPiA+ID4gQXQgbGVhc3QgZXJyYXRhcyBBMDA3NzkyIHNlZW1z
IGFwcGxpY2FibGUgZm9yIHVkYyB0b28uDQo+ID4gPg0KPiA+ID4gSXMgdGhlIGZzbF91ZGMgZHJp
dmVyIGZ1bmN0aW9uYWwgb24gNC4xNC54KHdoaWNoIHdlIHVzZSk/IFdoYXQgaXMgbWlzc2luZyA/
DQo+ID4NCj4gPiBXZSBhcmUgY3VycmVudGx5IHByb3ZpZGluZyA0LjE0IHN1cHBvcnQgd2l0aCBv
dXIgUW9ySVEgU0RLLiAgWW91IGNhbiB0cnkNCj4gdGhlIGtlcm5lbCB0cmVlIGF0DQo+IGh0dHBz
Oi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUy
RiUyRnNvdXJjDQo+IGUuY29kZWF1cm9yYS5vcmclMkZleHRlcm5hbCUyRnFvcmlxJTJGcW9yaXEt
DQo+IGNvbXBvbmVudHMlMkZsaW51eCUyRmxvZyUyRiUzRmglM0RsaW51eC0NCj4gNC4xNCZhbXA7
ZGF0YT0wMiU3QzAxJTdDbGVveWFuZy5saSU0MG54cC5jb20lN0M3MGZiZmFhOTJjOGU0ZThhOTIN
Cj4gNzAwOGQ2ZWRjYzQ4YTAlN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3QzAl
N0MwJTdDNjM2OQ0KPiA1Nzg1ODk4NDgwNDIwOSZhbXA7c2RhdGE9WWl2bWtnakRoSjFrTUxLM1Y1
bzNYRlhxT1pRYUp1NGdobnFqUTgNCj4gU1pVVFUlM0QmYW1wO3Jlc2VydmVkPTAuICBJIHRoaW5r
IGl0IGlzIHRlc3RlZCBvbiBUMTA0Mi4NCj4gPg0KPiA+IEkgc2VlIHRoYXQgdGhlcmUgYXJlIGEg
ZmV3IHVkYyByZWxhdGVkIHBhdGNoZXMgdGhhdCBvbmx5IGV4aXN0IG9uIG91ciBTREsNCj4gY29k
ZSBiYXNlLiAgQWRkaW5nIFJhbiBXYW5nIHdobyBpcyBtYWludGFpbmluZyB0aGVzZSBVU0IgcGF0
Y2hlcw0KPiBpbnRlcm5hbGx5LiAgV2Ugc2hvdWxkIGRlZmluaXRlbHkgdHJ5IHRvIHVwc3RyZWFt
IHRoZW0gaW5zdGVhZCBvZiBtYWludGFpbmluZw0KPiB0aGVtIGludGVybmFsbHkgZm9yZXZlci4N
Cj4gDQo+IEhpIExlbw0KPiANCj4gSSBjaGVja2VkIGFuZCBjaGVycnktcGlja2VkIHRoZSBmZXcg
Y2hhbmdlcyB0aGVyZSB3ZXJlIGluIHlvdXIgcmVwbyBpbnRvDQo+IG15IDQuMTQueCBzdGFibGUg
YW5kIG5vIGpveSA6KCBBbnlob3csIEkgc3VzcGVjdCB1ZGMgZ2FkZ2V0IHdhcyBuZXZlcg0KPiB0
ZXN0ZWQgb24gVDEwNDIgYXMgdGhpcyBkcml2ZXIgaGFzIG5vIHN1cHBvcnQgZm9yIGVycmF0YSBB
MDA3NzkyLCB3aXRob3V0IHRoYXQNCj4gc2ltcGxlIHdvcmthcm91bmQgdGhlIFVTQiBJL0YgaXMg
Y29tcGxldGVseSBkZWFkLg0KDQpJIHdpbGwgZG91YmxlIGNoZWNrIHRoZSB0ZXN0aW5nIHJlc3Vs
dCB3aXRoIHRoZSB0ZXN0aW5nIHRlYW0uICBCdXQgSSBkb3VidCB0aGF0IHRoZSBBMDA3NzkyIGlz
IGNhdXNpbmcgdGhpcyB0b3RhbCBmYWlsdXJlIG90aGVyd2lzZSB0aGUgcHJvYmxlbSBzaG91bGQg
aGF2ZSBiZWVuIHRoZXJlIGZvciBhIGxvbmcgdGltZSBhbmQgdW5saWtlbHkgdG8gYmUgbGVmdCB1
bm5vdGljZWQuDQoNCj4gDQo+IENvdWxkIHlvdSBjaGVjayBpZiB1ZGMvZ2FkZ2V0IHdvcmtzIG9u
IFQxMDQyUkRCKG9yIGFueSBUMTB4eSk/DQo+IElzIHRoZXJlIGEgYmV0dGVyIGRyaXZlciBub3dh
ZGF5cyB0aGFuIGZzbF91ZGMgPw0KDQpUaGVyZSB3YXMgc29tZSBlZmZvcnQgdG8gbWFrZSB1c2Ug
b2YgdGhlIGNoaXBpZGVhIGRyaXZlcihkcml2ZXJzL3VzYi9jaGlwaWRlYSkgZm9yIHRoZSBRb3JJ
USBwbGF0Zm9ybXMuICBCdXQgSSBndWVzcyB0aGUgZWZmb3J0IHN0b3BwZWQgd2hlbiB0aGUgZ3V5
IHdvcmtpbmcgb24gaXQgbGVmdC4gIFlvdSBjYW4gdHJ5IGl0IG91dCwgYnV0IEkgZG9uJ3QgdGhp
bmsgdGhlIGVycmF0dW0gd29ya2Fyb3VuZCBnZXQgaW50byB0aGF0IGRyaXZlciBlaXRoZXIuDQoN
Cj4gDQo+ICBKb2NrZQ0KPiBQUy4NCj4gDQo+IFdpdGggc29tZSBleHRyYSBkZWJ1ZyBpbiBJUlEg
aGFuZGxpbmcgYW5kIHRoZSBBMDA3NzkyIHdlIG9ubHkgZ2V0IHRoaXMgZmFyOg0KPiAgICAxMi45
OTk1OTJdIHVkYzpbZnNsX3VkY19pcnFdICBpcnFfc3JjIFsweCAgICAgIDQwXQ0KPiBbICAgMTIu
OTk5NTk4XSB1ZGM6W2ZzbF91ZGNfaXJxXSAgcmVzZXQgaW50DQo+IFsgICAxMi45OTk2MDFdIHVk
YzpbcmVzZXRfaXJxXSAgQnVzIHJlc2V0DQo+IFsgICAxMy4wMDE4NjBdIHVkYzpbZnNsX3VkY19p
cnFdICBpcnFfc3JjIFsweCAgICAgICA0XQ0KPiBbICAgMTMuMDAxODYzXSB1ZGM6W2ZzbF91ZGNf
aXJxXSAgcG9ydCBjaGFuZ2UNCj4gWyAgIDEzLjIxNTM5NV0gdWRjOltmc2xfdWRjX2lycV0gIGly
cV9zcmMgWzB4ICAgICAgNDBdDQo+IFsgICAxMy4yMTUzOThdIHVkYzpbZnNsX3VkY19pcnFdICBy
ZXNldCBpbnQNCj4gWyAgIDEzLjIxNTQwMV0gdWRjOltyZXNldF9pcnFdICBCdXMgcmVzZXQNCj4g
WyAgIDEzLjIxNzY2N10gdWRjOltmc2xfdWRjX2lycV0gIGlycV9zcmMgWzB4ICAgICAgIDRdDQo+
IFsgICAxMy4yMTc2NzBdIHVkYzpbZnNsX3VkY19pcnFdICBwb3J0IGNoYW5nZQ0KPiBbICAgMTMu
MzI2MDM1XSB1ZGM6W2ZzbF91ZGNfaXJxXSAgaXJxX3NyYyBbMHggICAgICAxMF0NCj4gWyAgIDEz
LjMyNjAzOF0gdWRjOltmc2xfdWRjX2lycV0gIEVycm9yIElSUSAxMA0KPiBbICAgMTguNjMxNDYz
XSB1ZGM6W2ZzbF91ZGNfaXJxXSAgaXJxX3NyYyBbMHggICAgICA0MF0NCj4gWyAgIDE4LjYzMTQ2
OV0gdWRjOltmc2xfdWRjX2lycV0gIHJlc2V0IGludA0KPiBbICAgMTguNjMxNDczXSB1ZGM6W3Jl
c2V0X2lycV0gIEJ1cyByZXNldA0KPiBbICAgMTguNjMzNzMyXSB1ZGM6W2ZzbF91ZGNfaXJxXSAg
aXJxX3NyYyBbMHggICAgICAgNF0NCj4gWyAgIDE4LjYzMzczNV0gdWRjOltmc2xfdWRjX2lycV0g
IHBvcnQgY2hhbmdlDQo+IFsgICAxOC44NDM5MzZdIHVkYzpbZnNsX3VkY19pcnFdICBpcnFfc3Jj
IFsweCAgICAgIDEwXQ0KPiBbICAgMTguODQzOTM5XSB1ZGM6W2ZzbF91ZGNfaXJxXSAgRXJyb3Ig
SVJRIDEwDQo+IFsgICAyNC4yNjM2NTZdIHVkYzpbZnNsX3VkY19pcnFdICBpcnFfc3JjIFsweCAg
ICAgIDQwXQ0KPiBbICAgMjQuMjYzNjYxXSB1ZGM6W2ZzbF91ZGNfaXJxXSAgcmVzZXQgaW50DQo+
IFsgICAyNC4yNjM2NjVdIHVkYzpbcmVzZXRfaXJxXSAgQnVzIHJlc2V0DQo+IFsgICAyNC4yNjU5
MjZdIHVkYzpbZnNsX3VkY19pcnFdICBpcnFfc3JjIFsweCAgICAgICA0XQ0KPiBbICAgMjQuMjY1
OTI5XSB1ZGM6W2ZzbF91ZGNfaXJxXSAgcG9ydCBjaGFuZ2UNCj4gWyAgIDI0LjQ3OTE0NF0gdWRj
Oltmc2xfdWRjX2lycV0gIGlycV9zcmMgWzB4ICAgICAxMDBdDQo+IFsgICAyNC40NzkxNDddIHVk
YzpbZnNsX3VkY19pcnFdICBzdXNwZW5kIGludA0KPiAuLi4uDQo+ICJFcnJvciBJUlEgMTAiIGlz
IFVTQl9TVFNfU1lTX0VSUiBhbmQgdGhhdCBpcyB3ZXJlIHdlIGFyZSBzdHVjay4NCj4gDQo+ICAg
IEpvY2tlDQo=
