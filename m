Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBD51657A7
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2020 07:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgBTGbW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Feb 2020 01:31:22 -0500
Received: from mail-db8eur05on2050.outbound.protection.outlook.com ([40.107.20.50]:27002
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726393AbgBTGbV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Feb 2020 01:31:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuxKgk9GwpsNwSX4oXqyPURjjOOK627d7wbzb3wNpehTLUHOdHMPjcD2u+CSg/oM5HgqIix1Jeyh70Pqfwv03OtV0/Kl9xBqhMADZLZXQA5oOQxw19G/3Gm6OVUT6yBcLVQ0/+uZx+srLK/5weg0c85hODDu8fPQcwKbrONp2CDv67obo04wEN2CcMAogOruu44Mbjm5JmtZLh3fFM+rMCOjcyjsz6htnsKOCAI302xmKYg9Xrp0/p109vUXb0H5idEESqPqpP7dggvnaqo2VRU5cX89WypsMAAVhZDTxwcRLhGmlVT2kvPddnUsjkXJZtzTbrc3VP2EyFPHGwm2ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHxNgIkMloWxt02CgGvCNu507NlnInwwfSdahu10dAA=;
 b=GWvPDBRIEzAnsUL/IHveuZV3FczwI50FcIXizM+nOZNjmW28TYU1lAe6UkmvVUx6gnzUKcqfGZHF8aos+tCgcpyzF7cP8cBsVdwcEz1SpFlhYnGncWZ0eWbfIhxUSxTjcOQ4BgrPy9cAmCr28Oob5NZM6jx3sEPHPACfQDeMTDIX3ovsMLThZZGgqCSol16+tihJNmKd4wFtwLeQIu685NvXs9dLiM/Qimmtgst322x5bOj/4jQan4y0qMZ6DFepOciM412w1m1axVUIxGH3BSJwI6Qq+4fNkhQX0qSjr8M5ZdP90qwfo3dkIIdiu0D7gdwJWbUpDwwief29NId5RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHxNgIkMloWxt02CgGvCNu507NlnInwwfSdahu10dAA=;
 b=b7G1ft9m1eBfW/p01tuDGWf1LVr2Z7sBJIpoSU6YhaNCnavfBBUpm76l67f/eFI6JjYYER4GjUSRvmLr+HO3e+YUS+M6B2vVFzpulHyWGifGqFRLzYggWSp3eGNCOgT214SGJe/bW/2wGvxoHwtkMzX8D8lTQkhHuOCuUZZIAuY=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.235.146) by
 VE1PR04MB6560.eurprd04.prod.outlook.com (20.179.234.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Thu, 20 Feb 2020 06:31:18 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::ccb0:7d6d:adfa:423c]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::ccb0:7d6d:adfa:423c%4]) with mapi id 15.20.2729.033; Thu, 20 Feb 2020
 06:31:18 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>,
        Peter Chen <peter.chen@nxp.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH] usb: host: xhci-plat: add XHCI_MISSING_CAS quirk
Thread-Topic: [PATCH] usb: host: xhci-plat: add XHCI_MISSING_CAS quirk
Thread-Index: AQHV50tVUicR6IQm20awkZ0QLiZyBagjlLUA
Date:   Thu, 20 Feb 2020 06:31:18 +0000
Message-ID: <VE1PR04MB65289878A84E662D6CCAF13089130@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <20200219173727.9882-1-martin.kepplinger@puri.sm>
In-Reply-To: <20200219173727.9882-1-martin.kepplinger@puri.sm>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c0dd0801-03b3-4934-91e6-08d7b5ce7e34
x-ms-traffictypediagnostic: VE1PR04MB6560:|VE1PR04MB6560:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6560C81BB84DACD37B2BBEF189130@VE1PR04MB6560.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(189003)(199004)(9686003)(53546011)(71200400001)(186003)(55016002)(26005)(6506007)(4326008)(33656002)(7696005)(2906002)(86362001)(8676002)(81166006)(81156014)(8936002)(478600001)(52536014)(110136005)(54906003)(66556008)(66476007)(44832011)(76116006)(66446008)(64756008)(316002)(5660300002)(66946007);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6560;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vVUfKywdV4cPMGsW88omNJHux9JM75bWUaEDZ4Jps24wUG8/tvLtU2jNRu3Vs3ocRUC9pKO5CrcCAIYEB7lYNGBhRmzRFgp8X/VCXKbCf7epa5ZBOIL4L+bcExACvFU9coXyVONY0JFInZCgZObE5F/1Uoig4JcU2oGKpcKlsGwgQwXHkPARpKSBdaxUr3IW0pmEDCM5ZNR3P+DAuEAfr/mK51TjrXsrVe7fPrS8J+ZAIlrme6gigLelOU/42DQXizVSkUffv8i4XDCxOPNBnAPr/w0fzmUwenN5iBK3rtiLkr9BxVLW5t/gCeKbLw9d7lUjgXgkFZEsN4/eMQtiNrSlrGJ7HJmcbmVuaUFj1x+QKtu9ZmOi4CpZlGLdG4OG+RepROc6cgrk0opKwmPQWNnaFq8KXw/ZZz0fUr3HblQVcDCBveEoBLMl8MMlLi2C
x-ms-exchange-antispam-messagedata: B+TGa8vXHxHlxCDztQGqRJFCehL610dOWbA6QdjiL7FkRkIHsvrsq5U32slNEQS1EQQrJQHFveFijUSAwNUQ8v0QdmzTYREVxUNnNLxq/9c8ZBGJQeLFjmM20HHiltEnbvHNxbKrkxswtLDBbP2KnA==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0dd0801-03b3-4934-91e6-08d7b5ce7e34
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 06:31:18.0929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oGI/u45jquLpBmefHuT0wmjalms92HNlVP7sMBBGjzdVztw1gU9EZEZn/vW2jfuU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6560
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJ0aW4gS2VwcGxpbmdlciA8
bWFydGluLmtlcHBsaW5nZXJAcHVyaS5zbT4NCj4gU2VudDogMjAyMMTqMtTCMjDI1SAxOjM3DQo+
IFRvOiBKdW4gTGkgPGp1bi5saUBueHAuY29tPjsgUGV0ZXIgQ2hlbiA8cGV0ZXIuY2hlbkBueHAu
Y29tPjsNCj4gbWF0aGlhcy5ueW1hbkBpbnRlbC5jb20NCj4gQ2M6IGxpbnV4LXVzYkB2Z2VyLmtl
cm5lbC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBBbnNvbiBIdWFuZw0K
PiA8YW5zb24uaHVhbmdAbnhwLmNvbT47IHNoYXduZ3VvQGtlcm5lbC5vcmc7IGtlcm5lbEBwZW5n
dXRyb25peC5kZQ0KPiBTdWJqZWN0OiBbUEFUQ0hdIHVzYjogaG9zdDogeGhjaS1wbGF0OiBhZGQg
WEhDSV9NSVNTSU5HX0NBUyBxdWlyaw0KPiANCj4gRnJvbTogTGkgSnVuIDxqdW4ubGlAbnhwLmNv
bT4NCj4gDQo+IGkuTVg4TVEgVVNCMyBob3N0IG5lZWRzIFhIQ0lfTUlTU0lOR19DQVMgcXVpcmsg
dG8gd2FybSByZXNldCB0aGUgcG9ydCB0byBlbnVtIHRoZQ0KPiBVU0IzIGRldmljZSBwbHVnZ2Vk
IGluIHdoaWxlIHN5c3RlbSBzbGVlcCwgYXMgdGhlIHBvcnQgc3RhdGUgaXMgc3R1Y2sgaW4gcG9s
bGluZw0KPiBtb2RlIGFmdGVyIHJlc3VtZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IExpIEp1biA8
anVuLmxpQG54cC5jb20+DQo+IEFja2VkLWJ5OiBQZXRlciBDaGVuIDxwZXRlci5jaGVuQG54cC5j
b20+DQo+IC0tLQ0KPiANCj4gSGksDQo+IA0KPiBCZWNhdXNlIHJlc3VtZSBmcm9tIFMzIHN1c3Bl
bmQgaXMgYnJva2VuIGZvciBtZSBvbiBpbXg4bXEsIEkgc3R1bWJsZWQgdXBvbiB0aGlzDQo+IHBh
dGNoIGluIE5YUCdzIGxpbnV4IHRyZWUuIChQbGVhc2Ugbm90ZSB0aGF0IEknbSBub3QgdGhlIGF1
dGhvciBhbmQgSSd2ZSBub3QgeWV0DQo+IHB1dCBteSBTb0IgdGFnIHVuZGVyIGl0KS4gVGhpcyBp
cyBqdXN0IGENCj4gcXVlc3Rpb246DQo+IA0KPiBUaGlzIHBhdGNoIChhbmQgdGhlIGRvY3MpIGNs
ZWFybHkgaXMgbWlzc2luZyBpbiBtYWlubGluZSBMaW51eCBiZWNhdXNlIHRoZSBpbXg4bXENCj4g
ZGV2aWNldHJlZSBkZXNjcmlwdGlvbiBpbmNsdWRlcyBpdCAod2hpY2ggZG9lcyBub3RoaW5nIG5v
dykuDQo+IA0KPiBJJ3ZlIHRlc3RlZCB0aGlzIGFuZCB0aGlzIHBhcnRpY3VsYXIgYWRkaXRpb24g
ZG9lc24ndCBmaXggbXkgcHJvYmxlbToNCj4gDQo+IFsgICA4NC4yNTc1MzhdIGlteDhtcS11c2It
cGh5IDM4MWYwMDQwLnVzYi1waHk6IGJ1cyByZXN1bWUNCj4gWyAgIDg0LjI2MzE5NV0gaW14OG1x
LXVzYi1waHkgMzgyZjAwNDAudXNiLXBoeTogYnVzIHJlc3VtZQ0KPiBbICAgODQuMjY4ODk4XSBk
d2MzIDM4MTAwMDAwLnVzYjogZHJpdmVyIHJlc3VtZQ0KPiANCj4gZHVyaW5nIHJlc3VtZSBmcm9t
IFMzIHN1c3BlbmQsIGhlcmUgaXQgc3RpbGwgaGFuZ3MuDQoNCklzIHlvdXIgcHJvYmxlbSBhIHN5
c3RlbSBoYW5nPyBJZiB5ZXMsIHRoaXMgbWF5IGFub3RoZXIgaXNzdWUsDQp3aGVyZSB0aGUgaGFu
ZyBoYXBwZW5zPyBkd2MzX3Jlc3VtZV9jb21tb24oKT8NCg0KVGhlIHF1ZXN0aW9uIHBhdGNoIGlz
IHRvIGdpdmUgYSB3YXJtIHJlc2V0IGZvciBjb25uZWN0ZWQgVVNCDQpkZXZpY2UgaWYgdGhlIGxp
bmsgc3RhdGUgaXMgbm90IGNvbm5lY3QvQ0FTIGFmdGVyIHN5c3RlbSByZXN1bWUsDQpvdGhlcndp
c2UgaG9zdCB3aWxsIHdhaXQgMnMgZm9yIGRldmljZSBhcHBlYXI6DQoNClsgICA0NC44MzQ4MzFd
IHVzYiAyLTE6IFdhaXRlZCAyMDAwbXMgZm9yIENPTk5FQ1QNCi4uLg0KWyAgIDQ1LjA1NTcxOF0g
UE06IHJlc3VtZSBkZXZpY2VzIHRvb2sgMy4xMzIgc2Vjb25kcw0KDQpJIHdpbGwgcG9zdCB0aGlz
IHBhdGNoIGFuZCBkb2ModG8gYmUgdXBkYXRlZCkgdG8gdXBzdHJlYW0gbGF0ZXIuDQoNCkxpIEp1
bg0KPiANCj4gV2hhdCBlbHNlIGNvdWxkIGJlIG1pc3NpbmcgaGVyZT8gSSdtIHVzaW5nIG1haW5s
aW5lIExpbnV4IG9ubHkgb2YgY291cnNlLg0KPiANCj4gdGhhbmtzLA0KPiANCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG1hcnRpbg0KPiANCj4gDQo+IA0KPiAgZHJpdmVycy91c2IvaG9z
dC94aGNpLXBsYXQuYyB8IDQgKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmMgYi9kcml2
ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jIGluZGV4DQo+IGQ5MGNkNWVjMDljZi4uNDY1NTAxNmVh
ZjQ1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jDQo+ICsrKyBi
L2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmMNCj4gQEAgLTI5MSw2ICsyOTEsMTAgQEAgc3Rh
dGljIGludCB4aGNpX3BsYXRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
DQo+ICAJCWRldmljZV9wcm9wZXJ0eV9yZWFkX3UzMih0bXBkZXYsICJpbW9kLWludGVydmFsLW5z
IiwNCj4gIAkJCQkJICZ4aGNpLT5pbW9kX2ludGVydmFsKTsNCj4gKw0KPiArCQlpZiAoZGV2aWNl
X3Byb3BlcnR5X3JlYWRfYm9vbCh0bXBkZXYsDQo+ICsJCQkJCSAgICAgICJ1c2IzLXJlc3VtZS1t
aXNzaW5nLWNhcyIpKQ0KPiArCQkJeGhjaS0+cXVpcmtzIHw9IFhIQ0lfTUlTU0lOR19DQVM7DQo+
ICAJfQ0KPiANCj4gIAloY2QtPnVzYl9waHkgPSBkZXZtX3VzYl9nZXRfcGh5X2J5X3BoYW5kbGUo
c3lzZGV2LCAidXNiLXBoeSIsIDApOw0KPiAtLQ0KPiAyLjIwLjENCg0K
