Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D9D1F94F9
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 13:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbgFOLBY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 07:01:24 -0400
Received: from mail-dm6nam12on2065.outbound.protection.outlook.com ([40.107.243.65]:28895
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728815AbgFOLBU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Jun 2020 07:01:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYSoiAItyeUop2vJWjsCs9amD+6WXFb0FA/hANGacmKi1Q3K7CjRqJfVh4szieYICjy7TCT6zr1fxH4nKaluRaFxqlXyZI7qiCmGI82IRkcMH2LjY+Qz7/qEdYCCpOYby9vD61r9wMEbKS5NegxIHViMcv9L8l6aO5h430IYndQ+v4vdY+//EMUVUOC0eUaV2OOhlPd5FcFv+rsZf9V/HhX/V49358He2vIbkAi9I1CZbdThb1Oqp5NcQisTcV1ZHTBrmDHjQR6+fgl8oGlXzX/0dFZfK69Hx4cO6e6mPtvap8GPVIZqtpG+cI3DEvaMZTXLHH4C2rR93tfR77KDrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAXiY6tfoYD0rPa78qPTT9QLxT8lqXv+mJY6xeGLDkQ=;
 b=jXjbqXzliYFA2y/5mnWeId1/Inci0CDga9h9R27fL1Rh/wyYVnkEHZDHI1L939wIobNymH9yo1CszbUnWysYww/3t8gTjz3GUJ+y0bOCfDsviy0xlQRjW9PYiIYWSdQdR0wd+tf+nBiuW+jXDy/KBF1lT3vyD6MpBOYkgBIngLn4wuqZG43vLDmA6CDosMRQzd3s43cgitwJrmwyvoTIQIH22Upbbdg5x6K/T+KHd2vwKIzHpsPLnynT/TxVYHtP5r3E5cKZnlGBBSOjy3Bmxrd10xXoo5lddzZJg3iq4cjwHdAg7yzuoUjY+pntu2kJnm+JmXiQoPXxnGMOLaqggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAXiY6tfoYD0rPa78qPTT9QLxT8lqXv+mJY6xeGLDkQ=;
 b=ebWi0UY1jE9xNfZuQg9NZDU/0WHnCpshGLt8pQuQUHMq48y1hGmwk8zBqj0pD+nrCLAgOq7yQUNxm2mN+FnOpqTqC2u+VN71AXyu0f6kiywELrEZKV5k4REYnT5Ucya1OzblmbZvzuUh8zsrrWOkAWwWowLlT6PHfxxkbj2oBmM=
Received: from MWHPR1001MB2190.namprd10.prod.outlook.com
 (2603:10b6:301:2e::20) by MWHPR10MB1918.namprd10.prod.outlook.com
 (2603:10b6:300:10b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Mon, 15 Jun
 2020 11:01:18 +0000
Received: from MWHPR1001MB2190.namprd10.prod.outlook.com
 ([fe80::b439:ba0:98d6:c2d1]) by MWHPR1001MB2190.namprd10.prod.outlook.com
 ([fe80::b439:ba0:98d6:c2d1%5]) with mapi id 15.20.3088.028; Mon, 15 Jun 2020
 11:01:18 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "oneukum@suse.com" <oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Topic: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Index: AQHWMqM6W5iP9Jkv9UCEGIiDuBaJw6i45d+AgAADdICAABpkAIABC5qAgAADbYCAH5CRgA==
Date:   Mon, 15 Jun 2020 11:01:18 +0000
Message-ID: <d918707d2a8684a17a79b7bfd21ca18eca0cf57f.camel@infinera.com>
References: <6a4fe396ab5ae6cda548e904c57bc823103999d7.camel@infinera.com>
         <1590418977.2838.16.camel@suse.com>
         <b39259fc7f397b27f4af145eeafb33ec36638660.camel@infinera.com>
         <a3f4a9bbde9efd2827b2a02c46f86c8ba7853bc6.camel@infinera.com>
         <1590482853.2838.26.camel@suse.com>
         <8cf71160e703a18b28d27a844406d42f6cadf39b.camel@infinera.com>
In-Reply-To: <8cf71160e703a18b28d27a844406d42f6cadf39b.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d6d8afa-7ab4-4e64-1b3d-08d8111b6e46
x-ms-traffictypediagnostic: MWHPR10MB1918:
x-microsoft-antispam-prvs: <MWHPR10MB1918313CA8493C85A73E8567F49C0@MWHPR10MB1918.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04359FAD81
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D8Rz6Srn1BzEXWKYd5Orn7VN4vCG1/tEZSHwbo7eoQgLUpeQfGpzidXKNvFOlzgLwdNYpO4m7Al+2BGH9xu2NYXvy/ZMzsuTFwmJI7IsFc9Nunufx1B2Z4oDspQBfh9QMV/VSvtza/akWWTNaKuiucEh6ji64tvnD2Dme2h3i1wbNMYt40tmX9YeQbNWqJ9Zsy0me6PMpJ8uD9DDP4MuUqNiehmY+84N71zEuGA6TwheXzz40wc77SqYq20so2g/RfjAdgW0AWmZJ0nRJtn4kuAjB67oVxsP/NoTEg1KqgRu670Wd1AsTJUtl7VybITJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2190.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(136003)(376002)(366004)(39850400004)(6486002)(8936002)(6506007)(36756003)(76116006)(2906002)(86362001)(91956017)(83380400001)(8676002)(316002)(64756008)(6512007)(26005)(2616005)(478600001)(66946007)(5660300002)(110136005)(66556008)(66476007)(186003)(71200400001)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: OgSpRp6D00EmSuoqy9R8JOWI6QRajsb89QIcy7mPXvrTe5vMwde4x3YJPq+bbo6dsQXbw+jVrAhSBKahfyl7eKpOQ8hpDWyouBoHojqOhTzLXofZMqzHGglJWnEsOOYyZIijqLfFFhe1hXAG29c4XQ8a1JYdbNeT5oyoiXwQhcMJzobG2I+IQhqZIKSUYenUt5/Mev1+odsDqLzNHQohSQ51nfQshn6IM4GxJqroiW5tPgmIZaPt+OGzYoGPDgmP/wVDgylC3qpqsKVCJQTjDckiO2zWgDJvmJcuhywZa+iEF+rpAbQueeTvS1MZ4uBo/OSl5MdIIASDuzd6vYG1OM4jIZpsh0nQEH++6daVgB+98AKYvQH8+/+IL1kEhAYKgkZrJG1rXiSMywgh+iCk9kiJ+YqMHsJbH4WrRP3g+4B1FLG8wJ+X85/nox8eEn9mySkv5xv+8QGBBrG6rgFdp7i4K9cSJiSWnPdM3TyYHnQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B40E635EA5A674BA1D99DBCAF81111F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6d8afa-7ab4-4e64-1b3d-08d8111b6e46
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2020 11:01:18.2184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZJ5EBuE9q4lcb0aNJ56rpZwh5yFdFCkwJK7xGO2T3ZAMGJoORSY6D8SlUMk4BLMbZQzctOp+PdWxvYkap7DcsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1918
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCAyMDIwLTA1LTI2IGF0IDEwOjU5ICswMjAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3Rl
Og0KPiBPbiBUdWUsIDIwMjAtMDUtMjYgYXQgMTA6NDcgKzAyMDAsIE9saXZlciBOZXVrdW0gd3Jv
dGU6DQo+ID4gQW0gTW9udGFnLCBkZW4gMjUuMDUuMjAyMCwgMTY6NDkgKzAwMDAgc2NocmllYiBK
b2FraW0gVGplcm5sdW5kOg0KPiA+IA0KPiA+ID4gVG8gYmUgY2xlYXIsIEkgY2FuIHB1bGwgdGhl
IGNhYmxlIGFuZCBwdXQgaXQgYmFjayBhbmQgdGhlcmUgYXJlIG5vIGdhcmJhZ2UgY2hhcnMuDQo+
ID4gPiBUaGVyZSBpcyBhbHNvIHRoaXMgZXJyb3I6DQo+ID4gPiBbV2VkIE1heSAyMCAxNDowMzoy
NSAyMDIwXSBjZGNfYWNtIDEtNi4zOjEuMTogYWNtX2N0cmxfaXJxIC0gdXNiX3N1Ym1pdF91cmIg
ZmFpbGVkOiAtMTkNCj4gPiA+IFtXZWQgTWF5IDIwIDE0OjAzOjI1IDIwMjBdIHVzYiAxLTYtcG9y
dDI6IGF0dGVtcHQgcG93ZXIgY3ljbGUNCj4gPiA+IFtXZWQgTWF5IDIwIDE0OjAzOjI2IDIwMjBd
IHVzYiAxLTYuMzogVVNCIGRpc2Nvbm5lY3QsIGRldmljZSBudW1iZXIgODYNCj4gPiA+IFtXZWQg
TWF5IDIwIDE0OjAzOjI2IDIwMjBdIGNkY19hY20gMS02LjM6MS4xOiBmYWlsZWQgdG8gc2V0IGR0
ci9ydHMNCj4gPiA+IA0KPiA+ID4gU2hvdWxkIG5vdCB0aGlzIGF1dG8gcmVlbmFibGUgZW11bGF0
ZSByZWF0dGFjaGluZyB0aGUgVVNCIGNhYmxlPw0KPiA+IA0KPiA+IEhpLA0KPiA+IA0KPiA+IHll
cyBpdCBzaG91bGQuIFlvdSBmaW5kIHRoZSBnYXJhZ2UgY2hhcmFjdGVycyBhZnRlciB0aGUgRU1J
IGV2ZW50LiBIb3cNCj4gPiBzdXJlIGFyZSB5b3UgdGhhdCB0aGV5IGFycml2ZSBhZnRlciB0aGUg
ZXZlbnQgYW5kIG5vdCBkdXJpbmcgdGhlIGV2ZW50Pw0KPiA+IA0KPiANCj4gRG9uJ3Qga25vd24g
aG93IHRvIGRldGVybWluZSB0aGF0PyANCj4gSSBjYW4gc2F5IHRoYXQgDQo+ICAgIGFjbV9jdHJs
X2lycSAtIHVzYl9zdWJtaXRfdXJiIGZhaWxlZDogLTE5DQo+IGFuZA0KPiAgICBjZGNfYWNtIDEt
Ni4zOjEuMTogZmFpbGVkIHRvIHNldCBkdHIvcnRzDQo+IGFyZSB1bmlxdWUgdG8gdGhpcyBFTUkg
ZXZlbnQgdGhvdWdoLiBJdCBkb2VzIG5vdCBmZWVsIGxpa2UgdGhpcw0KPiByZWVuYWJsaW5nIGZv
bGxvdyB0aGUgc2FtZSBwcm9jZWR1cmUgYXMgYSBjYWJsZSBwdWxsPw0KPiBBcyBJIGNhbiBvbmx5
IHNlZSB0aGUgYWJvdmUgdHdvIGVycm9ycyBJIHRoaW5rIHdlIHNob3VsZCBnZXQgcmlkIG9mDQo+
IHRoZXNlIGZpcnN0Lg0KPiANCj4gIEpvY2tlDQoNCkJlZW4gZG9pbmcgc29tZSBtb3JlIHRlc3Rp
bmcgYW5kIGZvdW5kIHNvbWUgaW50ZXJlc3RpbmcgcG9pbnRzIGZvciB0aGlzDQogICBkaXNhYmxl
ZCBieSBodWIgKEVNST8pLCByZS1lbmFibGluZy4uLg0KZXJyb3IgbWVzc2FnZToNCg0KMSkgSSBk
b2VzIG5vdCBoYXBwZW4gb24gV2luZG93cy4NCjIpIEl0IG9ubHkgaGFwcGVucyB3aGVuIHJlYm9v
dGluZyB0aGUgVURDIGRldmljZSBhbmQgYWx3YXlzIGFmdGVyIHRoZSBob3N0cyBoYXMgc2VlbiBh
Og0KICAgIGNkY19ldGhlciAxLTExLjI6MS4wIHVzYjA6IHVucmVnaXN0ZXIgJ2NkY19ldGhlcicg
dXNiLTAwMDA6MDA6MTQuMC0xMS4yLCBDREMgRXRoZXJuZXQgRGV2aWNlDQoNCk1heWJlIHNvbWUg
cmFjZSBpbiBDREMgdGVhciBkb3duID8NCg0KICAgSm9ja2UNCg==
