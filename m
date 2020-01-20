Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5C31421DA
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 04:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729188AbgATDEy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jan 2020 22:04:54 -0500
Received: from mail-eopbgr80073.outbound.protection.outlook.com ([40.107.8.73]:11682
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729011AbgATDEy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 19 Jan 2020 22:04:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/tgkYLg1ahe7uZfXmFEYip3peFsCzlDRfoPw64KChX+XKRkm3t1JS9e7Jvom8HT7LXjiHVK1RTVkA8q+hHk2UToCp3/5wbuD4U8YA5WOMAKUg6gZmjE5T1lNVqROvkIrIm5ELBCKm9IHuVbGCIx1XJYiJoPaX7qSpTosCtb4udlkWyX84E8KpQ6lLzcPCkGqMh6tl8PP6BXK1p+5nF1xWzRuL4tdVWtJ/QOO++UnuRilffLYbGsjoKM+kUD601yIHWBjis/EXnXSP7Fetz5n86G6CPzNTuuzBdQYdcqUwbZgrbRYoK2hYstygkHvUy8ILz4medZ0rtiFiWYQcBgcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5v7GaNkpJZiUKT+DF0i6T8sotNjFqWoY9rwcKZx4cY=;
 b=TcoyyWVViIs0sSQ1iP9WTa5c2xaxv8qdBdZKZSF025vTP+4KO+pgynvqgB30tKXIzW0IJrafpDDz6eFwLalWzshjsIk5Zkfy0uKODGw1ildo928Sxj+NoggFJprWLo7VvNV1B0jPdE/eIQz6vXWvr2g2ABjUfADtb7MbmI1sS+6b5iij33H9uvHY2HCVP0Vc/jZynB7We/pRmyCAyVr6pyGZb+VJ+TpklCgIEzh5MuXxfXk9q66Zgds+EAsYRGdSs1znx1Qx39Sswo6XjbVS/3uYHxvFMg9cJnY/V5e9e4oSZ4oJkuuAmkyr888Wf7/Rjm0n9KGeNRddpj0TVlCxvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5v7GaNkpJZiUKT+DF0i6T8sotNjFqWoY9rwcKZx4cY=;
 b=KjhS6aeZRvM/uLolectxu851aU/zTlKDYXPw8Kb5S4b3YoO0/TYVXKnVG7Q5FuwFNv13bE5spkhomuLmgRw7Eg3X9ltph5dH4aoLdTX0+6rOYZzkSgl31x5f5q0TmhsOJF5C/YV/iSnVtYKqMg64yYPYFtXl96gtvRDNJyM5XNQ=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.235.146) by
 VE1PR04MB6381.eurprd04.prod.outlook.com (20.179.232.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.21; Mon, 20 Jan 2020 03:04:50 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3%7]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 03:04:50 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] usb: typec: tcpci: mask event interrupts when remove
 driver
Thread-Topic: [PATCH] usb: typec: tcpci: mask event interrupts when remove
 driver
Thread-Index: AQHVzreK9AEzUagS3kq1GZTDoGwG96fyFaaAgADJJcA=
Date:   Mon, 20 Jan 2020 03:04:49 +0000
Message-ID: <VE1PR04MB6528346D8F90E1FE122FCD1289320@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1579431309-10265-1-git-send-email-jun.li@nxp.com>
 <6eca1c7d-71c9-6b55-3f14-e9d984f6fca9@roeck-us.net>
In-Reply-To: <6eca1c7d-71c9-6b55-3f14-e9d984f6fca9@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
x-originating-ip: [92.121.36.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 98c69fdf-5cc7-49fa-0b99-08d79d558383
x-ms-traffictypediagnostic: VE1PR04MB6381:|VE1PR04MB6381:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB638101060381C171A0C96A2B89320@VE1PR04MB6381.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:972;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(189003)(199004)(81166006)(26005)(55016002)(8676002)(76116006)(186003)(8936002)(53546011)(478600001)(33656002)(6506007)(9686003)(81156014)(2906002)(44832011)(4326008)(54906003)(110136005)(86362001)(316002)(71200400001)(7696005)(5660300002)(52536014)(66556008)(66946007)(66446008)(64756008)(66476007);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6381;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: adPx0z7POZtZk3e1K9CnQmP75tExa/Lz4jyWPgp4i8g+ytnKeiO2+ThxwnYC/evzZ1OHRhGPxOFf3NFAxpmz4zHyQGN7d6+mL9IgAA30Wlg8YEJkv1pIBEpfzJ+qKUNrpYlKCcJKZHJz6uFhJPHgiIjNEjYPT1zez5ALpyZXsfaMXRn9pkP/SuKGfYwhDwKczaioLhiSP0ksa3gLU8yndPz/75QRohmYAI6van1r8Z0dnZyztz9AVe8u1+qkp5t5dL9PK/Kxr5qYdvsnWMZqaFWaBwGIbAgU53AQXL1NGfwC/ss6QzcasNpg1Fjn1jygstmbujPrRSC1MtlucvEyD7pIU5naqLSo5FSyIQFnBHrJQrR53KNGHNV3OBYxy7dWFATbQD4EagdLEo/f0fPiaMjgxT5kyvNyxNadt30wxCuRjP/uF48Qy4GOR4R6Fg39
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98c69fdf-5cc7-49fa-0b99-08d79d558383
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 03:04:49.8670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jHeO8qWKIMfKsMumHBlRUu+WR3GXrAyyi8EMGGHg81BcWrNpQZXh4qUVXa/RRoEu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6381
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgR3VlbnRlciwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVu
dGVyIFJvZWNrIDxncm9lY2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sN
Cj4gU2VudDogMjAyMOW5tDHmnIgxOeaXpSAyMzowMw0KPiBUbzogSnVuIExpIDxqdW4ubGlAbnhw
LmNvbT47IGhlaWtraS5rcm9nZXJ1c0BsaW51eC5pbnRlbC5jb20NCj4gQ2M6IGdyZWdraEBsaW51
eGZvdW5kYXRpb24ub3JnOyBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnOyBkbC1saW51eC1pbXgN
Cj4gPGxpbnV4LWlteEBueHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB1c2I6IHR5cGVj
OiB0Y3BjaTogbWFzayBldmVudCBpbnRlcnJ1cHRzIHdoZW4gcmVtb3ZlDQo+IGRyaXZlcg0KPiAN
Cj4gT24gMS8xOS8yMCAyOjU5IEFNLCBKdW4gTGkgd3JvdGU6DQo+ID4gVGhpcyBpcyB0byBwcmV2
ZW50IGFueSBwb3NzaWJsZSBldmVudHMgZ2VuZXJhdGVkIHdoaWxlIHVucmVnaXN0ZXIgdHBjbQ0K
PiA+IHBvcnQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMaSBKdW4gPGp1bi5saUBueHAuY29t
Pg0KPiANCj4gRml4ZXM6IDc0ZTY1NmQ2YjA1NTEgKCJzdGFnaW5nOiB0eXBlYzogVHlwZS1DIFBv
cnQgQ29udHJvbGxlciBJbnRlcmZhY2UNCj4gZHJpdmVyICh0Y3BjaSkiKQ0KDQpUaGFua3MsIEkg
d2lsbCBhZGQgdGhlIHN0YWJsZSB0YWcuDQo+IA0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy91c2Iv
dHlwZWMvdGNwbS90Y3BjaS5jIHwgOCArKysrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3R5cGVjL3Rj
cG0vdGNwY2kuYw0KPiA+IGIvZHJpdmVycy91c2IvdHlwZWMvdGNwbS90Y3BjaS5jIGluZGV4IGMx
ZjcwNzMuLjNiNDJlZjggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2IvdHlwZWMvdGNwbS90
Y3BjaS5jDQo+ID4gKysrIGIvZHJpdmVycy91c2IvdHlwZWMvdGNwbS90Y3BjaS5jDQo+ID4gQEAg
LTU4MSw2ICs1ODEsMTQgQEAgc3RhdGljIGludCB0Y3BjaV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVu
dCAqY2xpZW50LA0KPiA+ICAgc3RhdGljIGludCB0Y3BjaV9yZW1vdmUoc3RydWN0IGkyY19jbGll
bnQgKmNsaWVudCkNCj4gPiAgIHsNCj4gPiAgIAlzdHJ1Y3QgdGNwY2lfY2hpcCAqY2hpcCA9IGky
Y19nZXRfY2xpZW50ZGF0YShjbGllbnQpOw0KPiA+ICsJdTE2IHZhbCA9IDA7DQo+ID4gKwlpbnQg
ZXJyOw0KPiA+ICsNCj4gPiArCS8qIERpc2FibGUgY2hpcCBpbnRlcnJ1cHRzIGJlZm9yZSB1bnJl
Z2lzdGdlciBwb3J0ICovDQo+ID4gKwllcnIgPSByZWdtYXBfcmF3X3dyaXRlKGNoaXAtPmRhdGEu
cmVnbWFwLCBUQ1BDX0FMRVJUX01BU0ssICZ2YWwsDQo+ID4gKwkJCSAgICAgICBzaXplb2YodTE2
KSk7DQo+IA0KPiBJIHdvdWxkIHN1Z2dlc3QNCj4gDQo+IAllcnIgPSB0Y3BjaV93cml0ZTE2KGNo
aXAsIFRDUENfQUxFUlRfTUFTSywgMCk7DQoNCk9LLCB0aGlzIGlzIHNpbXBsZXIsIHdpbGwgc2Vu
ZCBvdXQgVjIuDQoNCkxpIEp1bg0KPiANCj4gR3VlbnRlcg0KPiANCj4gPiArCWlmIChlcnIgPCAw
KQ0KPiA+ICsJCXJldHVybiBlcnI7DQo+ID4NCj4gPiAgIAl0Y3BjaV91bnJlZ2lzdGVyX3BvcnQo
Y2hpcC0+dGNwY2kpOw0KPiA+DQo+ID4NCg0K
