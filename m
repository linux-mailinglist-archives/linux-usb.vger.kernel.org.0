Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CFD215221
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 07:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728466AbgGFFUj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 01:20:39 -0400
Received: from mail-eopbgr770047.outbound.protection.outlook.com ([40.107.77.47]:56533
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726020AbgGFFUj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Jul 2020 01:20:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWJ9qUQHUUZG9q3Bc1LvxXHDRl8FiWX519mULzJ7gHxageUmlgOInSpg4KZzVchhvACSXPJoLklafh3NaH6V6wzo5xNcGesj3ouG3aUnAPM1fex917S/nebKt2cvanLzw6XG9ZlApKeBeF9stSIlRB4HbUYSh7eP97+dHsBY1d9+6ApSZBxQ1diuDY+nyUgWXpMpMaw6N4Ck7sQG/jtzkw9VTEzv4w0YZw8jW1So/l5rFDmx6WO43UYXGv8e7GKWhEaHJ+qYVO0FFtNhTSYLpyIEhrPWVJOzRiG+UbuhhpizYyKD9roVe3RKr+DZtNuNcfZC4xRfOSnddehh0RId4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Q6xEQvnoaoaPhTjWFC7ImE8j5dj3lK4NGYHaxC0qp8=;
 b=kPxcOAZrANH+SDY4e7TD+nVbfoR9cfypB+h1wvipo0Q97TLAacwiYEPXz9oC2qr7vm1GRE1Jt9A2qi0OtbBO1c6u0AgxWCEhLHXqxbXkPgb095I+pJS0wO2gYZwcL5q5rkwLA5BcMqJraZTcm8+Lsvui+qc21vSiF8mt/BoG16tOSM/Z7HR/SUZWRRIoR4JbkXm09hzWiKOz31oKF74p7plG4oWXYGAa8M2w2loFXAIOz8b2HEZQcIL764fALgXrOfMuRrzTnK83mGtq0zT9FXlaYkwAAXn2FgN5Ge2Y2cQLkbsrEu1hxcOdWnGdn2sMHjM8FUBWPpIk28u7wCAwkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Q6xEQvnoaoaPhTjWFC7ImE8j5dj3lK4NGYHaxC0qp8=;
 b=C/hx399NnR5MDXDW7m8Nqr1uFYaKct1hf2NO93CxyzyZi9EsFVEZY4zfIIodENQbe7h+cDCQF9wPbB/K4xXcs2+npPGfw9fpWAhG+GMcnmTKdVe3WcSEYcqErnHSTf1o1QAcAZ/tKeb8GjCGNU992YzzBCsPpDFykQAslba8nj8=
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by BYAPR11MB2918.namprd11.prod.outlook.com (2603:10b6:a03:92::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Mon, 6 Jul
 2020 05:20:37 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::3d7d:dfc1:b35d:63d1]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::3d7d:dfc1:b35d:63d1%7]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 05:20:37 +0000
From:   "Zhang, Qiang" <Qiang.Zhang@windriver.com>
To:     "balbi@kernel.org" <balbi@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>
Subject: =?gb2312?B?u9i4tDogW1BBVENIXSB1c2I6IGdhZGdldDogZnVuY3Rpb246IHByaW50ZXI6?=
 =?gb2312?Q?_Interface_is_disabled_and_returns_error?=
Thread-Topic: [PATCH] usb: gadget: function: printer: Interface is disabled
 and returns error
Thread-Index: AQHWT3bFuthXI8KBRkiJKgy7AeHyCKj6CuUd
Date:   Mon, 6 Jul 2020 05:20:36 +0000
Message-ID: <BYAPR11MB26321795232DA6C583866F82FF690@BYAPR11MB2632.namprd11.prod.outlook.com>
References: <20200630052331.33020-1-qiang.zhang@windriver.com>
In-Reply-To: <20200630052331.33020-1-qiang.zhang@windriver.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18670d9a-0d84-42dd-dcbd-08d8216c50f4
x-ms-traffictypediagnostic: BYAPR11MB2918:
x-microsoft-antispam-prvs: <BYAPR11MB29181A544CC25178367C5ECCFF690@BYAPR11MB2918.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 04569283F9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: duX6h58UWLXNqZ7kC9J4wqbtzXLBWB4M67mNqK61Pi99/kKKNNg0ownucYdZ3Sdry+NF9a744yI4igHiKZ+zRcof1kdntpJm7e1bIMdnWAmuk46sX+D4jFOaaQUbS/JGfrshfllPMW//DU5Kek1Rk6gjeSo/cQEJS/9+62/d1IN34vXuMEm2XjEch16F71xtu9ylU4JAblvrOOOBeJVFFY0G1cyngpSAH3bEnAAWeOOoTgC2AX4mUOddGca69jlup2J3VaCfTuJ3JuG7Q5Z1Md+yDyRS1CdCQGGFFUj68vf/MwlpMtYVp16QCbJajKKJTp5bWEd+cVBGtz60bRxMHg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(396003)(366004)(376002)(39840400004)(86362001)(76116006)(91956017)(8936002)(4326008)(7696005)(26005)(66446008)(64756008)(66946007)(52536014)(6506007)(5660300002)(66476007)(66556008)(71200400001)(2906002)(316002)(186003)(33656002)(6916009)(224303003)(55016002)(83380400001)(9686003)(478600001)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: cMUuh/dxX1YtLEbVD42A60jc4tIOUk1hseJuOFoqjSU1CybLe6CCunVLer6J5QoqMdaWYYoj3gIeyMXaz4pi9e73z0xwSQH3O8j9zyyuB0AFS/VXc2SCTdx2jOHrltucru7S9VbySDpfbDQbzRw+jmjouKV8aPBsLfe0qxTvEgl7VVAQacxIDbsfQcFqxZyPhi1omr+FrscS6acMYu7tmjj3IGeHw4JJxjYS0CLLzRUQgqhF/io63DJuvzrdXDa3vvQNNmPElCEidPWXj3CcRwckL1SX5EWnrbTuUez/tqXOgfqkls+2SoHVxPApkMY/VASgl9d5JbvOtLBAAFzdQ07u1IUdFMvCG8tZ2WcsRYRDc3bGFvGfWKHX92rnO6EtXEHbEvK36q58is8XlMeXzI6b59gg1xOprVa7ctbtA+094T4oPhWFMktmwErgB1Fw1p91wxLIpxMJBaJJXjPCZnhtjw2134KEldyrPJmaceg=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18670d9a-0d84-42dd-dcbd-08d8216c50f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2020 05:20:36.9755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yuTf34stsk/+bxOvZVj97IS/ADpzjVKVK6C8KAcckFvhIO8wO6MKXXvAIWzcNy1Wzu75eRLp6Ev+usaIDiUNLOazDT8e4MUHIoMX8GjzULQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2918
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6IGxpbnV4
LXVzYi1vd25lckB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LXVzYi1vd25lckB2Z2VyLmtlcm5lbC5v
cmc+ILT6se0gcWlhbmcuemhhbmdAd2luZHJpdmVyLmNvbSA8cWlhbmcuemhhbmdAd2luZHJpdmVy
LmNvbT4NCreiy83KsbzkOiAyMDIwxOo21MIzMMjVIDEzOjIzDQrK1bz+yMs6IGJhbGJpQGtlcm5l
bC5vcmcNCrOty806IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBsaW51eC11c2JAdmdlci5r
ZXJuZWwub3JnDQrW98ziOiBbUEFUQ0hdIHVzYjogZ2FkZ2V0OiBmdW5jdGlvbjogcHJpbnRlcjog
SW50ZXJmYWNlIGlzIGRpc2FibGVkIGFuZCByZXR1cm5zIGVycm9yDQoNCkZyb206IFpxaWFuZyA8
cWlhbmcuemhhbmdAd2luZHJpdmVyLmNvbT4NCg0KQWZ0ZXIgdGhlIGRldmljZSBpcyBkaXNjb25u
ZWN0ZWQgZnJvbSB0aGUgaG9zdCBzaWRlLCB0aGUgaW50ZXJmYWNlIG9mDQp0aGUgZGV2aWNlIGlz
IHJlc2V0LiBJZiB0aGUgdXNlcnNwYWNlIG9wZXJhdGVzIHRoZSBkZXZpY2UgYWdhaW4sDQphbiBl
cnJvciBjb2RlIHNob3VsZCBiZSByZXR1cm5lZC4NCg0KU2lnbmVkLW9mZi1ieTogWnFpYW5nIDxx
aWFuZy56aGFuZ0B3aW5kcml2ZXIuY29tPg0KLS0tDQogZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0
aW9uL2ZfcHJpbnRlci5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBj
aGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRn
ZXQvZnVuY3Rpb24vZl9wcmludGVyLmMgYi9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl9w
cmludGVyLmMNCmluZGV4IDljN2VkMjUzOWZmNy4uMmI0NWE2MWU0MjEzIDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfcHJpbnRlci5jDQorKysgYi9kcml2ZXJzL3Vz
Yi9nYWRnZXQvZnVuY3Rpb24vZl9wcmludGVyLmMNCkBAIC0zMzgsNiArMzM4LDExIEBAIHByaW50
ZXJfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmQpDQoNCiAgICAgICAg
c3Bpbl9sb2NrX2lycXNhdmUoJmRldi0+bG9jaywgZmxhZ3MpOw0KDQorICAgICAgIGlmIChkZXYt
PmludGVyZmFjZSA8IDApIHsNCisgICAgICAgICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3Jl
KCZkZXYtPmxvY2ssIGZsYWdzKTsNCisgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCisg
ICAgICAgfQ0KKw0KICAgICAgICBpZiAoIWRldi0+cHJpbnRlcl9jZGV2X29wZW4pIHsNCiAgICAg
ICAgICAgICAgICBkZXYtPnByaW50ZXJfY2Rldl9vcGVuID0gMTsNCiAgICAgICAgICAgICAgICBm
ZC0+cHJpdmF0ZV9kYXRhID0gZGV2Ow0KQEAgLTQzMCw2ICs0MzUsMTIgQEAgcHJpbnRlcl9yZWFk
KHN0cnVjdCBmaWxlICpmZCwgY2hhciBfX3VzZXIgKmJ1Ziwgc2l6ZV90IGxlbiwgbG9mZl90ICpw
dHIpDQogICAgICAgIG11dGV4X2xvY2soJmRldi0+bG9ja19wcmludGVyX2lvKTsNCiAgICAgICAg
c3Bpbl9sb2NrX2lycXNhdmUoJmRldi0+bG9jaywgZmxhZ3MpOw0KDQorICAgICAgIGlmIChkZXYt
PmludGVyZmFjZSA8IDApIHsNCisgICAgICAgICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3Jl
KCZkZXYtPmxvY2ssIGZsYWdzKTsNCisgICAgICAgICAgICAgICBtdXRleF91bmxvY2soJmRldi0+
bG9ja19wcmludGVyX2lvKTsNCisgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCisgICAg
ICAgfQ0KKw0KICAgICAgICAvKiBXZSB3aWxsIHVzZSB0aGlzIGZsYWcgbGF0ZXIgdG8gY2hlY2sg
aWYgYSBwcmludGVyIHJlc2V0IGhhcHBlbmVkDQogICAgICAgICAqIGFmdGVyIHdlIHR1cm4gaW50
ZXJydXB0cyBiYWNrIG9uLg0KICAgICAgICAgKi8NCkBAIC01NjEsNiArNTcyLDEyIEBAIHByaW50
ZXJfd3JpdGUoc3RydWN0IGZpbGUgKmZkLCBjb25zdCBjaGFyIF9fdXNlciAqYnVmLCBzaXplX3Qg
bGVuLCBsb2ZmX3QgKnB0cikNCiAgICAgICAgbXV0ZXhfbG9jaygmZGV2LT5sb2NrX3ByaW50ZXJf
aW8pOw0KICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmZGV2LT5sb2NrLCBmbGFncyk7DQoNCisg
ICAgICAgaWYgKGRldi0+aW50ZXJmYWNlIDwgMCkgew0KKyAgICAgICAgICAgICAgIHNwaW5fdW5s
b2NrX2lycXJlc3RvcmUoJmRldi0+bG9jaywgZmxhZ3MpOw0KKyAgICAgICAgICAgICAgIG11dGV4
X3VubG9jaygmZGV2LT5sb2NrX3ByaW50ZXJfaW8pOw0KKyAgICAgICAgICAgICAgIHJldHVybiAt
RU5PREVWOw0KKyAgICAgICB9DQorDQogICAgICAgIC8qIENoZWNrIGlmIGEgcHJpbnRlciByZXNl
dCBoYXBwZW5zIHdoaWxlIHdlIGhhdmUgaW50ZXJydXB0cyBvbiAqLw0KICAgICAgICBkZXYtPnJl
c2V0X3ByaW50ZXIgPSAwOw0KDQpAQCAtNjY3LDYgKzY4NCwxMyBAQCBwcmludGVyX2ZzeW5jKHN0
cnVjdCBmaWxlICpmZCwgbG9mZl90IHN0YXJ0LCBsb2ZmX3QgZW5kLCBpbnQgZGF0YXN5bmMpDQoN
CiAgICAgICAgaW5vZGVfbG9jayhpbm9kZSk7DQogICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZk
ZXYtPmxvY2ssIGZsYWdzKTsNCisNCisgICAgICAgaWYgKGRldi0+aW50ZXJmYWNlIDwgMCkgew0K
KyAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRldi0+bG9jaywgZmxhZ3Mp
Ow0KKyAgICAgICAgICAgICAgIGlub2RlX3VubG9jayhpbm9kZSk7DQorICAgICAgICAgICAgICAg
cmV0dXJuIC1FTk9ERVY7DQorICAgICAgIH0NCisNCiAgICAgICAgdHhfbGlzdF9lbXB0eSA9IChs
aWtlbHkobGlzdF9lbXB0eSgmZGV2LT50eF9yZXFzKSkpOw0KICAgICAgICBzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZkZXYtPmxvY2ssIGZsYWdzKTsNCg0KQEAgLTY4OSw2ICs3MTMsMTMgQEAgcHJp
bnRlcl9wb2xsKHN0cnVjdCBmaWxlICpmZCwgcG9sbF90YWJsZSAqd2FpdCkNCg0KICAgICAgICBt
dXRleF9sb2NrKCZkZXYtPmxvY2tfcHJpbnRlcl9pbyk7DQogICAgICAgIHNwaW5fbG9ja19pcnFz
YXZlKCZkZXYtPmxvY2ssIGZsYWdzKTsNCisNCisgICAgICAgaWYgKGRldi0+aW50ZXJmYWNlIDwg
MCkgew0KKyAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRldi0+bG9jaywg
ZmxhZ3MpOw0KKyAgICAgICAgICAgICAgIG11dGV4X3VubG9jaygmZGV2LT5sb2NrX3ByaW50ZXJf
aW8pOw0KKyAgICAgICAgICAgICAgIHJldHVybiBFUE9MTEVSUiB8IEVQT0xMSFVQOw0KKyAgICAg
ICB9DQorDQogICAgICAgIHNldHVwX3J4X3JlcXMoZGV2KTsNCiAgICAgICAgc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmZGV2LT5sb2NrLCBmbGFncyk7DQogICAgICAgIG11dGV4X3VubG9jaygmZGV2
LT5sb2NrX3ByaW50ZXJfaW8pOw0KQEAgLTcyMiw2ICs3NTMsMTEgQEAgcHJpbnRlcl9pb2N0bChz
dHJ1Y3QgZmlsZSAqZmQsIHVuc2lnbmVkIGludCBjb2RlLCB1bnNpZ25lZCBsb25nIGFyZykNCg0K
ICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmZGV2LT5sb2NrLCBmbGFncyk7DQoNCisgICAgICAg
aWYgKGRldi0+aW50ZXJmYWNlIDwgMCkgew0KKyAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrX2ly
cXJlc3RvcmUoJmRldi0+bG9jaywgZmxhZ3MpOw0KKyAgICAgICAgICAgICAgIHJldHVybiAtRU5P
REVWOw0KKyAgICAgICB9DQorDQogICAgICAgIHN3aXRjaCAoY29kZSkgew0KICAgICAgICBjYXNl
IEdBREdFVF9HRVRfUFJJTlRFUl9TVEFUVVM6DQogICAgICAgICAgICAgICAgc3RhdHVzID0gKGlu
dClkZXYtPnByaW50ZXJfc3RhdHVzOw0KLS0NCjIuMjQuMQ0KDQo=
