Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92540D38BE
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 07:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbfJKFmg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 01:42:36 -0400
Received: from mail-eopbgr60073.outbound.protection.outlook.com ([40.107.6.73]:62878
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726174AbfJKFmf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Oct 2019 01:42:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uzv+jjc6qtWyYQOV9RSiykYLpcYz5sUaqtbIj8MykKxJ+iEfncmOfdr0Mz/yL8jueyif1VXUacb2U8/lLE1xlFfxdQFUHBUhqWCa4bP8rK1CyQtzUfz+rJ7Q3+jjrrHqIknmlCROz6FXDgB3TTxdatSeo+/2Pnz3VUjEJCsZdosEnLy0CUWYEjOfWsHk1Zzz8VVKd7cw+9PudG6vFKSRjfY+Saf6fB0kB6+krkFh63am3lvUjwFyb2QOTqfk6VSZgM6sbSizxwuGT9glLxFC05K1YeU0oMd2gaEFm4g9OgRvfZucqZa4qxUWvOlpkA70XF2F8xLR1wVI89+8c9czLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCnyjx2pNLho7fw8/gE7ZHKqHepncWcuOGmM7JFEO1E=;
 b=FfEXZuzJ5h7l9zBNSVFjLfvW8QWhL8TlLE59qz9InXciV4XRddFgHH5A6lgGds91GdCCbPhPFJabSki39gFVf7vCnCtzxGI656FYaM2ql4sgTXGtJ5rDrs9Qsv/WyqAPRXQpy/k6v1T6jlTypAa9UE/jRxf8mYWVX8Rpqe7RdE38Cprh9LqzyQLD0kJXUSBq9z1ciiw7bEHJQCZODgChdgX+2dHaJhdxpOcYoc7HncBuKMJRfQTL3GfmJ7P1m04U4oW+7oBZTg2SuitxGhS1skH4KXdljxSXG4k6cD+1bnCQY4XIxHaB0SCZouOjJZaceHZoUOYNv6Z7hW5ojzskQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCnyjx2pNLho7fw8/gE7ZHKqHepncWcuOGmM7JFEO1E=;
 b=OLiVqi+fabZulkn3mWrIzkM8sL93hAVIf6FR3sAPbKsLW76BzARKefcMcF0R/iM8pW+TKdl09fo9fkvzJbOqAGU7wMnU88xzdqfBr9aW1WZYOpWqTm6rXRHMwGuKNl8Dp9xWSVyZLvdZ1yYrIRayatoGtozUgHZfn1tffEKflVM=
Received: from AM0PR04MB5314.eurprd04.prod.outlook.com (20.177.41.157) by
 AM0PR04MB4915.eurprd04.prod.outlook.com (20.176.215.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 05:42:31 +0000
Received: from AM0PR04MB5314.eurprd04.prod.outlook.com
 ([fe80::99b0:3cb8:e409:1798]) by AM0PR04MB5314.eurprd04.prod.outlook.com
 ([fe80::99b0:3cb8:e409:1798%6]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 05:42:31 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "git@andred.net" <git@andred.net>, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 3/3] usb: chipidea: imx: pinctrl for HSIC is optional
Thread-Topic: [PATCH 3/3] usb: chipidea: imx: pinctrl for HSIC is optional
Thread-Index: AQHVf/as820hEURzI0yo31E55+YF3g==
Date:   Fri, 11 Oct 2019 05:42:31 +0000
Message-ID: <20191011054129.20502-3-peter.chen@nxp.com>
References: <20191011054129.20502-1-peter.chen@nxp.com>
In-Reply-To: <20191011054129.20502-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-clientproxiedby: TY2PR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:404:a::36) To AM0PR04MB5314.eurprd04.prod.outlook.com
 (2603:10a6:208:cd::29)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0100a91d-004e-4f0d-2efd-08d74e0dcec6
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: AM0PR04MB4915:|AM0PR04MB4915:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB4915FDA165F91D66579C52028B970@AM0PR04MB4915.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:569;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(189003)(199004)(6436002)(2501003)(446003)(2351001)(2616005)(14444005)(256004)(6512007)(8936002)(5640700003)(50226002)(66574012)(6916009)(486006)(8676002)(11346002)(476003)(186003)(81166006)(81156014)(44832011)(1076003)(26005)(386003)(305945005)(54906003)(52116002)(66946007)(102836004)(316002)(5660300002)(86362001)(36756003)(71190400001)(64756008)(66556008)(66446008)(6506007)(6486002)(66476007)(3846002)(6116002)(25786009)(478600001)(14454004)(71200400001)(76176011)(4326008)(7736002)(2906002)(99286004)(66066001)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4915;H:AM0PR04MB5314.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fX/5iM0Gnfo82xheswE7SRDeai5b8BkJhQIz12MbkslBe2YJddDB6nbPv8vo+dkXHOCDzJRV9i8E/zH1/Pm8EjE1K2VSyufkozT+IfVDXZqVJJzsVrP8iRcw2mXgRzxjD9krUVYwG6MmA8tUwaKdSAbt5GjGGOFIxS9lKCoiMOxoD8mRly68Te0vlcSoxMLpWQJUV5oZAObWNqeFVxGg8HteiGee3vDGnBFbXk1TOQ963hng6NNwhca25Ieqqd6viwA3gPD7VFiKDmdHNHlwFjPcikgrGNRkiThNhgZmx2JE/1oB9yVZ8MjtYiXL15Rz4Fo4jqDHkfWkkH7qN+8DMX8gNTDiAumD683HRsPXLTcPNk2OcPSP4/FRFQUK0pHjSZ31gcn2vbqhwIuIvFVNUry11BE6u0gEZ57xTKukD2Y=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3810F450180C54A8755BC5F1967688B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0100a91d-004e-4f0d-2efd-08d74e0dcec6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 05:42:31.0498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ROK63+rA1kkQYOxOXF/6Hr7C0CQxhO6nfIEv8KzC/MH/T2qTWXrhBhk99UCnyGlGZ8dfGZsZ/oDKLBu6muPAwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4915
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Rm9yIGlteCBjaGlwaWRlYSBjb250cm9sbGVycywgaWYgdGhleSB1c2UgbXhzIFBIWSwgdGhleSBu
ZWVkIHBpbmN0cmwNCmZvciBIU0lDLiBPdGhlcndpc2UsIGl0IGRvZXNuJ3QgbmVlZCBwaW5jdHJs
IGFuZCB1c2JtaXNjIGNvbnRyb2wuIExpa2UNCmlteDdkIGFuZCBpbXg4bW0uDQoNClJlcG9ydGVk
LWJ5OiBBbmRyw6lEcmFzemlrIDxnaXRAYW5kcmVkLm5ldD4NClNpZ25lZC1vZmYtYnk6IFBldGVy
IENoZW4gPHBldGVyLmNoZW5AbnhwLmNvbT4NCi0tLQ0KIGRyaXZlcnMvdXNiL2NoaXBpZGVhL2Np
X2hkcmNfaW14LmMgfCA2MyArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0NCiAxIGZpbGUg
Y2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9jaGlwaWRlYS9jaV9oZHJjX2lteC5jIGIvZHJpdmVycy91c2IvY2hpcGlk
ZWEvY2lfaGRyY19pbXguYw0KaW5kZXggYzM0ZmNjMDc5Y2Q0Li5kOGU3ZWIyZjk3YjkgMTAwNjQ0
DQotLS0gYS9kcml2ZXJzL3VzYi9jaGlwaWRlYS9jaV9oZHJjX2lteC5jDQorKysgYi9kcml2ZXJz
L3VzYi9jaGlwaWRlYS9jaV9oZHJjX2lteC5jDQpAQCAtMjc0LDExICsyNzQsMTQgQEAgc3RhdGlj
IGludCBjaV9oZHJjX2lteF9ub3RpZnlfZXZlbnQoc3RydWN0IGNpX2hkcmMgKmNpLCB1bnNpZ25l
ZCBpbnQgZXZlbnQpDQogDQogCXN3aXRjaCAoZXZlbnQpIHsNCiAJY2FzZSBDSV9IRFJDX0lNWF9I
U0lDX0FDVElWRV9FVkVOVDoNCi0JCXJldCA9IHBpbmN0cmxfc2VsZWN0X3N0YXRlKGRhdGEtPnBp
bmN0cmwsDQotCQkJCWRhdGEtPnBpbmN0cmxfaHNpY19hY3RpdmUpOw0KLQkJaWYgKHJldCkNCi0J
CQlkZXZfZXJyKGRldiwgImhzaWNfYWN0aXZlIHNlbGVjdCBmYWlsZWQsIGVycj0lZFxuIiwNCi0J
CQkJcmV0KTsNCisJCWlmIChkYXRhLT5waW5jdHJsKSB7DQorCQkJcmV0ID0gcGluY3RybF9zZWxl
Y3Rfc3RhdGUoZGF0YS0+cGluY3RybCwNCisJCQkJCWRhdGEtPnBpbmN0cmxfaHNpY19hY3RpdmUp
Ow0KKwkJCWlmIChyZXQpDQorCQkJCWRldl9lcnIoZGV2LA0KKwkJCQkJImhzaWNfYWN0aXZlIHNl
bGVjdCBmYWlsZWQsIGVycj0lZFxuIiwNCisJCQkJCXJldCk7DQorCQl9DQogCQlicmVhazsNCiAJ
Y2FzZSBDSV9IRFJDX0lNWF9IU0lDX1NVU1BFTkRfRVZFTlQ6DQogCQlyZXQgPSBpbXhfdXNibWlz
Y19oc2ljX3NldF9jb25uZWN0KGRhdGEtPnVzYm1pc2NfZGF0YSk7DQpAQCAtMzA2LDcgKzMwOSw2
IEBAIHN0YXRpYyBpbnQgY2lfaGRyY19pbXhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCiAJY29uc3Qgc3RydWN0IGNpX2hkcmNfaW14X3BsYXRmb3JtX2ZsYWcgKmlteF9wbGF0
Zm9ybV9mbGFnOw0KIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gcGRldi0+ZGV2Lm9mX25vZGU7
DQogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQotCXN0cnVjdCBwaW5jdHJsX3N0
YXRlICpwaW5jdHJsX2hzaWNfaWRsZTsNCiANCiAJb2ZfaWQgPSBvZl9tYXRjaF9kZXZpY2UoY2lf
aGRyY19pbXhfZHRfaWRzLCBkZXYpOw0KIAlpZiAoIW9mX2lkKQ0KQEAgLTMzOSw2ICszNDEsMzMg
QEAgc3RhdGljIGludCBjaV9oZHJjX2lteF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQ0KIAkJCXJldHVybiBQVFJfRVJSKGRhdGEtPnBpbmN0cmwpOw0KIAkJfQ0KIA0KKwkJZGF0
YS0+aHNpY19wYWRfcmVndWxhdG9yID0NCisJCQkJZGV2bV9yZWd1bGF0b3JfZ2V0X29wdGlvbmFs
KGRldiwgImhzaWMiKTsNCisJCWlmIChQVFJfRVJSKGRhdGEtPmhzaWNfcGFkX3JlZ3VsYXRvcikg
PT0gLUVOT0RFVikgew0KKwkJCS8qIG5vIHBhZCByZWd1YWxhdG9yIGlzIG5lZWRlZCAqLw0KKwkJ
CWRhdGEtPmhzaWNfcGFkX3JlZ3VsYXRvciA9IE5VTEw7DQorCQl9IGVsc2UgaWYgKElTX0VSUihk
YXRhLT5oc2ljX3BhZF9yZWd1bGF0b3IpKSB7DQorCQkJaWYgKFBUUl9FUlIoZGF0YS0+aHNpY19w
YWRfcmVndWxhdG9yKSAhPSAtRVBST0JFX0RFRkVSKQ0KKwkJCQlkZXZfZXJyKGRldiwNCisJCQkJ
CSJHZXQgSFNJQyBwYWQgcmVndWxhdG9yIGVycm9yOiAlbGRcbiIsDQorCQkJCQlQVFJfRVJSKGRh
dGEtPmhzaWNfcGFkX3JlZ3VsYXRvcikpOw0KKwkJCXJldHVybiBQVFJfRVJSKGRhdGEtPmhzaWNf
cGFkX3JlZ3VsYXRvcik7DQorCQl9DQorDQorCQlpZiAoZGF0YS0+aHNpY19wYWRfcmVndWxhdG9y
KSB7DQorCQkJcmV0ID0gcmVndWxhdG9yX2VuYWJsZShkYXRhLT5oc2ljX3BhZF9yZWd1bGF0b3Ip
Ow0KKwkJCWlmIChyZXQpIHsNCisJCQkJZGV2X2VycihkZXYsDQorCQkJCQkiRmFpbGVkIHRvIGVu
YWJsZSBIU0lDIHBhZCByZWd1bGF0b3JcbiIpOw0KKwkJCQlyZXR1cm4gcmV0Ow0KKwkJCX0NCisJ
CX0NCisJfQ0KKw0KKwkvKiBIU0lDIHBpbmN0cmwgaGFuZGxpbmcgKi8NCisJaWYgKGRhdGEtPnBp
bmN0cmwpIHsNCisJCXN0cnVjdCBwaW5jdHJsX3N0YXRlICpwaW5jdHJsX2hzaWNfaWRsZTsNCisN
CiAJCXBpbmN0cmxfaHNpY19pZGxlID0gcGluY3RybF9sb29rdXBfc3RhdGUoZGF0YS0+cGluY3Ry
bCwgImlkbGUiKTsNCiAJCWlmIChJU19FUlIocGluY3RybF9oc2ljX2lkbGUpKSB7DQogCQkJZGV2
X2VycihkZXYsDQpAQCAtMzYxLDI4ICszOTAsNiBAQCBzdGF0aWMgaW50IGNpX2hkcmNfaW14X3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQogCQkJCQlQVFJfRVJSKGRhdGEtPnBp
bmN0cmxfaHNpY19hY3RpdmUpKTsNCiAJCQlyZXR1cm4gUFRSX0VSUihkYXRhLT5waW5jdHJsX2hz
aWNfYWN0aXZlKTsNCiAJCX0NCi0NCi0JCWRhdGEtPmhzaWNfcGFkX3JlZ3VsYXRvciA9DQotCQkJ
CWRldm1fcmVndWxhdG9yX2dldF9vcHRpb25hbChkZXYsICJoc2ljIik7DQotCQlpZiAoUFRSX0VS
UihkYXRhLT5oc2ljX3BhZF9yZWd1bGF0b3IpID09IC1FTk9ERVYpIHsNCi0JCQkvKiBubyBwYWQg
cmVndWFsYXRvciBpcyBuZWVkZWQgKi8NCi0JCQlkYXRhLT5oc2ljX3BhZF9yZWd1bGF0b3IgPSBO
VUxMOw0KLQkJfSBlbHNlIGlmIChJU19FUlIoZGF0YS0+aHNpY19wYWRfcmVndWxhdG9yKSkgew0K
LQkJCWlmIChQVFJfRVJSKGRhdGEtPmhzaWNfcGFkX3JlZ3VsYXRvcikgIT0gLUVQUk9CRV9ERUZF
UikNCi0JCQkJZGV2X2VycihkZXYsDQotCQkJCQkiR2V0IEhTSUMgcGFkIHJlZ3VsYXRvciBlcnJv
cjogJWxkXG4iLA0KLQkJCQkJUFRSX0VSUihkYXRhLT5oc2ljX3BhZF9yZWd1bGF0b3IpKTsNCi0J
CQlyZXR1cm4gUFRSX0VSUihkYXRhLT5oc2ljX3BhZF9yZWd1bGF0b3IpOw0KLQkJfQ0KLQ0KLQkJ
aWYgKGRhdGEtPmhzaWNfcGFkX3JlZ3VsYXRvcikgew0KLQkJCXJldCA9IHJlZ3VsYXRvcl9lbmFi
bGUoZGF0YS0+aHNpY19wYWRfcmVndWxhdG9yKTsNCi0JCQlpZiAocmV0KSB7DQotCQkJCWRldl9l
cnIoZGV2LA0KLQkJCQkJIkZhaWxlZCB0byBlbmFibGUgSFNJQyBwYWQgcmVndWxhdG9yXG4iKTsN
Ci0JCQkJcmV0dXJuIHJldDsNCi0JCQl9DQotCQl9DQogCX0NCiANCiAJaWYgKHBkYXRhLmZsYWdz
ICYgQ0lfSERSQ19QTVFPUykNCi0tIA0KMi4xNy4xDQoNCg==
