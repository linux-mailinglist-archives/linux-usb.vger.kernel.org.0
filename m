Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5B281576A
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2019 03:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbfEGBtU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 21:49:20 -0400
Received: from mail-eopbgr00074.outbound.protection.outlook.com ([40.107.0.74]:16005
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725994AbfEGBtT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 May 2019 21:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7PafUwTy2rYSbdhDGMfJR1Cas7vpq1YzxgjnJUPwyQ=;
 b=BMJ+TdIt+bgBevIh8yFphv5LQpuaFN9UqkwghgIimV0N1h7ysyW82BP3tLJ9bN9sVLQ1KrfOYa6YOES/TUd8i2o2cmlApjoGaC2L8CodCxbiyej32q77LnpLIoQt0lWXRwliw/PBcmRDn4dswRmP/BrlC47duHgnRQ5rfxj+Jdc=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5245.eurprd04.prod.outlook.com (20.177.51.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 7 May 2019 01:49:15 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61%5]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 01:49:15 +0000
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
Thread-Index: AQHU/W1IxN9UeWE440ehfCRd3nlpnqZWnzGAgAVFkCCAAmGngIAAoKTQ
Date:   Tue, 7 May 2019 01:49:15 +0000
Message-ID: <VI1PR04MB5327BED3397BFDB39800250C8B310@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20190428024847.5046-1-peter.chen@nxp.com>
 <20190428024847.5046-7-peter.chen@nxp.com>
 <CAL_JsqLPK8kuYTT7ekZbAzywp2kr9xKA0_X3BAqVn5hShbPM+w@mail.gmail.com>
 <VI1PR04MB5327641FD0A21BB4C93A85A58B370@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CAL_Jsq+OywH+_caxtrBJF=nMVxFeHsuL8jbLq=a6VBXWiZ0ktA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+OywH+_caxtrBJF=nMVxFeHsuL8jbLq=a6VBXWiZ0ktA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b43dad2-9ed6-42ff-fd41-08d6d28e3661
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5245;
x-ms-traffictypediagnostic: VI1PR04MB5245:
x-microsoft-antispam-prvs: <VI1PR04MB5245FF9CE525AFCC21C0E8778B310@VI1PR04MB5245.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(366004)(396003)(376002)(136003)(39860400002)(199004)(189003)(316002)(81156014)(54906003)(8936002)(478600001)(53936002)(7696005)(33656002)(6116002)(3846002)(68736007)(81166006)(5660300002)(25786009)(14454004)(229853002)(305945005)(6246003)(7736002)(52536014)(6436002)(86362001)(99286004)(486006)(66066001)(11346002)(9686003)(26005)(55016002)(76116006)(66446008)(66946007)(66556008)(64756008)(66476007)(73956011)(186003)(2906002)(476003)(6506007)(74316002)(4326008)(102836004)(256004)(44832011)(76176011)(71190400001)(71200400001)(446003)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5245;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7bI4a0PdtQ1feER6MlFFX1zFtcA02OjGVRW3u9VTisH1A9xC4q8tDCVAuN40ty74hKUv5GjzK3FgRRzq302zCKYkxhvl44CRL669I7BX7lPbglCPLz02hBFRDd/GHmevFfdx1F7LKL2ODY9oW4FkMXDghR5APOOf8mBXBVhUpfzSRJrlZVnvFLZmJ2IAsNoszfmjcLQ6idrMJj5srYJni428V108hlyXhi9Km+f81GTgZ5+ULzGWYxfliXtYp2HhaF0OHOeutYXx3SqQni045iWcE+9iU7St75EoQOPtMq0l5GAEzFi0fiYYTqZ6L2ChRHgyUmPicLqWJrTzqRK3wJjgV772Tm80FCgj9I3W3wZyy7k3hhtN2/o2SH7Lul4eDjX7Utr04Meo5mtVAHT+Z7sZjw/H9LwiChYU/cJg3O0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b43dad2-9ed6-42ff-fd41-08d6d28e3661
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 01:49:15.7563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5245
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiA+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQg
YS9hcmNoL2FybS9ib290L2R0cy9pbXg3dWxwLmR0c2kNCj4gPiA+ID4gYi9hcmNoL2FybS9ib290
L2R0cy9pbXg3dWxwLmR0c2kgaW5kZXggZmNhNmU1MGYzN2M4Li5lMjk0NGY5OGVhYzYNCj4gPiA+
ID4gMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDd1bHAuZHRzaQ0K
PiA+ID4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9pbXg3dWxwLmR0c2kNCj4gPiA+ID4gQEAg
LTMwLDYgKzMwLDcgQEANCj4gPiA+ID4gICAgICAgICAgICAgICAgIHNlcmlhbDEgPSAmbHB1YXJ0
NTsNCj4gPiA+ID4gICAgICAgICAgICAgICAgIHNlcmlhbDIgPSAmbHB1YXJ0NjsNCj4gPiA+ID4g
ICAgICAgICAgICAgICAgIHNlcmlhbDMgPSAmbHB1YXJ0NzsNCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgIHVzYnBoeTAgPSAmdXNicGh5MTsNCj4gPiA+DQo+ID4gPiBEcm9wIHRoaXMuIFlvdSBzaG91
bGRuJ3QgbmVlZCBhbiBhbGlhcy4NCj4gPiA+DQo+ID4NCj4gPiBJdCBpcyBhIGRlcml2ZWQgVVNC
IFBIWSBhbmQgdXNlZCBvbiBtb3N0IG9mIGkubXggY2hpcGlkZWEgVVNCIGNvbnRyb2xsZXJzLg0K
PiA+IEF0IHRoZSBzb3VyY2UgY29kZSwgd2UgdXNlIGFsaWduZWQgaWQgdG8ga25vdyB0aGUgY29u
dHJvbGxlciBudW1iZXIuDQo+ID4NCj4gPiAgICAgICAgIHJldCA9IG9mX2FsaWFzX2dldF9pZChu
cCwgInVzYnBoeSIpOw0KPiA+ICAgICAgICAgaWYgKHJldCA8IDApDQo+ID4gICAgICAgICAgICAg
ICAgIGRldl9kYmcoJnBkZXYtPmRldiwgImZhaWxlZCB0byBnZXQgYWxpYXMgaWQsIGVycm5vICVk
XG4iLCByZXQpOw0KPiA+ICAgICAgICAgbXhzX3BoeS0+cG9ydF9pZCA9IHJldDsNCj4gDQo+IGZz
bCxhbmF0b3AgcHJvcGVydHkgc2hvdWxkIHByb2JhYmx5IGhhdmUgY2VsbCB0byBzcGVjaWZ5IHRo
aXMuDQo+IA0KDQppbXg3dWxwIGRvZXNuJ3QgaGF2ZSBhbmF0b3AgcGFydCwgdGhlIGFuYWxvZyBm
b3IgaW14N3VscCBpcyBkaWZmZXJlbnQgd2l0aCBpbXg2Lg0KDQo+ID4NCj4gPiA+ID4gICAgICAg
ICB9Ow0KPiA+ID4gPg0KPiA+ID4gPiAgICAgICAgIGNwdXMgew0KPiA+ID4gPiBAQCAtMTMzLDYg
KzEzNCwzNSBAQA0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9
ICJpcGciLCAicGVyIjsNCj4gPiA+ID4gICAgICAgICAgICAgICAgIH07DQo+ID4gPiA+DQo+ID4g
PiA+ICsgICAgICAgICAgICAgICB1c2JvdGcxOiB1c2JANDAzMzAwMDAgew0KPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZzbCxpbXg3dWxwLXVzYiIsICJmc2ws
aW14NnVsLXVzYiIsDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImZz
bCxpbXgyNy11c2IiOw0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHg0
MDMzMDAwMCAweDIwMD47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVw
dHMgPSA8R0lDX1NQSSA0MCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgY2xvY2tzID0gPCZwY2MyIElNWDdVTFBfQ0xLX1VTQjA+Ow0KPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICBmc2wsdXNicGh5ID0gPCZ1c2JwaHkxPjsNCj4gPiA+
DQo+ID4gPiBEb24ndCB1c2UgdGhpcyBmb3IgbmV3IHVzZXJzLiBVc2UgdGhlIHBoeSBiaW5kaW5n
IGluc3RlYWQuDQo+ID4gPg0KPiA+DQo+ID4gSXQgaXMgbm90IGEgbmV3IHVzZXIsIHRoZSBVU0Ig
UEhZIHVzZWQgYXQgaW14N3VscCBpcyB0aGUgc2FtZSB3aXRoIGlteDYncy4NCj4gDQo+IE5ldyBT
b0MgaXMgYSBuZXcgdXNlci4gVGhlIGNoaXBpZGVhIGNvcmUgYWxyZWFkeSBzdXBwb3J0cyB1c2lu
ZyAncGh5cycNCj4gc28geW91IHNob3VsZCBiZSBhYmxlIHRvIGp1c3QgdXNlIHRoZSBjb21tb24g
Y29kZS4NCj4gDQoNClRoYW5rcywgd2lsbCB1c2UgYmVsb3csIGFuZCBjaGFuZ2UgdGhlIGlteCBn
bHVlIGxheWVyIGNvZGUgd2hpY2ggImZzbCx1c2JwaHkiIHBoYW5kbGUgaXMgbWFuZGF0b3J5IG5v
dy4NCg0KcGh5cyA9IDwmdXNicGh5MT47IC8qIGZvciB1c2JvdGcxICovDQphbmQNCiNwaHktY2Vs
bHMgPSA8MD47ICAvKiBmb3IgdXNicGh5MSAqLw0KDQpQZXRlcg0K
