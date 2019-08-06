Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E990382E9B
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 11:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732197AbfHFJXh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 05:23:37 -0400
Received: from mail-eopbgr70058.outbound.protection.outlook.com ([40.107.7.58]:62499
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730068AbfHFJXh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 05:23:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWgNP5OrzntgpLpIRrsCaZMitluXrmnSgdUbFbOSxjhvYF0/MV2/BrTe8VLTQRso8Iillkj53lRZRL97j5XUjMk3r0crjUJuYrB4+1SSybsXjRMbCh4D66psbRC+QeQBJX5bqztc04xBkTm1xW1GLBBJeXKg/jaF9H2CEBNyOWXUbZBBtWI7/A8S+0KI9uD6rSabscwAYvWOZtNAInO5hvkdEv7pO2ik6vGN7waBXJvsJX8QvfZPegExi8oZeAIn1zoJwdd+JOVLJcadU9yhspMZtdKxjJLgS/2zPyrgVg8kT6hsPcdrbsvAPMMbpjtpEHsXhvUSRl17oeIX1Jw/fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l39yd1hVQe6SBuSZl/EBJI6jvZ/SeRtdqohn63qVouc=;
 b=QrKGGVU2WoM2f633HGm2G7HMCV+BHk/G0N0qFraXFDxdLANMdJb5Q3Soqus5Yaz0co416VdIztSpkq/OUZLf14Wlp7WeQEdANSlF4mCA5n/8dsKBBEA807AsmGZa/nrj/3xMjGtR/XBdglA5yqtGz4omx80XHOc6rQX+c+dY9rD90DbqCfIgdFKGB3Juo/FnkSYvNttbTxwi0RtQfNBqvFoLpuBk1I4yHuQb4oq22U+glbHWPU0VTu2+WwG6c5/3cUtllH4tc397yT4RuoewxAdURNv6p1kRz0xt+XsMsXua1dpDUtjIF5jWrqH3xN0pFej0Mx1UdyLGZf15teFFvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l39yd1hVQe6SBuSZl/EBJI6jvZ/SeRtdqohn63qVouc=;
 b=s1ErnOe9dORx1Sc/YVo3ccPct95IB1hZ1bifPg2cABMRsMYOiIjjcxKabeHwkn6cM2BcUC0CBpFCM81pmjnTDroXntnKtEyowbKahYzhBIOnTu/P4178B89a3/08QzZmF0/7de+Q4VREk65GeQFGH7adgjL43o/r2VhK/We71iw=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.233.225) by
 VE1PR04MB6478.eurprd04.prod.outlook.com (20.179.233.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Tue, 6 Aug 2019 09:23:29 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::6025:6518:3420:7317]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::6025:6518:3420:7317%7]) with mapi id 15.20.2115.005; Tue, 6 Aug 2019
 09:23:29 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Peter Chen <peter.chen@nxp.com>, Peter Chen <hzpeterchen@gmail.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 2/5] usb: chipidea: add role switch class support
Thread-Topic: [PATCH 2/5] usb: chipidea: add role switch class support
Thread-Index: AQHVMXEBpzW67j5jnEyJURF9gaNQo6bnyc4AgAQsJ/CAAB8lAIAAGnMQgAACBICAAAQTsIABvxEAgAACXrA=
Date:   Tue, 6 Aug 2019 09:23:29 +0000
Message-ID: <VE1PR04MB652857AAEA39148AF5C5D6BF89D50@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <20190703071953.38082-1-jun.li@nxp.com>
 <20190703071953.38082-2-jun.li@nxp.com>
 <CAL411-oHEbC6Lkr-X=GBKbHhRfuoQsfMVnUKtUjC1c8wrf-k+Q@mail.gmail.com>
 <VE1PR04MB6528DEA1B84E9B85A8594E5089DA0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <CAL411-o8pO=HQwRrgibpRsrfCBD0bqWaCM5imxtCVKTCdwa=ew@mail.gmail.com>
 <VE1PR04MB652883E67829A33509B02E0E89DA0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <VI1PR04MB53278DE4140B5B9FA7BDB2D08BDA0@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <VE1PR04MB65283BA3C45143002905E6FD89DA0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <VI1PR04MB532730BFF128E0A4F9868A9F8BD50@VI1PR04MB5327.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB532730BFF128E0A4F9868A9F8BD50@VI1PR04MB5327.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2ca5d9a-5e43-4a39-573f-08d71a4fbe5c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VE1PR04MB6478;
x-ms-traffictypediagnostic: VE1PR04MB6478:
x-microsoft-antispam-prvs: <VE1PR04MB64781A1FEE08B2585C00948789D50@VE1PR04MB6478.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(199004)(189003)(13464003)(14454004)(30864003)(76176011)(5660300002)(102836004)(478600001)(53546011)(6506007)(71200400001)(71190400001)(66066001)(74316002)(9686003)(64756008)(66556008)(66476007)(66446008)(76116006)(66946007)(6436002)(55016002)(25786009)(8936002)(14444005)(446003)(256004)(2906002)(11346002)(486006)(7736002)(305945005)(476003)(3846002)(6116002)(53936002)(44832011)(81156014)(86362001)(8676002)(68736007)(81166006)(26005)(33656002)(7696005)(99286004)(4326008)(6246003)(52536014)(54906003)(110136005)(229853002)(186003)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6478;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sqkMI0xxtMUlfZsGKk/Nv2oZJ0b0ach8LkEVb7jcY8mXWHPPNAkbQ+4IKB79db1mrGoLT47LzruhPnZmx8HfTtemfEIpk+MPZ8PkoAk1yQnx9QVoyOv7dp2J5SzL1lNYLCXzd10bbFPD2yvGNLAIzq+SiKHdvYJzCTq2iZ0C1eRPE4rZMwdKC0yl9hY5Fcjs3/EHG88AW2ouSvJAIGmlJ+8SZ6ID+3ibT7tpkEUNWo/5GHUOY9CSFvOvsBUMTtpP6nLM4eIwuOstFynP3tSdrK2OZJEAicGkAdvLUgL93R39H9xZP6TQctCJQewrRvT7z1PgE1i0myjN7bw33XxprSA/IHwoQ+R6ZfbI2cFGLq8HwGDcMYu+QyQ8JfXI7jgatpFtQ8X/Jug2rJJtVzK7GBlXyAnG2w5aJxW6zUnHXmc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ca5d9a-5e43-4a39-573f-08d71a4fbe5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 09:23:29.3666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jun.li@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6478
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgQ2hlbg0KPiBT
ZW50OiAyMDE55bm0OOaciDbml6UgMTU6NTINCj4gVG86IEp1biBMaSA8anVuLmxpQG54cC5jb20+
OyBQZXRlciBDaGVuIDxoenBldGVyY2hlbkBnbWFpbC5jb20+DQo+IENjOiBHcmVnIEtyb2FoLUhh
cnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPjsgZGwtbGludXgtaW14DQo+IDxsaW51
eC1pbXhAbnhwLmNvbT47IFVTQiBsaXN0IDxsaW51eC11c2JAdmdlci5rZXJuZWwub3JnPg0KPiBT
dWJqZWN0OiBSRTogW1BBVENIIDIvNV0gdXNiOiBjaGlwaWRlYTogYWRkIHJvbGUgc3dpdGNoIGNs
YXNzIHN1cHBvcnQNCj4gDQo+IA0KPiA+ID4NCj4gPiA+IFlvdSBtYXkgdXNlIGNvbm5lY3QgYml0
IGF0IHBvcnRzYyBzaW5jZSBWQlVTIG1heSBub3QgY29ubmVjdCB0byBTb0MuDQo+ID4NCj4gPiBC
eSB0aGlzIHdheSwgZGlzY29ubmVjdCBjYW4gYmUgZGVjaWRlZCBidXQgY29ubmVjdCBpcyBhIHBy
b2JsZW0gaW4NCj4gPiBjdXJyZW50IGRyaXZlciwgYXMgY29udHJvbGxlciB3YXMgc3RvcHBlZCBp
biBsb3cgcG93ZXIgbW9kZSBzbyBjYW4ndA0KPiA+IGRldGVjdCBjb25uZWN0aW9uIGZyb20gaG9z
dCwgdW5sZXNzIHdlIGFsc28gdXBkYXRlIHRoaXMgYmVoYXZpb3IgdG9vLg0KPiA+DQo+IA0KPiBG
b3IgY29ubmVjdGlvbiwgaWYgY3VycmVudCByb2xlIGlzIFVTQl9ST0xFX05PTkUsIHlvdSBtYXkg
c3RhcnQgZGV2aWNlIG1vZGUuDQoNClRoaXMgaXMgYXNzdW1pbmcgc2V0IHJvbGUgb25seSBjYW4g
YmUgY2FsbGVkIG9uZSB0aW1lIGJldHdlZW4gZGlzY29ubmVjdA0KYW5kIGNvbm5lY3QgdG8gaG9z
dCwgdGhpcyBtYXkgbm90IGFsd2F5cyB0cnVlLCBidXQgdGhpcyBjYW4gYmUgcmVzb2x2ZWQsDQpJ
IHRoaW5rIHdlIG5lZWQgaGFuZGxlIHRoZSBjYXNlIGRldmljZSBtb2RlIGlzIHN0YXJ0ZWQgYnV0
IGNvbm5lY3Rpb24gZG9lcw0Kbm90IGhhcHBlbiwgc28gdGhlIGdhZGdldCBuZWVkIGJlIHN0b3Bw
ZWQgYW5kIGVudGVyIGxvdyBwb3dlciBtb2RlIGFnYWluLA0KaWYgdGhpcyBhcHByb2FjaCBpcyBP
SyB0byB5b3UsIEkgd2lsbCBnbyBpbiB0aGlzIGRpcmVjdGlvbiBmb3IgbXkgdjIuDQoNCkxpIEp1
biANCg0KPiANCj4gUGV0ZXINCj4gDQo+ID4gTGkgSnVuDQo+ID4gPg0KPiA+ID4gUGV0ZXINCj4g
PiA+DQo+ID4gPiA+IExpIEp1bg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gUGV0ZXINCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gTGkgSnVuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gPiBQZXRlcg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IExpIEp1biA8anVuLmxpQG54cC5jb20+DQo+ID4gPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+
ID4gPiA+ID4gIGRyaXZlcnMvdXNiL2NoaXBpZGVhL2NpLmggICB8ICAgMiArDQo+ID4gPiA+ID4g
PiA+ID4gIGRyaXZlcnMvdXNiL2NoaXBpZGVhL2NvcmUuYyB8IDEyNQ0KPiA+ID4gPiA+ID4gPiA+
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+ID4gPiA+ID4g
PiA+ID4gIGRyaXZlcnMvdXNiL2NoaXBpZGVhL290Zy5jICB8ICAxMyArKysrKw0KPiA+ID4gPiA+
ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDExMSBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMo
LSkNCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi9jaGlwaWRlYS9jaS5oDQo+ID4gPiA+ID4gPiA+ID4gYi9kcml2ZXJzL3VzYi9jaGlwaWRl
YS9jaS5oIGluZGV4IDgyYjg2Y2QuLjVlMmYwYmMgMTAwNjQ0DQo+ID4gPiA+ID4gPiA+ID4gLS0t
IGEvZHJpdmVycy91c2IvY2hpcGlkZWEvY2kuaA0KPiA+ID4gPiA+ID4gPiA+ICsrKyBiL2RyaXZl
cnMvdXNiL2NoaXBpZGVhL2NpLmgNCj4gPiA+ID4gPiA+ID4gPiBAQCAtMjEyLDYgKzIxMiw3IEBA
IHN0cnVjdCBjaV9oZHJjIHsNCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIGt0aW1lX3QNCj4gPiA+
ID4gPiBocl90aW1lb3V0c1tOVU1fT1RHX0ZTTV9USU1FUlNdOw0KPiA+ID4gPiA+ID4gPiA+ICAg
ICAgICAgdW5zaWduZWQgICAgICAgICAgICAgICAgICAgICAgICBlbmFibGVkX290Z190aW1lcl9i
aXRzOw0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgZW51bSBvdGdfZnNtX3RpbWVyICAgICAgICAg
ICAgICBuZXh0X290Z190aW1lcjsNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgIHN0cnVjdCB1c2Jf
cm9sZV9zd2l0Y2ggICAgICAgICAgKnJvbGVfc3dpdGNoOw0KPiA+ID4gPiA+ID4gPiA+ICAgICAg
ICAgc3RydWN0IHdvcmtfc3RydWN0ICAgICAgICAgICAgICB3b3JrOw0KPiA+ID4gPiA+ID4gPiA+
ICAgICAgICAgc3RydWN0IHdvcmtxdWV1ZV9zdHJ1Y3QgICAgICAgICAqd3E7DQo+ID4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBAQCAtMjQ0LDYgKzI0NSw3IEBAIHN0cnVjdCBjaV9oZHJj
IHsNCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIHN0cnVjdCBkZW50cnkgICAgICAgICAgICAgICAg
ICAgKmRlYnVnZnM7DQo+ID4gPiA+ID4gPiA+ID4gICAgICAgICBib29sICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGlkX2V2ZW50Ow0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgYm9vbCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBiX3Nlc3NfdmFsaWRfZXZlbnQ7DQo+ID4gPiA+ID4gPiA+
ID4gKyAgICAgICBib29sICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJvbGVfc3dpdGNoX2V2
ZW50Ow0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgYm9vbCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpbXgyOF93cml0ZV9maXg7DQo+ID4gPiA+ID4gPiA+ID4gICAgICAgICBib29sICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN1cHBvcnRzX3J1bnRpbWVfcG07DQo+ID4gPiA+ID4gPiA+
ID4gICAgICAgICBib29sICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluX2xwbTsNCj4gPiA+
ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY2hpcGlkZWEvY29yZS5jDQo+ID4g
PiA+ID4gPiA+ID4gYi9kcml2ZXJzL3VzYi9jaGlwaWRlYS9jb3JlLmMgaW5kZXggYmMyNGM1Yi4u
MWJjZjZmNg0KPiA+ID4gPiA+ID4gPiA+IDEwMDY0NA0KPiA+ID4gPiA+ID4gPiA+IC0tLSBhL2Ry
aXZlcnMvdXNiL2NoaXBpZGVhL2NvcmUuYw0KPiA+ID4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMv
dXNiL2NoaXBpZGVhL2NvcmUuYw0KPiA+ID4gPiA+ID4gPiA+IEBAIC01ODcsNiArNTg3LDQ3IEBA
IHN0YXRpYyBpcnFyZXR1cm5fdCBjaV9pcnEoaW50IGlycSwgdm9pZCAqZGF0YSkNCj4gPiA+ID4g
PiA+ID4gPiAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gPiA+ID4gPiA+ID4gIH0NCj4gPiA+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ICtzdGF0aWMgaW50IGNpX3VzYl9yb2xlX3N3aXRjaF9z
ZXQoc3RydWN0IGRldmljZSAqZGV2LA0KPiA+ID4gPiA+ID4gPiA+ICtlbnVtIHVzYl9yb2xlDQo+
ID4gPiA+ID4gPiA+ID4gK3JvbGUpIHsNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgIHN0cnVjdCBj
aV9oZHJjICpjaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiA+ID4gPiA+ID4gPiA+ICsgICAg
ICAgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+
ID4gKyAgICAgICBpZiAoY2ktPnJvbGUgPT0gcm9sZSB8fCByb2xlID09IFVTQl9ST0xFX05PTkUp
DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAwOw0KPiA+ID4gPiA+ID4g
PiA+ICsNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZjaS0+bG9j
aywgZmxhZ3MpOw0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgY2ktPnJvbGVfc3dpdGNoX2V2ZW50
ID0gdHJ1ZTsNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgIGlmIChjaS0+cm9sZSA9PSBVU0JfUk9M
RV9OT05FKSB7DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChyb2xlID09IFVT
Ql9ST0xFX0RFVklDRSkNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBj
aS0+cm9sZSA9IFVTQl9ST0xFX0hPU1Q7DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAg
IGVsc2UNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBjaS0+cm9sZSA9
IFVTQl9ST0xFX0RFVklDRTsNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgIH0NCj4gPiA+ID4gPiA+
ID4gPiArICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmNpLT5sb2NrLCBmbGFncyk7DQo+
ID4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgY2lfb3RnX3F1ZXVlX3dv
cmsoY2kpOw0KPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgIHJldHVy
biAwOw0KPiA+ID4gPiA+ID4gPiA+ICt9DQo+ID4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4g
PiA+ICtzdGF0aWMgZW51bSB1c2Jfcm9sZSBjaV91c2Jfcm9sZV9zd2l0Y2hfZ2V0KHN0cnVjdCBk
ZXZpY2UgKmRldikgew0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgc3RydWN0IGNpX2hkcmMgKmNp
ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICB1bnNpZ25l
ZCBsb25nIGZsYWdzOw0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgZW51bSB1c2Jfcm9sZSByb2xl
Ow0KPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgIHNwaW5fbG9ja19p
cnFzYXZlKCZjaS0+bG9jaywgZmxhZ3MpOw0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgcm9sZSA9
IGNpLT5yb2xlOw0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9y
ZSgmY2ktPmxvY2ssIGZsYWdzKTsNCj4gPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4g
KyAgICAgICByZXR1cm4gcm9sZTsNCj4gPiA+ID4gPiA+ID4gPiArfQ0KPiA+ID4gPiA+ID4gPiA+
ICsNCj4gPiA+ID4gPiA+ID4gPiArc3RhdGljIHN0cnVjdCB1c2Jfcm9sZV9zd2l0Y2hfZGVzYyBj
aV9yb2xlX3N3aXRjaCA9IHsNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgIC5zZXQgPSBjaV91c2Jf
cm9sZV9zd2l0Y2hfc2V0LA0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgLmdldCA9IGNpX3VzYl9y
b2xlX3N3aXRjaF9nZXQsIH07DQo+ID4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiA+ICBz
dGF0aWMgaW50IGNpX2NhYmxlX25vdGlmaWVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIsIHVu
c2lnbmVkIGxvbmcgZXZlbnQsDQo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB2b2lkICpwdHIpICB7IEBAIC02ODksNg0KPiA+ID4gPiA+ID4gPiA+ICs3MzAsOSBA
QCBzdGF0aWMgaW50IGNpX2dldF9wbGF0ZGF0YShzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ID4gPiA+
ID4gPiA+ID4gICAgICAgICBpZiAob2ZfZmluZF9wcm9wZXJ0eShkZXYtPm9mX25vZGUsICJub24t
emVyby10dGN0cmwtdHRoYSIsIE5VTEwpKQ0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAg
ICBwbGF0ZGF0YS0+ZmxhZ3MgfD0NCj4gPiA+ID4gPiA+ID4gPiBDSV9IRFJDX1NFVF9OT05fWkVS
T19UVEhBOw0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICBpZiAoZGV2
aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJ1c2Itcm9sZS1zd2l0Y2giKSkNCj4gPiA+ID4g
PiA+ID4gPiArICAgICAgICAgICAgICAgY2lfcm9sZV9zd2l0Y2guZndub2RlID0gZGV2LT5md25v
ZGU7DQo+ID4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgZXh0X2lkID0g
RVJSX1BUUigtRU5PREVWKTsNCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIGV4dF92YnVzID0gRVJS
X1BUUigtRU5PREVWKTsNCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIGlmIChvZl9wcm9wZXJ0eV9y
ZWFkX2Jvb2woZGV2LT5vZl9ub2RlLCAiZXh0Y29uIikpDQo+ID4gPiA+ID4gPiA+ID4geyBAQA0K
PiA+ID4gPiA+ID4gPiA+IC05MDgsNg0KPiA+ID4gPiA+ID4gPiA+ICs5NTIsNDMgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXANCj4gPiA+ID4gPiA+ID4gPiArY2lfYXR0cl9n
cm91cCA9IHsNCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIC5hdHRycyA9IGNpX2F0dHJzLCAgfTsN
Cj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ICtzdGF0aWMgaW50IGNpX3N0YXJ0X2lu
aXRpYWxfcm9sZShzdHJ1Y3QgY2lfaGRyYyAqY2kpIHsNCj4gPiA+ID4gPiA+ID4gPiArICAgICAg
IGludCByZXQgPSAwOw0KPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gPiArICAgICAg
IGlmIChjaS0+cm9sZXNbVVNCX1JPTEVfSE9TVF0gJiYNCj4gPiA+ID4gPiA+ID4gPiArIGNpLT5y
b2xlc1tVU0JfUk9MRV9ERVZJQ0VdKQ0KPiA+ID4gew0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAg
ICAgICAgICBpZiAoY2ktPmlzX290Zykgew0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGNpLT5yb2xlID0gY2lfb3RnX3JvbGUoY2kpOw0KPiA+ID4gPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIC8qIEVuYWJsZSBJRCBjaGFuZ2UgaXJxICovDQo+ID4gPiA+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaHdfd3JpdGVfb3Rnc2MoY2ksIE9UR1ND
X0lESUUsDQo+IE9UR1NDX0lESUUpOw0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICB9
IGVsc2Ugew0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIC8qDQo+ID4g
PiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICogSWYgdGhlIGNvbnRyb2xsZXIg
aXMgbm90IE9URyBjYXBhYmxlLCBidXQgc3VwcG9ydA0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAqIHJvbGUgc3dpdGNoLCB0aGUgZGVmYWx0IHJvbGUgaXMgZ2FkZ2V0
LCBhbmQgdGhlDQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICogdXNl
ciBjYW4gc3dpdGNoIGl0IHRocm91Z2ggZGVidWdmcy4NCj4gPiA+ID4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgKi8NCj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBjaS0+cm9sZSA9IFVTQl9ST0xFX0RFVklDRTsNCj4gPiA+ID4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgfQ0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgfSBlbHNlIHsNCj4gPiA+ID4gPiA+
ID4gPiArICAgICAgICAgICAgICAgY2ktPnJvbGUgPSBjaS0+cm9sZXNbVVNCX1JPTEVfSE9TVF0N
Cj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICA/IFVTQl9ST0xFX0hPU1QN
Cj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICA6IFVTQl9ST0xFX0RFVklD
RTsNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgIH0NCj4gPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+
ID4gPiA+ID4gKyAgICAgICBpZiAoIWNpX290Z19pc19mc21fbW9kZShjaSkpIHsNCj4gPiA+ID4g
PiA+ID4gPiArICAgICAgICAgICAgICAgLyogb25seSB1cGRhdGUgdmJ1cyBzdGF0dXMgZm9yIHBl
cmlwaGVyYWwgKi8NCj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgaWYgKGNpLT5yb2xl
ID09IFVTQl9ST0xFX0RFVklDRSkNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBjaV9oYW5kbGVfdmJ1c19jaGFuZ2UoY2kpOw0KPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+
ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgcmV0ID0gY2lfcm9sZV9zdGFydChjaSwgY2ktPnJv
bGUpOw0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAocmV0KQ0KPiA+ID4gPiA+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoY2ktPmRldiwgImNhbid0IHN0
YXJ0ICVzIHJvbGVcbiIsDQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY2lfcm9sZShjaSktPm5hbWUpOw0KPiA+ID4gPiA+ID4g
PiA+ICsgICAgICAgfQ0KPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gPiArICAgICAg
IHJldHVybiByZXQ7DQo+ID4gPiA+ID4gPiA+ID4gK30NCj4gPiA+ID4gPiA+ID4gPiArDQo+ID4g
PiA+ID4gPiA+ID4gIHN0YXRpYyBpbnQgY2lfaGRyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KSAgew0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgc3RydWN0IGRldmljZSAgICpk
ZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ID4gPiA+ID4gPiA+IEBAIC0xMDUxLDM2ICsxMTMyLDEwIEBA
IHN0YXRpYyBpbnQgY2lfaGRyY19wcm9iZShzdHJ1Y3QNCj4gPiA+ID4gcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICB9DQo+ID4gPiA+ID4gPiA+
ID4gICAgICAgICB9DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiAtICAgICAgIGlm
IChjaS0+cm9sZXNbVVNCX1JPTEVfSE9TVF0gJiYgY2ktDQo+ID4gPnJvbGVzW1VTQl9ST0xFX0RF
VklDRV0pIHsNCj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgaWYgKGNpLT5pc19vdGcp
IHsNCj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBjaS0+cm9sZSA9IGNp
X290Z19yb2xlKGNpKTsNCj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAv
KiBFbmFibGUgSUQgY2hhbmdlIGlycSAqLw0KPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGh3X3dyaXRlX290Z3NjKGNpLCBPVEdTQ19JRElFLCBPVEdTQ19JRElFKTsNCj4g
PiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgfSBlbHNlIHsNCj4gPiA+ID4gPiA+ID4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAvKg0KPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAqIElmIHRoZSBjb250cm9sbGVyIGlzIG5vdCBPVEcgY2FwYWJsZSwgYnV0IHN1
cHBvcnQNCj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgKiByb2xlIHN3
aXRjaCwgdGhlIGRlZmFsdCByb2xlIGlzIGdhZGdldCwgYW5kIHRoZQ0KPiA+ID4gPiA+ID4gPiA+
IC0gICAgICAgICAgICAgICAgICAgICAgICAqIHVzZXIgY2FuIHN3aXRjaCBpdCB0aHJvdWdoIGRl
YnVnZnMuDQo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICovDQo+ID4g
PiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgY2ktPnJvbGUgPSBVU0JfUk9MRV9E
RVZJQ0U7DQo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIH0NCj4gPiA+ID4gPiA+ID4g
PiAtICAgICAgIH0gZWxzZSB7DQo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIGNpLT5y
b2xlID0gY2ktPnJvbGVzW1VTQl9ST0xFX0hPU1RdDQo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgPyBVU0JfUk9MRV9IT1NUDQo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgOiBVU0JfUk9MRV9ERVZJQ0U7DQo+ID4gPiA+ID4gPiA+ID4gLSAgICAg
ICB9DQo+ID4gPiA+ID4gPiA+ID4gLQ0KPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgaWYgKCFjaV9v
dGdfaXNfZnNtX21vZGUoY2kpKSB7DQo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIC8q
IG9ubHkgdXBkYXRlIHZidXMgc3RhdHVzIGZvciBwZXJpcGhlcmFsICovDQo+ID4gPiA+ID4gPiA+
ID4gLSAgICAgICAgICAgICAgIGlmIChjaS0+cm9sZSA9PSBVU0JfUk9MRV9ERVZJQ0UpDQo+ID4g
PiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgY2lfaGFuZGxlX3ZidXNfY2hhbmdl
KGNpKTsNCj4gPiA+ID4gPiA+ID4gPiAtDQo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAg
IHJldCA9IGNpX3JvbGVfc3RhcnQoY2ksIGNpLT5yb2xlKTsNCj4gPiA+ID4gPiA+ID4gPiAtICAg
ICAgICAgICAgICAgaWYgKHJldCkgew0KPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAg
ICAgICAgIGRldl9lcnIoZGV2LCAiY2FuJ3Qgc3RhcnQgJXMgcm9sZVxuIiwNCj4gPiA+ID4gPiA+
ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjaV9y
b2xlKGNpKS0+bmFtZSk7DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICBpZiAoIWNpX3JvbGVfc3dp
dGNoLmZ3bm9kZSkgew0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICByZXQgPSBjaV9z
dGFydF9pbml0aWFsX3JvbGUoY2kpOw0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBp
ZiAocmV0KQ0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gc3Rv
cDsNCj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgfQ0KPiA+ID4gPiA+ID4gPiA+ICAg
ICAgICAgfQ0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gICAgICAgICByZXQgPSBk
ZXZtX3JlcXVlc3RfaXJxKGRldiwgY2ktPmlycSwgY2lfaXJxLA0KPiA+ID4gPiA+ID4gPiA+IElS
UUZfU0hBUkVELCBAQA0KPiA+ID4gPiA+ID4gPiA+IC0xMDkyLDYgKzExNDcsMTUgQEAgc3RhdGlj
IGludCBjaV9oZHJjX3Byb2JlKHN0cnVjdA0KPiA+ID4gPiA+ID4gPiA+IHBsYXRmb3JtX2Rldmlj
ZQ0KPiA+ID4gPiAqcGRldikNCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIGlmIChyZXQpDQo+ID4g
PiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIGdvdG8gc3RvcDsNCj4gPiA+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gPiA+ICsgICAgICAgaWYgKGNpX3JvbGVfc3dpdGNoLmZ3bm9kZSkgew0KPiA+
ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBjaS0+cm9sZV9zd2l0Y2ggPSB1c2Jfcm9sZV9z
d2l0Y2hfcmVnaXN0ZXIoZGV2LA0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAmY2lfcm9sZV9zd2l0Y2gpOw0KPiA+ID4gPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICBpZiAoSVNfRVJSKGNpLT5yb2xlX3N3aXRjaCkpIHsNCj4gPiA+ID4gPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKGNpLT5yb2xlX3N3aXRj
aCk7DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBzdG9wOw0K
PiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICB9DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAg
ICB9DQo+ID4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgaWYgKGNpLT5z
dXBwb3J0c19ydW50aW1lX3BtKSB7DQo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIHBt
X3J1bnRpbWVfc2V0X2FjdGl2ZSgmcGRldi0+ZGV2KTsNCj4gPiA+ID4gPiA+ID4gPiAgICAgICAg
ICAgICAgICAgcG1fcnVudGltZV9lbmFibGUoJnBkZXYtPmRldik7IEBAIC0xMTMzLDYNCj4gPiA+
ID4gPiA+ID4gPiArMTE5Nyw5IEBAIHN0YXRpYyBpbnQgY2lfaGRyY19yZW1vdmUoc3RydWN0DQo+
ID4gPiA+ID4gPiA+ID4gK3BsYXRmb3JtX2RldmljZQ0KPiA+ID4gPiA+ID4gPiA+ICsqcGRldikg
IHsNCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIHN0cnVjdCBjaV9oZHJjICpjaSA9IHBsYXRmb3Jt
X2dldF9kcnZkYXRhKHBkZXYpOw0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gKyAg
ICAgICBpZiAoY2ktPnJvbGVfc3dpdGNoKQ0KPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+
ID4gPiArIHVzYl9yb2xlX3N3aXRjaF91bnJlZ2lzdGVyKGNpLT5yb2xlX3N3aXRjaCk7DQo+ID4g
PiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgaWYgKGNpLT5zdXBwb3J0c19y
dW50aW1lX3BtKSB7DQo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIHBtX3J1bnRpbWVf
Z2V0X3N5bmMoJnBkZXYtPmRldik7DQo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIHBt
X3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsgZGlmZiAtLWdpdA0KPiA+ID4gPiA+ID4gPiA+
IGEvZHJpdmVycy91c2IvY2hpcGlkZWEvb3RnLmMgYi9kcml2ZXJzL3VzYi9jaGlwaWRlYS9vdGcu
Yw0KPiA+ID4gPiA+ID4gPiA+IGluZGV4DQo+ID4gPiA+ID4gPiA+ID4gNWJkZTBiNS4uMGEyMjg1
NSAxMDA2NDQNCj4gPiA+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3VzYi9jaGlwaWRlYS9vdGcu
Yw0KPiA+ID4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2NoaXBpZGVhL290Zy5jDQo+ID4g
PiA+ID4gPiA+ID4gQEAgLTIxNCw2ICsyMTQsMTkgQEAgc3RhdGljIHZvaWQgY2lfb3RnX3dvcmso
c3RydWN0DQo+ID4gPiA+ID4gPiA+ID4gd29ya19zdHJ1Y3QNCj4gPiAqd29yaykNCj4gPiA+ID4g
PiA+ID4gPiAgICAgICAgICAgICAgICAgY2lfaGFuZGxlX3ZidXNfY2hhbmdlKGNpKTsNCj4gPiA+
ID4gPiA+ID4gPiAgICAgICAgIH0NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ICsg
ICAgICAgaWYgKGNpLT5yb2xlX3N3aXRjaF9ldmVudCkgew0KPiA+ID4gPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICBjaS0+cm9sZV9zd2l0Y2hfZXZlbnQgPSBmYWxzZTsNCj4gPiA+ID4gPiA+ID4g
PiArDQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChjaS0+cm9sZSA9PSBVU0Jf
Uk9MRV9ERVZJQ0UpIHsNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICB1
c2JfZ2FkZ2V0X3ZidXNfZGlzY29ubmVjdCgmY2ktPmdhZGdldCk7DQo+ID4gPiA+ID4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgY2lfcm9sZV9zdGFydChjaSwgVVNCX1JPTEVfSE9TVCk7
DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIH0gZWxzZSBpZiAoY2ktPnJvbGUgPT0g
VVNCX1JPTEVfSE9TVCkgew0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGNpX3JvbGVfc3RvcChjaSk7DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgdXNiX2dhZGdldF92YnVzX2Nvbm5lY3QoJmNpLT5nYWRnZXQpOw0KPiA+ID4gPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIGNpLT5yb2xlID0gVVNCX1JPTEVfREVWSUNFOw0KPiA+
ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICB9DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICB9
DQo+ID4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgcG1fcnVudGltZV9w
dXRfc3luYyhjaS0+ZGV2KTsNCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ICAgICAg
ICAgZW5hYmxlX2lycShjaS0+aXJxKTsNCj4gPiA+ID4gPiA+ID4gPiAtLQ0KPiA+ID4gPiA+ID4g
PiA+IDIuNy40DQo+ID4gPiA+ID4gPiA+ID4NCg==
