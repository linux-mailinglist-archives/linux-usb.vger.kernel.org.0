Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3598425A96E
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 12:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbgIBK3D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 06:29:03 -0400
Received: from mail-eopbgr70089.outbound.protection.outlook.com ([40.107.7.89]:6624
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726528AbgIBK3A (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Sep 2020 06:29:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBB2KGmRxe2YdGIRj+o/Vqez+BfMhXEeTw7Xrils52rpoCviGVQF4Onm2Cw3EMr8AABZKmPyTUC0AlTeJa2tXIu1Rw45M04i+LA/ogteY9vEzcUoccgnP/G3fjpNV4ZQk4aNma32hrGtui37wXghUEM8l8J2do+BxXmq4cxoRhAf9McZWZUfTcZaplxfN/S9lMzoQjpbNTxvzerQ/kcli3dXVyZDKSES1wTWtqoOe1oBwz7G/ZZqCrtUWEUmXzoTHy0ruw0FQn8RmegCZkw0giJVBVXyLe+0fJ4OqX5BJFL76Ym/KvkWN9fm7eKdB1nrYrl61jssqcTafH2zzmWZMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdDfDSswkBJY0gQw8p8JmUOB1Zcla3x43J5shtVPnpc=;
 b=fnmb7/ji3fPTs0oXgqBeHr2Vs1wya98zs0kUCpTr5RiqNNKO0q96AmQ/66j1DFrO8CCLKgtIbZKP/KMcTQiCoNiXUnr9EXMYzLJ2v4TKMP/QN4A5W4g8SPdnIr9fAgBe1KB2eeZirKa4ro0RKhMvHuGbWpWMPaV1Tsnd2QgRorPedQmqnjP5xqZKdDYtjhU3dpq8MXNWzLcsn+vJLfsayq1ifF/5jggonGRrViTHS+wclFft1Rnb8SVOtNVVR+0uH8YENWP68FaL4KnX05sUDT8NAlgr3svZpA5aO2i2214GEeG6/z0a0MzcrBVbTcjOnrSjVwWCdCjiggUjvzvbUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdDfDSswkBJY0gQw8p8JmUOB1Zcla3x43J5shtVPnpc=;
 b=q1WzC+ERBfwhdbLQwEVFvukAK9qglIXUFqzDbXx1nExSUUV7WiSc7yss7X8BQX1jjgyWE/y2hJlRJbs0kMQ+1VXMPWsDJQ+fYSJsu+PX6h+xZ60Pe4SASpBjylKHU7scgwdIHgkPRdUqg6pz+T73HI50N2nsM0xntg9iMgSiiRQ=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0401MB2382.eurprd04.prod.outlook.com (2603:10a6:800:23::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 2 Sep
 2020 10:28:55 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 10:28:55 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH v2] usb: xhci: add debugfs support for ep with stream
Thread-Topic: [PATCH v2] usb: xhci: add debugfs support for ep with stream
Thread-Index: AQHWW240LsQE47DpHka0ISI6aMQrkKk1+RLggAZonYCAAOs9cIAVLJ6AgALqhdA=
Date:   Wed, 2 Sep 2020 10:28:55 +0000
Message-ID: <VE1PR04MB6528936627B6478BE76813D6892F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1594901321-6992-1-git-send-email-jun.li@nxp.com>
 <DB8PR04MB6523AC8B5B7C1DEDA1254F0A89430@DB8PR04MB6523.eurprd04.prod.outlook.com>
 <c6c4f598-ff8a-8b51-d87c-c5d20f4421a4@linux.intel.com>
 <VE1PR04MB65289D522279DD1267A1FFF5895C0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <5257ec39-9f59-58fe-661f-a1cd69955f1e@linux.intel.com>
In-Reply-To: <5257ec39-9f59-58fe-661f-a1cd69955f1e@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fb1732c3-538f-4664-9e6b-08d84f2afed7
x-ms-traffictypediagnostic: VI1PR0401MB2382:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0401MB2382D48334B406809C56DD0D892F0@VI1PR0401MB2382.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5Y5xluAt29vkHZm1HnM4+39Lx13zF5PetDPzqwvVVYfr6ypUWVvSRFmpiaPVgrSuBFxAUhHEXQIiIrpTUO9lnjGL0He7tc3KyFdrHgYf9lcZh8arWUxxcHItmsx6jW3Mte59DJmAxj6UnDVCh53CL5yy55PyQ/1Zl/BmH5cAhUtoYQmzw2BaivgNEWuIzQdk0vpNq9k1/+0GKLSYURudV7YII2DhcCizOwjl8Mnq3kgcBaKs10z7uer0dx4ECJoDDlMSagqL0hT/a2G5eub2YPyE+qtMm8Feso8T9ufL1bnDE2ANz+T506x2IEz6Q9Yb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(52536014)(110136005)(54906003)(9686003)(8676002)(8936002)(4326008)(55016002)(5660300002)(83380400001)(498600001)(71200400001)(53546011)(6506007)(7696005)(86362001)(26005)(66946007)(186003)(33656002)(66476007)(66556008)(66446008)(64756008)(76116006)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: g7ut7WsEZAV5RcA0zwUkTaTnOK+7Fdfut0W42Jq4cjzgR501prlgfEbLGhtTMT0guSEA9sAqIdrE13AyxUib+Yj7gqIcJ88U6Gb1/nlG3M3H4NI33hL8iG2X8SPQShKMjilx4rmVrVEdiZf08gYC7hyficJa3pm0SWOhTztdoBdb5jjKGmppSjbKg9e73VA291ZF2bRatOnPu8QMedhhv7x3nso9xxDRESNZa/rjn6Rup52hTgwhrBmgnnCQ2rZWPoKXW8ePPVpd+E9ZFNnlh6ha6OQ9Viq6wXgnr2qFakpiI/WAifpaa3RdHur042IMqMiw0Zs95YypIdL3/tK4cJ+1qxxl/moyIxhMXj4LMd6hMz6+lL80zYsbwJEF6JCWCGBwUuHRWMynMhFACQhCmUfWG4GcnwQtHoPA/yPFapFj9F9uPlddylssszcN3iWVu26a5S4C/qct0jPEkwZu7z0FMJBKyXGrFXZ87KiOYw1wRAeYfJa7/YQBenMTJvqN9QIf/v3aAQzRSxzq2Upiy4AWH+KPbPV6XTB/rTpQ+eVVMMdtUfgK/dzBtHCDhpZjZX3/DhiJT0zROC+IEUv8VBvlbYeKkkhI/o8qcjjr6jI7W+/KTLxAMr9wIla7gy7rSYc87y2us52akv7Yvt/wyw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1732c3-538f-4664-9e6b-08d84f2afed7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 10:28:55.4410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ZVNvb5Qut2IoIFy+6stkj47sTs2tNHtxwV8DsJYa74J7XYdjpWHBhkNI0IITfDX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2382
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlhcyBOeW1hbiA8
bWF0aGlhcy5ueW1hbkBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDMx
LCAyMDIwIDk6MTEgUE0NCj4gVG86IEp1biBMaSA8anVuLmxpQG54cC5jb20+OyBtYXRoaWFzLm55
bWFuQGludGVsLmNvbQ0KPiBDYzogZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IGxpbnV4LXVz
YkB2Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteA0KPiA8bGludXgtaW14QG54cC5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIHVzYjogeGhjaTogYWRkIGRlYnVnZnMgc3VwcG9ydCBm
b3IgZXAgd2l0aCBzdHJlYW0NCj4gDQo+IE9uIDE4LjguMjAyMCA0LjU0LCBKdW4gTGkgd3JvdGU6
DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBN
YXRoaWFzIE55bWFuIDxtYXRoaWFzLm55bWFuQGxpbnV4LmludGVsLmNvbT4NCj4gPj4gU2VudDog
TW9uZGF5LCBBdWd1c3QgMTcsIDIwMjAgNzo0OCBQTQ0KPiA+PiBUbzogSnVuIExpIDxqdW4ubGlA
bnhwLmNvbT47IG1hdGhpYXMubnltYW5AaW50ZWwuY29tDQo+ID4+IENjOiBncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZzsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsNCj4gPj4gZGwtbGludXgt
aW14IDxsaW51eC1pbXhAbnhwLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gdXNi
OiB4aGNpOiBhZGQgZGVidWdmcyBzdXBwb3J0IGZvciBlcCB3aXRoDQo+ID4+IHN0cmVhbQ0KPiA+
Pg0KPiA+PiBPbiAxMy44LjIwMjAgMTIuNTcsIEp1biBMaSB3cm90ZToNCj4gPj4+IEhpDQo+ID4+
Pg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4gRnJvbTogSnVuIExp
IDxqdW4ubGlAbnhwLmNvbT4NCj4gPj4+PiBTZW50OiBUaHVyc2RheSwgSnVseSAxNiwgMjAyMCA4
OjQwIFBNDQo+ID4+Pj4gVG86IG1hdGhpYXMubnltYW5AaW50ZWwuY29tDQo+ID4+Pj4gQ2M6IGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnOw0KPiA+
Pj4+IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+DQo+ID4+Pj4gU3ViamVjdDogW1BB
VENIIHYyXSB1c2I6IHhoY2k6IGFkZCBkZWJ1Z2ZzIHN1cHBvcnQgZm9yIGVwIHdpdGgNCj4gPj4+
PiBzdHJlYW0NCj4gPj4+Pg0KPiA+Pj4+IFRvIHNob3cgdGhlIHRyYiByaW5nIG9mIHN0cmVhbXMs
IHVzZSB0aGUgZXhzaXRpbmcgcmluZyBmaWxlcyBvZg0KPiA+Pj4+IGJ1bGsgZXAgdG8gc2hvdyB0
cmIgcmluZyBvZiBvbmUgc3BlY2lmaWMgc3RyZWFtIElELCB3aGljaCBzdHJlYW0NCj4gPj4+PiBJ
RCdzIHRyYiByaW5nIHdpbGwgYmUgc2hvd24sIGlzIGNvbnRyb2xsZWQgYnkgYSBuZXcgZGVidWdm
cyBmaWxlDQo+ID4+Pj4gc3RyZWFtX2lkLCB0aGlzIGlzIHRvIGF2b2lkIHRvIGNyZWF0ZSBhIGxh
cmdlIG51bWJlciBvZiBkaXIgZm9yDQo+ID4+Pj4gZXZlcnkgYWxsb2NhdGUgc3RyZWFtIElEcywg
YW5vdGhlciBkZWJ1Z2ZzIGZpbGUNCj4gPj4+PiBzdHJlYW1fY29udGV4dF9hcnJheSBpcyBjcmVh
dGVkIHRvIHNob3cgYWxsDQo+ID4+IHRoZSBhbGxvY2F0ZWQgc3RyZWFtIGNvbnRleHQgYXJyYXkg
ZW50cmllcy4NCj4gPj4+Pg0KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IExpIEp1biA8anVuLmxpQG54
cC5jb20+DQo+ID4+Pj4gLS0tDQo+ID4+Pj4gY2hhbmFnZXMgZm9yIHYyOg0KPiA+Pj4+IC0gIERy
b3Agc3RyZWFtIGZpbGVzIHJlbW92ZSwgdGhlIHN0cmVhbSBmaWxlcyB3aWxsIGJlIHJlbW92ZWQN
Cj4gPj4+PiAgICB3aXRoIGVwIGRpciByZW1vdmFsLCBrZWVwIHRoZSBlcCBidXQgb25seSByZW1v
dmUgc3RyZWFtcw0KPiA+Pj4+ICAgIGFjdHVhbGx5IGRvZXMgbm90IG1ha2Ugc2Vuc2UgaW4gY3Vy
cmVudCBjb2RlLg0KPiA+Pj4+IC0gIFVzZSB0aGUgbmV3X3JpbmcgZm9yIHNob3dfcmluZyBwb2lu
dGVyIGZvciBub24temVybyBlcC4NCj4gPj4+Pg0KPiA+Pj4+ICBkcml2ZXJzL3VzYi9ob3N0L3ho
Y2ktZGVidWdmcy5jIHwgMTEyDQo+ID4+Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQ0KPiA+Pj4+ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2ktZGVidWdmcy5oIHwgIDEw
ICsrKysNCj4gPj4+PiAgZHJpdmVycy91c2IvaG9zdC94aGNpLmMgICAgICAgICB8ICAgMSArDQo+
ID4+Pj4gIDMgZmlsZXMgY2hhbmdlZCwgMTIyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gPj4+Pg0KPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktZGVidWdm
cy5jDQo+ID4+Pj4gYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktZGVidWdmcy5jIGluZGV4IDY1ZDhk
ZTQuLjcwODU4NWMgMTAwNjQ0DQo+ID4+Pj4gLS0tIGEvZHJpdmVycy91c2IvaG9zdC94aGNpLWRl
YnVnZnMuYw0KPiA+Pj4+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1kZWJ1Z2ZzLmMNCj4g
Pj4+PiBAQCAtNDUwLDkgKzQ1MCwxNCBAQCB2b2lkIHhoY2lfZGVidWdmc19jcmVhdGVfZW5kcG9p
bnQoc3RydWN0IHhoY2lfaGNkICp4aGNpLA0KPiA+Pj4+ICAJaWYgKCFlcHJpdikNCj4gPj4+PiAg
CQlyZXR1cm47DQo+ID4+Pj4NCj4gPj4+PiArCWlmIChkZXYtPmVwc1tlcF9pbmRleF0ucmluZykN
Cj4gPj4+PiArCQllcHJpdi0+c2hvd19yaW5nID0gZGV2LT5lcHNbZXBfaW5kZXhdLnJpbmc7DQo+
ID4+Pj4gKwllbHNlDQo+ID4+Pj4gKwkJZXByaXYtPnNob3dfcmluZyA9IGRldi0+ZXBzW2VwX2lu
ZGV4XS5uZXdfcmluZzsNCj4gPj4+PiArDQo+IA0KPiBSYW4gc29tZSB0ZXN0cyBhbmQgdGhlIEkg
c3VzcGVjdCB0aGUgYWJvdmUgY29kZSBjYXVzZXMgaXNzdWVzLg0KPiANCj4gSWYgYW4gZW5kcG9p
bnQgaXMgZHJvcHBlZCBhbmQgYWRkZWQgYmFjayB0aGUgYWJvdmUgY29kZSB3aWxsIHN0b3JlIHRo
ZSBvbGQgcmluZw0KPiBpbiBlcHJpdi0+c2hvd19yaW5nIGFzIHdlIGhhdmUgYm90aCBhIC5yaW5n
IGFuZCAubmV3X3JpbmcgcHJlc2VudCBhdCB0aGF0IG1vbWVudC4NCj4gU29vbiBhZnRlciB0aGlz
IHRoZSBvbGQgcmluZyBwb2ludGVkIHRvIGJ5IC5yaW5nIHdpbGwgYmUgZnJlZWQsIGFuZCAucmlu
ZyA9IC5uZXdfcmluZw0KPiB3aWxsIGJlIHNldC4NCg0KWWVzLCBpbiB0aGlzIGNhc2UsIGVwc1tl
cF9pbmRleF0ucmluZyBzdGlsbCBrZWVwcyB0aGUgb2xkIHJpbmcgYWRkcmVzcywgYnV0DQplcHNb
ZXBfaW5kZXhdLm5ld19yaW5nIGlzIHBvaW50aW5nIHRvIHRoZSBuZXcvY29ycmVjdCByaW5nLCBt
eSBwYXRjaCB3aWxsDQpzdG9yZSB0aGUgb2xkIHJpbmcgYWRkcmVzcy4NCg0KPiANCj4gT2xkIGNv
ZGUgc2hvd2VkIHdoYXRldmVyIHJpbmcgYnVmZmVyIGVwc1tpXS5yaW5nIHBvaW50ZXIgcG9pbnRl
ZCAsdG8gd2hlbiB0aGUgc3lzZnMNCj4gZmlsZSB3YXMgcmVhZCwgKGFzIHdlIHNhdmVkIHRoZSBh
ZGRyZXNzLCAmZXBzW2ldLnJpbmcpLiBJIHNlZSBub3cgdGhhdCBpdCBpbiB0aGVvcnkNCj4gaXQg
aGFkIGEgc21hbGwgZ2FwIGJlZm9yZSAucmluZyA9IC5uZXdfcmluZyB3YXMgc2V0IHdoZXJlIHVz
ZXIgY291bGQgcmVhZCB0aGUgcmluZw0KPiBidWZmZXIgYW5kIC5yaW5nIHdvdWxkIHN0aWxsIGJl
IGEgTlVMTCBwb2ludGVyLg0KPiBUaGF0IG5lZWRzIHRvIGJlIGZpeGVkIGFzIHdlbGwuDQoNClll
cywgYWxzbyBpbiBhYm92ZSBkcm9wLXRoZW4tYWRkLWJhY2sgY2FzZSB0aGUgb2xkIGNvZGUgZXBz
W2ldLnJpbmcgc3RpbGwgcG9pbnRzIHRvDQp0aGUgb2xkIHJpbmcuDQoNClNvIGNvbnNpZGVyaW5n
IHdlIGFyZSBjcmVhdGluZyBkZWJ1Z2ZzIGZpbGUgZm9yIGVwIGJlZm9yZSANCi5yaW5nID0gLm5l
d19yaW5nOw0KLm5ld19yaW5nID0gTlVMTDsNCg0KQSBzb2x1dGlvbiBvZiBmaXJzdGx5IGNoZWNr
IC5uZXdfcmluZyBzZWVtcyBjYW4gcmVzb2x2ZSB0aGUgcHJvYmxlbXMgaGVyZToNCg0KaWYgKGRl
di0+ZXBzW2VwX2luZGV4XS5uZXdfcmluZykNCgkvKiBGb3IgZmlyc3QgYWRkIG9mIEVQOyBvciBk
cm9wLXRoZW4tYWRkLWJhY2sgRVAgKi8NCgllcHJpdi0+c2hvd19yaW5nID0gZGV2LT5lcHNbZXBf
aW5kZXhdLm5ld19yaW5nOw0KZWxzZQ0KCS8qIEZvciBFUDAgKi8NCgllcHJpdi0+c2hvd19yaW5n
ID0gZGV2LT5lcHNbZXBfaW5kZXhdLnJpbmc7DQoNCj4gDQo+IEkgc3RpbGwgbGlrZSB0aGUgb2xk
IHdheSBvZiB1c2luZyBkb3VibGUgcG9pbnRlciBtb3JlLg0KPiB4aGNpIGRyaXZlciB3aWxsIGFs
c28gZGlnIG91dCB0aGUgY3VycmVudCByaW5nIGZyb20gZXBzW2ldLnJpbmcsIHNvIEkgdGhpbmsg
d2Ugc2hvdWxkDQo+IGFzIHdlbGwuDQo+IChpbiBzdHJlYW0gY2FzZSBpdCB3b3VsZCBiZSAmZXAt
PnN0cmVhbV9pbmZvLT5zdHJlYW1fcmluZ3Nbc3RyZWFtX2lkXSkNCg0Kc3RyZWFtIGNhc2Ugc2hv
dWxkIG5vIHByb2JsZW0gYXMgaXQgaXMgDQplcHJpdi0+c2hvd19yaW5nID0gZXAtPnN0cmVhbV9p
bmZvLT5zdHJlYW1fcmluZ3Nbc3RyZWFtX2lkXTsNCg0KdGhhbmtzDQpMaSBKdW4NCj4gDQo+IC1N
YXRoaWFzDQo=
