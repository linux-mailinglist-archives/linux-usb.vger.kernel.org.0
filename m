Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 383F01DFD5B
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2020 07:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbgEXF45 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 May 2020 01:56:57 -0400
Received: from mail-eopbgr50064.outbound.protection.outlook.com ([40.107.5.64]:48611
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725782AbgEXF45 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 24 May 2020 01:56:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAg4OuNPMwbp+3eeId0JMB65T223GYBod1cfgjjgXNu39G231UYNey3pKnsAUgN+N/73spkN9/FqtJm5nVn28RPvXlob1zQyze8I6IY/tDAv1z2vrtTF+poUQCVbmVzLw2gmIq7nb4qveIoKQgBD0OAb5Azk76jhL9qB5FGlgXSpDxlbtsOv4Mjmk9ui+m0dZPIp3pHkDnn1bo4+acci6GSFlWRRI1hzKPN8pYad+YqncR3B4Qf8vnIvTQYVXPBZNDSCQ+PoPTYeOZ5U4fkwwFNxTApxCiFhw8W30rQFaimJf3x7b3DPbY0d+ptimLdRHBxRGcFoqqm3SFHMmhzDGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIB9Aqdz+j8GZQ42UwxFUlOkkPlLRvMzkaRwA7EinZ0=;
 b=J/QYyy2KtGyWDmUB0BCcL0dEchrdy9FqTqB1HkaPCMspzX96B4Uwo7qTlZYdycTWHjiZmpUHgPXoc7WktpVKA0OAErdYiWLLuvSKRTrxSFIAmButJl3VSGKM6P+N/9qtntEvxOT183gpXoDv51dTmHdHIheXPssj52pWOBEsmE5WKBn+kTgQcbxhx2PrLkmGxGuTZsBXNy0X0qE59EArq8CZ0IGB3MIVkjIwXnn91dlcYNzp3mOS7I5lka8hJiAsFnHXxf0oeYl36fBc/0rn/FU1owDxqRpAK45JJMb7BCfGzxidPigRuqg3N9UIAoN2hxbVoADb54IzSQYvOwlOiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIB9Aqdz+j8GZQ42UwxFUlOkkPlLRvMzkaRwA7EinZ0=;
 b=OhsA/RkdmAawlvX6Lj9VbNZxQTlqZR5thpMpKnbXGVqg3dx4OmMI80cxY/pSFdzjedOOKyiFTYG0LCUcWAQ7MiS9VlkApuPJCO0jELLfMiZ5+t7zoQ0RZ1ghVhyBB4R/zydJn5jQQtYID4JkN1C/0zqbwu9RJEEMbpO/CwZjm3Q=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6717.eurprd04.prod.outlook.com (2603:10a6:803:129::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Sun, 24 May
 2020 05:56:51 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.3021.027; Sun, 24 May 2020
 05:56:51 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v2 1/9] usb: cdns3: introduce cdns3_set_phy_power API
Thread-Topic: [PATCH v2 1/9] usb: cdns3: introduce cdns3_set_phy_power API
Thread-Index: AQHWMVkWQEQBRgyUu0eBkmmqoSzRxai2fsNg
Date:   Sun, 24 May 2020 05:56:51 +0000
Message-ID: <VE1PR04MB65283CE4D3BE7C6909BFEB6A89B20@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <20200523232304.23976-1-peter.chen@nxp.com>
 <20200523232304.23976-2-peter.chen@nxp.com>
In-Reply-To: <20200523232304.23976-2-peter.chen@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5c6608a5-c368-41db-5431-08d7ffa74159
x-ms-traffictypediagnostic: VE1PR04MB6717:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB67171649E2D343AE4A8A584189B20@VE1PR04MB6717.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0413C9F1ED
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jh6kqDP+l/dNFUhxRbw4gCYJsxBg9FBZMrxNeLqh3gPnC/50j99ef+qzG+ND3OjLY4P2yPAelb3oE9YleKHJ8mEGfdRzNNhFN56bRYojkpPQn3KWH16alkwHRK8TKBh/ZDhD5s9VSmiN9R0/ErVDRanP/8feNHrEecgiWEilxcL7YyEvzdXLVpWkgsat15+OXJ7dmH+MRoHWdwj74pEHwGcHHu/VGiMOGatQ7lfynEQs9raH/M3T9RgptdO6i7wb9oKbye67PtHoV5kl8K2KdQPj6es66BWMAS4YerCjwdqNMNviiVy/oWPgC6RLtGWm489kG4nzGCG9IGUYQ5X3bQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(316002)(2906002)(54906003)(53546011)(6506007)(64756008)(66476007)(8676002)(8936002)(66556008)(186003)(86362001)(66946007)(76116006)(52536014)(44832011)(66446008)(110136005)(55016002)(5660300002)(4326008)(7696005)(9686003)(478600001)(71200400001)(26005)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ibUmJ49qZOuzrHX+F8y0MsgC8lLwj13sbdK/jzN/4xNglmnFcVssBvWqIfpuZUgA6Q6tH3MxjfQvmfM3/gjlIafK2ceh82bsM+aF3W/u/kEBSQ4c5dZFZZM/pBdKNCxSWr+Cu+g2RBqVp9ZQVFkQTo9JS2P8bHBRTGq38h5gEZiKQQTWA6azwsdm16wRE5hXMnM+powSXJu4s1YWc6Uj9xWD1YpaJ9P0TxIJi1K60En/ywTBHph5hZ/1F1M3ca1+XPTG9decJUFDgpWQqwMgvvwcyfAZnXhoeVU/9dOEUJW3xwx/UOCca5RCc8pLzM+w69dd9tI+INE//XCrwyyTcpfxKmU2EfYVf0aWjtL07Slis6ZahqO5xwwMGWUmxtTH8oAqKZ+acYAk6zKHScWiY6bP1wiFX2YbKsqy6cRY3jTlYMYlWvM7AthHOKPx0NDM1UBFI0//K0rhWhPoMW1v1YIckLS9zmntjPlnr0Eo8Io=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6608a5-c368-41db-5431-08d7ffa74159
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2020 05:56:51.5650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b9YyCp8tSzbdg+feA1kfTx/p6KYW6CInNw9xca8fAOkApgi/2kNcwyii8S0Fn3FM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6717
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBldGVyIENoZW4gPHBl
dGVyLmNoZW5AbnhwLmNvbT4NCj4gU2VudDogMjAyMMTqNdTCMjTI1SA3OjIzDQo+IFRvOiBiYWxi
aUBrZXJuZWwub3JnOyBtYXRoaWFzLm55bWFuQGludGVsLmNvbQ0KPiBDYzogbGludXgtdXNiQHZn
ZXIua2VybmVsLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47DQo+IHBhd2Vs
bEBjYWRlbmNlLmNvbTsgcm9nZXJxQHRpLmNvbTsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7
IEp1biBMaQ0KPiA8anVuLmxpQG54cC5jb20+OyBQZXRlciBDaGVuIDxwZXRlci5jaGVuQG54cC5j
b20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2MiAxLzldIHVzYjogY2RuczM6IGludHJvZHVjZSBjZG5z
M19zZXRfcGh5X3Bvd2VyIEFQSQ0KPiANCj4gU2luY2Ugd2UgaGF2ZSBib3RoIFVTQjIgYW5kIFVT
QjMgUEhZcyBmb3IgY2RuczMgY29udHJvbGxlciwgaXQgaXMgYmV0dGVyIHdlIGhhdmUNCj4gYSB1
bml0eSBBUEkgdG8gaGFuZGxlIGJvdGggVVNCMiBhbmQgVVNCMydzIHBvd2VyLCBpdCBjb3VsZCBz
aW1wbGlmeSBjb2RlIGZvciBlcnJvcg0KPiBoYW5kbGluZyBhbmQgZnVydGhlciBwb3dlciBtYW5h
Z2VtZW50IGltcGxlbWVudGF0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgQ2hlbiA8
cGV0ZXIuY2hlbkBueHAuY29tPg0KDQpSZXZpZXdlZC1ieTogSnVuIExpIDxqdW4ubGlAbnhwLmNv
bT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2NkbnMzL2NvcmUuYyB8IDQ0ICsrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNl
cnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9jZG5zMy9jb3JlLmMgYi9kcml2ZXJzL3VzYi9jZG5zMy9jb3JlLmMgaW5kZXgNCj4gMTliYmI1
YjdlNmI2Li5iZmQwOWFhOThjMTIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2NkbnMzL2Nv
cmUuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9jZG5zMy9jb3JlLmMNCj4gQEAgLTM4NCw2ICszODQs
MjggQEAgc3RhdGljIGludCBjZG5zM19yb2xlX3NldChzdHJ1Y3QgdXNiX3JvbGVfc3dpdGNoICpz
dywgZW51bQ0KPiB1c2Jfcm9sZSByb2xlKQ0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQo+IA0KPiAr
c3RhdGljIGludCBjZG5zM19zZXRfcGh5X3Bvd2VyKHN0cnVjdCBjZG5zMyAqY2RucywgYm9vbCBv
bikgew0KPiArCWludCByZXQgPSAwOw0KPiArDQo+ICsJaWYgKG9uKSB7DQo+ICsJCXJldCA9IHBo
eV9wb3dlcl9vbihjZG5zLT51c2IyX3BoeSk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlyZXR1cm4g
cmV0Ow0KPiArDQo+ICsJCXJldCA9IHBoeV9wb3dlcl9vbihjZG5zLT51c2IzX3BoeSk7DQo+ICsJ
CWlmIChyZXQpIHsNCj4gKwkJCXBoeV9wb3dlcl9vZmYoY2Rucy0+dXNiMl9waHkpOw0KPiArCQkJ
cmV0dXJuIHJldDsNCj4gKwkJfQ0KPiArCX0gZWxzZSB7DQo+ICsJCXBoeV9wb3dlcl9vZmYoY2Ru
cy0+dXNiM19waHkpOw0KPiArCQlwaHlfcG93ZXJfb2ZmKGNkbnMtPnVzYjJfcGh5KTsNCj4gKwl9
DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiAgLyoqDQo+ICAgKiBjZG5zM19wcm9i
ZSAtIHByb2JlIGZvciBjZG5zMyBjb3JlIGRldmljZQ0KPiAgICogQHBkZXY6IFBvaW50ZXIgdG8g
Y2RuczMgY29yZSBwbGF0Zm9ybSBkZXZpY2UgQEAgLTQ3NywxNCArNDk5LDEwIEBAIHN0YXRpYyBp
bnQNCj4gY2RuczNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlpZiAo
cmV0KQ0KPiAgCQlnb3RvIGVycjE7DQo+IA0KPiAtCXJldCA9IHBoeV9wb3dlcl9vbihjZG5zLT51
c2IyX3BoeSk7DQo+ICsJcmV0ID0gY2RuczNfc2V0X3BoeV9wb3dlcihjZG5zLCB0cnVlKTsNCj4g
IAlpZiAocmV0KQ0KPiAgCQlnb3RvIGVycjI7DQo+IA0KPiAtCXJldCA9IHBoeV9wb3dlcl9vbihj
ZG5zLT51c2IzX3BoeSk7DQo+IC0JaWYgKHJldCkNCj4gLQkJZ290byBlcnIzOw0KPiAtDQo+ICAJ
c3dfZGVzYy5zZXQgPSBjZG5zM19yb2xlX3NldDsNCj4gIAlzd19kZXNjLmdldCA9IGNkbnMzX3Jv
bGVfZ2V0Ow0KPiAgCXN3X2Rlc2MuYWxsb3dfdXNlcnNwYWNlX2NvbnRyb2wgPSB0cnVlOyBAQCAt
NDk2LDE2ICs1MTQsMTYgQEAgc3RhdGljIGludA0KPiBjZG5zM19wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQ0KPiAgCWlmIChJU19FUlIoY2Rucy0+cm9sZV9zdykpIHsNCj4gIAkJ
cmV0ID0gUFRSX0VSUihjZG5zLT5yb2xlX3N3KTsNCj4gIAkJZGV2X3dhcm4oZGV2LCAiVW5hYmxl
IHRvIHJlZ2lzdGVyIFJvbGUgU3dpdGNoXG4iKTsNCj4gLQkJZ290byBlcnI0Ow0KPiArCQlnb3Rv
IGVycjM7DQo+ICAJfQ0KPiANCj4gIAlyZXQgPSBjZG5zM19kcmRfaW5pdChjZG5zKTsNCj4gIAlp
ZiAocmV0KQ0KPiAtCQlnb3RvIGVycjU7DQo+ICsJCWdvdG8gZXJyNDsNCj4gDQo+ICAJcmV0ID0g
Y2RuczNfY29yZV9pbml0X3JvbGUoY2Rucyk7DQo+ICAJaWYgKHJldCkNCj4gLQkJZ290byBlcnI1
Ow0KPiArCQlnb3RvIGVycjQ7DQo+IA0KPiAgCWRldmljZV9zZXRfd2FrZXVwX2NhcGFibGUoZGV2
LCB0cnVlKTsNCj4gIAlwbV9ydW50aW1lX3NldF9hY3RpdmUoZGV2KTsNCj4gQEAgLTUyMiwxNCAr
NTQwLDExIEBAIHN0YXRpYyBpbnQgY2RuczNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gIAlkZXZfZGJnKGRldiwgIkNhZGVuY2UgVVNCMyBjb3JlOiBwcm9iZSBzdWNjZWVk
XG4iKTsNCj4gDQo+ICAJcmV0dXJuIDA7DQo+IC1lcnI1Og0KPiArZXJyNDoNCj4gIAljZG5zM19k
cmRfZXhpdChjZG5zKTsNCj4gIAl1c2Jfcm9sZV9zd2l0Y2hfdW5yZWdpc3RlcihjZG5zLT5yb2xl
X3N3KTsNCj4gLWVycjQ6DQo+IC0JcGh5X3Bvd2VyX29mZihjZG5zLT51c2IzX3BoeSk7DQo+IC0N
Cj4gIGVycjM6DQo+IC0JcGh5X3Bvd2VyX29mZihjZG5zLT51c2IyX3BoeSk7DQo+ICsJY2RuczNf
c2V0X3BoeV9wb3dlcihjZG5zLCBmYWxzZSk7DQo+ICBlcnIyOg0KPiAgCXBoeV9leGl0KGNkbnMt
PnVzYjNfcGh5KTsNCj4gIGVycjE6DQo+IEBAIC01NTMsOCArNTY4LDcgQEAgc3RhdGljIGludCBj
ZG5zM19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlwbV9ydW50aW1l
X3B1dF9ub2lkbGUoJnBkZXYtPmRldik7DQo+ICAJY2RuczNfZXhpdF9yb2xlcyhjZG5zKTsNCj4g
IAl1c2Jfcm9sZV9zd2l0Y2hfdW5yZWdpc3RlcihjZG5zLT5yb2xlX3N3KTsNCj4gLQlwaHlfcG93
ZXJfb2ZmKGNkbnMtPnVzYjJfcGh5KTsNCj4gLQlwaHlfcG93ZXJfb2ZmKGNkbnMtPnVzYjNfcGh5
KTsNCj4gKwljZG5zM19zZXRfcGh5X3Bvd2VyKGNkbnMsIGZhbHNlKTsNCj4gIAlwaHlfZXhpdChj
ZG5zLT51c2IyX3BoeSk7DQo+ICAJcGh5X2V4aXQoY2Rucy0+dXNiM19waHkpOw0KPiAgCXJldHVy
biAwOw0KPiAtLQ0KPiAyLjE3LjENCg0K
