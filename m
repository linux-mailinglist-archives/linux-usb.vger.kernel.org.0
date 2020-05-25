Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65DCF1E130C
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 18:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388915AbgEYQtx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 12:49:53 -0400
Received: from mail-eopbgr700063.outbound.protection.outlook.com ([40.107.70.63]:32737
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388675AbgEYQtv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 May 2020 12:49:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTjS9EsBd9X2zO0KBohwPuexwYKows/0Dc4nOHoBtU6tEuQCn0qBK3lhBwyAdkxUgQicFCadoci4V2BEseHcM5r4UkKeJylgNivmuildUdzFzp0uJ9ahhEEOrOOOAM3NdwRRxeiqja132JrJje9biUmIOuHHCXCOjcZdDL0ltbt5qd+YrIyV/BLAmd56zcNMuiDApAGBw6RfDYpqXRnNhxkiicfRME74lWT9dv7ypIsq0LL8UMsKMJIaJygzAVoyfkV4MwZCyruR2qyBaKccWdaysFC/jlq0SC7rxGvnzUW/J0WNSl+HjG68P7p6jDNi5FnTai9gGaaCYOXViFq9kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJl1/QwdAE49YanFq/YYo4ZwMrvzr77oKitD4orZG78=;
 b=laQuw9mKUPOHL+TeQ7P2EgjuzhQ9YDGUySIBLLicElXi7fKiVbMW3DY57U+J21DQ8nuxdLB2AlkN9pt1RXgh2+rDbh7N1sVF/pEaNw/Ti9jZp4yW+t7QCFskU2d0/1E2TkC63QVeNWd54DTgy1JhG6au5mEOAE1hUHh2/Ke1K6WtfYMCEN2DMFsvoUNG8UkhfPmEsMeBNOkXvqSDfZutAGaPeFkTjT83VFo4N53zMskherCHxzFEjHChBGQYxdPBf7e6/MoQF40Geol86rZdfAfLrWKUs7QPmRNLfPJj5Nn20AR7wdBKGehbXnklkLWSrSBoIH3q3ter+fS0IVYC8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJl1/QwdAE49YanFq/YYo4ZwMrvzr77oKitD4orZG78=;
 b=g2fdWTRodgijz6gJrpcAHWPb/HjJAQ/YieVdhVJ8z01FuwCQEyWQwsAhAceNKghR4/Jl1kytoWTMjQGYbTI9wWe3qbVtWMKEO1RyXQc2uHZFmX8rrY/RI294DmPacJ48ihyEofxFOemsY6sGW3PdnFnkBrUxsNqRe1AhB2SKiO0=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3140.namprd10.prod.outlook.com (2603:10b6:408:cc::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Mon, 25 May
 2020 16:49:47 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941%2]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 16:49:46 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "oneukum@suse.com" <oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Topic: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Index: AQHWMqM6W5iP9Jkv9UCEGIiDuBaJw6i45d+AgAADdICAABpkAA==
Date:   Mon, 25 May 2020 16:49:46 +0000
Message-ID: <a3f4a9bbde9efd2827b2a02c46f86c8ba7853bc6.camel@infinera.com>
References: <6a4fe396ab5ae6cda548e904c57bc823103999d7.camel@infinera.com>
         <1590418977.2838.16.camel@suse.com>
         <b39259fc7f397b27f4af145eeafb33ec36638660.camel@infinera.com>
In-Reply-To: <b39259fc7f397b27f4af145eeafb33ec36638660.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a1fc5e8-b886-4560-ba22-08d800cba208
x-ms-traffictypediagnostic: BN8PR10MB3140:
x-microsoft-antispam-prvs: <BN8PR10MB3140E5D9D1C4DEDE4EB22C1DF4B30@BN8PR10MB3140.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mNZpu4V7NI8yjhP3K/Ygt3cJpgG3hGN6T+Aj68FjWGdr2j6Q5yOgJEBZBdiD1uBE1qsuPlVg9Qry+S6Peg4ld17k4QQ5AL90Jy4td785PI0h0CIdRXp9nxRnVGtaK14WO3S/TOg7P5sYyjt+55tt4J+swR9sRxPg8gkVCuGro4zjl/bByGgo4H5Ycyuimu8a0lct3mhosRwni2eIrRTK36dIrwLsE7IlbeaImA3+ifNyNvnGzobRrWeU9Heprp8ziN6xr/cEewP8+spXlFCfMMkNIyeU56l/9HtBQ01C7mUXkjDg5Z/rU1hAZpryH5Fo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3540.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(6506007)(86362001)(26005)(316002)(478600001)(110136005)(6486002)(8936002)(186003)(6512007)(8676002)(2616005)(2906002)(66476007)(91956017)(66946007)(66446008)(64756008)(66556008)(76116006)(36756003)(5660300002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 3p9O6g075OVzxE573o+Reonp+Zzq9CLBWtgmLpemveTPZofi+NEVUSeQZu4F/Hp833qRUVeov2uMs43uq5RzsC6CW8dPqo48clXJ3H93aKSEmrx//EcdnGlAmJdYuNBLR++BPJzFZG9X+gW3SuoJMet7kcFwjkWYNaz2iSUmeoa3AXyy6nBhI/pdDAr0uJVgf38QjYwJQ00thtIAS98BoY6O0QFQfM6gMOuESV6Y49PwlEn9D5DOJTDergDzhPpoDIivegA1FdoALHGK3/TaGtVEy8iVHjHz8q95tJ1BpTAQYmoBCSIB+HXlKa3Po/v8Ejn0TCTf2tiEvgBk480HCsV1/P8ay7GMJwWz/kwU20QReeinem+RxOVklBJ3cQF+y8/d1Nzoduns2wLatEB6qPI81qMkz4EEiu1y+l4/ENBW8ns5kOcIFf35eY6k2ujiqz5QF0MATheCQ+fKWWou546alkvh1FHOtdmrZKlrtt42bEC0fkVRs+MbqC3M/7g1
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D56397B8FA460E4EABAC263A69BAB666@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1fc5e8-b886-4560-ba22-08d800cba208
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 16:49:46.9037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IFB9rZU3PaaYIXSinC+N81nqwY4KSyCh6CKU/EKx3x3zb3BmE3HOedQr3ASKMERTBPP4NF7GwchxKaxht1mI2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3140
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCAyMDIwLTA1LTI1IGF0IDE3OjE1ICswMjAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3Rl
Og0KPiBPbiBNb24sIDIwMjAtMDUtMjUgYXQgMTc6MDIgKzAyMDAsIE9saXZlciBOZXVrdW0gd3Jv
dGU6DQo+ID4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0
aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNh
ZmUuDQo+ID4gDQo+ID4gDQo+ID4gQW0gTW9udGFnLCBkZW4gMjUuMDUuMjAyMCwgMTQ6NDYgKzAw
MDAgc2NocmllYiBKb2FraW0gVGplcm5sdW5kOg0KPiA+IA0KPiA+ID4gVGhpcyAoRU1JPykgZGlz
Y29ubmVjdCBjYXVzZXMgMiB0aGluZ3MuDQo+ID4gPiAxKSBJIGxvb3NlIHRoZSBUVFkgdGVtcG9y
YXJpbHkgYW5kIGhhdmUgdG8gcmVjb25uZWN0Lg0KPiA+IA0KPiA+IFVuZm9ydHVuYXRlbHkgSSBz
ZWUgbm8gd2F5IHRvIHJlZXN0YWJsaXNoIGNvbnRhY3QgdHJhbnNwYXJhbnRseQ0KPiA+IG9uIHRo
ZSBsZXZlbCBvZiB0aGUgZHJpdmVyLg0KPiA+IA0KPiA+ID4gMikgQWZ0ZXIgcmVjb25uZWN0IHRo
ZXJlIGFyZSBnYXJiYWdlIGNoYXJzIG9uIHRoZSBnYWRnZXQgc2lkZSwgc3VjaCBhczoNCj4gPiA+
ICAgICAgaO+/vV5AXkDvv70gXkBeQO+/vSBeQA0KPiA+IA0KPiA+IFRoaXMgbG9va3MgbGlrZSBN
TSBpcyBhY3RpbmcgdXAgaW4gdXNlciBzcGFjZS4NCj4gPiANCj4gPiA+ICAgIG9yDQo+ID4gPiAg
ICAgIFjvv73vv73vv70pSO+/ve+/vTTEnl7vv73vv73vv70NCj4gPiA+ICAgIHdoaWNoIGNhdXNl
cyBjb25mdXNpb24gb24gZm9yIHRoZSB0dHkvYmFzaCBvbiB0aGUgZ2FkZ2V0Lg0KPiA+ID4gDQo+
ID4gPiBUaGUgZGlzY29ubmVjdCBpcyBtb3N0bHkganVzdCBhbm5veWluZyBidXQgdGhlIGdhcmJh
Z2UgY2hhcnMgYXJlIGEgbWFqb3IgcGFpbiwgb25lIGNhbm5vdCB0cnVzdA0KPiA+ID4gdGhhdCBj
bWRzIGFyZSB1bmRlcnN0b2QuIElzIHRoZXJlIGEgYnVnIGluIHR0eUFDTSBkcml2ZXIgY2F1c2lu
ZyB0aGVzZT8NCj4gPiANCj4gPiBIaSwNCj4gPiANCj4gPiB0aGFua3MgZm9yIHRoZSBidWcgcmVw
b3J0LiBUaGUgbW9zdCBsaWtlbHkgY2F1c2Ugb2YgeW91ciBwcm9ibGVtIGlzDQo+ID4gTW9kZW1N
YW5hZ2VyIHByb2JpbmcgdGhlIG5ldyBkZXZpY2UuIEl0IGhhcyBhIGJsYWNrbGlzdC4NCj4gDQo+
IE5vLCBJIGhhdmUgYWxyZWFkeSBibGFja2xpc3RlZCB0aGlzIGRldmljZSBmcm9tIG1vZGVtbWFu
Z2VyLCBpcyBibGFja2xpc3Qgbm90IHJlbGlhYmxlIGluIHRoaXMgY2FzZT8NCj4gDQo+ICBKb2Nr
ZQ0KPiANCg0KVG8gYmUgY2xlYXIsIEkgY2FuIHB1bGwgdGhlIGNhYmxlIGFuZCBwdXQgaXQgYmFj
ayBhbmQgdGhlcmUgYXJlIG5vIGdhcmJhZ2UgY2hhcnMuDQpUaGVyZSBpcyBhbHNvIHRoaXMgZXJy
b3I6DQpbV2VkIE1heSAyMCAxNDowMzoyNSAyMDIwXSBjZGNfYWNtIDEtNi4zOjEuMTogYWNtX2N0
cmxfaXJxIC0gdXNiX3N1Ym1pdF91cmIgZmFpbGVkOiAtMTkNCltXZWQgTWF5IDIwIDE0OjAzOjI1
IDIwMjBdIHVzYiAxLTYtcG9ydDI6IGF0dGVtcHQgcG93ZXIgY3ljbGUNCltXZWQgTWF5IDIwIDE0
OjAzOjI2IDIwMjBdIHVzYiAxLTYuMzogVVNCIGRpc2Nvbm5lY3QsIGRldmljZSBudW1iZXIgODYN
CltXZWQgTWF5IDIwIDE0OjAzOjI2IDIwMjBdIGNkY19hY20gMS02LjM6MS4xOiBmYWlsZWQgdG8g
c2V0IGR0ci9ydHMNCg0KU2hvdWxkIG5vdCB0aGlzIGF1dG8gcmVlbmFibGUgZW11bGF0ZSByZWF0
dGFjaGluZyB0aGUgVVNCIGNhYmxlPw0KDQogICAgIEpvY2tlDQo=
