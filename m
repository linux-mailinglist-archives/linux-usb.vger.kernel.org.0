Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B47D714361F
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2020 05:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbgAUEDl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 23:03:41 -0500
Received: from mail-am6eur05on2087.outbound.protection.outlook.com ([40.107.22.87]:61792
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728767AbgAUEDl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jan 2020 23:03:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTdIeMnnQCTOUo3ESjiADiYIvFSeWBZGuQtNyWD29Knai+Sf2fGMrHU2CfdGV8FVKrIXmVLulDD4enlh5GxJVg+hW1+HB2G244thmxhn2hNhGos5NCsI5BYySsc7y8cQ3mfotyEI41Si4m1UPfNrA9IGbhDyjvbRKv7KDYpCwq6asJm6FYAqOUyNPA9sZVpJmXNEmJF5D482ljaRTsJXr6Q3hzFPbpiA7GCFb8aYR9RG8CLKu5F3Jd+7g44lG8cwZ1ToYxVYE0TSZUEtUqyE1+gCdJbSCtezH7KDbtakrpfRSZ+VY9eUy6fSBDQNXsPZh8R+agxaA4VYjipu7qevNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OH3u/MIV6EFk6ZpNJEER7amgt8AeULfMCW43D+DeC8c=;
 b=g0G5wCbQdl6p4nx3miU++Un2BlGrtPWhVZu5oD5a9/HUkm9nWwQaNNhll9o4/2eLA+b9rICHHFCjL0wGETlJLPTSvykJ9ufyWf1FjTb3U4qKvmT912UZwc7TgPJ1LLNYH8fj6Gp9PjexVZeVaYS5q1uoB19AMgwahYZQ7MOVuVbgi5LfMDR8wPFQN7/z9Mp6ojDxMinKCnaOZKhL6KCEeZ2+SPX75K/qHzFS9dmqU9NmtJFcikgKNdKHEgzN0ixVLQqp2Qw7DUz3AxsmdIIy5CTFNFE9UZsYQTGAQ4qhYUVNZjFtQLyW14rgGE1YIZmx6t5cnn0UEjvWpBstcr+f8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OH3u/MIV6EFk6ZpNJEER7amgt8AeULfMCW43D+DeC8c=;
 b=XgNXk4s/qTompLl/N2UDeBgUTtpoesA1hnkdbW+9kMjazcOBWSRaGZAHyG/p/ZAboDnvKlZ1CUeomIzNUpfTXf1nbn0ERllTb4/jTK1gkVozYvZcpaA423HqH05Oj9XTO0fz0lnWVfHXP2mLIqXCN2Hw9x2OXAz6ArhicvC9aFQ=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.235.146) by
 VE1PR04MB6720.eurprd04.prod.outlook.com (20.179.234.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19; Tue, 21 Jan 2020 04:01:55 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3%7]) with mapi id 15.20.2644.027; Tue, 21 Jan 2020
 04:01:54 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 2/2] usb: typec: tcpm: set correct data role for non-DRD
Thread-Topic: [PATCH 2/2] usb: typec: tcpm: set correct data role for non-DRD
Thread-Index: AQHVvKHjC6zqhzWfdEevqj0S0FBRh6fiTT8AgAF2BVCAD/TMgIAA7HsQ
Date:   Tue, 21 Jan 2020 04:01:54 +0000
Message-ID: <VE1PR04MB65286717662BCB974B0C9A85890D0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1577442957-6921-1-git-send-email-jun.li@nxp.com>
 <20200109115224.GC29437@kuha.fi.intel.com>
 <VE1PR04MB65285B642821DAD91C2F692389380@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <20200120135107.GD32175@kuha.fi.intel.com>
In-Reply-To: <20200120135107.GD32175@kuha.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fb892cfc-9b76-4cc5-109b-08d79e26a756
x-ms-traffictypediagnostic: VE1PR04MB6720:|VE1PR04MB6720:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6720B3D011CFCE3585FAFAC8890D0@VE1PR04MB6720.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(189003)(199004)(2906002)(9686003)(55016002)(71200400001)(4326008)(478600001)(66556008)(6506007)(66446008)(66476007)(52536014)(64756008)(66946007)(76116006)(53546011)(6916009)(26005)(86362001)(54906003)(186003)(316002)(8936002)(81166006)(81156014)(8676002)(33656002)(44832011)(5660300002)(7696005);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6720;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ll+kJeHSOEpNxhhH6VeMjtgUoGVC/MpCZDCm5wkqwKDSi1PBP95TZCqBD+5q+1OOfE1aVXMYBb+gdd1sPT3oBxFm8DyGlNp5ELyZCQdczdGHFD4hdHlG5DpL6IM99C/icvi4DsXEWIJQvlk3RBQ9h5uix1IXeZRX76mKibtVR/U8eCBCoOp1z7XMtkE5iSLC0i4q5vnX53XWO921t3Pwg5Em44omFlX+0OZF5dnEPnYsGKse7j4Wt8sRHr8ni59UQU0+0RzyW3q9uTCdztvs5A2pxI/LEcFlpMQuL/QleD343WPSUmmdC4ImLum1/ZTk+Y2+FrigN7h8MnLAbhvBnYQ6DqPE1CZ7PXPu0pJgGjobdDGNIig0rAM/xy/f8xi8jLGnFFNvyR48Ikt31kdZDhbm7irDNn2Wq2PxYi5Rfs4S4/OzHChyxKSwmzdNtox1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb892cfc-9b76-4cc5-109b-08d79e26a756
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 04:01:54.8356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4sQk2PxCE9HsHFQ4I5qm5HGjBBKfy46b57FJKSUPzSblQWYWWvg1A3DNaMUH0bS4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6720
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgSGVpa2tpLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEhlaWtr
aSBLcm9nZXJ1cyA8aGVpa2tpLmtyb2dlcnVzQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogMjAy
MOW5tDHmnIgyMOaXpSAyMTo1MQ0KPiBUbzogSnVuIExpIDxqdW4ubGlAbnhwLmNvbT4NCj4gQ2M6
IGxpbnV4QHJvZWNrLXVzLm5ldDsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IGRsLWxpbnV4
LWlteA0KPiA8bGludXgtaW14QG54cC5jb20+OyBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnDQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSB1c2I6IHR5cGVjOiB0Y3BtOiBzZXQgY29ycmVjdCBk
YXRhIHJvbGUgZm9yIG5vbi1EUkQNCj4gDQo+IEhpIEp1biwNCj4gDQo+IE9uIEZyaSwgSmFuIDEw
LCAyMDIwIGF0IDEwOjQxOjMxQU0gKzAwMDAsIEp1biBMaSB3cm90ZToNCj4gPiA+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBIZWlra2kgS3JvZ2VydXMgPGhlaWtraS5r
cm9nZXJ1c0BsaW51eC5pbnRlbC5jb20+DQo+ID4gPiBTZW50OiAyMDIw5bm0MeaciDnml6UgMTk6
NTINCj4gPiA+IFRvOiBKdW4gTGkgPGp1bi5saUBueHAuY29tPg0KPiA+ID4gQ2M6IGxpbnV4QHJv
ZWNrLXVzLm5ldDsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IGRsLWxpbnV4LWlteA0KPiA+
ID4gPGxpbnV4LWlteEBueHAuY29tPjsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZw0KPiA+ID4g
U3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIHVzYjogdHlwZWM6IHRjcG06IHNldCBjb3JyZWN0IGRh
dGEgcm9sZSBmb3INCj4gPiA+IG5vbi1EUkQNCj4gPiA+DQo+ID4gPiBIaSBKdW4sDQo+ID4gPg0K
PiA+ID4gV2hlcmUncyB0aGUgMS8yIG9mIHRoaXMgc2VyaWVzPw0KPiA+DQo+ID4gMS8yIHBhdGNo
IGlzIGZvciBjb250cm9sbGVyIGRyaXZlciBjaGFuZ2UsIHNvIG5vdCBUTyBvciBDQyB5b3UgaW4g
bWFpbCBsaXN0Lg0KPiA+IFdpbGwgcGF5IGF0dGVudGlvbiB0aGlzIHRvIGF2b2lkIGNvbmZ1c2Uu
DQo+ID4NCj4gPiA+DQo+ID4gPiBPbiBGcmksIERlYyAyNywgMjAxOSBhdCAxMDozOToxN0FNICsw
MDAwLCBKdW4gTGkgd3JvdGU6DQo+ID4gPiA+IEZyb206IExpIEp1biA8anVuLmxpQG54cC5jb20+
DQo+ID4gPiA+DQo+ID4gPiA+IFNpbmNlIHRoZSB0eXBlYyBwb3J0IGRhdGEgcm9sZSBpcyBzZXBh
cmF0ZWQgZnJvbSBwb3dlciByb2xlLCBzbw0KPiA+ID4gPiBjaGVjayB0aGUgcG9ydCBkYXRhIGNh
cGFiaWxpdHkgd2hlbiBzZXR0aW5nIGRhdGEgcm9sZS4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogTGkgSnVuIDxqdW4ubGlAbnhwLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBk
cml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcG0uYyB8IDI0ICsrKysrKysrKysrKysrKysrLS0tLS0t
LQ0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi90eXBlYy90Y3Bt
L3RjcG0uYw0KPiA+ID4gPiBiL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwbS5jIGluZGV4IDU2
ZmMzNTYuLjFmMGQ4MmUgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdXNiL3R5cGVjL3Rj
cG0vdGNwbS5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwbS5jDQo+
ID4gPiA+IEBAIC03ODAsNyArNzgwLDcgQEAgc3RhdGljIGludCB0Y3BtX3NldF9yb2xlcyhzdHJ1
Y3QgdGNwbV9wb3J0DQo+ID4gPiA+ICpwb3J0LA0KPiA+ID4gYm9vbCBhdHRhY2hlZCwNCj4gPiA+
ID4gIAkJCSAgZW51bSB0eXBlY19yb2xlIHJvbGUsIGVudW0gdHlwZWNfZGF0YV9yb2xlIGRhdGEp
ICB7DQo+ID4gPiA+ICAJZW51bSB0eXBlY19vcmllbnRhdGlvbiBvcmllbnRhdGlvbjsNCj4gPiA+
ID4gLQllbnVtIHVzYl9yb2xlIHVzYl9yb2xlOw0KPiA+ID4gPiArCWVudW0gdXNiX3JvbGUgdXNi
X3JvbGUgPSBVU0JfUk9MRV9OT05FOw0KPiA+ID4gPiAgCWludCByZXQ7DQo+ID4gPiA+DQo+ID4g
PiA+ICAJaWYgKHBvcnQtPnBvbGFyaXR5ID09IFRZUEVDX1BPTEFSSVRZX0NDMSkgQEAgLTc4OCwx
MCArNzg4LDIwDQo+IEBADQo+ID4gPiA+IHN0YXRpYyBpbnQgdGNwbV9zZXRfcm9sZXMoc3RydWN0
IHRjcG1fcG9ydCAqcG9ydCwgYm9vbCBhdHRhY2hlZCwNCj4gPiA+ID4gIAllbHNlDQo+ID4gPiA+
ICAJCW9yaWVudGF0aW9uID0gVFlQRUNfT1JJRU5UQVRJT05fUkVWRVJTRTsNCj4gPiA+ID4NCj4g
PiA+ID4gLQlpZiAoZGF0YSA9PSBUWVBFQ19IT1NUKQ0KPiA+ID4gPiAtCQl1c2Jfcm9sZSA9IFVT
Ql9ST0xFX0hPU1Q7DQo+ID4gPiA+IC0JZWxzZQ0KPiA+ID4gPiAtCQl1c2Jfcm9sZSA9IFVTQl9S
T0xFX0RFVklDRTsNCj4gPiA+ID4gKwlpZiAocG9ydC0+dHlwZWNfY2Fwcy5kYXRhID09IFRZUEVD
X1BPUlRfRFJEKSB7DQo+ID4gPiA+ICsJCWlmIChkYXRhID09IFRZUEVDX0hPU1QpDQo+ID4gPiA+
ICsJCQl1c2Jfcm9sZSA9IFVTQl9ST0xFX0hPU1Q7DQo+ID4gPiA+ICsJCWVsc2UNCj4gPiA+ID4g
KwkJCXVzYl9yb2xlID0gVVNCX1JPTEVfREVWSUNFOw0KPiA+ID4gPiArCX0gZWxzZSBpZiAocG9y
dC0+dHlwZWNfY2Fwcy5kYXRhID09IFRZUEVDX1BPUlRfREZQKSB7DQo+ID4gPiA+ICsJCWlmIChk
YXRhID09IFRZUEVDX0hPU1QpDQo+ID4gPiA+ICsJCQl1c2Jfcm9sZSA9IFVTQl9ST0xFX0hPU1Q7
DQo+ID4gPiA+ICsJCWRhdGEgPSBUWVBFQ19IT1NUOw0KPiA+ID4NCj4gPiA+IFNvIGlmIGRhdGEg
IT0gaG9zdCwgdGNwYyBpcyB0b2xkIHRoYXQgZGF0YSA9PSBob3N0LCBidXQgdGhlIG11eCBpcw0K
PiA+ID4gc2V0IHRvIFVTQl9ST0xFX05PTkUuIFNvIHdoeSB0Y3BjIG5lZWRzIHRvIHRoaW5rIHRo
ZSByb2xlIGlzIGhvc3QgaW4NCj4gdGhhdCBjYXNlPw0KPiA+DQo+ID4gZW51bSB1c2Jfcm9sZSB7
DQo+ID4gCVVTQl9ST0xFX05PTkUsDQo+ID4gCVVTQl9ST0xFX0hPU1QsDQo+ID4gCVVTQl9ST0xF
X0RFVklDRSwNCj4gPiB9Ow0KPiA+DQo+ID4gZW51bSB0eXBlY19kYXRhX3JvbGUgew0KPiA+IAlU
WVBFQ19ERVZJQ0UsDQo+ID4gCVRZUEVDX0hPU1QsDQo+ID4gfTsNCj4gPg0KPiA+IElmIHRoZSBw
b3J0IG9ubHkgc3VwcG9ydCBERlAoaG9zdCksIEkgdGhpbmsgd2Ugc2hvdWxkIG5ldmVyIHRlbGwg
dGNwYw0KPiA+IHRoZSBkYXRhIGlzIFRZUEVDX0RFVklDRSwgc28gVFlQRUNfSE9TVC4NCj4gDQo+
IEJ1dCB3ZSBzaG91bGQgYWxzbyBub3QgaGF2ZSB0byAibGllIiBhbmQgZm9yY2UgdGhlIHJvbGUg
aW50byBzb21ldGhpbmcgdGhhdA0KPiB3b3Jrcy4NCj4gDQo+ID4gPiBTaG91bGRuJ3QgdGhpcyBm
dW5jdGlvbiBhY3R1YWxseSByZXR1cm4gZXJyb3IgaWYgdGhlIHBvcnQgaXMgREZQDQo+ID4gPiBv
bmx5LCBhbmQgVFlQRUNfREVWSUNFIGlzIHJlcXVlc3RlZD8NCj4gPg0KPiA+IEN1cnJlbnQgVENQ
TSB1c2Ugb25lIEFQSSB0byBzZXQgYm90aCBwb3dlciBhbmQgZGF0YSByb2xlLCBkb2Vzbid0DQo+
ID4gY29uc2lkZXIgdGhlIGNhc2Ugb2YgZHVhbCBwb3dlciByb2xlIGJ1dCBzaW5nbGUgZGF0YSBy
b2xlLiBSZXR1cm4NCj4gPiBlcnJvciBpbiB0Y3BtX3NldF9yb2xlcygpIG1heSBsb3NlIHRoZSBz
ZXR0aW5nIGZvciBwb3dlciByb2xlLCBJIHRoaW5rDQo+ID4gdGhlIGN1cnJlbnQgY2hhbmdlIGlz
IHVzZSBjb3JyZWN0IGRhdGEgcm9sZSB2YWx1ZSB3aGVuIGNhbGwgdG8NCj4gdGNwbV9zZXRfcm9s
ZXMoKS4NCj4gPiBGb3Igc2ltcGxlLCBJIGRpZG4ndCBjaGFuZ2UgdGhlIGNhbGxlciBwbGFjZXMg
b2YgdGNwbV9zZXRfcm9sZXMoKSwgc28NCj4gPiBqdXN0IG92ZXJyaWRlIHRoZSBkYXRhIGFuZCB1
c2Jfcm9sZSB0byBiZSByZWFzb25hYmxlIHZhbHVlIGhlcmUuDQo+IA0KPiBJIHRoaW5rIHRoZSBj
b3JyZWN0IHRoaW5nIHRvIGRvIHdvdWxkIGJlIHRvIGZpeCB0aGUgcGxhY2VzIHdoZXJlIHRoZSBm
dW5jdGlvbiBpcw0KPiBjYWxsZWQsIGFuZCBoZXJlIHJldHVybiBlcnJvciBpZiB0aGUgdW5zdXBw
b3J0ZWQgcm9sZSBpcyBhdHRlbXB0ZWQuIEkgaGF0ZSB0byBiZQ0KPiBwaWNreSwgYnV0IHRoaXMg
bG9va3MgbGlrZSBhIHdvcmthcm91bmQgdGhhdCBtYXkgcG90ZW50aWFsbHkgaGlkZSByZWFsIGlz
c3VlcyBpbg0KPiB0aGUgY29kZS4NCg0KT0ssIHVuZGVyc3Rvb2QsIEkgd2lsbCBzZW5kIHYyLg0K
DQpUaGFua3MNCkxpIEp1bg0KPiANCj4gDQo+ID4gPiA+ICsJfSBlbHNlIHsNCj4gPiA+ID4gKwkJ
aWYgKGRhdGEgPT0gVFlQRUNfREVWSUNFKQ0KPiA+ID4gPiArCQkJdXNiX3JvbGUgPSBVU0JfUk9M
RV9ERVZJQ0U7DQo+ID4gPiA+ICsJCWRhdGEgPSBUWVBFQ19ERVZJQ0U7DQo+ID4gPiA+ICsJfQ0K
PiA+ID4gPg0KPiA+ID4gPiAgCXJldCA9IHRjcG1fbXV4X3NldChwb3J0LCBUWVBFQ19TVEFURV9V
U0IsIHVzYl9yb2xlLA0KPiBvcmllbnRhdGlvbik7DQo+ID4gPiA+ICAJaWYgKHJldCA8IDApDQo+
ID4gPiA+IEBAIC0xODE3LDcgKzE4MjcsNyBAQCBzdGF0aWMgdm9pZCB0Y3BtX3BkX2N0cmxfcmVx
dWVzdChzdHJ1Y3QNCj4gPiA+IHRjcG1fcG9ydCAqcG9ydCwNCj4gPiA+ID4gIAkJdGNwbV9zZXRf
c3RhdGUocG9ydCwgU09GVF9SRVNFVCwgMCk7DQo+ID4gPiA+ICAJCWJyZWFrOw0KPiA+ID4gPiAg
CWNhc2UgUERfQ1RSTF9EUl9TV0FQOg0KPiA+ID4gPiAtCQlpZiAocG9ydC0+cG9ydF90eXBlICE9
IFRZUEVDX1BPUlRfRFJQKSB7DQo+ID4gPiA+ICsJCWlmIChwb3J0LT50eXBlY19jYXBzLmRhdGEg
IT0gVFlQRUNfUE9SVF9EUkQpIHsNCj4gPiA+ID4gIAkJCXRjcG1fcXVldWVfbWVzc2FnZShwb3J0
LCBQRF9NU0dfQ1RSTF9SRUpFQ1QpOw0KPiA+ID4gPiAgCQkJYnJlYWs7DQo+ID4gPiA+ICAJCX0N
Cj4gPiA+ID4gQEAgLTM5NjksNyArMzk3OSw3IEBAIHN0YXRpYyBpbnQgdGNwbV9kcl9zZXQoc3Ry
dWN0IHR5cGVjX3BvcnQgKnAsDQo+ID4gPiBlbnVtIHR5cGVjX2RhdGFfcm9sZSBkYXRhKQ0KPiA+
ID4gPiAgCW11dGV4X2xvY2soJnBvcnQtPnN3YXBfbG9jayk7DQo+ID4gPiA+ICAJbXV0ZXhfbG9j
aygmcG9ydC0+bG9jayk7DQo+ID4gPiA+DQo+ID4gPiA+IC0JaWYgKHBvcnQtPnBvcnRfdHlwZSAh
PSBUWVBFQ19QT1JUX0RSUCkgew0KPiA+ID4gPiArCWlmIChwb3J0LT50eXBlY19jYXBzLmRhdGEg
IT0gVFlQRUNfUE9SVF9EUkQpIHsNCj4gPiA+ID4gIAkJcmV0ID0gLUVJTlZBTDsNCj4gPiA+ID4g
IAkJZ290byBwb3J0X3VubG9jazsNCj4gPiA+ID4gIAl9DQo+ID4gPiA+IC0tDQo+ID4gPiA+IDIu
Ny40DQo+IA0KPiB0aGFua3MsDQo+IA0KPiAtLQ0KPiBoZWlra2kNCg==
