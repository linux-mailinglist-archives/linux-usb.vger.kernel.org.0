Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A28811E0504
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 05:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388505AbgEYDD4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 May 2020 23:03:56 -0400
Received: from mail-eopbgr50041.outbound.protection.outlook.com ([40.107.5.41]:45826
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388178AbgEYDD4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 24 May 2020 23:03:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3KYvI1IRA0dbGfXCji2niXGLNawUdW9w4niTRAWqCI/P5VCnLdeLOO8k8igwa/+ujC7+YJS75PKf05cB74yk8a2B+frWZT1vJHugKUu+kOcOCunjzUyYUFHsyvT1bGRlp4ins3NMUMELcaYlqswTSSp/4PxaiZ1d0I6j0qa2pwqqvoQkenUfSd0y+LFuy5lO6TBWUmo4keIqPLMCz90o5lGSzKcoGeSPTSBIeXIA/fxz61mLqdfgtfcrON4sLDP+WPriZC0LS4Kq3ifQ8WnddwO+zlKRMrF/JoZK7qMok76cEMUdqA2BzisJH4j3ywKHf7tmrOqOHptWrMtavzBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1wPgt3te+RvCUfvw1gWrSvcqtRmC1HipKMRgDzBW0E=;
 b=hrWkoEalYgWHy2zAQa+jnm71rIDTZVg9gUh6lJ+E2JbOpsJyhYFILKzx3whheT2YGGsF/+MqBkX9xNiUcmC09Hy57QHeLThxywSIaqpCiqok/ysnEWEEc5vBaXUFu61RhbJovcxYmm01TDz0dokaZ6OtKNQCLsk3mJf6vdDqxdolfxXD6wJmuzwE1dGtlHs7DJakPcWbVUCD2+sjU6gdteFxfTdUCmL17fkXfDHPxAULtqRUkWuhUuPP62TUAyJ7D3uN4BCMO7657GlxLirO7RFk9TWvQbjKYEf4J2E7tqAldo/0X/3w3m/Xf6DsrFyDOPrerK7JxVDnHKcz0cLTJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1wPgt3te+RvCUfvw1gWrSvcqtRmC1HipKMRgDzBW0E=;
 b=ce7D6vWZFVvZPMGQwZQQMJZks0nkWJM4IJ4M6BZ6Q26EJagZqNy7xXRijwroa8FoJjco/x+744hRi95bjd8agHxLUD/8Mhpv4GBn5pa303QLthOXr9GSkoXtx8P0EmDi6UNoNntP1fT8bpGq64nz5Pws4iJ+nOpvbjRhnZsB4Mw=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7109.eurprd04.prod.outlook.com (2603:10a6:20b:117::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.26; Mon, 25 May
 2020 03:03:54 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 03:03:53 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 7/9] usb: host: xhci-plat: add priv flag for
 skip_phy_initialization
Thread-Topic: [PATCH v2 7/9] usb: host: xhci-plat: add priv flag for
 skip_phy_initialization
Thread-Index: AQHWMVkhNTTKDE+VhEWiCwuIqij7b6i22oUAgAFFJAA=
Date:   Mon, 25 May 2020 03:03:53 +0000
Message-ID: <20200525030418.GC16948@b29397-desktop>
References: <20200523232304.23976-1-peter.chen@nxp.com>
 <20200523232304.23976-8-peter.chen@nxp.com>
 <VE1PR04MB6528C7F33B4C35AF9DBCE84489B20@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6528C7F33B4C35AF9DBCE84489B20@VE1PR04MB6528.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6c0513f5-b3cc-44c7-6251-08d800584228
x-ms-traffictypediagnostic: AM7PR04MB7109:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB710944B12BE35873C472DC438BB30@AM7PR04MB7109.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SIMaEvRbexmNWjhDmOXXfsUCYn+kQIGLZRcHFOmDFexWmFKNxyO+lP8Nt/uC7rWFnb8D4JLfGBYxWsUXbp7I0u+zC5qIyZWd8ukckesIrtEMnqu1tL31nWekDFGZJ5coW46IO3cvXx3zrmE24eYVHsL4Tky3MyRzPtNLxfJ0mx301yDH+chOKIEY5buAglGORmbVlpbEu35k4zKumGfH/u3MA3/2fwC46QzSP0x5AFALzA1TDzd96TaKUAJzd+OTT/Ic2HgCM9Uqs4gblMFkzaQFVDZSCPUeaBr656+ibHjqmpB9NcRPRgoTRpKSWKND1PYWF1cA2M4hUf49NN98wQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(376002)(396003)(366004)(39860400002)(346002)(136003)(33656002)(86362001)(8676002)(6512007)(9686003)(44832011)(186003)(54906003)(478600001)(8936002)(71200400001)(33716001)(6636002)(76116006)(6862004)(6486002)(4326008)(2906002)(5660300002)(316002)(53546011)(91956017)(66946007)(64756008)(1076003)(66556008)(6506007)(26005)(66446008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: OpHzjWR3028cRm7BL5EiX2M8I2VpsoOBwAofPBxrnrgrUGgH6zuFsALWlaZVGrdAcf1RBEzOZXVw+qKDubq7fcro5YiPZ0mRfgeavpaJc5uGoS16xpnu1VZczPv2XeJcxCXWgKx/04U6eEuBr1cD2cgUVAwDx5HD8jjPR5hIaV6iSq9WectCsVEfWybub5vAvz8MuVg6qm3omBwtdFTTap8GE/i2RS6xmPU9oHPwVN2EmHy2h/KAS6rlkLEI6G67JrrTEE576EliPezwMPGEuQ+xuA7J9OXMFY7ia8sEe75PwjIFg7Hdunml+UHyTiqA+D+IpyE1/PE5iY7PG6AC3CoBX4z5AQ8pSFYqMZ8CyhOPl6JMlQJERLvHGG60tMyA9epir6H8gMS1IOVvsubXpsCDXGs3ExQNQmaINmksdLnWVc5jisUHSotQFb4duZZ53J518k5DvT5clkWH2+bPfFZ9+C8GlUnFzJ2l25QQ9AI=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DE1F5044EEC8F419E5F12F6C06C9B8F@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0513f5-b3cc-44c7-6251-08d800584228
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 03:03:53.8486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fz5g33XcX/DSwDNC53ahWo4UP+AQAinpfeJR/4j7VlqGv4n7AYNU0l2PMmAWK2mir/LcoS41MRc4jKDc+dCHSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7109
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMjAtMDUtMjQgMDc6NDA6MzQsIEp1biBMaSB3cm90ZToNCj4gSGkNCj4gDQo+ID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBQZXRlciBDaGVuIDxwZXRlci5jaGVuQG54
cC5jb20+DQo+ID4gU2VudDogMjAyMOW5tDXmnIgyNOaXpSA3OjIzDQo+ID4gVG86IGJhbGJpQGtl
cm5lbC5vcmc7IG1hdGhpYXMubnltYW5AaW50ZWwuY29tDQo+ID4gQ2M6IGxpbnV4LXVzYkB2Z2Vy
Lmtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+Ow0KPiA+IHBhd2Vs
bEBjYWRlbmNlLmNvbTsgcm9nZXJxQHRpLmNvbTsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7
IEp1biBMaQ0KPiA+IDxqdW4ubGlAbnhwLmNvbT47IFBldGVyIENoZW4gPHBldGVyLmNoZW5Abnhw
LmNvbT4NCj4gPiBTdWJqZWN0OiBbUEFUQ0ggdjIgNy85XSB1c2I6IGhvc3Q6IHhoY2ktcGxhdDog
YWRkIHByaXYgZmxhZyBmb3INCj4gPiBza2lwX3BoeV9pbml0aWFsaXphdGlvbg0KPiA+IA0KPiA+
IFNvbWUgRFJEIGNvbnRyb2xsZXJzIChlZywgZHdjMyAmIGNkbnMzKSBoYXZlIFBIWSBtYW5hZ2Vt
ZW50IGF0IHRoZWlyIG93biBkcml2ZXINCj4gPiB0byBjb3ZlciBib3RoIGRldmljZSBhbmQgaG9z
dCBtb2RlLCBzbyBhZGQgb25lIHByaXYgZmxhZyBmb3Igc3VjaCB1c2VycyB0byBza2lwDQo+ID4g
UEhZIG1hbmFnZW1lbnQgZnJvbSBIQ0QgY29yZS4NCj4gDQo+IENhbiB0aGlzIGZsYWcgYmUgc2V0
IGRpcmVjdGx5IGluIF9fY2RuczNfaG9zdF9pbml0KCk/DQoNCk5vLCBzaW5jZSBib3RoIEhDRCBj
cmVhdGlvbiBhbmQgdXNiX2FkZF9oY2QgaW52b2tpbmcgYXJlIGF0DQp4aGNpX3BsYXRfcHJvYmUs
IGdsdWUgbGF5ZXIgaGFzIG5vIGNoYW5jZSB0byBjaGFuZ2UgaGNkIGZsYWdzLg0KDQpQZXRlcg0K
PiANCj4gTGkgSnVuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgQ2hlbiA8cGV0ZXIu
Y2hlbkBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5j
IHwgOCArKysrKystLSAgZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuaCB8IDEgKw0KPiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiANCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuYyBiL2RyaXZlcnMvdXNi
L2hvc3QveGhjaS1wbGF0LmMgaW5kZXgNCj4gPiAwM2Q2YmJlNTE5MTkuLmEzZDZjYjQ2NDE4NiAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jDQo+ID4gKysrIGIv
ZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuYw0KPiA+IEBAIC0xODMsNiArMTgzLDggQEAgc3Rh
dGljIGludCB4aGNpX3BsYXRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
PiAgCXN0cnVjdCB1c2JfaGNkCQkqaGNkOw0KPiA+ICAJaW50CQkJcmV0Ow0KPiA+ICAJaW50CQkJ
aXJxOw0KPiA+ICsJc3RydWN0IHhoY2lfcGxhdF9wcml2CSpwcml2ID0gTlVMTDsNCj4gPiArDQo+
ID4gDQo+ID4gIAlpZiAodXNiX2Rpc2FibGVkKCkpDQo+ID4gIAkJcmV0dXJuIC1FTk9ERVY7DQo+
ID4gQEAgLTI4MCw4ICsyODIsNyBAQCBzdGF0aWMgaW50IHhoY2lfcGxhdF9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAJCXByaXZfbWF0Y2ggPSBkZXZfZ2V0X3BsYXRk
YXRhKCZwZGV2LT5kZXYpOw0KPiA+IA0KPiA+ICAJaWYgKHByaXZfbWF0Y2gpIHsNCj4gPiAtCQlz
dHJ1Y3QgeGhjaV9wbGF0X3ByaXYgKnByaXYgPSBoY2RfdG9feGhjaV9wcml2KGhjZCk7DQo+ID4g
LQ0KPiA+ICsJCXByaXYgPSBoY2RfdG9feGhjaV9wcml2KGhjZCk7DQo+ID4gIAkJLyogSnVzdCBj
b3B5IGRhdGEgZm9yIG5vdyAqLw0KPiA+ICAJCSpwcml2ID0gKnByaXZfbWF0Y2g7DQo+ID4gIAl9
DQo+ID4gQEAgLTMyOSw2ICszMzAsOSBAQCBzdGF0aWMgaW50IHhoY2lfcGxhdF9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+IA0KPiA+ICAJaGNkLT50cGxfc3VwcG9ydCA9
IG9mX3VzYl9ob3N0X3RwbF9zdXBwb3J0KHN5c2Rldi0+b2Zfbm9kZSk7DQo+ID4gIAl4aGNpLT5z
aGFyZWRfaGNkLT50cGxfc3VwcG9ydCA9IGhjZC0+dHBsX3N1cHBvcnQ7DQo+ID4gKwlpZiAocHJp
diAmJiBwcml2LT5za2lwX3BoeV9pbml0aWFsaXphdGlvbikNCj4gPiArCQloY2QtPnNraXBfcGh5
X2luaXRpYWxpemF0aW9uID0gMTsNCj4gPiArDQo+ID4gIAlyZXQgPSB1c2JfYWRkX2hjZChoY2Qs
IGlycSwgSVJRRl9TSEFSRUQpOw0KPiA+ICAJaWYgKHJldCkNCj4gPiAgCQlnb3RvIGRpc2FibGVf
dXNiX3BoeTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuaCBi
L2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmggaW5kZXgNCj4gPiAxZmIxNDlkMWZiY2UuLjg4
MjVlOGViMjhkNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5o
DQo+ID4gKysrIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuaA0KPiA+IEBAIC0xMyw2ICsx
Myw3IEBADQo+ID4gIHN0cnVjdCB4aGNpX3BsYXRfcHJpdiB7DQo+ID4gIAljb25zdCBjaGFyICpm
aXJtd2FyZV9uYW1lOw0KPiA+ICAJdW5zaWduZWQgbG9uZyBsb25nIHF1aXJrczsNCj4gPiArCXVu
c2lnbmVkIGludCBza2lwX3BoeV9pbml0aWFsaXphdGlvbjoxOw0KPiA+ICAJdm9pZCAoKnBsYXRf
c3RhcnQpKHN0cnVjdCB1c2JfaGNkICopOw0KPiA+ICAJaW50ICgqaW5pdF9xdWlyaykoc3RydWN0
IHVzYl9oY2QgKik7DQo+ID4gIAlpbnQgKCpzdXNwZW5kX3F1aXJrKShzdHJ1Y3QgdXNiX2hjZCAq
KTsNCj4gPiAtLQ0KPiA+IDIuMTcuMQ0KPiANCg0KLS0gDQoNClRoYW5rcywNClBldGVyIENoZW4=
