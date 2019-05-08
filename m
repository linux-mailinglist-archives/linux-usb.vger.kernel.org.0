Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F370817625
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2019 12:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbfEHKnS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 May 2019 06:43:18 -0400
Received: from mail-eopbgr130057.outbound.protection.outlook.com ([40.107.13.57]:8453
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726986AbfEHKnS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 May 2019 06:43:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xQFjFLdqtWL0aJHHWyH0OkSt0qcFCMpk9nWcvyLYBQ=;
 b=Lh/mCkK2q+JsQD83wg+Cd86+k3jygk1PZ1HZPV6UF1Lqp7GxuDzomNsE5ZdJFYR/3qhqzoTfz7N8Pwybl/o9wyT6gxoYBfJScV3zRPU99gIQ295KDbpPEy2uDp+Rmxp65uhp9wctaoSysDfTpyaQKqHcNzcRq0jk3PAMUGWYzeo=
Received: from VI1PR04MB4558.eurprd04.prod.outlook.com (20.177.55.216) by
 VI1PR04MB6175.eurprd04.prod.outlook.com (20.179.27.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Wed, 8 May 2019 10:43:14 +0000
Received: from VI1PR04MB4558.eurprd04.prod.outlook.com
 ([fe80::7c70:2812:86ad:7e1c]) by VI1PR04MB4558.eurprd04.prod.outlook.com
 ([fe80::7c70:2812:86ad:7e1c%3]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 10:43:14 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Sriharsha Allenki <sallenki@codeaurora.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "thinhn@synopsys.com" <thinhn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] usb: dwc3: move core validation to be after clks enable
Thread-Topic: [PATCH] usb: dwc3: move core validation to be after clks enable
Thread-Index: AQHVBVX75mSUr4osh0SkRZR1EPQnb6ZhBhWAgAAELlA=
Date:   Wed, 8 May 2019 10:43:13 +0000
Message-ID: <VI1PR04MB4558ECB0BD5BAB664BA2AD6089320@VI1PR04MB4558.eurprd04.prod.outlook.com>
References: <1557288102-26129-1-git-send-email-jun.li@nxp.com>
 <636e1751-dab8-ab8a-a924-0015f9ae8089@codeaurora.org>
In-Reply-To: <636e1751-dab8-ab8a-a924-0015f9ae8089@codeaurora.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
x-originating-ip: [114.218.114.168]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a6c313d-0cb6-459a-7ed2-08d6d3a1f90d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB6175;
x-ms-traffictypediagnostic: VI1PR04MB6175:
x-microsoft-antispam-prvs: <VI1PR04MB617566BB7AF6DABA2E87284389320@VI1PR04MB6175.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(136003)(366004)(346002)(376002)(396003)(13464003)(199004)(189003)(6436002)(478600001)(11346002)(2501003)(102836004)(73956011)(110136005)(53936002)(66946007)(54906003)(52536014)(2906002)(76176011)(305945005)(71200400001)(71190400001)(53546011)(64756008)(55016002)(7736002)(66066001)(81166006)(44832011)(9686003)(74316002)(229853002)(86362001)(8936002)(486006)(6246003)(14444005)(8676002)(4326008)(68736007)(7696005)(6116002)(3846002)(2201001)(81156014)(76116006)(446003)(476003)(26005)(66476007)(6506007)(316002)(66446008)(66556008)(186003)(33656002)(256004)(25786009)(99286004)(14454004)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6175;H:VI1PR04MB4558.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +aM1M4amOchJ2cAsOUSANvS2JH4aR1GkorbgrWn8Tgd7UKBPBSHsIG/Qs0lJPt72yS/PNWo8P71hmjZX1B+7SpJwRGs02YEPh/W7g95Khp8pcWM6P44zqbnO40jU74csEFQAQiqiFwSGyMmrnTayVhVtJk4mAnoqZXXrI/6bIFCTnm4ORL+LZuwNZdh1qxFZlF1Frn5TAx9wskMzhotSAyae6DwsVDUXdSDnUp1eRjI0l0Sou26NRTgU2FwVFcb6XRTBB6ssA56CokfaoL1Qc7c2B1nOt0wYNLb6nuw+TFLMCCH4mwauxHuPZzDo9Y6hSWikhIQL+nILUDXbEaSH8++LwefH+pEvSVEriu/JnS3C9lW7eQvNw2t1xdU2KDjxfIhCQk1+lNoUJPgfQ6sBI+CndFCj2R1NqRfMDcdiOD8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6c313d-0cb6-459a-7ed2-08d6d3a1f90d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 10:43:13.9839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6175
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgU3JpaGFyc2hhLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNy
aWhhcnNoYSBBbGxlbmtpIDxzYWxsZW5raUBjb2RlYXVyb3JhLm9yZz4NCj4gU2VudDogMjAxOeW5
tDXmnIg45pelIDE4OjI2DQo+IFRvOiBKdW4gTGkgPGp1bi5saUBueHAuY29tPjsgYmFsYmlAa2Vy
bmVsLm9yZzsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmcNCj4gQ2M6IHRoaW5obkBzeW5vcHN5
cy5jb207IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteA0KPiA8bGludXgt
aW14QG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHVzYjogZHdjMzogbW92ZSBjb3Jl
IHZhbGlkYXRpb24gdG8gYmUgYWZ0ZXIgY2xrcyBlbmFibGUNCj4gDQo+IEhpIEp1biBMaSwNCj4g
DQo+IE9uIDUvOC8yMDE5IDk6NTQgQU0sIEp1biBMaSB3cm90ZToNCj4gPiBGcm9tOiBKdW4gTGkg
PGp1bi5saUBueHAuY29tPg0KPiA+DQo+ID4gUmVnaXN0ZXIgYWNjZXNzIGluIGNvcmUgdmFsaWRh
dGlvbiBtYXkgaGFuZyBiZWZvcmUgdGhlIGJ1bGsgY2xrcyBhcmUNCj4gPiBlbmFibGVkLg0KPiA+
DQo+ID4gRml4ZXM6IGI4NzNlMmQwZWExZSAoInVzYjogZHdjMzogRG8gY29yZSB2YWxpZGF0aW9u
IGVhcmx5IG9uIHByb2JlIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBKdW4gTGkgPGp1bi5saUBueHAu
Y29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgfCAxMiArKysrKyst
LS0tLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2
ZXJzL3VzYi9kd2MzL2NvcmUuYyBpbmRleA0KPiA+IDRhZmYxZDguLjBlNDlmZjMgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gPiArKysgYi9kcml2ZXJzL3VzYi9k
d2MzL2NvcmUuYw0KPiA+IEBAIC0xNDIzLDExICsxNDIzLDYgQEAgc3RhdGljIGludCBkd2MzX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gICAJZHdjLT5yZWdzCT0gcmVn
czsNCj4gPiAgIAlkd2MtPnJlZ3Nfc2l6ZQk9IHJlc291cmNlX3NpemUoJmR3Y19yZXMpOw0KPiA+
DQo+ID4gLQlpZiAoIWR3YzNfY29yZV9pc192YWxpZChkd2MpKSB7DQo+ID4gLQkJZGV2X2Vycihk
d2MtPmRldiwgInRoaXMgaXMgbm90IGEgRGVzaWduV2FyZSBVU0IzIERSRCBDb3JlXG4iKTsNCj4g
PiAtCQlyZXR1cm4gLUVOT0RFVjsNCj4gPiAtCX0NCj4gPiAtDQo+ID4gICAJZHdjM19nZXRfcHJv
cGVydGllcyhkd2MpOw0KPiA+DQo+ID4gICAJZHdjLT5yZXNldCA9IGRldm1fcmVzZXRfY29udHJv
bF9nZXRfb3B0aW9uYWxfc2hhcmVkKGRldiwgTlVMTCk7DQo+IEBADQo+ID4gLTE0NjAsNiArMTQ1
NSwxMSBAQCBzdGF0aWMgaW50IGR3YzNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gPiAgIAlpZiAocmV0KQ0KPiA+ICAgCQlnb3RvIHVucHJlcGFyZV9jbGtzOw0KPiA+DQo+
ID4gKwlpZiAoIWR3YzNfY29yZV9pc192YWxpZChkd2MpKSB7DQo+ID4gKwkJZGV2X2Vycihkd2Mt
PmRldiwgInRoaXMgaXMgbm90IGEgRGVzaWduV2FyZSBVU0IzIERSRCBDb3JlXG4iKTsNCj4gDQo+
IFBsZWFzZSB1cGRhdGUgInJldCIgaGVyZSB3aXRoIC1FTk9ERVYsIGVsc2UgdGhlIHByb2JlIGNh
bGwgd2lsbCByZXR1cm4gc3VjY2VzcyAocmV0DQo+IGlzIDApLg0KDQpDb3JyZWN0LCBJIHdpbGwg
dXBkYXRlIGFuZCBzZW5kIFYyLg0KDQpUaGFua3MNCkp1bg0KDQo+IA0KPiA+ICsJCWdvdG8gZGlz
YWJsZV9jbGtzOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAgIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShw
ZGV2LCBkd2MpOw0KPiA+ICAgCWR3YzNfY2FjaGVfaHdwYXJhbXMoZHdjKTsNCj4gPg0KPiA+IEBA
IC0xNTI0LDcgKzE1MjQsNyBAQCBzdGF0aWMgaW50IGR3YzNfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCj4gPiAgIGVycjE6DQo+ID4gICAJcG1fcnVudGltZV9wdXRfc3luYygm
cGRldi0+ZGV2KTsNCj4gPiAgIAlwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7DQo+ID4g
LQ0KPiA+ICtkaXNhYmxlX2Nsa3M6DQo+ID4gICAJY2xrX2J1bGtfZGlzYWJsZShkd2MtPm51bV9j
bGtzLCBkd2MtPmNsa3MpOw0KPiA+ICAgdW5wcmVwYXJlX2Nsa3M6DQo+ID4gICAJY2xrX2J1bGtf
dW5wcmVwYXJlKGR3Yy0+bnVtX2Nsa3MsIGR3Yy0+Y2xrcyk7DQo+IA0KPiBSZWdhcmRzLA0KPiAN
Cj4gU3JpaGFyc2hhDQoNCg==
