Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB74E55F22
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2019 04:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfFZCks (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jun 2019 22:40:48 -0400
Received: from mail-eopbgr50073.outbound.protection.outlook.com ([40.107.5.73]:61824
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726667AbfFZCks (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 Jun 2019 22:40:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=tQPM/eeUdNDScdLWzEioXa6+dUU1/weVquh5UJ2qRV3r/X1fGHHq5c268wBwYK4jyHFPEixGCbasVeKC49f6I5GMCSpfyl6g//jNq4qyY3nZ0TTZ7pN9lWM9Q9jFXLhyYQhFIQ7TA1+5EKCdcqTG6So933sJdlWZawgWh2yQ8Tw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c23JJpN3yUzEV9iCudDG/s+HCJ3CLfHrfifaMYDDYCg=;
 b=mZ3K0zZOIYoWN/xmfaweTvxqe4kPLdfivj1Ahyc6fpWIWOh8fFnjUOFsSjQBmJd4Mdlmt5l6dPCH53TP4bmeYlljQw75F77kjbDdzU8SaEraH+k2GTMglBne4C5ua3f7XfrthlNrWQGDuDDWt/DNDjeaVddfSGyy7R+WOGJEXIE=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c23JJpN3yUzEV9iCudDG/s+HCJ3CLfHrfifaMYDDYCg=;
 b=TE8OZcczUkO7Xloyfu2VprFBE85dQud9n/hBHi0TBWg1lFfcxUB1Tka+I7vpiM4OZugC79FWQg2WUzslJ7oO/7v5ueXy7h+sk23Y+RDpeHJqjiNbOWJbs6lUQNWgKEkihbxyqRbazNNW9mPOTtg7wGjSTmSNPFV9WATUOZJGXAY=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB7056.eurprd04.prod.outlook.com (10.186.158.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 02:40:05 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c1bf:7842:6630:b87a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c1bf:7842:6630:b87a%7]) with mapi id 15.20.2008.014; Wed, 26 Jun 2019
 02:40:05 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
CC:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] ARM: imx25: provide a fixed regulator for usb phys
Thread-Topic: [PATCH] ARM: imx25: provide a fixed regulator for usb phys
Thread-Index: AQHVKz1enai+x3/0XUiWuEOLFWXTl6atMdCg
Date:   Wed, 26 Jun 2019 02:40:04 +0000
Message-ID: <VI1PR04MB5327E09DB0DFEB7E868DB59D8BE20@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20190625100412.11815-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20190625100412.11815-1-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25e48127-beb8-4c73-4249-08d6f9df9870
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB7056;
x-ms-traffictypediagnostic: VI1PR04MB7056:
x-microsoft-antispam-prvs: <VI1PR04MB70561DB91154610F50D06E248BE20@VI1PR04MB7056.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(366004)(136003)(396003)(39860400002)(346002)(189003)(199004)(66066001)(66574012)(476003)(44832011)(68736007)(486006)(229853002)(9686003)(76176011)(4326008)(8936002)(71190400001)(71200400001)(5660300002)(446003)(11346002)(33656002)(256004)(52536014)(14444005)(316002)(186003)(54906003)(110136005)(6436002)(6246003)(81166006)(6506007)(2906002)(64756008)(66446008)(7696005)(74316002)(81156014)(7736002)(305945005)(14454004)(478600001)(76116006)(3846002)(6116002)(8676002)(55016002)(25786009)(99286004)(86362001)(66476007)(66556008)(26005)(53936002)(73956011)(66946007)(102836004);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB7056;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2nE60KFKJvzAaLD7rCF/qYBuuzpRWpymd3YFjPcxavYaRvZKiWdnhyCuvxnSml3H3l5C/kmrwLLYmCjhHxGJmyPXUq62BssKwLFdW5Y68jjk2pPzYsnXFXA8e/BpV2wNeKUh9ETxe/1M8YE2Hbe4kDvrrDfm1VR7bIJvgkVN2EcEVfOfebdG0D68BtlFeuC4rDtd74EuvgHL+mjuEMAlb6lfUJQGoScFC0M0z52miZsCElQ+Caps+YIljSdTQXBdq0hKs1nMUryEhM3jgJ6LfZ9Hs+MV3K7iXWYodIgKHeY6TxJCYI3KbsMtx5VbU3yukb0LRhF/jj4AC5cUWvch8Gfjn+DG4DbczrT2vvTEMz9iQwzMcPuzvdCXb2gd0IV5ul6ztq2TdBB5cDDaSFBSFqoYkUIVZU8//jSLuRCmJzU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e48127-beb8-4c73-4249-08d6f9df9870
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 02:40:04.8791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peter.chen@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7056
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiBTdWJqZWN0OiBbUEFUQ0hdIEFSTTogaW14MjU6IHByb3ZpZGUgYSBmaXhlZCByZWd1bGF0
b3IgZm9yIHVzYiBwaHlzDQo+IA0KPiBUaGUgdXNiIHBoeXMgYXJlIGludGVybmFsIHRvIHRoZSBT
b0MgYW5kIHNvIGl0IHRoZWlyIDVWIHN1cHBseS4gV2l0aCB0aGlzIHJlZ3VsYXRvcg0KPiBhZGRl
ZCBleHBsaWNpdGx5IHRoZSBmb2xsb3dpbmcgKGhhcm1sZXNzKSBib290IG1lc3NhZ2VzIGdvIGF3
YXk6DQo+IA0KPiAJdXNiX3BoeV9nZW5lcmljIHVzYnBoeTp1c2ItcGh5QDA6IHVzYnBoeTp1c2It
cGh5QDAgc3VwcGx5IHZjYyBub3QNCj4gZm91bmQsIHVzaW5nIGR1bW15IHJlZ3VsYXRvcg0KPiAJ
dXNiX3BoeV9nZW5lcmljIHVzYnBoeTp1c2ItcGh5QDE6IHVzYnBoeTp1c2ItcGh5QDEgc3VwcGx5
IHZjYyBub3QNCj4gZm91bmQsIHVzaW5nIGR1bW15IHJlZ3VsYXRvcg0KPiANCg0KVG8gZWxpbWlu
YXRlIHRoZSB3YXJuaW5nIG1lc3NhZ2UsIEkgc3VnZ2VzdCBkb2luZyBiZWxvdyBjaGFuZ2VzLCBh
cyB2Y2MNCnN1cHBseSBpcyBub3QgbWFuZGF0b3J5Lg0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvcGh5L3BoeS1nZW5lcmljLmMgYi9kcml2ZXJzL3VzYi9waHkvcGh5LWdlbmVyaWMuYw0KaW5k
ZXggYTUzYjg5YmU1MzI0Li4wMWE1ZmYxYTA1MTUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9w
aHkvcGh5LWdlbmVyaWMuYw0KKysrIGIvZHJpdmVycy91c2IvcGh5L3BoeS1nZW5lcmljLmMNCkBA
IC0yNzUsNyArMjc1LDcgQEAgaW50IHVzYl9waHlfZ2VuX2NyZWF0ZV9waHkoc3RydWN0IGRldmlj
ZSAqZGV2LCBzdHJ1Y3QgdXNiX3BoeV9nZW5lcmljICpub3AsDQogICAgICAgICAgICAgICAgfSAg
IA0KICAgICAgICB9ICAgDQogDQotICAgICAgIG5vcC0+dmNjID0gZGV2bV9yZWd1bGF0b3JfZ2V0
KGRldiwgInZjYyIpOw0KKyAgICAgICBub3AtPnZjYyA9IGRldm1fcmVndWxhdG9yX2dldF9vcHRp
b25hbChkZXYsICJ2Y2MiKTsNCiAgICAgICAgaWYgKElTX0VSUihub3AtPnZjYykpIHsNCiAgICAg
ICAgICAgICAgICBkZXZfZGJnKGRldiwgIkVycm9yIGdldHRpbmcgdmNjIHJlZ3VsYXRvcjogJWxk
XG4iLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBUUl9FUlIobm9w
LT52Y2MpKTsNCg0KUGV0ZXINCg0KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8
dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPg0KPiAtLS0NCj4gSGVsbG8sDQo+IA0KPiBu
b3RlIEknbSBhbiBVU0Igbm9vYiwgc28gcGxlYXNlIGNvbnNpZGVyIGNhcmVmdWxseSBiZWZvcmUg
YXBwbHlpbmcgOi0pIEkgYWxzbyBwdXQgdGhlDQo+IHJlZ3VsYXRvciBuZWFyIHRoZSB1c2JwaHkg
bm9kZSBpbnN0ZWFkIG9mIGluIGFscGhhYmV0aWMgb3JkZXIuIE5vdCBzdXJlIHdoYXQgaXMNCj4g
c2Vuc2libGUvdXN1YWwgaGVyZSwgdG9vLg0KPiANCj4gQmVzdCByZWdhcmRzDQo+IFV3ZQ0KPiAN
Cj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2lteDI1LmR0c2kgfCA5ICsrKysrKysrKw0KPiAgMSBmaWxl
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL2lteDI1LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9pbXgyNS5kdHNpDQo+IC0tLSBh
L2FyY2gvYXJtL2Jvb3QvZHRzL2lteDI1LmR0c2kNCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMv
aW14MjUuZHRzaQ0KPiBAQCAtNjE0LDYgKzYxNCwxMSBAQA0KPiAgCQl9Ow0KPiAgCX07DQo+IA0K
PiArCXJlZ191c2I6IHJlZ3VsYXRvcl91c2JwaHkgew0KPiArCQljb21wYXRpYmxlID0gInJlZ3Vs
YXRvci1maXhlZCI7DQo+ICsJCXJlZ3VsYXRvci1uYW1lID0gInVzYi1waHkgc3VwcGx5IjsNCj4g
Kwl9Ow0KPiArDQo+ICAJdXNicGh5IHsNCj4gIAkJY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsN
Cj4gIAkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+IEBAIC02MjMsMTIgKzYzMCwxNCBAQA0KPiAg
CQkJcmVnID0gPDA+Ow0KPiAgCQkJY29tcGF0aWJsZSA9ICJ1c2Itbm9wLXhjZWl2IjsNCj4gIAkJ
CSNwaHktY2VsbHMgPSA8MD47DQo+ICsJCQl2Y2Mtc3VwcGx5ID0gPCZyZWdfdXNiPjsNCj4gIAkJ
fTsNCj4gDQo+ICAJCXVzYnBoeTE6IHVzYi1waHlAMSB7DQo+ICAJCQlyZWcgPSA8MT47DQo+ICAJ
CQljb21wYXRpYmxlID0gInVzYi1ub3AteGNlaXYiOw0KPiAgCQkJI3BoeS1jZWxscyA9IDwwPjsN
Cj4gKwkJCXZjYy1zdXBwbHkgPSA8JnJlZ191c2I+Ow0KPiAgCQl9Ow0KPiAgCX07DQo+ICB9Ow0K
PiAtLQ0KPiAyLjIwLjENCg0K
