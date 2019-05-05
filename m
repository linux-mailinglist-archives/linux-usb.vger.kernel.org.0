Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C35E913CE8
	for <lists+linux-usb@lfdr.de>; Sun,  5 May 2019 05:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbfEEDNc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 May 2019 23:13:32 -0400
Received: from mail-eopbgr140088.outbound.protection.outlook.com ([40.107.14.88]:58752
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727055AbfEEDNb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 4 May 2019 23:13:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLm75CjcxtPHC0057FuuGs5+ELOdx8i9imGQLffERPM=;
 b=Sy86OLZj/agLo05W6LfqH8bXfmDaXYXeRzxyAfJWghx6xNn1M6mbr9CFnKIQJsVgwXp4L1A8ZnScfpZOk5i7tCH69ENkjc2VAsFbi0bEDWjcep6bLVPN2DAF5A7gXaHcELgn5CD2YxWNwtS+Vevg7apsHJMCWwLsD5f2J8alc9w=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5037.eurprd04.prod.outlook.com (20.177.50.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Sun, 5 May 2019 03:13:20 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61%5]) with mapi id 15.20.1856.012; Sun, 5 May 2019
 03:13:20 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 6/7] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Thread-Topic: [PATCH 6/7] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Thread-Index: AQHU/W1IxN9UeWE440ehfCRd3nlpnqZWnzGAgAVFkCA=
Date:   Sun, 5 May 2019 03:13:20 +0000
Message-ID: <VI1PR04MB5327641FD0A21BB4C93A85A58B370@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20190428024847.5046-1-peter.chen@nxp.com>
 <20190428024847.5046-7-peter.chen@nxp.com>
 <CAL_JsqLPK8kuYTT7ekZbAzywp2kr9xKA0_X3BAqVn5hShbPM+w@mail.gmail.com>
In-Reply-To: <CAL_JsqLPK8kuYTT7ekZbAzywp2kr9xKA0_X3BAqVn5hShbPM+w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ced1b11-a6aa-4a21-e99a-08d6d107a076
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5037;
x-ms-traffictypediagnostic: VI1PR04MB5037:
x-microsoft-antispam-prvs: <VI1PR04MB50376D48D7EC3748FE3C4A828B370@VI1PR04MB5037.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00286C0CA6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(346002)(366004)(376002)(39860400002)(189003)(199004)(68736007)(33656002)(7736002)(6436002)(54906003)(6506007)(55016002)(99286004)(3846002)(5660300002)(6116002)(7696005)(76176011)(9686003)(44832011)(26005)(186003)(305945005)(8936002)(478600001)(446003)(25786009)(4326008)(486006)(74316002)(14454004)(11346002)(476003)(256004)(86362001)(14444005)(316002)(229853002)(71190400001)(71200400001)(53936002)(81166006)(52536014)(81156014)(8676002)(66066001)(6246003)(102836004)(66446008)(76116006)(64756008)(66556008)(66476007)(66946007)(73956011)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5037;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: djhTRspOdFO+Vsh+OphOWWGL0N1TU4gfoAgksyxeh+k8ExSCiWcC4gEieV25+8E5HfdYIrEtOxaPWnNyOt/9BrEzsFzGqU6DBHB3SbpKMZo4UOiVYGOGuJX/0LOmwvbuiH3IPdw3wbjVm7yfdmm0R/UA/oxzII55ikDPiCAt0sHpn2I5CVQFoKjKNY5XtTNahrpjKKgXf+FOUHedlov5wQ8kHyevzwTtdwQZJktfs6O4IzM8OldTXxmvUPqu7eYdonZqI9Dyxx59jHcT8XtfSuDzAY98Ihld6PjzIGJyGtNxAnXJqVEPBsZq+RFOJcaJC7HDBmNL+GERnvkAVFPXIWrFkNE7fRrd6YBrL6jB2NSHBI//JzAN/7teM3W9/Un+xBWZ3FY5MozdZh/EToqUTG+hjLSLroCuzKgbmBqA1/w=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ced1b11-a6aa-4a21-e99a-08d6d107a076
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2019 03:13:20.4025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5037
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybS9ib290L2R0cy9pbXg3dWxwLmR0c2kgfCAzMCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2Vy
dGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9pbXg3dWxw
LmR0c2kNCj4gPiBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDd1bHAuZHRzaSBpbmRleCBmY2E2ZTUw
ZjM3YzguLmUyOTQ0Zjk4ZWFjNg0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2lteDd1bHAuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDd1bHAuZHRz
aQ0KPiA+IEBAIC0zMCw2ICszMCw3IEBADQo+ID4gICAgICAgICAgICAgICAgIHNlcmlhbDEgPSAm
bHB1YXJ0NTsNCj4gPiAgICAgICAgICAgICAgICAgc2VyaWFsMiA9ICZscHVhcnQ2Ow0KPiA+ICAg
ICAgICAgICAgICAgICBzZXJpYWwzID0gJmxwdWFydDc7DQo+ID4gKyAgICAgICAgICAgICAgIHVz
YnBoeTAgPSAmdXNicGh5MTsNCj4gDQo+IERyb3AgdGhpcy4gWW91IHNob3VsZG4ndCBuZWVkIGFu
IGFsaWFzLg0KPiANCg0KSXQgaXMgYSBkZXJpdmVkIFVTQiBQSFkgYW5kIHVzZWQgb24gbW9zdCBv
ZiBpLm14IGNoaXBpZGVhIFVTQiBjb250cm9sbGVycy4NCkF0IHRoZSBzb3VyY2UgY29kZSwgd2Ug
dXNlIGFsaWduZWQgaWQgdG8ga25vdyB0aGUgY29udHJvbGxlciBudW1iZXIuDQoNCiAgICAgICAg
cmV0ID0gb2ZfYWxpYXNfZ2V0X2lkKG5wLCAidXNicGh5Iik7DQogICAgICAgIGlmIChyZXQgPCAw
KQ0KICAgICAgICAgICAgICAgIGRldl9kYmcoJnBkZXYtPmRldiwgImZhaWxlZCB0byBnZXQgYWxp
YXMgaWQsIGVycm5vICVkXG4iLCByZXQpOw0KICAgICAgICBteHNfcGh5LT5wb3J0X2lkID0gcmV0
Ow0KDQo+ID4gICAgICAgICB9Ow0KPiA+DQo+ID4gICAgICAgICBjcHVzIHsNCj4gPiBAQCAtMTMz
LDYgKzEzNCwzNSBAQA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0g
ImlwZyIsICJwZXIiOw0KPiA+ICAgICAgICAgICAgICAgICB9Ow0KPiA+DQo+ID4gKyAgICAgICAg
ICAgICAgIHVzYm90ZzE6IHVzYkA0MDMzMDAwMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJmc2wsaW14N3VscC11c2IiLCAiZnNsLGlteDZ1bC11c2IiLA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImZzbCxpbXgyNy11c2IiOw0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDQwMzMwMDAwIDB4MjAwPjsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNDAgSVJRX1RZUEVfTEVW
RUxfSElHSD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZwY2MyIElN
WDdVTFBfQ0xLX1VTQjA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGZzbCx1c2JwaHkg
PSA8JnVzYnBoeTE+Ow0KPiANCj4gRG9uJ3QgdXNlIHRoaXMgZm9yIG5ldyB1c2Vycy4gVXNlIHRo
ZSBwaHkgYmluZGluZyBpbnN0ZWFkLg0KPiANCg0KSXQgaXMgbm90IGEgbmV3IHVzZXIsIHRoZSBV
U0IgUEhZIHVzZWQgYXQgaW14N3VscCBpcyB0aGUgc2FtZSB3aXRoIGlteDYncy4NCg0KVGhhbmtz
Lg0KDQpQZXRlcg0KDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZnNsLHVzYm1pc2MgPSA8
JnVzYm1pc2MxIDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGFoYi1idXJzdC1jb25m
aWcgPSA8MHgwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB0eC1idXJzdC1zaXplLWR3
b3JkID0gPDB4OD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcngtYnVyc3Qtc2l6ZS1k
d29yZCA9IDwweDg+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNh
YmxlZCI7DQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAg
ICB1c2JtaXNjMTogdXNibWlzY0A0MDMzMDIwMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgI2luZGV4LWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiZnNsLGlteDd1bHAtdXNibWlzYyIsICJmc2wsaW14N2QtdXNibWlzYyIsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZnNsLGlteDZxLXVzYm1pc2MiOw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDQwMzMwMjAwIDB4MjAwPjsNCj4gPiAr
ICAgICAgICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIHVzYnBoeTE6IHVz
YnBoeUAweDQwMzUwMDAwIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxl
ID0gImZzbCxpbXg3dWxwLXVzYnBoeSIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAiZnNsLGlteDZ1bC11c2JwaHkiLCAiZnNsLGlteDIzLXVzYnBoeSI7DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmVnID0gPDB4NDAzNTAwMDAgMHgxMDAwPjsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzkgSVJRX1RZUEVfTEVWRUxf
SElHSD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZwY2MyIElNWDdV
TFBfQ0xLX1VTQl9QSFk+Ow0KPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ICsNCj4gPiAgICAg
ICAgICAgICAgICAgdXNkaGMwOiBtbWNANDAzNzAwMDAgew0KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLGlteDd1bHAtdXNkaGMiLCAiZnNsLGlteDZzeC11c2Ro
YyI7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4NDAzNzAwMDAgMHgxMDAw
MD47DQo+ID4gLS0NCj4gPiAyLjE0LjENCj4gPg0K
