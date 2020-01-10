Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5D8C136B36
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2020 11:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbgAJKli (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jan 2020 05:41:38 -0500
Received: from mail-eopbgr20043.outbound.protection.outlook.com ([40.107.2.43]:48644
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727339AbgAJKli (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 10 Jan 2020 05:41:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksCgYVY7quEb7cBr6VIi5X/UwhE/Y2mBDhElFt8jN0a4NOvHHwW93szO7mg9LgBNzqaQ6oOhQTqSGjcjxQcldW5ecJTFam1cqk1bxmaVOK0kifKkhsKa1HsF+yOKGQeQbUjQ1Y1Ymv/raH1NZ6mySj9NE2QUHBE6UGyz1rPt7w8Wsj628hFlsYVlZevd7qNnXQsGnKiNVCzJMfxA25yt7ZFStd1FVzuTOagD3JxawIxhBEiVJXAJz2bhxckXpzpvKDDeDXGXphPB//jplCkpgQZXOgDbetyc39tcJxRfCxa3CJVajJF6/UOuym+ztMhp2OSbPkzLm7yptzAhU5KXLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqV++xyq7zhX1FhcCKLetvm4Ob7IvBbp60ub1n35QPo=;
 b=k32n35nRVSWeY1E3RIM067WeUU1ctCLorhaWqio4vOUZXJqPQ78RcqSoJEuPzR9ANv4aBPxm20aQYa97IOkkrPzLO2gbEFRjZ4UpSiMXMn19jCAY2bX9dy4lR11/GbuaRk2sshoT5lzGa0zoUx0us+1ztdiN/9qqi6t7A7v5uSxT0q0wHJqtT1Q3g1VUVMr4fHf3Se+ZPF5bU3J03zPqT97PXy4Gz9XXq7ZCGxoqJLJYH0d9dS/MKPkBFqGnnAykkY/rBWLlD6SSE/4oW+TUCawVaRxSiEvq33e1/nnMqJPquruQ4P0zuKfjMsbt+eRQtkTrKqM0QHXTfGB1iTYWCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqV++xyq7zhX1FhcCKLetvm4Ob7IvBbp60ub1n35QPo=;
 b=bDABFLn9XwoB3KTZudU0N8FCrX3Whd/eOe4UwpCLSLahN5YBI27yvO45kbgjnIc9TCI4Bgo8a1mLSrN/NL6JH/la3wv3VrP1IJ0CFXl/gQmV8AslWV09dVhwGVWPLE2UiVJzN4p38hK0WY+2qkGOP5asio2Oo4lQWjcSO7PDM2o=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.235.146) by
 VE1PR04MB6384.eurprd04.prod.outlook.com (20.179.235.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Fri, 10 Jan 2020 10:41:31 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3%7]) with mapi id 15.20.2623.013; Fri, 10 Jan 2020
 10:41:31 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 2/2] usb: typec: tcpm: set correct data role for non-DRD
Thread-Topic: [PATCH 2/2] usb: typec: tcpm: set correct data role for non-DRD
Thread-Index: AQHVvKHjC6zqhzWfdEevqj0S0FBRh6fiTT8AgAF2BVA=
Date:   Fri, 10 Jan 2020 10:41:31 +0000
Message-ID: <VE1PR04MB65285B642821DAD91C2F692389380@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1577442957-6921-1-git-send-email-jun.li@nxp.com>
 <20200109115224.GC29437@kuha.fi.intel.com>
In-Reply-To: <20200109115224.GC29437@kuha.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 34e5fce1-3d88-41d5-2305-08d795b9a833
x-ms-traffictypediagnostic: VE1PR04MB6384:|VE1PR04MB6384:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6384DC17A550CB300F8E2F8E89380@VE1PR04MB6384.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02788FF38E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(189003)(199004)(13464003)(7696005)(76116006)(6506007)(71200400001)(86362001)(186003)(9686003)(2906002)(66556008)(66946007)(53546011)(66476007)(64756008)(66446008)(33656002)(44832011)(54906003)(6916009)(5660300002)(81156014)(81166006)(8676002)(478600001)(8936002)(4326008)(316002)(52536014)(55016002)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6384;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fCECZrDyB9IUiExVFg5WNenw5uYnJ63nl64QOX2JUl/3FQL/DQBK4u90tmR27qJ1JGqYz03C15V5akPIn7hdnPpsx1uXR7BtzNrMOLas1ZwKgUgDfDNp96HMVxNhoVhiR3SV45BOpMGl/2WFmz83tymAflD0haemw9k97o/oRz8i2hrlmYaStcRGFQZUU4GoKlOIn4+AKcdtB6vhHdJTSHPHN5A5uAqYTLjD2eFHFs3OywKFbNGvxJky4SKx0ru9SfOk1UIXiaQxMPTr1L0OE/fQnhvQL2w17VXj1xNgEn8yDW0nClLJVPZUtr7qWQ4YE5rbRHlXdZEkJsLRyKM2zqEDU+fLVflZXFTpfEu0hfxgGtRy/FdKiWv6AIrbXHSQQtF3rE6aY+KFOzwznNXag20LJeQZGGUYn+aynstUR7DWP4yfVKZdZQ7/IElewFkB80DRAt22TuIFbtV5ZlBpv4vNsG+d4lR0AS1xBQEX/IrRxfMAvRdzhLOctb+iM2oJ
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e5fce1-3d88-41d5-2305-08d795b9a833
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2020 10:41:31.8637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QxBfyTf1eNoLNd6DpRbVK392or4n+AwTZC1zcdAvI5MzpKZqlaFmtOFyOmXvFE57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6384
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGVpa2tpIEtyb2dlcnVz
IDxoZWlra2kua3JvZ2VydXNAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAyMDIwxOox1MI5yNUg
MTk6NTINCj4gVG86IEp1biBMaSA8anVuLmxpQG54cC5jb20+DQo+IENjOiBsaW51eEByb2Vjay11
cy5uZXQ7IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBkbC1saW51eC1pbXgNCj4gPGxpbnV4
LWlteEBueHAuY29tPjsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIDIvMl0gdXNiOiB0eXBlYzogdGNwbTogc2V0IGNvcnJlY3QgZGF0YSByb2xlIGZvciBu
b24tRFJEDQo+IA0KPiBIaSBKdW4sDQo+IA0KPiBXaGVyZSdzIHRoZSAxLzIgb2YgdGhpcyBzZXJp
ZXM/DQoNCjEvMiBwYXRjaCBpcyBmb3IgY29udHJvbGxlciBkcml2ZXIgY2hhbmdlLCBzbyBub3Qg
VE8gb3IgQ0MgeW91IGluIG1haWwgbGlzdC4NCldpbGwgcGF5IGF0dGVudGlvbiB0aGlzIHRvIGF2
b2lkIGNvbmZ1c2UuDQoNCj4gDQo+IE9uIEZyaSwgRGVjIDI3LCAyMDE5IGF0IDEwOjM5OjE3QU0g
KzAwMDAsIEp1biBMaSB3cm90ZToNCj4gPiBGcm9tOiBMaSBKdW4gPGp1bi5saUBueHAuY29tPg0K
PiA+DQo+ID4gU2luY2UgdGhlIHR5cGVjIHBvcnQgZGF0YSByb2xlIGlzIHNlcGFyYXRlZCBmcm9t
IHBvd2VyIHJvbGUsIHNvIGNoZWNrDQo+ID4gdGhlIHBvcnQgZGF0YSBjYXBhYmlsaXR5IHdoZW4g
c2V0dGluZyBkYXRhIHJvbGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMaSBKdW4gPGp1bi5s
aUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcG0uYyB8
IDI0ICsrKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi90eXBlYy90Y3BtL3RjcG0uYw0KPiA+IGIvZHJpdmVycy91c2IvdHlwZWMvdGNwbS90Y3Bt
LmMgaW5kZXggNTZmYzM1Ni4uMWYwZDgyZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi90
eXBlYy90Y3BtL3RjcG0uYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwbS5j
DQo+ID4gQEAgLTc4MCw3ICs3ODAsNyBAQCBzdGF0aWMgaW50IHRjcG1fc2V0X3JvbGVzKHN0cnVj
dCB0Y3BtX3BvcnQgKnBvcnQsDQo+IGJvb2wgYXR0YWNoZWQsDQo+ID4gIAkJCSAgZW51bSB0eXBl
Y19yb2xlIHJvbGUsIGVudW0gdHlwZWNfZGF0YV9yb2xlIGRhdGEpICB7DQo+ID4gIAllbnVtIHR5
cGVjX29yaWVudGF0aW9uIG9yaWVudGF0aW9uOw0KPiA+IC0JZW51bSB1c2Jfcm9sZSB1c2Jfcm9s
ZTsNCj4gPiArCWVudW0gdXNiX3JvbGUgdXNiX3JvbGUgPSBVU0JfUk9MRV9OT05FOw0KPiA+ICAJ
aW50IHJldDsNCj4gPg0KPiA+ICAJaWYgKHBvcnQtPnBvbGFyaXR5ID09IFRZUEVDX1BPTEFSSVRZ
X0NDMSkgQEAgLTc4OCwxMCArNzg4LDIwIEBADQo+ID4gc3RhdGljIGludCB0Y3BtX3NldF9yb2xl
cyhzdHJ1Y3QgdGNwbV9wb3J0ICpwb3J0LCBib29sIGF0dGFjaGVkLA0KPiA+ICAJZWxzZQ0KPiA+
ICAJCW9yaWVudGF0aW9uID0gVFlQRUNfT1JJRU5UQVRJT05fUkVWRVJTRTsNCj4gPg0KPiA+IC0J
aWYgKGRhdGEgPT0gVFlQRUNfSE9TVCkNCj4gPiAtCQl1c2Jfcm9sZSA9IFVTQl9ST0xFX0hPU1Q7
DQo+ID4gLQllbHNlDQo+ID4gLQkJdXNiX3JvbGUgPSBVU0JfUk9MRV9ERVZJQ0U7DQo+ID4gKwlp
ZiAocG9ydC0+dHlwZWNfY2Fwcy5kYXRhID09IFRZUEVDX1BPUlRfRFJEKSB7DQo+ID4gKwkJaWYg
KGRhdGEgPT0gVFlQRUNfSE9TVCkNCj4gPiArCQkJdXNiX3JvbGUgPSBVU0JfUk9MRV9IT1NUOw0K
PiA+ICsJCWVsc2UNCj4gPiArCQkJdXNiX3JvbGUgPSBVU0JfUk9MRV9ERVZJQ0U7DQo+ID4gKwl9
IGVsc2UgaWYgKHBvcnQtPnR5cGVjX2NhcHMuZGF0YSA9PSBUWVBFQ19QT1JUX0RGUCkgew0KPiA+
ICsJCWlmIChkYXRhID09IFRZUEVDX0hPU1QpDQo+ID4gKwkJCXVzYl9yb2xlID0gVVNCX1JPTEVf
SE9TVDsNCj4gPiArCQlkYXRhID0gVFlQRUNfSE9TVDsNCj4gDQo+IFNvIGlmIGRhdGEgIT0gaG9z
dCwgdGNwYyBpcyB0b2xkIHRoYXQgZGF0YSA9PSBob3N0LCBidXQgdGhlIG11eCBpcyBzZXQgdG8N
Cj4gVVNCX1JPTEVfTk9ORS4gU28gd2h5IHRjcGMgbmVlZHMgdG8gdGhpbmsgdGhlIHJvbGUgaXMg
aG9zdCBpbiB0aGF0IGNhc2U/DQoNCmVudW0gdXNiX3JvbGUgew0KCVVTQl9ST0xFX05PTkUsDQoJ
VVNCX1JPTEVfSE9TVCwNCglVU0JfUk9MRV9ERVZJQ0UsDQp9Ow0KDQplbnVtIHR5cGVjX2RhdGFf
cm9sZSB7DQoJVFlQRUNfREVWSUNFLA0KCVRZUEVDX0hPU1QsDQp9Ow0KDQpJZiB0aGUgcG9ydCBv
bmx5IHN1cHBvcnQgREZQKGhvc3QpLCBJIHRoaW5rIHdlIHNob3VsZCBuZXZlciB0ZWxsIHRjcGMg
dGhlIGRhdGENCmlzIFRZUEVDX0RFVklDRSwgc28gVFlQRUNfSE9TVC4gDQoNCj4gDQo+IFNob3Vs
ZG4ndCB0aGlzIGZ1bmN0aW9uIGFjdHVhbGx5IHJldHVybiBlcnJvciBpZiB0aGUgcG9ydCBpcyBE
RlAgb25seSwgYW5kDQo+IFRZUEVDX0RFVklDRSBpcyByZXF1ZXN0ZWQ/DQoNCkN1cnJlbnQgVENQ
TSB1c2Ugb25lIEFQSSB0byBzZXQgYm90aCBwb3dlciBhbmQgZGF0YSByb2xlLCBkb2Vzbid0IGNv
bnNpZGVyDQp0aGUgY2FzZSBvZiBkdWFsIHBvd2VyIHJvbGUgYnV0IHNpbmdsZSBkYXRhIHJvbGUu
IFJldHVybiBlcnJvciBpbiB0Y3BtX3NldF9yb2xlcygpDQptYXkgbG9zZSB0aGUgc2V0dGluZyBm
b3IgcG93ZXIgcm9sZSwgSSB0aGluayB0aGUgY3VycmVudCBjaGFuZ2UgaXMgdXNlIGNvcnJlY3QN
CmRhdGEgcm9sZSB2YWx1ZSB3aGVuIGNhbGwgdG8gdGNwbV9zZXRfcm9sZXMoKS4gDQpGb3Igc2lt
cGxlLCBJIGRpZG4ndCBjaGFuZ2UgdGhlIGNhbGxlciBwbGFjZXMgb2YgdGNwbV9zZXRfcm9sZXMo
KSwgc28ganVzdCBvdmVycmlkZSB0aGUNCmRhdGEgYW5kIHVzYl9yb2xlIHRvIGJlIHJlYXNvbmFi
bGUgdmFsdWUgaGVyZS4NCg0KdGhhbmtzDQpKdW4NCj4gDQo+ID4gKwl9IGVsc2Ugew0KPiA+ICsJ
CWlmIChkYXRhID09IFRZUEVDX0RFVklDRSkNCj4gPiArCQkJdXNiX3JvbGUgPSBVU0JfUk9MRV9E
RVZJQ0U7DQo+ID4gKwkJZGF0YSA9IFRZUEVDX0RFVklDRTsNCj4gPiArCX0NCj4gPg0KPiA+ICAJ
cmV0ID0gdGNwbV9tdXhfc2V0KHBvcnQsIFRZUEVDX1NUQVRFX1VTQiwgdXNiX3JvbGUsIG9yaWVu
dGF0aW9uKTsNCj4gPiAgCWlmIChyZXQgPCAwKQ0KPiA+IEBAIC0xODE3LDcgKzE4MjcsNyBAQCBz
dGF0aWMgdm9pZCB0Y3BtX3BkX2N0cmxfcmVxdWVzdChzdHJ1Y3QNCj4gdGNwbV9wb3J0ICpwb3J0
LA0KPiA+ICAJCXRjcG1fc2V0X3N0YXRlKHBvcnQsIFNPRlRfUkVTRVQsIDApOw0KPiA+ICAJCWJy
ZWFrOw0KPiA+ICAJY2FzZSBQRF9DVFJMX0RSX1NXQVA6DQo+ID4gLQkJaWYgKHBvcnQtPnBvcnRf
dHlwZSAhPSBUWVBFQ19QT1JUX0RSUCkgew0KPiA+ICsJCWlmIChwb3J0LT50eXBlY19jYXBzLmRh
dGEgIT0gVFlQRUNfUE9SVF9EUkQpIHsNCj4gPiAgCQkJdGNwbV9xdWV1ZV9tZXNzYWdlKHBvcnQs
IFBEX01TR19DVFJMX1JFSkVDVCk7DQo+ID4gIAkJCWJyZWFrOw0KPiA+ICAJCX0NCj4gPiBAQCAt
Mzk2OSw3ICszOTc5LDcgQEAgc3RhdGljIGludCB0Y3BtX2RyX3NldChzdHJ1Y3QgdHlwZWNfcG9y
dCAqcCwNCj4gZW51bSB0eXBlY19kYXRhX3JvbGUgZGF0YSkNCj4gPiAgCW11dGV4X2xvY2soJnBv
cnQtPnN3YXBfbG9jayk7DQo+ID4gIAltdXRleF9sb2NrKCZwb3J0LT5sb2NrKTsNCj4gPg0KPiA+
IC0JaWYgKHBvcnQtPnBvcnRfdHlwZSAhPSBUWVBFQ19QT1JUX0RSUCkgew0KPiA+ICsJaWYgKHBv
cnQtPnR5cGVjX2NhcHMuZGF0YSAhPSBUWVBFQ19QT1JUX0RSRCkgew0KPiA+ICAJCXJldCA9IC1F
SU5WQUw7DQo+ID4gIAkJZ290byBwb3J0X3VubG9jazsNCj4gPiAgCX0NCj4gPiAtLQ0KPiA+IDIu
Ny40DQo+IA0KPiB0aGFua3MsDQo+IA0KPiAtLQ0KPiBoZWlra2kNCg==
