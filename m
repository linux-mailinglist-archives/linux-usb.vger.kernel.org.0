Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 681009702B
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 05:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbfHUDTA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Aug 2019 23:19:00 -0400
Received: from mail-eopbgr140050.outbound.protection.outlook.com ([40.107.14.50]:47285
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726864AbfHUDTA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Aug 2019 23:19:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wv51SBkOZpfE+WeYTXDZW7I+UX2SeiJDfagI0n9mFPtpdYnLjyH3W2e1EmVQw5g8YkiRmNmGF++vZujK6WNncFNqTK/5lJ+4zr5/tNcoFTUtgc1Z4bEIsgqrGzZ5crrkgHSy0q2qeTIr02OlbvGudjrru/gnIBkgDH1yqLZcQNdCgbIhFL6XJRVfTCRmhg0WxJusevF82AMNPk1ofQSrlbKdV0Zd9U4BeUn0OtIyFhfzfz5DEZWGvpPJvEbkMrYN8Kon86hDIkbW/jSbho1TnKO69VJGX7kioA3oL/87i/WRIZ6WTmdfDNuMqxUCZ2b55sxcPJ79iMHfkrWRFfRLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPmdrKV5ttpe0GKfA+du2W5dAU7E/htG/7JVRusr+qM=;
 b=jva61E+95Er82f2VKyCRe3a0NSuDHiHySo/hp9S3fyRo9c+rEVzpyIJZXyTvEpT3gFC+HX9ob3J/u0FPkCg3fY965jPKVSHQqL4khrtFW6CEnRys1a8QyK3sy3FQJF6JwrZQQPYxXc+O6jQaQhqFcWtqzV82odAFGz0FF8QybkgGGdaAWIsAjCe+/RKAPRQoYf6UyzpYdVladDQHCDxthUkQ4yr98G+7elXIF4cEd1KQF2xGMUnsdYIudu2dySC5PEN2tJ6NWv26jreZMray24bfnnr1wG7uGDc9lsDjHyZkIyPmVJnoVBCpqYo0osXz1UyEN7srds4Sy7CXGFQiAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPmdrKV5ttpe0GKfA+du2W5dAU7E/htG/7JVRusr+qM=;
 b=Rwzv2UV7WrSrfGOI9qMHpTYbqKpujm5SBGxROuukSyRPSxgEluhXSdIFTEuEzb0MiyeR2+e3cTiehL20TLjGO9FSuRbQl5a5ywTzmoDf9uKI3Uugyx68TCCryXypDVL3O1vgB5hGfVHS6nFn7WmWVL/1B+2fBwZQLYxxMlmyErE=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB3230.eurprd04.prod.outlook.com (10.170.227.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Wed, 21 Aug 2019 03:18:56 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a%4]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 03:18:56 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] usb: xhci: avoid VBus glitch during controller reset
 operation
Thread-Topic: [PATCH 1/1] usb: xhci: avoid VBus glitch during controller reset
 operation
Thread-Index: AQHVV88qu74WcWDk3UKcEVqZOYC8KQ==
Date:   Wed, 21 Aug 2019 03:18:56 +0000
Message-ID: <20190821031602.1030-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-clientproxiedby: HK0PR03CA0046.apcprd03.prod.outlook.com
 (2603:1096:203:2f::34) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:60::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc4270dd-bdd4-4ebb-5484-08d725e64cdd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB3230;
x-ms-traffictypediagnostic: VI1PR04MB3230:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB323023A0B902E3FC06E40F558BAA0@VI1PR04MB3230.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(189003)(199004)(5660300002)(64756008)(4326008)(66946007)(25786009)(316002)(6512007)(486006)(476003)(2616005)(53936002)(8676002)(81156014)(5640700003)(50226002)(81166006)(44832011)(6486002)(2351001)(2501003)(36756003)(8936002)(386003)(478600001)(26005)(186003)(102836004)(3846002)(6116002)(1076003)(54906003)(6436002)(2906002)(86362001)(71200400001)(66446008)(6916009)(256004)(52116002)(7736002)(71190400001)(305945005)(6506007)(99286004)(14444005)(14454004)(66556008)(66476007)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3230;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6aQgEKeh1YhTK0YcXcmtNSzozch3VNp55viSZuZ22h9t5Fpo2tLe/p1MYbCU31Qy0vjEB2ElKXir6TgdsywCyQj4k7ACoJK4qrXKSQH9vxIZDtl7W7hxN+DLmaKdSvWzJh6BaNUrAkykdjsu4vrLmYVv75UNMJ0Yu7qDvJnMKRsXgDUg9urei8rO2GNTCgz7USBv2TpYxKUDTYcN3xuKocCRTMkEl9tBWJxYTB4icxXhduKBw/8sH0q9wa97PPKWurqPO2RMTIgLfT8WRBiDEw1bB4oNIggMRyy5xcFTzT+pXaZDLU+RwDZ05T651Yvg8xwih/Fzxdum55mrVBsrhV29UXUwQuv76aZ3+wWO/8k+c44hMdRu+7K9CwLgWAlrphiHvhyBOvbfVSPKfjiqCMRFlX2rc4Ekg3lEkawuxHY=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1D1111C341A0241AAA6C526339DF1A7@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4270dd-bdd4-4ebb-5484-08d725e64cdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 03:18:56.1032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nLaFX7x2X995AOV6tV21zf5zGH2AwYoubl8ZXbYdTuqQFQc1aP4//FCTMnvhA6TtojynMwk/3Su6hoDCUcxQQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3230
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

QWNjb3JkaW5nIHRvIHhIQ0kgMS4xIENINC4xOS40IFBvcnQgUG93ZXI6DQoJV2hpbGUgQ2hpcCBI
YXJkd2FyZSBSZXNldCBvciBIQ1JTVCBpcyBhc3NlcnRlZCwNCiAgICAgICAJdGhlIHZhbHVlIG9m
IFBQIGlzIHVuZGVmaW5lZC4gSWYgdGhlIHhIQyBzdXBwb3J0cw0KICAgICAgIAlwb3dlciBzd2l0
Y2hlcyAoUFBDID0g4oCYMeKAmSkgdGhlbiBWQnVzIG1heSBiZSBkZWFzc2VydGVkDQogICAgICAg
CWR1cmluZyB0aGlzIHRpbWUuIFBQIChhbmQgVkJ1cykgc2hhbGwgYmUgZW5hYmxlZCBpbW1lZGlh
dGVseQ0KICAgICAgIAl1cG9uIGV4aXRpbmcgdGhlIHJlc2V0IGNvbmRpdGlvbi4NCg0KVGhlIFZC
dXMgZ2xpdGNoIG1heSBjYXVzZSBzb21lIFVTQiBkZXZpY2VzIHdvcmsgYWJub3JtYWwsIHdlIG9i
c2VydmUNCml0IGF0IE5YUCBMUzEwMTJBRldSWS9MUzEwNDNBUkRCL0xYMjE2MEFRRFMvTFMxMDg4
QVJEQiBwbGF0Zm9ybXMuIFRvDQphdm9pZCB0aGlzIFZidXMgZ2xpdGNoLCB3ZSBjb3VsZCBzZXQg
UFAgYXMgMCBiZWZvcmUgSENSU1QsIGFuZCB0aGUgUFANCndpbGwgYmFjayB0byAxIGFmdGVyIEhD
UlNUIGFjY29yZGluZyB0byBzcGVjLg0KDQpSZXBvcnRlZC1ieTogUmFuIFdhbmcgPHJhbi53YW5n
XzFAbnhwLmNvbT4NClNpZ25lZC1vZmYtYnk6IFBldGVyIENoZW4gPHBldGVyLmNoZW5AbnhwLmNv
bT4NCi0tLQ0KIGRyaXZlcnMvdXNiL2hvc3QveGhjaS5jIHwgMTUgKysrKysrKysrKysrKystDQog
MSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLmMN
CmluZGV4IDZiMzRhNTczYzNkOS4uZjVhN2I1ZDYzMDMxIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91
c2IvaG9zdC94aGNpLmMNCisrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jDQpAQCAtMTY3LDcg
KzE2Nyw4IEBAIGludCB4aGNpX3Jlc2V0KHN0cnVjdCB4aGNpX2hjZCAqeGhjaSkNCiB7DQogCXUz
MiBjb21tYW5kOw0KIAl1MzIgc3RhdGU7DQotCWludCByZXQ7DQorCWludCByZXQsIGk7DQorCXUz
MiBwb3J0c2M7DQogDQogCXN0YXRlID0gcmVhZGwoJnhoY2ktPm9wX3JlZ3MtPnN0YXR1cyk7DQog
DQpAQCAtMTgxLDYgKzE4MiwxOCBAQCBpbnQgeGhjaV9yZXNldChzdHJ1Y3QgeGhjaV9oY2QgKnho
Y2kpDQogCQlyZXR1cm4gMDsNCiAJfQ0KIA0KKwkvKg0KKwkgKiBLZWVwIFBPUlRTQy5QUCBhcyAw
IGJlZm9yZSBIQ1JTVCB0byBlbGltaW5hdGUNCisJICogVmJ1cyBnbGl0Y2gsIHNlZSBDSCA0LjE5
LjQuDQorCSAqLw0KKwlmb3IgKGkgPSAwOyBpIDwgSENTX01BWF9QT1JUUyh4aGNpLT5oY3NfcGFy
YW1zMSk7IGkrKykgew0KKwkJX19sZTMyIF9faW9tZW0gKnBvcnRfYWRkciA9ICZ4aGNpLT5vcF9y
ZWdzLT5wb3J0X3N0YXR1c19iYXNlICsNCisJCQkJTlVNX1BPUlRfUkVHUyAqIGk7DQorCQlwb3J0
c2MgPSByZWFkbChwb3J0X2FkZHIpOw0KKwkJcG9ydHNjICY9IH5QT1JUX1BPV0VSOw0KKwkJd3Jp
dGVsKHBvcnRzYywgcG9ydF9hZGRyKTsNCisJfQ0KKw0KIAl4aGNpX2RiZ190cmFjZSh4aGNpLCB0
cmFjZV94aGNpX2RiZ19pbml0LCAiLy8gUmVzZXQgdGhlIEhDIik7DQogCWNvbW1hbmQgPSByZWFk
bCgmeGhjaS0+b3BfcmVncy0+Y29tbWFuZCk7DQogCWNvbW1hbmQgfD0gQ01EX1JFU0VUOw0KLS0g
DQoyLjE3LjENCg0K
