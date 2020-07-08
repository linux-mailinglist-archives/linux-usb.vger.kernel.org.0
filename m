Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7761A217D04
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 04:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729399AbgGHCXC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 22:23:02 -0400
Received: from mail-eopbgr700073.outbound.protection.outlook.com ([40.107.70.73]:55617
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729199AbgGHCXC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jul 2020 22:23:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WeN74N3ZQGvfMJBLIVqIYwuuTyTVWi/yP2H30x+/IAV8Wa2VcYfqX/jfGRrnpppBem77/ouUVgilARHAPf0fnKeJKfnGuCIvPcNMpdr3e6PCjwtm8iyTcanbuVk8+3VuBxc15wPlL/sCpS3260bDR0nk6kSM/Ca0D1ToJWNzRlP/QWnO8XZvzT4uu+JewUJquiLgKbhL4Lkp1/oepz08WfHQ83xqvWYK0+tJACm0IUMtBxABbVknySXAR4SDlFz+KepXNLZpIlzzJMYSv6q3YNnqwK3jf9LpzRb8Rp68rphzDNfCvYjMR9MVQIh3Pm7jKVRIu30PswbuhMHRodhkPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNxVxdWM+czGqT3BfTEr2MFR456KNseZH2Q+TcWhWvA=;
 b=kLSsTMEr9QdTxODJIgzIkvnC+k9uxrdO6H1iVK868Am5Wpb9LImxg6t8iZr6RuKUNj10LJWVWvRypy4KPI88YXFOV6TT/NRP3QlM4EzGbABXCaMgWKe2k2XyrGhf4hKlTP4Myhe6apiLB+zxMyAhI9g5gbUJnx1wuaJYyFvlN2oXV2lO3H6TEtK5DG4dDx8zCK+0VR+cF6S7Hi3KTEuRt8wN2TCeFQRh1TCQAsmWNUsgoEYFEOJpflwcK7j6p4M4VG1hroYuCiLsff6+qQT7IA8mxVAdg41fspfZLwUsWkCfH9wc8nFNm89/jhDHBSuIPXIXIir9nt5fL6D/NuQd9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNxVxdWM+czGqT3BfTEr2MFR456KNseZH2Q+TcWhWvA=;
 b=o8itE1LFJFNIhNbzebuubpzn1jIoGWfO35dr/3Wbeh3NivBEsE1JCoaEoLBB8jyEnsoriZXOk8nwOGus/Sm7oPyGKiJc5An6BtfzTONMyJ21yL3NKGRMVfFNial9M8gJk1OXghnbPOlojkLIEPZEzs17XPLAMpGy7rd9zqN3vT4=
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by BY5PR11MB4387.namprd11.prod.outlook.com (2603:10b6:a03:1cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Wed, 8 Jul
 2020 02:22:58 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::3d7d:dfc1:b35d:63d1]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::3d7d:dfc1:b35d:63d1%7]) with mapi id 15.20.3174.021; Wed, 8 Jul 2020
 02:22:58 +0000
From:   "Zhang, Qiang" <Qiang.Zhang@windriver.com>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "andrzej.p@samsung.com" <andrzej.p@samsung.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>
Subject: =?gb2312?B?u9i4tDogW1BBVENIXSB1c2I6IGdhZGdldDogZnVuY3Rpb246IHByaW50ZXI6?=
 =?gb2312?Q?_Interface_is_disabled_and_returns_error?=
Thread-Topic: [PATCH] usb: gadget: function: printer: Interface is disabled
 and returns error
Thread-Index: AQHWT3bFuthXI8KBRkiJKgy7AeHyCKj6CuUdgALyOKU=
Date:   Wed, 8 Jul 2020 02:22:58 +0000
Message-ID: <BYAPR11MB263201D84DF870F9D65836BBFF670@BYAPR11MB2632.namprd11.prod.outlook.com>
References: <20200630052331.33020-1-qiang.zhang@windriver.com>,<BYAPR11MB26321795232DA6C583866F82FF690@BYAPR11MB2632.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB26321795232DA6C583866F82FF690@BYAPR11MB2632.namprd11.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 213a9969-c57d-4369-34b9-08d822e5d4d5
x-ms-traffictypediagnostic: BY5PR11MB4387:
x-microsoft-antispam-prvs: <BY5PR11MB438706C3DA3F8860FA0E423BFF670@BY5PR11MB4387.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UFAzhGqM37p9/ujDRqwvwL8KovPlev0GTvOwFB7muuEUW9nI3h3aCUGqtBlwxFpcriMH6mrJyJ1qLkBjvoe3TR1JNj9m6IFnJNfkyP+SZix8wJF/loeTiJ2gEtQeGb319tzY914wOGw95dsC4FUeImGd9WMaadCQkfRfPstGrgSWNLuryMIfU0Dp58LiSakuUcTLiK491WlOxlebyAlTeIyuIvZLabaR2Eavjf+jWu0iIzzr8D8W5HJHkSuK4h1Ah9BtFd9+gZ/W64s7Ydw2IntmjkLIvQDSZiCNfTv0ocJs5dVH6YC3CtvdvEbJ//ZlHIuY9m1B15u1VuC0VtLNDw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(346002)(376002)(136003)(396003)(366004)(54906003)(6916009)(186003)(7696005)(86362001)(55016002)(71200400001)(9686003)(83380400001)(5660300002)(33656002)(4326008)(2906002)(66946007)(91956017)(66446008)(64756008)(66556008)(66476007)(76116006)(6506007)(478600001)(26005)(52536014)(224303003)(8936002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: DdaGzAIxt5DZMVQ4acpWu0eoFiXhxkskaTxi0+EMRmeZI7aVseENEJ4TVeNRcjt/kZeBWSwBJu5VW1Nlq2QeHo1Y28oqjC49lLmWWMfuOrnC4Z0CfWlfldeCqoYkNDd4SI9hbDGI/21aTDpY1k37FNq0CLBzdw2z85c6mLSrUxIMuXnJ0AnEnZvQR4/V5UAkVMK3ssH1bQ68NjvSjNaeqA7ER4ipxEYYjO7wxDDGbT4HPr9n+Er4YymcVcgC4zbMIDiEes4g7e/hPIYywPdQ2E1R8VVsnvD0SmC2N4edM9UrjX03xJwUhZlDKWSiDTapQLGV/3vBY1N5vgkwl0P8NsVab8THAONbCR5hzWeTpwHgoQn41G5yAtuuHLLGUDSxvb0b1o6IASH8fShoark2/DNbWSDsNUqO/8NUPnIRSFGC+FHO8C/wHFBjnro6FZhdrIWE81Zey4VqUAxKYhAq8W4qhDhLZG7DxuKaJfDV2yg=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 213a9969-c57d-4369-34b9-08d822e5d4d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2020 02:22:58.5463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZEK5Oiug24GeA4917yL/Eirn8AcSX6aI/rCImpcvthiGCD1bmYgzC67eWxrO1mOXoSJhU4hBG0M55Dwkw6pCje/CqkCqTzEapE7/mEjq5JI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4387
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQpIaSBGZWxpcGUNClBsZWFzZSByZXZpZXcgdGhpcyBjaGFuZ2UuDQp0aGFua3MNClpoYW5nIFFp
YW5nDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8/sjL
OiBsaW51eC11c2Itb3duZXJAdmdlci5rZXJuZWwub3JnIDxsaW51eC11c2Itb3duZXJAdmdlci5r
ZXJuZWwub3JnPiC0+rHtIFpoYW5nLCBRaWFuZyA8UWlhbmcuWmhhbmdAd2luZHJpdmVyLmNvbT4N
Creiy83KsbzkOiAyMDIwxOo31MI2yNUgMTM6MjANCsrVvP7IyzogYmFsYmlAa2VybmVsLm9yZw0K
s63LzTogZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5v
cmc7IGFuZHJ6ZWp0cDIwMTBAZ21haWwuY29tDQrW98ziOiC72Li0OiBbUEFUQ0hdIHVzYjogZ2Fk
Z2V0OiBmdW5jdGlvbjogcHJpbnRlcjogSW50ZXJmYWNlIGlzIGRpc2FibGVkIGFuZCByZXR1cm5z
IGVycm9yDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8
/sjLOiBsaW51eC11c2Itb3duZXJAdmdlci5rZXJuZWwub3JnIDxsaW51eC11c2Itb3duZXJAdmdl
ci5rZXJuZWwub3JnPiC0+rHtIHFpYW5nLnpoYW5nQHdpbmRyaXZlci5jb20gPHFpYW5nLnpoYW5n
QHdpbmRyaXZlci5jb20+DQq3osvNyrG85DogMjAyMMTqNtTCMzDI1SAxMzoyMw0KytW8/sjLOiBi
YWxiaUBrZXJuZWwub3JnDQqzrcvNOiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgbGludXgt
dXNiQHZnZXIua2VybmVsLm9yZw0K1vfM4jogW1BBVENIXSB1c2I6IGdhZGdldDogZnVuY3Rpb246
IHByaW50ZXI6IEludGVyZmFjZSBpcyBkaXNhYmxlZCBhbmQgcmV0dXJucyBlcnJvcg0KDQpGcm9t
OiBacWlhbmcgPHFpYW5nLnpoYW5nQHdpbmRyaXZlci5jb20+DQoNCkFmdGVyIHRoZSBkZXZpY2Ug
aXMgZGlzY29ubmVjdGVkIGZyb20gdGhlIGhvc3Qgc2lkZSwgdGhlIGludGVyZmFjZSBvZg0KdGhl
IGRldmljZSBpcyByZXNldC4gSWYgdGhlIHVzZXJzcGFjZSBvcGVyYXRlcyB0aGUgZGV2aWNlIGFn
YWluLA0KYW4gZXJyb3IgY29kZSBzaG91bGQgYmUgcmV0dXJuZWQuDQoNClNpZ25lZC1vZmYtYnk6
IFpxaWFuZyA8cWlhbmcuemhhbmdAd2luZHJpdmVyLmNvbT4NCi0tLQ0KIGRyaXZlcnMvdXNiL2dh
ZGdldC9mdW5jdGlvbi9mX3ByaW50ZXIuYyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysN
CiAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfcHJpbnRlci5jIGIvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1
bmN0aW9uL2ZfcHJpbnRlci5jDQppbmRleCA5YzdlZDI1MzlmZjcuLjJiNDVhNjFlNDIxMyAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi9mX3ByaW50ZXIuYw0KKysrIGIv
ZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfcHJpbnRlci5jDQpAQCAtMzM4LDYgKzMzOCwx
MSBAQCBwcmludGVyX29wZW4oc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmZkKQ0K
DQogICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZkZXYtPmxvY2ssIGZsYWdzKTsNCg0KKyAgICAg
ICBpZiAoZGV2LT5pbnRlcmZhY2UgPCAwKSB7DQorICAgICAgICAgICAgICAgc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmZGV2LT5sb2NrLCBmbGFncyk7DQorICAgICAgICAgICAgICAgcmV0dXJuIC1F
Tk9ERVY7DQorICAgICAgIH0NCisNCiAgICAgICAgaWYgKCFkZXYtPnByaW50ZXJfY2Rldl9vcGVu
KSB7DQogICAgICAgICAgICAgICAgZGV2LT5wcmludGVyX2NkZXZfb3BlbiA9IDE7DQogICAgICAg
ICAgICAgICAgZmQtPnByaXZhdGVfZGF0YSA9IGRldjsNCkBAIC00MzAsNiArNDM1LDEyIEBAIHBy
aW50ZXJfcmVhZChzdHJ1Y3QgZmlsZSAqZmQsIGNoYXIgX191c2VyICpidWYsIHNpemVfdCBsZW4s
IGxvZmZfdCAqcHRyKQ0KICAgICAgICBtdXRleF9sb2NrKCZkZXYtPmxvY2tfcHJpbnRlcl9pbyk7
DQogICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZkZXYtPmxvY2ssIGZsYWdzKTsNCg0KKyAgICAg
ICBpZiAoZGV2LT5pbnRlcmZhY2UgPCAwKSB7DQorICAgICAgICAgICAgICAgc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmZGV2LT5sb2NrLCBmbGFncyk7DQorICAgICAgICAgICAgICAgbXV0ZXhfdW5s
b2NrKCZkZXYtPmxvY2tfcHJpbnRlcl9pbyk7DQorICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9E
RVY7DQorICAgICAgIH0NCisNCiAgICAgICAgLyogV2Ugd2lsbCB1c2UgdGhpcyBmbGFnIGxhdGVy
IHRvIGNoZWNrIGlmIGEgcHJpbnRlciByZXNldCBoYXBwZW5lZA0KICAgICAgICAgKiBhZnRlciB3
ZSB0dXJuIGludGVycnVwdHMgYmFjayBvbi4NCiAgICAgICAgICovDQpAQCAtNTYxLDYgKzU3Miwx
MiBAQCBwcmludGVyX3dyaXRlKHN0cnVjdCBmaWxlICpmZCwgY29uc3QgY2hhciBfX3VzZXIgKmJ1
Ziwgc2l6ZV90IGxlbiwgbG9mZl90ICpwdHIpDQogICAgICAgIG11dGV4X2xvY2soJmRldi0+bG9j
a19wcmludGVyX2lvKTsNCiAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmRldi0+bG9jaywgZmxh
Z3MpOw0KDQorICAgICAgIGlmIChkZXYtPmludGVyZmFjZSA8IDApIHsNCisgICAgICAgICAgICAg
ICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkZXYtPmxvY2ssIGZsYWdzKTsNCisgICAgICAgICAg
ICAgICBtdXRleF91bmxvY2soJmRldi0+bG9ja19wcmludGVyX2lvKTsNCisgICAgICAgICAgICAg
ICByZXR1cm4gLUVOT0RFVjsNCisgICAgICAgfQ0KKw0KICAgICAgICAvKiBDaGVjayBpZiBhIHBy
aW50ZXIgcmVzZXQgaGFwcGVucyB3aGlsZSB3ZSBoYXZlIGludGVycnVwdHMgb24gKi8NCiAgICAg
ICAgZGV2LT5yZXNldF9wcmludGVyID0gMDsNCg0KQEAgLTY2Nyw2ICs2ODQsMTMgQEAgcHJpbnRl
cl9mc3luYyhzdHJ1Y3QgZmlsZSAqZmQsIGxvZmZfdCBzdGFydCwgbG9mZl90IGVuZCwgaW50IGRh
dGFzeW5jKQ0KDQogICAgICAgIGlub2RlX2xvY2soaW5vZGUpOw0KICAgICAgICBzcGluX2xvY2tf
aXJxc2F2ZSgmZGV2LT5sb2NrLCBmbGFncyk7DQorDQorICAgICAgIGlmIChkZXYtPmludGVyZmFj
ZSA8IDApIHsNCisgICAgICAgICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkZXYtPmxv
Y2ssIGZsYWdzKTsNCisgICAgICAgICAgICAgICBpbm9kZV91bmxvY2soaW5vZGUpOw0KKyAgICAg
ICAgICAgICAgIHJldHVybiAtRU5PREVWOw0KKyAgICAgICB9DQorDQogICAgICAgIHR4X2xpc3Rf
ZW1wdHkgPSAobGlrZWx5KGxpc3RfZW1wdHkoJmRldi0+dHhfcmVxcykpKTsNCiAgICAgICAgc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgmZGV2LT5sb2NrLCBmbGFncyk7DQoNCkBAIC02ODksNiArNzEz
LDEzIEBAIHByaW50ZXJfcG9sbChzdHJ1Y3QgZmlsZSAqZmQsIHBvbGxfdGFibGUgKndhaXQpDQoN
CiAgICAgICAgbXV0ZXhfbG9jaygmZGV2LT5sb2NrX3ByaW50ZXJfaW8pOw0KICAgICAgICBzcGlu
X2xvY2tfaXJxc2F2ZSgmZGV2LT5sb2NrLCBmbGFncyk7DQorDQorICAgICAgIGlmIChkZXYtPmlu
dGVyZmFjZSA8IDApIHsNCisgICAgICAgICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZk
ZXYtPmxvY2ssIGZsYWdzKTsNCisgICAgICAgICAgICAgICBtdXRleF91bmxvY2soJmRldi0+bG9j
a19wcmludGVyX2lvKTsNCisgICAgICAgICAgICAgICByZXR1cm4gRVBPTExFUlIgfCBFUE9MTEhV
UDsNCisgICAgICAgfQ0KKw0KICAgICAgICBzZXR1cF9yeF9yZXFzKGRldik7DQogICAgICAgIHNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJmRldi0+bG9jaywgZmxhZ3MpOw0KICAgICAgICBtdXRleF91
bmxvY2soJmRldi0+bG9ja19wcmludGVyX2lvKTsNCkBAIC03MjIsNiArNzUzLDExIEBAIHByaW50
ZXJfaW9jdGwoc3RydWN0IGZpbGUgKmZkLCB1bnNpZ25lZCBpbnQgY29kZSwgdW5zaWduZWQgbG9u
ZyBhcmcpDQoNCiAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmRldi0+bG9jaywgZmxhZ3MpOw0K
DQorICAgICAgIGlmIChkZXYtPmludGVyZmFjZSA8IDApIHsNCisgICAgICAgICAgICAgICBzcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZkZXYtPmxvY2ssIGZsYWdzKTsNCisgICAgICAgICAgICAgICBy
ZXR1cm4gLUVOT0RFVjsNCisgICAgICAgfQ0KKw0KICAgICAgICBzd2l0Y2ggKGNvZGUpIHsNCiAg
ICAgICAgY2FzZSBHQURHRVRfR0VUX1BSSU5URVJfU1RBVFVTOg0KICAgICAgICAgICAgICAgIHN0
YXR1cyA9IChpbnQpZGV2LT5wcmludGVyX3N0YXR1czsNCi0tDQoyLjI0LjENCg0K
