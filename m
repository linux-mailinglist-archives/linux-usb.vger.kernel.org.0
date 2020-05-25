Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A121E0E78
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 14:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390540AbgEYMaz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 08:30:55 -0400
Received: from mail-eopbgr70052.outbound.protection.outlook.com ([40.107.7.52]:15877
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390504AbgEYMaz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 May 2020 08:30:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I20+W5r6dNuJLzvoNjkC2mRrRrnnpnBmSF/44F7nPk1OB9BV+E4hh7yx/eo+79wbhNBp1da1ip/at395jptblLv9HFtkSktJaLV54YmHYt71e5DopX6vwqSOb3NxHsbhHXgp7FvTnrMhBGdG8dlg1jWVmioiuZEHFUBPYG1eaaAjnKfs8rDcpoYzc7mG0LQ8IE2/GTvomYKS3ZEqvEV0F98iQFIYRi4Np6JQtddTsVIVOpqKT2/SaS73ihLifZWB6xiZV96WTh9CMya5ZzkULPeKnqKUrgip9GZfI6EnKM9jCChjkidl/XIdqC4hVpEtZpmeH8xOjaEiOEp8YmzDXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPvZjxvSK78M2zFG03JiCfwehLmfMhAkEzkThoq+Vyo=;
 b=Sz/HoYaQ1nuA27TSXH9Gfqw2emFuCHCngn/m5IBBXeRgN95UcSImqSCuQ4eXptuVEvhRxdvjLu07PFEFtz8B+r6c1hNUKjmmEaohb4EsBvA9Y4YUdmFIz5EXpp1FBmHhCJpuao4K33/nR2G9vUuw2xspQLs7PSeTlKnGPAwYmsfXk2MoN33CxlIQbvQz8ZLBrw64diFB4rUiOdlRCUUDIpbBlQPalhkWstOj/AmfuJGMhdxoz/kaar2XAD6uTEo3wps6VDO+Y6A5Mub1sF0UZ5bcd2F1cvELekTbNeaAz87jA+VJo+HM27BMOV7qj7ZobmZurZocnH3/dUx7tx73tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPvZjxvSK78M2zFG03JiCfwehLmfMhAkEzkThoq+Vyo=;
 b=sQEFAhhRQFHNW8t342CNGQRJ3oVBE/XJcy0L2bDLVMg1bB9gebP12kgtJ54jT93Y+52nST5x1BTvD6dOJy/mfYoJtCdt52+UqRhfe5LgHaQjpXIlpg5oL2s5JlgSC1ycj291BsMHc7VUK7xCp9sUm1N1dJvu5KkgR4wNbrYAlh8=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6384.eurprd04.prod.outlook.com (2603:10a6:803:126::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Mon, 25 May
 2020 12:30:49 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 12:30:49 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Peter Chen <peter.chen@nxp.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v2 7/9] usb: host: xhci-plat: add priv flag for
 skip_phy_initialization
Thread-Topic: [PATCH v2 7/9] usb: host: xhci-plat: add priv flag for
 skip_phy_initialization
Thread-Index: AQHWMVkhOJT6Y53YCkmYwUN2fNlbl6i22S1QgAFGXoCAAJ2ZgA==
Date:   Mon, 25 May 2020 12:30:49 +0000
Message-ID: <VE1PR04MB65288C26F1F79234332E757D89B30@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <20200523232304.23976-1-peter.chen@nxp.com>
 <20200523232304.23976-8-peter.chen@nxp.com>
 <VE1PR04MB6528C7F33B4C35AF9DBCE84489B20@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <20200525030418.GC16948@b29397-desktop>
In-Reply-To: <20200525030418.GC16948@b29397-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 616d41e5-4391-4f1f-0421-08d800a7752e
x-ms-traffictypediagnostic: VE1PR04MB6384:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB638489B48ECB289A18C850DD89B30@VE1PR04MB6384.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3g8arPtYk4sqYXY4vOX9V76AcOhrXe8KdudkX6iqbXPaiwazpGC1KiT38SBS7bA+GFz7Fj4hDI0r4MIk2qvTkYUMEdo3JaeFfAhdyIJgh2iHhgMfgJuJRvX7/+aqS0jlCCiX98Ll7ahsnGDsc1qpMClp+8JsR0sJ/gIbW7/huxpm8gPYp10P8iy/kFAiQxl1sEd1K2UIPUkN4GYJS9xhFxRFQBD69g8dQUwH+Lb4azH+w+nYX4puV9QLhXfRO6cPi6U7OZs4EDUjv92T3E89fC5Hsu0dumc0qZwO7xrkmoymSiWUln+4fo33fajwksVe0lgz3xlZYF9mey6CK4mCWw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(6636002)(44832011)(316002)(54906003)(33656002)(478600001)(8676002)(9686003)(52536014)(8936002)(6862004)(4326008)(5660300002)(86362001)(2906002)(71200400001)(66946007)(55016002)(26005)(66476007)(66556008)(64756008)(53546011)(6506007)(76116006)(66446008)(186003)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: KSeI0UBEGAweYEez39ovpEoK9SL0TDlQvcHkCfJi4K8HpB3JpDGPqv9g/ZY4mQbAUtNIhK3lYKXOKM0jLsKjg0+4o0gAaFcqWdTuYgh8HJkTtsSw27+VNZasygMlUWOu/d8TYelUIuhC73xVoJU6rY9xIeytkGVPYBEdBJyt7Xj1ZBTqVf3wgNz7LBrpdFK2qkcsenj43VBprjX5qb95xDjsmpE8Yq+K6+VQJkfj2ZAx/SqKjyPxCzPfukba24NpTdESfOBHVzKDL0t2ZJGtwXNe+z+ESSJVlAFaAu8RrbiULwMut9oD785ESwPszryW9AYAQxQ23AVVPSfSLprvKZXY/tl4eZ1cbcjBAwqa+l3v7/zCDoZl45t+Eo5+aR+lnbURX/OVaJ9yB3o2Zoeb79NmJ7yl4VLVX6WqQKyPSocg2G1S9udz+RErUHISenccUMaFjruI4y++y1PcYIiSrgbPb2LjiMWec7p+rFNV73s=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 616d41e5-4391-4f1f-0421-08d800a7752e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 12:30:49.7484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JQQEu7RYWr1BZ8OQrwPMEQMwpz/8lU1Ro48tHS/vqrbndAT0FKlHGGIHZMgjk5Zp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6384
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgQ2hlbiA8cGV0
ZXIuY2hlbkBueHAuY29tPg0KPiBTZW50OiAyMDIw5bm0NeaciDI15pelIDExOjA0DQo+IFRvOiBK
dW4gTGkgPGp1bi5saUBueHAuY29tPg0KPiBDYzogYmFsYmlAa2VybmVsLm9yZzsgbWF0aGlhcy5u
eW1hbkBpbnRlbC5jb207IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRsLWxpbnV4LWlt
eCA8bGludXgtaW14QG54cC5jb20+OyBwYXdlbGxAY2FkZW5jZS5jb207IHJvZ2VycUB0aS5jb207
DQo+IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
Ny85XSB1c2I6IGhvc3Q6IHhoY2ktcGxhdDogYWRkIHByaXYgZmxhZyBmb3INCj4gc2tpcF9waHlf
aW5pdGlhbGl6YXRpb24NCj4gDQo+IE9uIDIwLTA1LTI0IDA3OjQwOjM0LCBKdW4gTGkgd3JvdGU6
DQo+ID4gSGkNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZy
b206IFBldGVyIENoZW4gPHBldGVyLmNoZW5AbnhwLmNvbT4NCj4gPiA+IFNlbnQ6IDIwMjDlubQ1
5pyIMjTml6UgNzoyMw0KPiA+ID4gVG86IGJhbGJpQGtlcm5lbC5vcmc7IG1hdGhpYXMubnltYW5A
aW50ZWwuY29tDQo+ID4gPiBDYzogbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgZGwtbGludXgt
aW14IDxsaW51eC1pbXhAbnhwLmNvbT47DQo+ID4gPiBwYXdlbGxAY2FkZW5jZS5jb207IHJvZ2Vy
cUB0aS5jb207IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBKdW4NCj4gPiA+IExpIDxqdW4u
bGlAbnhwLmNvbT47IFBldGVyIENoZW4gPHBldGVyLmNoZW5AbnhwLmNvbT4NCj4gPiA+IFN1Ympl
Y3Q6IFtQQVRDSCB2MiA3LzldIHVzYjogaG9zdDogeGhjaS1wbGF0OiBhZGQgcHJpdiBmbGFnIGZv
cg0KPiA+ID4gc2tpcF9waHlfaW5pdGlhbGl6YXRpb24NCj4gPiA+DQo+ID4gPiBTb21lIERSRCBj
b250cm9sbGVycyAoZWcsIGR3YzMgJiBjZG5zMykgaGF2ZSBQSFkgbWFuYWdlbWVudCBhdCB0aGVp
cg0KPiA+ID4gb3duIGRyaXZlciB0byBjb3ZlciBib3RoIGRldmljZSBhbmQgaG9zdCBtb2RlLCBz
byBhZGQgb25lIHByaXYgZmxhZw0KPiA+ID4gZm9yIHN1Y2ggdXNlcnMgdG8gc2tpcCBQSFkgbWFu
YWdlbWVudCBmcm9tIEhDRCBjb3JlLg0KPiA+DQo+ID4gQ2FuIHRoaXMgZmxhZyBiZSBzZXQgZGly
ZWN0bHkgaW4gX19jZG5zM19ob3N0X2luaXQoKT8NCj4gDQo+IE5vLCBzaW5jZSBib3RoIEhDRCBj
cmVhdGlvbiBhbmQgdXNiX2FkZF9oY2QgaW52b2tpbmcgYXJlIGF0IHhoY2lfcGxhdF9wcm9iZSwg
Z2x1ZQ0KPiBsYXllciBoYXMgbm8gY2hhbmNlIHRvIGNoYW5nZSBoY2QgZmxhZ3MuDQoNCkkgc2Vl
IGFmdGVyIHBhdGNoWzIvOV0sDQoNCkBAIC00Myw2ICs0NSwxMSBAQCBzdGF0aWMgaW50IF9fY2Ru
czNfaG9zdF9pbml0KHN0cnVjdCBjZG5zMyAqY2RucykNCiAgICAgICAgICAgICAgICBnb3RvIGVy
cjE7DQogICAgICAgIH0NCg0KKyAgICAgICAvKiBHbHVlIG5lZWRzIHRvIGFjY2VzcyB4SENJIHJl
Z2lvbiByZWdpc3RlciBmb3IgUG93ZXIgbWFuYWdlbWVudCAqLw0KKyAgICAgICBoY2QgPSBwbGF0
Zm9ybV9nZXRfZHJ2ZGF0YSh4aGNpKTsNCisgICAgICAgaWYgKGhjZCkNCisgICAgICAgICAgICAg
ICBjZG5zLT54aGNpX3JlZ3MgPSBoY2QtPnJlZ3M7DQorDQoNCllvdSBhbHJlYWR5IGNhbiBhY2Nl
c3MgaGNkIGRpcmVjdGx5Lg0KDQpMaSBKdW4NCj4gDQo+IFBldGVyDQo+ID4NCj4gPiBMaSBKdW4N
Cj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBDaGVuIDxwZXRlci5jaGVuQG54cC5j
b20+DQo+ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jIHwgOCAr
KysrKystLQ0KPiA+ID4gZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuaCB8IDEgKw0KPiA+ID4g
IDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+ID4N
Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jDQo+ID4gPiBi
L2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmMgaW5kZXgNCj4gPiA+IDAzZDZiYmU1MTkxOS4u
YTNkNmNiNDY0MTg2IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy91c2IvaG9zdC94aGNpLXBs
YXQuYw0KPiA+ID4gKysrIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuYw0KPiA+ID4gQEAg
LTE4Myw2ICsxODMsOCBAQCBzdGF0aWMgaW50IHhoY2lfcGxhdF9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQ0KPiA+ID4gIAlzdHJ1Y3QgdXNiX2hjZAkJKmhjZDsNCj4gPiA+ICAJ
aW50CQkJcmV0Ow0KPiA+ID4gIAlpbnQJCQlpcnE7DQo+ID4gPiArCXN0cnVjdCB4aGNpX3BsYXRf
cHJpdgkqcHJpdiA9IE5VTEw7DQo+ID4gPiArDQo+ID4gPg0KPiA+ID4gIAlpZiAodXNiX2Rpc2Fi
bGVkKCkpDQo+ID4gPiAgCQlyZXR1cm4gLUVOT0RFVjsNCj4gPiA+IEBAIC0yODAsOCArMjgyLDcg
QEAgc3RhdGljIGludCB4aGNpX3BsYXRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gPiA+ICAJCXByaXZfbWF0Y2ggPSBkZXZfZ2V0X3BsYXRkYXRhKCZwZGV2LT5kZXYpOw0K
PiA+ID4NCj4gPiA+ICAJaWYgKHByaXZfbWF0Y2gpIHsNCj4gPiA+IC0JCXN0cnVjdCB4aGNpX3Bs
YXRfcHJpdiAqcHJpdiA9IGhjZF90b194aGNpX3ByaXYoaGNkKTsNCj4gPiA+IC0NCj4gPiA+ICsJ
CXByaXYgPSBoY2RfdG9feGhjaV9wcml2KGhjZCk7DQo+ID4gPiAgCQkvKiBKdXN0IGNvcHkgZGF0
YSBmb3Igbm93ICovDQo+ID4gPiAgCQkqcHJpdiA9ICpwcml2X21hdGNoOw0KPiA+ID4gIAl9DQo+
ID4gPiBAQCAtMzI5LDYgKzMzMCw5IEBAIHN0YXRpYyBpbnQgeGhjaV9wbGF0X3Byb2JlKHN0cnVj
dA0KPiA+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ID4NCj4gPiA+ICAJaGNkLT50cGxf
c3VwcG9ydCA9IG9mX3VzYl9ob3N0X3RwbF9zdXBwb3J0KHN5c2Rldi0+b2Zfbm9kZSk7DQo+ID4g
PiAgCXhoY2ktPnNoYXJlZF9oY2QtPnRwbF9zdXBwb3J0ID0gaGNkLT50cGxfc3VwcG9ydDsNCj4g
PiA+ICsJaWYgKHByaXYgJiYgcHJpdi0+c2tpcF9waHlfaW5pdGlhbGl6YXRpb24pDQo+ID4gPiAr
CQloY2QtPnNraXBfcGh5X2luaXRpYWxpemF0aW9uID0gMTsNCj4gPiA+ICsNCj4gPiA+ICAJcmV0
ID0gdXNiX2FkZF9oY2QoaGNkLCBpcnEsIElSUUZfU0hBUkVEKTsNCj4gPiA+ICAJaWYgKHJldCkN
Cj4gPiA+ICAJCWdvdG8gZGlzYWJsZV91c2JfcGh5Ow0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdXNiL2hvc3QveGhjaS1wbGF0LmgNCj4gPiA+IGIvZHJpdmVycy91c2IvaG9zdC94aGNpLXBs
YXQuaCBpbmRleA0KPiA+ID4gMWZiMTQ5ZDFmYmNlLi44ODI1ZThlYjI4ZDYgMTAwNjQ0DQo+ID4g
PiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5oDQo+ID4gPiArKysgYi9kcml2ZXJz
L3VzYi9ob3N0L3hoY2ktcGxhdC5oDQo+ID4gPiBAQCAtMTMsNiArMTMsNyBAQA0KPiA+ID4gIHN0
cnVjdCB4aGNpX3BsYXRfcHJpdiB7DQo+ID4gPiAgCWNvbnN0IGNoYXIgKmZpcm13YXJlX25hbWU7
DQo+ID4gPiAgCXVuc2lnbmVkIGxvbmcgbG9uZyBxdWlya3M7DQo+ID4gPiArCXVuc2lnbmVkIGlu
dCBza2lwX3BoeV9pbml0aWFsaXphdGlvbjoxOw0KPiA+ID4gIAl2b2lkICgqcGxhdF9zdGFydCko
c3RydWN0IHVzYl9oY2QgKik7DQo+ID4gPiAgCWludCAoKmluaXRfcXVpcmspKHN0cnVjdCB1c2Jf
aGNkICopOw0KPiA+ID4gIAlpbnQgKCpzdXNwZW5kX3F1aXJrKShzdHJ1Y3QgdXNiX2hjZCAqKTsN
Cj4gPiA+IC0tDQo+ID4gPiAyLjE3LjENCj4gPg0KPiANCj4gLS0NCj4gDQo+IFRoYW5rcywNCj4g
UGV0ZXIgQ2hlbg0K
