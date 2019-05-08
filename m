Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87DDD16FE6
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2019 06:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbfEHEY7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 May 2019 00:24:59 -0400
Received: from mail-eopbgr130045.outbound.protection.outlook.com ([40.107.13.45]:54190
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725825AbfEHEY7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 May 2019 00:24:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhiFVhaftahPwXQcWqU8kAzSTN6IuCWPofA8J8QJvIY=;
 b=hg7O48d9kXO+BWhCy6cHSOTG7J862dNQV6n0H/xYj8lw3k4KO3CiD2c0LrDL4e3bNO0JyupUEjU8nQ/apCkIKR3zDHfaU0gx3xnntozRWSHUUaS+hTtZu67z0vqAl4v9EbrQdHdkw3Vy98DyFyli9gmGM0UedK3yuqH34eNW6XI=
Received: from VI1PR04MB4558.eurprd04.prod.outlook.com (20.177.55.216) by
 VI1PR04MB3213.eurprd04.prod.outlook.com (10.170.227.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Wed, 8 May 2019 04:24:52 +0000
Received: from VI1PR04MB4558.eurprd04.prod.outlook.com
 ([fe80::7c70:2812:86ad:7e1c]) by VI1PR04MB4558.eurprd04.prod.outlook.com
 ([fe80::7c70:2812:86ad:7e1c%3]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 04:24:52 +0000
From:   Jun Li <jun.li@nxp.com>
To:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "thinhn@synopsys.com" <thinhn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: [PATCH] usb: dwc3: move core validation to be after clks enable
Thread-Topic: [PATCH] usb: dwc3: move core validation to be after clks enable
Thread-Index: AQHVBVX75mSUr4osh0SkRZR1EPQnbw==
Date:   Wed, 8 May 2019 04:24:51 +0000
Message-ID: <1557288102-26129-1-git-send-email-jun.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR02CA0204.apcprd02.prod.outlook.com
 (2603:1096:201:20::16) To VI1PR04MB4558.eurprd04.prod.outlook.com
 (2603:10a6:803:6f::24)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 680f7345-d7e6-45c3-29c7-08d6d36d1d6b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB3213;
x-ms-traffictypediagnostic: VI1PR04MB3213:
x-microsoft-antispam-prvs: <VI1PR04MB3213ABD4BA62261A4741988489320@VI1PR04MB3213.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(396003)(136003)(39860400002)(346002)(366004)(189003)(199004)(86362001)(478600001)(8676002)(110136005)(2616005)(256004)(14444005)(386003)(8936002)(5660300002)(50226002)(6116002)(53936002)(81156014)(66066001)(81166006)(68736007)(4326008)(2906002)(52116002)(186003)(99286004)(14454004)(71200400001)(71190400001)(6436002)(102836004)(6506007)(26005)(3846002)(6486002)(316002)(6512007)(7736002)(54906003)(64756008)(66556008)(66446008)(73956011)(2501003)(66476007)(66946007)(36756003)(305945005)(476003)(25786009)(486006)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3213;H:VI1PR04MB4558.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nWrEIhaDmYUJIIgbPzpvFoV9N0SJAMkBUQrwPV4bvMC4WgUMpWt/dLBvuj14gB+zVxd/m1ieVICOyJEwEh1dPi5wUPxGS1+ZmoENWpBmfOmepl4A+VWZu2jckdtIec3Uxl1/dNqmU51ZBHk/EE0aFVxq8HHw/+sI+vjUZTXEOToNxJhgkyt+550li4KP2qiqzGag9KFvDq14sNJBhQGW/Quv3NB1Z+MQobMrkcK06VehrUuSxfZBw+Is9JrqLfconh7PiOLGE9J8GmPUko+sYcZOQ0WsXb1IeKSzYW4v+Pol7+YiMCkjF21t5PbJb5VKxe3in2+veKIM/KvUMedDMVkxnbvzlxiTU8179UL//0hnzOs/4CQF5WMRdmn/E/nwxnO5FGjoS/nE4unuW0HotBiq8hXGDDWqA4ssJfmSnkg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 680f7345-d7e6-45c3-29c7-08d6d36d1d6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 04:24:52.0133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3213
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RnJvbTogSnVuIExpIDxqdW4ubGlAbnhwLmNvbT4NCg0KUmVnaXN0ZXIgYWNjZXNzIGluIGNvcmUg
dmFsaWRhdGlvbiBtYXkgaGFuZyBiZWZvcmUgdGhlIGJ1bGsNCmNsa3MgYXJlIGVuYWJsZWQuDQoN
CkZpeGVzOiBiODczZTJkMGVhMWUgKCJ1c2I6IGR3YzM6IERvIGNvcmUgdmFsaWRhdGlvbiBlYXJs
eSBvbiBwcm9iZSIpDQpTaWduZWQtb2ZmLWJ5OiBKdW4gTGkgPGp1bi5saUBueHAuY29tPg0KLS0t
DQogZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgfCAxMiArKysrKystLS0tLS0NCiAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KaW5kZXggNGFm
ZjFkOC4uMGU0OWZmMyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQorKysg
Yi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KQEAgLTE0MjMsMTEgKzE0MjMsNiBAQCBzdGF0aWMg
aW50IGR3YzNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAJZHdjLT5yZWdz
CT0gcmVnczsNCiAJZHdjLT5yZWdzX3NpemUJPSByZXNvdXJjZV9zaXplKCZkd2NfcmVzKTsNCiAN
Ci0JaWYgKCFkd2MzX2NvcmVfaXNfdmFsaWQoZHdjKSkgew0KLQkJZGV2X2Vycihkd2MtPmRldiwg
InRoaXMgaXMgbm90IGEgRGVzaWduV2FyZSBVU0IzIERSRCBDb3JlXG4iKTsNCi0JCXJldHVybiAt
RU5PREVWOw0KLQl9DQotDQogCWR3YzNfZ2V0X3Byb3BlcnRpZXMoZHdjKTsNCiANCiAJZHdjLT5y
ZXNldCA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWxfc2hhcmVkKGRldiwgTlVMTCk7
DQpAQCAtMTQ2MCw2ICsxNDU1LDExIEBAIHN0YXRpYyBpbnQgZHdjM19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KIAlpZiAocmV0KQ0KIAkJZ290byB1bnByZXBhcmVfY2xrczsN
CiANCisJaWYgKCFkd2MzX2NvcmVfaXNfdmFsaWQoZHdjKSkgew0KKwkJZGV2X2Vycihkd2MtPmRl
diwgInRoaXMgaXMgbm90IGEgRGVzaWduV2FyZSBVU0IzIERSRCBDb3JlXG4iKTsNCisJCWdvdG8g
ZGlzYWJsZV9jbGtzOw0KKwl9DQorDQogCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGR3Yyk7
DQogCWR3YzNfY2FjaGVfaHdwYXJhbXMoZHdjKTsNCiANCkBAIC0xNTI0LDcgKzE1MjQsNyBAQCBz
dGF0aWMgaW50IGR3YzNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiBlcnIx
Og0KIAlwbV9ydW50aW1lX3B1dF9zeW5jKCZwZGV2LT5kZXYpOw0KIAlwbV9ydW50aW1lX2Rpc2Fi
bGUoJnBkZXYtPmRldik7DQotDQorZGlzYWJsZV9jbGtzOg0KIAljbGtfYnVsa19kaXNhYmxlKGR3
Yy0+bnVtX2Nsa3MsIGR3Yy0+Y2xrcyk7DQogdW5wcmVwYXJlX2Nsa3M6DQogCWNsa19idWxrX3Vu
cHJlcGFyZShkd2MtPm51bV9jbGtzLCBkd2MtPmNsa3MpOw0KLS0gDQoyLjcuNA0KDQo=
