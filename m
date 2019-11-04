Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40BABEDA1D
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 08:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbfKDHuZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 02:50:25 -0500
Received: from mail-eopbgr1410111.outbound.protection.outlook.com ([40.107.141.111]:7611
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726391AbfKDHuZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Nov 2019 02:50:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWpxrVbGy7UTaQqnmswIExzvAxrC4L/w1UAVbiarQQk1JjNKwhfnuENER5ZdnNOZ/pF8925UkPID6iNVMVDGVp/V5WhIrYfCD1eqJtA41xZTSutWZFprg3FWpyzRfWC6AGUbOI23assEScViwMmu/KY/y5+5l7t9WSCX20BIKcyXtERdBHgoI88sXQn4iNiKUFZhMZIK369fdLdgSveVSbAZKOrMwqLx+ZiLzyojx/CwAXDlDD2zrTS24+GhLsgLo29I/TQuCfy54QeaZNjn0yPwoUx5HlYV1cFniKJt/tPwrRmc+AL3mcdVV91Qbjha6WSfwEgLpxs44KXQsE6tKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4q2+S30Bh75JJ18XnoUMO8hUxhCWf9R5sPDXvxqDts=;
 b=Ez53pAQqMS2FWbLqbwrAlAzQA8mYiIS31Cl+nmqS81i++8mKdkuA+ZfimDMn52+nqaVbXRjxShD8t8JkWrJm6YS0lb5GNjyvg0lHTnfVQS8Tcc+oNtCs7gZ+38M1k48/6a+9ucAAdpPowcLRDjE69of2tS3ygJ114Tceb5BpWreepzcyGzoAFsC3NXZV77elmHbGwU3Egy7dfHApZDBVYwBTU0eAHmk6w7dKeQqowFSLSQTkNubYRyEsJY2KDwvukS1ziIkPZIKNyArJRxo/aE4k9O0gjqK3GQMde+0Y3S1FtM9kUFq6JVpjD1XWIqGal6evFw6eq0Pk59MYlQT/MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4q2+S30Bh75JJ18XnoUMO8hUxhCWf9R5sPDXvxqDts=;
 b=UKiuHj/rtZnD8SFLMPvOYjULRrVqZodyxI+uOzNhpWetk3qvgVtkQfdC1nvbHFRBJMFOikErw2Ugu3MY7LXLowmyBe5AGlsUX4+F3iE8n/A7U+y+sRL+9Vq7DamEkCFf9k+Y8BFa5Rix8DFbQbr6qwe/7snRoLgaKiNkawxwdGY=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB2343.jpnprd01.prod.outlook.com (52.134.252.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Mon, 4 Nov 2019 07:50:20 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::c9e7:5418:764e:69e3]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::c9e7:5418:764e:69e3%3]) with mapi id 15.20.2408.024; Mon, 4 Nov 2019
 07:50:20 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Ajay Gupta <ajayg@nvidia.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v3 10/18] usb: typec: hd3ss3220: Give the connector fwnode
 to the port device
Thread-Topic: [PATCH v3 10/18] usb: typec: hd3ss3220: Give the connector
 fwnode to the port device
Thread-Index: AQHViw2IO3WBazR3e0O5cgcdQRLrYad4GjgAgAKWrZA=
Date:   Mon, 4 Nov 2019 07:50:19 +0000
Message-ID: <OSBPR01MB2103ECF15FAD3E9567DD2952B87F0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <20191025082324.75731-1-heikki.krogerus@linux.intel.com>
 <20191025082324.75731-11-heikki.krogerus@linux.intel.com>
 <8f050871-b3b8-21b3-0662-a74a398831c8@roeck-us.net>
In-Reply-To: <8f050871-b3b8-21b3-0662-a74a398831c8@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 925dcd4b-7042-46d8-d232-08d760fba411
x-ms-traffictypediagnostic: OSBPR01MB2343:
x-microsoft-antispam-prvs: <OSBPR01MB2343E96F6F51975AA39B3CEDB87F0@OSBPR01MB2343.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0211965D06
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(189003)(199004)(13464003)(26005)(8676002)(76176011)(81166006)(81156014)(8936002)(71190400001)(71200400001)(305945005)(186003)(14444005)(256004)(476003)(486006)(44832011)(7736002)(74316002)(66066001)(86362001)(3846002)(6116002)(2906002)(52536014)(446003)(11346002)(76116006)(229853002)(99286004)(14454004)(316002)(478600001)(66946007)(110136005)(66446008)(66476007)(25786009)(66556008)(64756008)(55016002)(9686003)(6436002)(6506007)(53546011)(7696005)(102836004)(33656002)(54906003)(4326008)(5660300002)(6246003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2343;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TNEJaE+Fb1OfSKvXb1RsHxuR6zZBvchTlPN6DTcJpFi2dBmFxT1mvFGO0uUl9rScR79RT5sExhYweehuz46RLRmRsEvxGDHKlPS2pCYboshGY6V8ommAWYjCcfIzo3QdCWp+yPfU6bLKM2q/9U3NVU89WBf17aSzMvUBrIvQIOYlP4u8YMkWFKAqCK/ZHC3+xGSYkvLYPKTJY9sF8w0brAApSCuaT5t3jQy3XRlClWVGBcIVdOTF9v1V4JOKcKc43Kk64+FUGFY6DFl8ziLow+OZqcJ8nMiC45cnYcbWw2K79Uk3t6wigopncjnabZybgUoctD+FS/6jstm62s4FCWlpOh6ssXr9Fs2DF+D4maTf2rhvUhQQU9E4tdHJVASIT35LmeSeqI8q9CPMeEw03mfCNypzxRb/xrcp1XTsI3NyGpWIx/da9lFMMy4Vtoz7
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 925dcd4b-7042-46d8-d232-08d760fba411
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2019 07:50:19.9005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XfQXuRLkcf8oPUatNzKawXv3S6bnbj7r7t8H3bMgcVij3a+ED/N2hVO42nERb5WdKaDyqCgv7dSV/pGokZeyFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2343
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgR3VlbnRlciwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVu
dGVyIFJvZWNrIDxncm9lY2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sN
Cj4gU2VudDogU2F0dXJkYXksIE5vdmVtYmVyIDIsIDIwMTkgNDoxMSBQTQ0KPiBUbzogSGVpa2tp
IEtyb2dlcnVzIDxoZWlra2kua3JvZ2VydXNAbGludXguaW50ZWwuY29tPjsgR3JlZyBLcm9haC1I
YXJ0bWFuDQo+IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gQ2M6IEFqYXkgR3VwdGEg
PGFqYXlnQG52aWRpYS5jb20+OyBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnOyBCaWp1IERhcw0K
PiA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMTAv
MThdIHVzYjogdHlwZWM6IGhkM3NzMzIyMDogR2l2ZSB0aGUgY29ubmVjdG9yDQo+IGZ3bm9kZSB0
byB0aGUgcG9ydCBkZXZpY2UNCj4gDQo+IE9uIDEwLzI1LzE5IDE6MjMgQU0sIEhlaWtraSBLcm9n
ZXJ1cyB3cm90ZToNCj4gPiBUaGUgZHJpdmVyIGFscmVhZHkgZmluZHMgdGhlIG5vZGUgaW4gb3Jk
ZXIgdG8gZ2V0IHJlZmVyZW5jZSB0byB0aGUgVVNCDQo+ID4gcm9sZSBzd2l0Y2guDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBIZWlra2kgS3JvZ2VydXMgPGhlaWtraS5rcm9nZXJ1c0BsaW51eC5p
bnRlbC5jb20+DQo+ID4gVGVzdGVkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5j
b20+DQo+IA0KPiBUaGUgZnVzYjMwMiBkcml2ZXIgcmV0YWlucyB0aGUgZndub2RlIGFuZCBjYWxs
cyBmd25vZGVfaGFuZGxlX3B1dCgpIGluIHRoZQ0KPiByZW1vdmUgZnVuY3Rpb24uIEFzc3VtaW5n
IHRoaXMgaXNuJ3QgbmVjZXNzYXJ5IGhlcmUsDQoNCkl0IGlzIG5vdCByZXF1aXJlZC4gVGhlIHB1
cnBvc2UgaXMgIHRvIGdldCB0aGUgcm9sZSBzd2l0Y2ggaGFuZGxlIGFzc29jaWF0ZWQgd2l0aCB0
aGUgY29ubmVjdGVyIG5vZGUuDQpPbmNlIHlvdSBnZXQgdGhlIHJvbGUgc3dpdGNoIGhhbmRsZSwg
IHlvdSBkb24ndCBuZWVkIHRoZSBjb25uZWN0b3IgaGFuZGxlIGFueSBtb3JlLiANCg0KQ2hlZXJz
LA0KQmlqdQ0KDQo+IFJldmlld2VkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5u
ZXQ+DQo+IA0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy91c2IvdHlwZWMvaGQzc3MzMjIwLmMgfCAx
MiArKysrKysrKystLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvdHlwZWMvaGQz
c3MzMjIwLmMNCj4gPiBiL2RyaXZlcnMvdXNiL3R5cGVjL2hkM3NzMzIyMC5jIGluZGV4IGRiMDlm
YTBkODVmMi4uMzIzZGZhODE2MGFiDQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2Iv
dHlwZWMvaGQzc3MzMjIwLmMNCj4gPiArKysgYi9kcml2ZXJzL3VzYi90eXBlYy9oZDNzczMyMjAu
Yw0KPiA+IEBAIC0xNzgsMTUgKzE3OCwxNyBAQCBzdGF0aWMgaW50IGhkM3NzMzIyMF9wcm9iZShz
dHJ1Y3QgaTJjX2NsaWVudA0KPiAqY2xpZW50LA0KPiA+ICAgCQlyZXR1cm4gLUVOT0RFVjsNCj4g
Pg0KPiA+ICAgCWhkM3NzMzIyMC0+cm9sZV9zdyA9IGZ3bm9kZV91c2Jfcm9sZV9zd2l0Y2hfZ2V0
KGNvbm5lY3Rvcik7DQo+ID4gLQlmd25vZGVfaGFuZGxlX3B1dChjb25uZWN0b3IpOw0KPiA+IC0J
aWYgKElTX0VSUihoZDNzczMyMjAtPnJvbGVfc3cpKQ0KPiA+IC0JCXJldHVybiBQVFJfRVJSKGhk
M3NzMzIyMC0+cm9sZV9zdyk7DQo+ID4gKwlpZiAoSVNfRVJSKGhkM3NzMzIyMC0+cm9sZV9zdykp
IHsNCj4gPiArCQlyZXQgPSBQVFJfRVJSKGhkM3NzMzIyMC0+cm9sZV9zdyk7DQo+ID4gKwkJZ290
byBlcnJfcHV0X2Z3bm9kZTsNCj4gPiArCX0NCj4gPg0KPiA+ICAgCXR5cGVjX2NhcC5wcmVmZXJf
cm9sZSA9IFRZUEVDX05PX1BSRUZFUlJFRF9ST0xFOw0KPiA+ICAgCXR5cGVjX2NhcC5kcml2ZXJf
ZGF0YSA9IGhkM3NzMzIyMDsNCj4gPiAgIAl0eXBlY19jYXAudHlwZSA9IFRZUEVDX1BPUlRfRFJQ
Ow0KPiA+ICAgCXR5cGVjX2NhcC5kYXRhID0gVFlQRUNfUE9SVF9EUkQ7DQo+ID4gICAJdHlwZWNf
Y2FwLm9wcyA9ICZoZDNzczMyMjBfb3BzOw0KPiA+ICsJdHlwZWNfY2FwLmZ3bm9kZSA9IGNvbm5l
Y3RvcjsNCj4gPg0KPiA+ICAgCWhkM3NzMzIyMC0+cG9ydCA9IHR5cGVjX3JlZ2lzdGVyX3BvcnQo
JmNsaWVudC0+ZGV2LCAmdHlwZWNfY2FwKTsNCj4gPiAgIAlpZiAoSVNfRVJSKGhkM3NzMzIyMC0+
cG9ydCkpIHsNCj4gPiBAQCAtMjIwLDYgKzIyMiw4IEBAIHN0YXRpYyBpbnQgaGQzc3MzMjIwX3By
b2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsDQo+ID4gICAJaWYgKHJldCA8IDApDQo+ID4g
ICAJCWdvdG8gZXJyX3VucmVnX3BvcnQ7DQo+ID4NCj4gPiArCWZ3bm9kZV9oYW5kbGVfcHV0KGNv
bm5lY3Rvcik7DQo+ID4gKw0KPiA+ICAgCWRldl9pbmZvKCZjbGllbnQtPmRldiwgInByb2JlZCBy
ZXZpc2lvbj0weCV4XG4iLCByZXQpOw0KPiA+DQo+ID4gICAJcmV0dXJuIDA7DQo+ID4gQEAgLTIy
Nyw2ICsyMzEsOCBAQCBzdGF0aWMgaW50IGhkM3NzMzIyMF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVu
dCAqY2xpZW50LA0KPiA+ICAgCXR5cGVjX3VucmVnaXN0ZXJfcG9ydChoZDNzczMyMjAtPnBvcnQp
Ow0KPiA+ICAgZXJyX3B1dF9yb2xlOg0KPiA+ICAgCXVzYl9yb2xlX3N3aXRjaF9wdXQoaGQzc3Mz
MjIwLT5yb2xlX3N3KTsNCj4gPiArZXJyX3B1dF9md25vZGU6DQo+ID4gKwlmd25vZGVfaGFuZGxl
X3B1dChjb25uZWN0b3IpOw0KPiA+DQo+ID4gICAJcmV0dXJuIHJldDsNCj4gPiAgIH0NCj4gPg0K
DQo=
