Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3559A1E71B
	for <lists+linux-usb@lfdr.de>; Wed, 15 May 2019 05:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfEODXs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 May 2019 23:23:48 -0400
Received: from mail-eopbgr40055.outbound.protection.outlook.com ([40.107.4.55]:65212
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726218AbfEODXr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 May 2019 23:23:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFBhF9Itws187wrlQqkP8gO8nr8L/usDNTCbvBjihxc=;
 b=IoS2R6+nAoh33txFna3CvxTgwBq0EsQ0HPTIKCcA23prY1niDbUsoQ5H2eLC3Ze9P2aki3qpXuBGXES602D+HcLr5J4BPt6DivVvuzTIJEsKDwBKUwJD5j2rJ7K0Lk/A1paxkcqEN5UvrveR90BGDiFR+NOS9IeBDCIzBoh8ujM=
Received: from AM0PR04MB5314.eurprd04.prod.outlook.com (20.177.41.157) by
 AM0PR04MB4979.eurprd04.prod.outlook.com (20.177.40.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Wed, 15 May 2019 03:23:43 +0000
Received: from AM0PR04MB5314.eurprd04.prod.outlook.com
 ([fe80::3095:ca86:db25:e7a]) by AM0PR04MB5314.eurprd04.prod.outlook.com
 ([fe80::3095:ca86:db25:e7a%7]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 03:23:43 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH v2 2/8] usb: phy: phy-mxs-usb: add imx7ulp support
Thread-Topic: [PATCH v2 2/8] usb: phy: phy-mxs-usb: add imx7ulp support
Thread-Index: AQHVCif2vRA1gZTNi0O1cb14Aet16KZqRRyAgAFBebA=
Date:   Wed, 15 May 2019 03:23:41 +0000
Message-ID: <AM0PR04MB53144B3928AD2843758DF77D8B090@AM0PR04MB5314.eurprd04.prod.outlook.com>
References: <20190514073529.29505-1-peter.chen@nxp.com>
         <20190514073529.29505-3-peter.chen@nxp.com>
 <1557821523.10179.284.camel@mhfsdcap03>
In-Reply-To: <1557821523.10179.284.camel@mhfsdcap03>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98beb347-6043-4da2-0daf-08d6d8e4bb8d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4979;
x-ms-traffictypediagnostic: AM0PR04MB4979:
x-microsoft-antispam-prvs: <AM0PR04MB4979749AD607581C7AE3F8E38B090@AM0PR04MB4979.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(366004)(136003)(396003)(39860400002)(199004)(189003)(6916009)(53936002)(66446008)(64756008)(76116006)(73956011)(6246003)(66946007)(66556008)(446003)(25786009)(11346002)(486006)(476003)(8936002)(229853002)(8676002)(4326008)(81156014)(14444005)(256004)(186003)(26005)(6506007)(7696005)(74316002)(76176011)(81166006)(71200400001)(9686003)(6116002)(3846002)(102836004)(2906002)(14454004)(33656002)(7736002)(66476007)(6436002)(86362001)(55016002)(316002)(5660300002)(52536014)(66066001)(478600001)(68736007)(71190400001)(305945005)(99286004)(54906003)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4979;H:AM0PR04MB5314.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dGcILI1PXuBOeKIzBAQzg0BeLCwwolz7EG8SnLdMu612uWUrRoqfEqrst3t/t4ed2yQdPjfnwD9Goc5sLBszshBYDzD6/FWvzAc+9HcqSZxBIXSVczL3wHxheNuvrKri/cihm6EnFZNR3LjRfhKpSSRr6yHzMCgr5Ol0E+HjDjoZAnuQllTg9znG0cxJVJ2V1gqf5g416W01Yld8k8YQNapUdExw1h4E/yaAQTKDqhT1ZWVdFNMA3Sc6H+DDoRm8uB7X5VqXtEPPZTSC7Yj4x6dvux6b6j0VcX2UQ3NyRKUxK3nQOjC1iZUogfMPMVWhvk4m7dyMHmAJds1Uaa5ChTYzUKrCQqg26k4zj9ZfDtlu/eLa5LNSQUTEqbPxhH40mylT0NbNDBI9985D+eb/xxIucnIWN5Gr15kCevM3XW4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98beb347-6043-4da2-0daf-08d6d8e4bb8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 03:23:42.9560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4979
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIENoZW4gPHBldGVyLmNoZW5AbnhwLmNvbT4NCj4g
PiAtLS0NCj4gPiAgZHJpdmVycy91c2IvcGh5L3BoeS1teHMtdXNiLmMgfCA3Ng0KPiA+ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDc1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9waHkvcGh5LW14cy11c2IuYw0KPiA+IGIvZHJpdmVycy91c2IvcGh5L3Bo
eS1teHMtdXNiLmMgaW5kZXggMWIxYmIwYWQ0MGMzLi45MGM5NmE4ZTkzNDINCj4gPiAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9waHkvcGh5LW14cy11c2IuYw0KPiA+ICsrKyBiL2RyaXZl
cnMvdXNiL3BoeS9waHktbXhzLXVzYi5jDQo+ID4gQEAgLTIwLDYgKzIwLDcgQEANCj4gPg0KPiA+
ICAjZGVmaW5lIERSSVZFUl9OQU1FICJteHNfcGh5Ig0KPiA+DQo+ID4gKy8qIFJlZ2lzdGVyIE1h
Y3JvICovDQo+ID4gICNkZWZpbmUgSFdfVVNCUEhZX1BXRAkJCQkweDAwDQo+ID4gICNkZWZpbmUg
SFdfVVNCUEhZX1RYCQkJCTB4MTANCj4gPiAgI2RlZmluZSBIV19VU0JQSFlfQ1RSTAkJCQkweDMw
DQo+ID4gQEAgLTM3LDYgKzM4LDExIEBADQo+ID4gICNkZWZpbmUgR01fVVNCUEhZX1RYX1RYQ0FM
NDVETih4KSAgICAgICAgICAgICgoKHgpICYgMHhmKSA8PCA4KQ0KPiA+ICAjZGVmaW5lIEdNX1VT
QlBIWV9UWF9EX0NBTCh4KSAgICAgICAgICAgICAgICAoKCh4KSAmIDB4ZikgPDwgMCkNCj4gPg0K
PiA+ICsvKiBpbXg3dWxwICovDQo+ID4gKyNkZWZpbmUgSFdfVVNCUEhZX1BMTF9TSUMJCQkweGEw
DQo+ID4gKyNkZWZpbmUgSFdfVVNCUEhZX1BMTF9TSUNfU0VUCQkJMHhhNA0KPiA+ICsjZGVmaW5l
IEhXX1VTQlBIWV9QTExfU0lDX0NMUgkJCTB4YTgNCj4gPiArDQo+ID4gICNkZWZpbmUgQk1fVVNC
UEhZX0NUUkxfU0ZUUlNUCQkJQklUKDMxKQ0KPiA+ICAjZGVmaW5lIEJNX1VTQlBIWV9DVFJMX0NM
S0dBVEUJCQlCSVQoMzApDQo+ID4gICNkZWZpbmUgQk1fVVNCUEhZX0NUUkxfT1RHX0lEX1ZBTFVF
CQlCSVQoMjcpDQo+ID4gQEAgLTU1LDYgKzYxLDEyIEBADQo+ID4gICNkZWZpbmUgQk1fVVNCUEhZ
X0lQX0ZJWCAgICAgICAgICAgICAgICAgICAgICAgKEJJVCgxNykgfCBCSVQoMTgpKQ0KPiA+DQo+
ID4gICNkZWZpbmUgQk1fVVNCUEhZX0RFQlVHX0NMS0dBVEUJCQlCSVQoMzApDQo+ID4gKy8qIGlt
eDd1bHAgKi8NCj4gPiArI2RlZmluZSBCTV9VU0JQSFlfUExMX0xPQ0sJCQlCSVQoMzEpDQo+ID4g
KyNkZWZpbmUgQk1fVVNCUEhZX1BMTF9SRUdfRU5BQkxFCQlCSVQoMjEpDQo+ID4gKyNkZWZpbmUg
Qk1fVVNCUEhZX1BMTF9CWVBBU1MJCQlCSVQoMTYpDQo+ID4gKyNkZWZpbmUgQk1fVVNCUEhZX1BM
TF9QT1dFUgkJCUJJVCgxMikNCj4gPiArI2RlZmluZSBCTV9VU0JQSFlfUExMX0VOX1VTQl9DTEtT
CQlCSVQoNikNCj4gPg0KPiA+ICAvKiBBbmF0b3AgUmVnaXN0ZXJzICovDQo+ID4gICNkZWZpbmUg
QU5BRElHX0FOQV9NSVNDMAkJCTB4MTUwDQo+ID4gQEAgLTE2Nyw2ICsxNzksOSBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IG14c19waHlfZGF0YSBpbXg2dWxfcGh5X2RhdGEgPSB7DQo+ID4gIAkuZmxh
Z3MgPSBNWFNfUEhZX0RJU0NPTk5FQ1RfTElORV9XSVRIT1VUX1ZCVVMsDQo+ID4gIH07DQo+ID4N
Cj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBteHNfcGh5X2RhdGEgaW14N3VscF9waHlfZGF0YSA9
IHsgfTsNCj4gPiArDQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG14c19w
aHlfZHRfaWRzW10gPSB7DQo+ID4gIAl7IC5jb21wYXRpYmxlID0gImZzbCxpbXg2c3gtdXNicGh5
IiwgLmRhdGEgPSAmaW14NnN4X3BoeV9kYXRhLCB9LA0KPiA+ICAJeyAuY29tcGF0aWJsZSA9ICJm
c2wsaW14NnNsLXVzYnBoeSIsIC5kYXRhID0gJmlteDZzbF9waHlfZGF0YSwgfSwgQEANCj4gPiAt
MTc0LDYgKzE4OSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG14c19waHlf
ZHRfaWRzW10gPSB7DQo+ID4gIAl7IC5jb21wYXRpYmxlID0gImZzbCxpbXgyMy11c2JwaHkiLCAu
ZGF0YSA9ICZpbXgyM19waHlfZGF0YSwgfSwNCj4gPiAgCXsgLmNvbXBhdGlibGUgPSAiZnNsLHZm
NjEwLXVzYnBoeSIsIC5kYXRhID0gJnZmNjEwX3BoeV9kYXRhLCB9LA0KPiA+ICAJeyAuY29tcGF0
aWJsZSA9ICJmc2wsaW14NnVsLXVzYnBoeSIsIC5kYXRhID0gJmlteDZ1bF9waHlfZGF0YSwgfSwN
Cj4gPiArCXsgLmNvbXBhdGlibGUgPSAiZnNsLGlteDd1bHAtdXNicGh5IiwgLmRhdGEgPSAmaW14
N3VscF9waHlfZGF0YSwgfSwNCj4gPiAgCXsgLyogc2VudGluZWwgKi8gfQ0KPiA+ICB9Ow0KPiA+
ICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBteHNfcGh5X2R0X2lkcyk7IEBAIC0xOTgsNiArMjE0
LDExIEBADQo+IHN0YXRpYw0KPiA+IGlubGluZSBib29sIGlzX2lteDZzbF9waHkoc3RydWN0IG14
c19waHkgKm14c19waHkpDQo+ID4gIAlyZXR1cm4gbXhzX3BoeS0+ZGF0YSA9PSAmaW14NnNsX3Bo
eV9kYXRhOyAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBpbmxpbmUgYm9vbCBpc19pbXg3dWxwX3BoeShz
dHJ1Y3QgbXhzX3BoeSAqbXhzX3BoeSkgew0KPiA+ICsJcmV0dXJuIG14c19waHktPmRhdGEgPT0g
JmlteDd1bHBfcGh5X2RhdGE7IH0NCj4gPiArDQo+ID4gIC8qDQo+ID4gICAqIFBIWSBuZWVkcyBz
b21lIDMySyBjeWNsZXMgdG8gc3dpdGNoIGZyb20gMzJLIGNsb2NrIHRvDQo+ID4gICAqIGJ1cyAo
c3VjaCBhcyBBSEIvQVhJLCBldGMpIGNsb2NrLg0KPiA+IEBAIC0yMjEsMTQgKzI0Miw1OSBAQCBz
dGF0aWMgdm9pZCBteHNfcGh5X3R4X2luaXQoc3RydWN0IG14c19waHkgKm14c19waHkpDQo+ID4g
IAl9DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgaW50IHdhaXRfZm9yX3BsbF9sb2NrKGNvbnN0
IHZvaWQgX19pb21lbSAqYmFzZSkNCj4gPiArew0KPiA+ICsJaW50IGxvb3BfY291bnQgPSAxMDA7
DQo+ID4gKw0KPiA+ICsJLyogV2FpdCBmb3IgUExMIHRvIGxvY2sgKi8NCj4gPiArCWRvIHsNCj4g
PiArCQlpZiAocmVhZGwoYmFzZSArIEhXX1VTQlBIWV9QTExfU0lDKSAmDQo+IEJNX1VTQlBIWV9Q
TExfTE9DSykNCj4gPiArCQkJYnJlYWs7DQo+ID4gKwkJdXNsZWVwX3JhbmdlKDEwMCwgMTUwKTsN
Cj4gPiArCX0gd2hpbGUgKGxvb3BfY291bnQtLSA+IDApOw0KPiA+ICsNCj4gdGhlcmUgaXMgYSBj
b21tb24gQVBJIHJlYWRsX3BvbGxfdGltZW91dCgpLCBtYXliZSB5b3UgY2FuIHRyeSBpdC4NCj4g
DQogDQpDaGVja2VkIGl0LCBpdCBjYW4gYmUgdXNlZC4gVGhhbmtzLg0KDQpQZXRlcg0KDQo=
