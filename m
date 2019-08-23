Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00C889A527
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2019 03:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388260AbfHWB73 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 21:59:29 -0400
Received: from mail-eopbgr130070.outbound.protection.outlook.com ([40.107.13.70]:52294
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733086AbfHWB73 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Aug 2019 21:59:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNNj03jCCRgmNTnVouQQ+OrW4mkVQCenu12FSMMPh/QYa+hXYTpA6sbi1B8iB07GkW+2SM1crxiXdlX+r77ncO+J4L2X7GSlbvpt+UsGwF7TCcKMkkSUXDaioejK5+KLR0LMvPmHp8XjZ6/dHnD8h8B/fHaHr6YNMMNqIUKzBUYyiI36IjiUPjzWRCAg8GTQE2F/SrVZBDfzxrKAFZXk6UaAt67lI3rfUKr4z68OBKUkav3/ZSAA8VihmfEXie+itgLJhBvbWdhrmrdBN9iCVQbcUyBENg+84Y/4r0Pmht/SI+YEEtJSO4b4jtc6I2Lgh/Ei+UzCyrb8gKiSto9RDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LA8s/9flI7y+Hj/3BFKn2afzi8HIJBzmMI2cGJaxBxc=;
 b=R5fIypH/tB08Fm+vS92Fe08FKFyJezcd0vpaI8WTd9ppzAsrrWPzZjSxOT0M/SIP/+J0ibFX/g8r5081B07LA7AqeRyIdij+YGz+NeBhmMNeuHmP2s40ppPdHiKa79S1kVZPT5czgMqHV0jGjGka1AWVpEXDa0B2aqhHUsYO57ypXeHLpIWmTfutOn3VdW9O4SYeOLrI8ZyMKvjLn5ACx+4EUNBhcascMwT2VBsSPQ/yDnxoDbg4p+QTjEGmmg1KtGHdN3O+GYrwB09DCNMZc1pWR0QsLLNZMyH/BC3+1Qc7E1ZlO+ip6BQVkMTpkJEsXI7ADvi01ZaRWB7G1iq+wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LA8s/9flI7y+Hj/3BFKn2afzi8HIJBzmMI2cGJaxBxc=;
 b=D8BBOHFCkAHEY+qQj76fshg511NdEvE3mmLAniZ72DYhIEfTvFYK+J6emfN48C1B7XpJQ3d3o6yXYmwpSBjUlK0utWnuuGRgFc+zrBFeR3QNGHtFjXqB5J4FrDH18k/JWvUOik6pEVlFM6OSE1PQER9lKloaSFS4FILCliCnQmU=
Received: from DB8PR04MB6826.eurprd04.prod.outlook.com (52.133.240.82) by
 DB8PR04MB6668.eurprd04.prod.outlook.com (20.179.250.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 23 Aug 2019 01:59:24 +0000
Received: from DB8PR04MB6826.eurprd04.prod.outlook.com
 ([fe80::ad63:e8df:f0c2:7246]) by DB8PR04MB6826.eurprd04.prod.outlook.com
 ([fe80::ad63:e8df:f0c2:7246%2]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 01:59:24 +0000
From:   Ran Wang <ran.wang_1@nxp.com>
To:     Peter Chen <peter.chen@nxp.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/1] usb: xhci: avoid VBus glitch during controller reset
 operation
Thread-Topic: [PATCH 1/1] usb: xhci: avoid VBus glitch during controller reset
 operation
Thread-Index: AQHVV88qu74WcWDk3UKcEVqZOYC8KacHBDgAgADoJACAAAz3QA==
Date:   Fri, 23 Aug 2019 01:59:24 +0000
Message-ID: <DB8PR04MB6826525334C938A6838A896EF1A40@DB8PR04MB6826.eurprd04.prod.outlook.com>
References: <20190821031602.1030-1-peter.chen@nxp.com>
 <ce4fc3ec-2290-2902-1cf9-95add5b428b9@linux.intel.com>
 <20190823005918.mlcvlbzdai74t6xf@b29397-desktop>
In-Reply-To: <20190823005918.mlcvlbzdai74t6xf@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ran.wang_1@nxp.com; 
x-originating-ip: [92.121.36.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e8f37d4-5360-4fd9-6ab8-08d7276d858e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB8PR04MB6668;
x-ms-traffictypediagnostic: DB8PR04MB6668:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB6668DCB733CC995974ACAB91F1A40@DB8PR04MB6668.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(43544003)(199004)(189003)(25786009)(66066001)(71200400001)(476003)(71190400001)(52536014)(256004)(486006)(99286004)(478600001)(66946007)(86362001)(76116006)(186003)(6246003)(66556008)(64756008)(14444005)(6116002)(3846002)(81166006)(81156014)(66446008)(8676002)(8936002)(66476007)(4326008)(110136005)(53936002)(5660300002)(2906002)(55016002)(9686003)(74316002)(7696005)(76176011)(229853002)(446003)(26005)(305945005)(14454004)(7736002)(102836004)(11346002)(316002)(33656002)(54906003)(53546011)(6506007)(6436002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB8PR04MB6668;H:DB8PR04MB6826.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eiDFAtMYBEyHB1pC0TGANFl0hviQHJwWY0IgvTnLKP4yuJE4QWgDcm5qc5g++WIb97lv28RBVuZZ19QUeiqJNGeJppokCAnB7lYP7uZN/1VApW+Sl4Pf97CSbR/ycDXKh4Uv/50riUeo6NDWfSHxsdceLd82WrORePv5187DCn3/CklecNeEkiqVRK+wTn3GLJ843oB5F0WwPPZKzSqtCEiptcsOcINYEi0fyhYZufYHcyl2LSIfQxUx2OS/Gj2nsRFUKp+eMqeHDS2uPf6dVShdPwYtNJxkk2TUpwFrYr3M125gjZbSecBwdaDzd4xy6RgrbM//Q32khMOD3tCtXn6TGkRemZk7gUjzO9TIzCV9GwRzU6NbNtW+sxMWBOF2W7gW7+6YqRwWmImLdq0KLzMUdxb/+6TwmtmkQsoXtDU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8f37d4-5360-4fd9-6ab8-08d7276d858e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 01:59:24.0925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1b61Io704qTTPKcghNA0r6RfXEpMzC415oS35YyWorAaXn7ssK9mSBfRM5Lc4IQJUM3meHFst0JNM77+dC8kAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6668
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SEkgUGV0ZXIsIE1hdGhpYXMsDQoNClNvcnJ5IGZvciB0aGUgbGF0ZSByZXZpZXcuDQoNCk9uIEZy
aWRheSwgQXVndXN0IDIzLCAyMDE5IDA5OjAyLCBQZXRlciBDaGVuIHdyb3RlOg0KPiANCj4gT24g
MTktMDgtMjIgMTQ6MDg6MjYsIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+ID4gT24gMjEuOC4yMDE5
IDYuMTgsIFBldGVyIENoZW4gd3JvdGU6DQo+ID4gPiBBY2NvcmRpbmcgdG8geEhDSSAxLjEgQ0g0
LjE5LjQgUG9ydCBQb3dlcjoNCj4gPiA+IAlXaGlsZSBDaGlwIEhhcmR3YXJlIFJlc2V0IG9yIEhD
UlNUIGlzIGFzc2VydGVkLA0KPiA+ID4gICAgICAgICAJdGhlIHZhbHVlIG9mIFBQIGlzIHVuZGVm
aW5lZC4gSWYgdGhlIHhIQyBzdXBwb3J0cw0KPiA+ID4gICAgICAgICAJcG93ZXIgc3dpdGNoZXMg
KFBQQyA9IOKAmDHigJkpIHRoZW4gVkJ1cyBtYXkgYmUgZGVhc3NlcnRlZA0KPiA+ID4gICAgICAg
ICAJZHVyaW5nIHRoaXMgdGltZS4gUFAgKGFuZCBWQnVzKSBzaGFsbCBiZSBlbmFibGVkIGltbWVk
aWF0ZWx5DQo+ID4gPiAgICAgICAgIAl1cG9uIGV4aXRpbmcgdGhlIHJlc2V0IGNvbmRpdGlvbi4N
Cj4gPiA+DQo+ID4gPiBUaGUgVkJ1cyBnbGl0Y2ggbWF5IGNhdXNlIHNvbWUgVVNCIGRldmljZXMg
d29yayBhYm5vcm1hbCwgd2Ugb2JzZXJ2ZQ0KPiA+ID4gaXQgYXQgTlhQIExTMTAxMkFGV1JZL0xT
MTA0M0FSREIvTFgyMTYwQVFEUy9MUzEwODhBUkRCIHBsYXRmb3Jtcy4NCj4gVG8NCj4gPiA+IGF2
b2lkIHRoaXMgVmJ1cyBnbGl0Y2gsIHdlIGNvdWxkIHNldCBQUCBhcyAwIGJlZm9yZSBIQ1JTVCwg
YW5kIHRoZQ0KPiA+ID4gUFAgd2lsbCBiYWNrIHRvIDEgYWZ0ZXIgSENSU1QgYWNjb3JkaW5nIHRv
IHNwZWMuDQo+ID4NCj4gPiBJcyB0aGlzIGdsaXRjaCBjYXVzaW5nIGlzc3VlcyBhbHJlYWR5IGF0
IHRoZSBmaXJzdCB4SEMgcmVzZXQgd2hlbiB3ZQ0KPiA+IGFyZSBsb2FkaW5nIHRoZSB4aGNpIGRy
aXZlciwgIG9yIG9ubHkgbGF0ZXIgcmVzZXRzLCBsaWtlIHhIQyByZXNldCBhdCByZXN1bWU/DQo+
IA0KPiBUaGUgZmlyc3QgdGltZSwgUmFuIHdvdWxkIHlvdSBwbGVhc2UgY29uZmlybT8NCg0KTXkg
dW5kZXJzdGFuZCBpcyB0aGlzIHdpbGwgaGFwcGVuZWQgd2hlbmV2ZXIgUFAgaXMgc2V0IHRvIDAs
IHN1Y2ggYXMgeEhDSSByZXNldC4NClNvIEkgdGhpbmsgaXQgbWlnaHQgYWxzbyBiZSBvYnNlcnZl
ZCBkdXJpbmcgcmVzdW1lIGlmIHhIQyBkbyByZXNldC4NCg0KSG93ZXZlciwgYWNjb3JkaW5nIHRv
IG15IHByZXZpb3VzIHRlc3RpbmcsIGl0IG1pZ2h0IGJlIHRvbyBsYXRlIHRvDQpkbyB0aGlzIHBv
cnQgcG93ZXIgb2ZmIGluIHhoY2lfcmVzZXQoKSwgYWN0dWFsbHkgdGhlIFZCVVMgd2lsbCBhc3Nl
cnQgb25jZSBEV0MzIGRyaXZlcg0Kc2V0IElQIHRvIGhvc3QgbW9kZSAoYmVmb3JlIGRvaW5nIHhI
QyByZXNldCkuIFNvIHRoZSBnbGl0Y2ggc3RpbGwgY2FuIGJlIG9ic2VydmVkIG9uIHRoZSBzY29w
ZTsNCkkgaGF2ZSBtb3JlIGlzc3VlIGRlc2NyaXB0aW9uIGluIGFub3RoZXIgcGF0Y2ggZGlzY3Vz
c2lvbiBhYm91dCB0aGlzLCBwbGVhc2Ugc2VlDQoNCmxvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsv
cGF0Y2gvMTAzMjQyNS8NClF1b3RlZCBmcm9tIGl0Og0KQWN0dWFsbHkgSSBoYXZlIGRvbmUgZXhw
ZXJpbWVudCBsaWtlIHdoYXQgeW91IHN1Z2dlc3RlZCAoaW4geGhjaS1wbGF0LmMpLCBidXQgdGhl
IHRpbWluZw0Kc2VlbXMgdG9vIGxhdGUtLW1ha2luZyBWQlVTIHdhdmVmb3JtIGxvb2sgbGlrZSBh
IHNxdWFyZSB3YXZlIGFzIGJlbG93Og0KDQogICAgICAgICAgICAgIEhlcmUgRFdDMyBlbmFibGUg
aG9zdCBtb2RlLCBWQlVTIG9uDQogICAgICAgICAgICAgIHwNCis1ViAgICAgICAgICAvLS0tLS0t
LS0tXCA0MG1zICAvLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLi4uLg0KMFYgIF9fX19fX19f
LyAgIDkwbXMgICBcX19fX19fLw0KICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgfCAgICAg
ICAgICAgDQogICAgICAgICAgICAgICAgICAgICAgIHwgICAgICBIZXJlIGRvIHhoY2kgcmVzZXQs
IFZCVVMgYmFjayB0byArNVYgYWdhaW4NCiAgICAgICAgICAgICAgICAgICAgICAgSGVyZSBzZXQg
YWxsIFBPUlRTQ1tQUF0gdG8gMCBpbiB4aGNpX2dlbl9zZXR1cCgpDQoNClNvIEkgYW0gYWZyYWlk
IHRoZSBzb2x1dGlvbiBtaWdodCBoYXZlIHRvIGJlIGFkZGVkIGluIERXQzMgY29yZSBkcml2ZXIg
d2hlcmUganVzdCBhZnRlciBob3N0IG1vZGUgZW5hYmxpbmcgY29kZSBpZiB3YW50IGZpeCB0aGlz
IDooDQoNCg0KUmVnYXJkcywNClJhbiANCj4gPg0KPiA+ID4NCj4gPiA+IFJlcG9ydGVkLWJ5OiBS
YW4gV2FuZyA8cmFuLndhbmdfMUBueHAuY29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIg
Q2hlbiA8cGV0ZXIuY2hlbkBueHAuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgIGRyaXZlcnMvdXNi
L2hvc3QveGhjaS5jIHwgMTUgKysrKysrKysrKysrKystDQo+ID4gPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLmMgaW5k
ZXgNCj4gPiA+IDZiMzRhNTczYzNkOS4uZjVhN2I1ZDYzMDMxIDEwMDY0NA0KPiA+ID4gLS0tIGEv
ZHJpdmVycy91c2IvaG9zdC94aGNpLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhj
aS5jDQo+ID4gPiBAQCAtMTY3LDcgKzE2Nyw4IEBAIGludCB4aGNpX3Jlc2V0KHN0cnVjdCB4aGNp
X2hjZCAqeGhjaSkNCj4gPiA+ICAgew0KPiA+ID4gICAJdTMyIGNvbW1hbmQ7DQo+ID4gPiAgIAl1
MzIgc3RhdGU7DQo+ID4gPiAtCWludCByZXQ7DQo+ID4gPiArCWludCByZXQsIGk7DQo+ID4gPiAr
CXUzMiBwb3J0c2M7DQo+ID4gPiAgIAlzdGF0ZSA9IHJlYWRsKCZ4aGNpLT5vcF9yZWdzLT5zdGF0
dXMpOyBAQCAtMTgxLDYgKzE4MiwxOCBAQCBpbnQNCj4gPiA+IHhoY2lfcmVzZXQoc3RydWN0IHho
Y2lfaGNkICp4aGNpKQ0KPiA+ID4gICAJCXJldHVybiAwOw0KPiA+ID4gICAJfQ0KPiA+ID4gKwkv
Kg0KPiA+ID4gKwkgKiBLZWVwIFBPUlRTQy5QUCBhcyAwIGJlZm9yZSBIQ1JTVCB0byBlbGltaW5h
dGUNCj4gPiA+ICsJICogVmJ1cyBnbGl0Y2gsIHNlZSBDSCA0LjE5LjQuDQo+ID4gPiArCSAqLw0K
PiA+ID4gKwlmb3IgKGkgPSAwOyBpIDwgSENTX01BWF9QT1JUUyh4aGNpLT5oY3NfcGFyYW1zMSk7
IGkrKykgew0KPiA+ID4gKwkJX19sZTMyIF9faW9tZW0gKnBvcnRfYWRkciA9ICZ4aGNpLT5vcF9y
ZWdzLQ0KPiA+cG9ydF9zdGF0dXNfYmFzZSArDQo+ID4gPiArCQkJCU5VTV9QT1JUX1JFR1MgKiBp
Ow0KPiA+ID4gKwkJcG9ydHNjID0gcmVhZGwocG9ydF9hZGRyKTsNCj4gPiA+ICsJCXBvcnRzYyAm
PSB+UE9SVF9QT1dFUjsNCj4gPiA+ICsJCXdyaXRlbChwb3J0c2MsIHBvcnRfYWRkcik7DQo+ID4N
Cj4gPiBOb3QgYWxsIGJpdHMgcmVhZCBmcm9tIFBPUlRTQyBzaG91bGQgYmUgd3JpdHRlbiBiYWNr
LCB5b3UgbWlnaHQgbmVlZA0KPiA+IHBvcnRzYyA9IHhoY2lfcG9ydF9zdGF0ZV90b19uZXV0cmFs
KHBvcnRzYykgaGVyZS4NCj4gDQo+IFdpbGwgY2hhbmdlLg0KPiANCj4gPg0KPiA+IE5vcm1hbGx5
IEknZCByZWNvbW1lbmQgdXNpbmcgdGhlIHhoY2lfc2V0X3BvcnRfcG93ZXIoKSBoZWxwZXIgaW5z
dGVhZCwNCj4gPiBidXQgaWYgdGhpcyBpcyBpcyBuZWVkZWQgYXQgZHJpdmVyIGxvYWQgdGltZSB0
aGVuIHBvcnQgYXJyYXlzIG1heSBub3QgYmUgc2V0IHVwDQo+IHlldC4NCj4gPiB4aGNpX3NldF9w
b3J0X3Bvd2VyKCkgd291bGQgdGFrZSBjYXJlIG9mIHBvc3NpYmxlIEFDUEkgbWV0aG9kIGNhbGxz
LCBhbmQgYWRkDQo+IHNvbWUgZGVidWdnaW5nLg0KPiA+DQo+IA0KPiBJdCBpcyBuZWVkZWQgYXQg
bG9hZCB0aW1lLCBzbyBJIGRpZCBub3QgdXNlIHBvcnQgYXJyYXkuDQo+IA0KPiA+IE5vdCBzdXJl
IGlmIHRoaXMgd2lsbCBpbXBhY3Qgc29tZSBvdGhlciBwbGF0Zm9ybXMsIG1heWJlIGl0IHdvdWxk
IGJlDQo+ID4gYmV0dGVyIHRvIG1vdmUgdGhpcyB0byBhIHNlcGFyYXRlIGZ1bmN0aW9uLCBhbmQg
Y2FsbCBpdCBiZWZvcmUgeGhjaV9yZXNldCgpIGlmIGENCj4gcXVpcmsgaXMgc2V0Lg0KPiA+DQo+
IA0KPiBJdCBmb2xsb3dzIHNwZWMsIG5vdCBhdCBxdWlyay4gV2UgdGFsa2VkIHdpdGggU3lub3Bz
aXMgZW5naW5lZXINCj4gKGNhc2U6IDgwMDEyMzU0NzkpLCB0aGV5IGNvbmZpcm1lZCB0aGlzIGJl
aGF2aW91ciBmb2xsb3dzIHNwZWMuDQo+IEJlc2lkZXMsIEkgdHJpZWQgYXQgYm90aCBkd2MzIGFu
ZCBjYWRlbmNlMyB4SENJIHBsYXRmb3JtcywgdGhlIFBPUlRfUE9XRVINCj4gd2lsbCBiZSBzZXQg
YWdhaW4gYWZ0ZXIgY29udHJvbGxlciBzZXQuDQo+IA0KPiBXaGF0J3MgcG90ZW50aWFsIGlzc3Vl
IHlvdSBjb25zaWRlcj8NCj4gDQo+IFRoYW5rcywNCj4gUGV0ZXINCg==
