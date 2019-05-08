Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C73F1764D
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2019 12:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfEHKwl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 May 2019 06:52:41 -0400
Received: from mail-eopbgr20081.outbound.protection.outlook.com ([40.107.2.81]:61670
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726281AbfEHKwk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 May 2019 06:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEwdnRNb0dQnFatowUgaozQwav2yrmUA9bOT5poJmlg=;
 b=SCRQyE2OlTAFevdaWvI9f/wySvivukaLWWutPuuoVt2TKHjoxtaAURN9bRLW9W6r9mRjGReU3I9+7y1D6RNIyL0Jx3g7Fk1EHK9tuzNLKn6Soi0f57ft3OB1uldlndtK1rmJC1zBx8sytTjwSHEVCFrVbXpdLVHU5DuhqMXf4+8=
Received: from VI1PR04MB4558.eurprd04.prod.outlook.com (20.177.55.216) by
 VI1PR04MB4046.eurprd04.prod.outlook.com (10.171.182.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Wed, 8 May 2019 10:52:37 +0000
Received: from VI1PR04MB4558.eurprd04.prod.outlook.com
 ([fe80::7c70:2812:86ad:7e1c]) by VI1PR04MB4558.eurprd04.prod.outlook.com
 ([fe80::7c70:2812:86ad:7e1c%3]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 10:52:37 +0000
From:   Jun Li <jun.li@nxp.com>
To:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "thinhn@synopsys.com" <thinhn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: [PATCH v2] usb: dwc3: move core validation to be after clks enable
Thread-Topic: [PATCH v2] usb: dwc3: move core validation to be after clks
 enable
Thread-Index: AQHVBYwmwgoFIPzeoU+y0VWKj8yWsw==
Date:   Wed, 8 May 2019 10:52:37 +0000
Message-ID: <1557311367-5863-1-git-send-email-jun.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0032.apcprd03.prod.outlook.com
 (2603:1096:203:2f::20) To VI1PR04MB4558.eurprd04.prod.outlook.com
 (2603:10a6:803:6f::24)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53a6f603-1a3b-4e00-4a9a-08d6d3a348b5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB4046;
x-ms-traffictypediagnostic: VI1PR04MB4046:
x-microsoft-antispam-prvs: <VI1PR04MB4046A0908B29D407E9905EC789320@VI1PR04MB4046.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(136003)(396003)(366004)(346002)(189003)(199004)(44832011)(14454004)(36756003)(68736007)(256004)(14444005)(7736002)(6486002)(486006)(478600001)(2616005)(476003)(6436002)(6116002)(2906002)(4326008)(2501003)(3846002)(54906003)(110136005)(25786009)(316002)(6512007)(53936002)(66066001)(8936002)(386003)(50226002)(6506007)(102836004)(186003)(81166006)(26005)(8676002)(81156014)(99286004)(305945005)(52116002)(66476007)(66556008)(66446008)(64756008)(86362001)(66946007)(73956011)(5660300002)(71200400001)(71190400001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4046;H:VI1PR04MB4558.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ce4FDakzlEP/ZJlrLU6Ji5O158CGm2+Jy39GPY/xXet1Fhvfc8NkbuOpLrgShdZpU3rTdUo4sNVB2mNv7rJNH2fI6A+tH1X61wFEe1rGwpWXTOSPGzkyy2G5I0it/tR8UDzpFwdDAlWOqP5+obCTL38ZZGiKQ8ufsW29iAJIOOimUQQZP9NZ3R13F5VRNhekptoKgbUJ8n8ZK81zZliBRzG/YiRbo9Vn6MDPlafc9kZ6v54JyZvMD5FQ2GKLwd0YP0S4+a0IM48wzJyd5Y7lS5Jf601Zy40/UU3NqTEZ+4qVAAeq+v17QmygqwRjcZLS941A2WBU6kQ26MAIC7OLq2GLV93BcsOzHGaUYBHWRGC7fJJdITk9dNmWMU3lgQEEjF+mSI9bIQoWM3CsdIzWyzInfINz0RUTUzFLxv71srM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a6f603-1a3b-4e00-4a9a-08d6d3a348b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 10:52:37.5176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4046
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RnJvbTogSnVuIExpIDxqdW4ubGlAbnhwLmNvbT4NCg0KUmVnaXN0ZXIgYWNjZXNzIGluIGNvcmUg
dmFsaWRhdGlvbiBtYXkgaGFuZyBiZWZvcmUgdGhlIGJ1bGsNCmNsa3MgYXJlIGVuYWJsZWQuDQoN
CkZpeGVzOiBiODczZTJkMGVhMWUgKCJ1c2I6IGR3YzM6IERvIGNvcmUgdmFsaWRhdGlvbiBlYXJs
eSBvbiBwcm9iZSIpDQpTaWduZWQtb2ZmLWJ5OiBKdW4gTGkgPGp1bi5saUBueHAuY29tPg0KLS0t
DQoNCkNoYW5nZSBmb3IgdjI6DQotIFVwZGF0ZSByZXQgdG8gYmUgLUVOT0RFViBpbiBjYXNlIGR3
YzNfY29yZV9pc192YWxpZCgpIGZhaWwuDQoNCiBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyB8IDEz
ICsrKysrKystLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJz
L3VzYi9kd2MzL2NvcmUuYw0KaW5kZXggNGFmZjFkOC4uOTNiOTZlNiAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvdXNiL2R3YzMvY29yZS5jDQorKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KQEAg
LTE0MjMsMTEgKzE0MjMsNiBAQCBzdGF0aWMgaW50IGR3YzNfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCiAJZHdjLT5yZWdzCT0gcmVnczsNCiAJZHdjLT5yZWdzX3NpemUJPSBy
ZXNvdXJjZV9zaXplKCZkd2NfcmVzKTsNCiANCi0JaWYgKCFkd2MzX2NvcmVfaXNfdmFsaWQoZHdj
KSkgew0KLQkJZGV2X2Vycihkd2MtPmRldiwgInRoaXMgaXMgbm90IGEgRGVzaWduV2FyZSBVU0Iz
IERSRCBDb3JlXG4iKTsNCi0JCXJldHVybiAtRU5PREVWOw0KLQl9DQotDQogCWR3YzNfZ2V0X3By
b3BlcnRpZXMoZHdjKTsNCiANCiAJZHdjLT5yZXNldCA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRf
b3B0aW9uYWxfc2hhcmVkKGRldiwgTlVMTCk7DQpAQCAtMTQ2MCw2ICsxNDU1LDEyIEBAIHN0YXRp
YyBpbnQgZHdjM19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIAlpZiAocmV0
KQ0KIAkJZ290byB1bnByZXBhcmVfY2xrczsNCiANCisJaWYgKCFkd2MzX2NvcmVfaXNfdmFsaWQo
ZHdjKSkgew0KKwkJZGV2X2Vycihkd2MtPmRldiwgInRoaXMgaXMgbm90IGEgRGVzaWduV2FyZSBV
U0IzIERSRCBDb3JlXG4iKTsNCisJCXJldCA9IC1FTk9ERVY7DQorCQlnb3RvIGRpc2FibGVfY2xr
czsNCisJfQ0KKw0KIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBkd2MpOw0KIAlkd2MzX2Nh
Y2hlX2h3cGFyYW1zKGR3Yyk7DQogDQpAQCAtMTUyNCw3ICsxNTI1LDcgQEAgc3RhdGljIGludCBk
d2MzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQogZXJyMToNCiAJcG1fcnVu
dGltZV9wdXRfc3luYygmcGRldi0+ZGV2KTsNCiAJcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5k
ZXYpOw0KLQ0KK2Rpc2FibGVfY2xrczoNCiAJY2xrX2J1bGtfZGlzYWJsZShkd2MtPm51bV9jbGtz
LCBkd2MtPmNsa3MpOw0KIHVucHJlcGFyZV9jbGtzOg0KIAljbGtfYnVsa191bnByZXBhcmUoZHdj
LT5udW1fY2xrcywgZHdjLT5jbGtzKTsNCi0tIA0KMi43LjQNCg0K
