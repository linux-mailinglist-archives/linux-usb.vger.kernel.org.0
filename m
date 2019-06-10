Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE303BB58
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 19:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388268AbfFJRvl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 13:51:41 -0400
Received: from mail-eopbgr800059.outbound.protection.outlook.com ([40.107.80.59]:42039
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388185AbfFJRvl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jun 2019 13:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzhZz7Bg4eBg64kdDu7netQXKzU9PIcGIlxWsclnqzw=;
 b=CCzcqALstUOnCHT78FJ0NMv7CeKrTx9n9fJE+lfn4lKZARl5g7liV22dXNKFAli4rmGFW95w9mC5tXqX75E+BQcs7vynpbkDkJzbASBAnNiRx1MURuX0dcHVVT7KH9uLiNLivyeorWo7/yh8KrFq/d0nQwybpsy/uRMkGlqY0UQ=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (20.179.78.205) by
 BN8PR10MB3299.namprd10.prod.outlook.com (20.179.139.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Mon, 10 Jun 2019 17:51:35 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::a460:e299:c4c:4ba8]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::a460:e299:c4c:4ba8%6]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 17:51:35 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "ran.wang_1@nxp.com" <ran.wang_1@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: fsl_udc status?
Thread-Topic: fsl_udc status?
Thread-Index: AQHVH2FeViVekb5FTkyBYafYtN/FkaaVHuBQgAAMpYA=
Date:   Mon, 10 Jun 2019 17:51:34 +0000
Message-ID: <067978c60a918e55bfa59f0928dc014f7967a774.camel@infinera.com>
References: <95d5902538997e340ccf7784406832904d512b51.camel@infinera.com>
         <VE1PR04MB6687C0AD101BF0747EB0077D8F130@VE1PR04MB6687.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6687C0AD101BF0747EB0077D8F130@VE1PR04MB6687.eurprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1dd83bc-b604-4682-f045-08d6edcc47b5
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BN8PR10MB3299;
x-ms-traffictypediagnostic: BN8PR10MB3299:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR10MB329992AFA85E1392ADD6EFF3F4130@BN8PR10MB3299.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(376002)(366004)(136003)(39860400002)(13464003)(199004)(189003)(66946007)(6486002)(102836004)(305945005)(81166006)(81156014)(229853002)(53936002)(6306002)(6512007)(66446008)(8676002)(14454004)(73956011)(2201001)(66476007)(66556008)(64756008)(86362001)(76116006)(2501003)(478600001)(118296001)(966005)(72206003)(91956017)(6116002)(8936002)(7736002)(45080400002)(7116003)(3846002)(36756003)(11346002)(476003)(25786009)(256004)(5660300002)(71190400001)(110136005)(486006)(14444005)(446003)(71200400001)(6436002)(2906002)(2616005)(316002)(53546011)(6246003)(76176011)(6506007)(26005)(66066001)(99286004)(186003)(68736007);DIR:OUT;SFP:1101;SCL:1;SRVR:BN8PR10MB3299;H:BN8PR10MB3540.namprd10.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iH5/vSR7ll6OFVRq9aFgSfCtKk1AVSZzt7pE3sR41LBv6oF5Y53fD0p4VEffrRf+Ca8OWW/H9Yrxx7ke0BzgES8i0p6VDGsDwXhiK3oR2VaKyl83QVCCwa/QA8oiwCvgrsXJJS92FZTz9Qz3slSaT8pzWhuAWa480M4u5YXsammV03TWwLwFG1u0OsCHrQ9SFbcn2N1LRv2bztADiaabM4+1Y+qu/TRJ1UmyqUxg6spQSnDHOHu0ae3YJtxnqnZUvnRGCtetiWwqnv7SXy1WBRM6kUWwWp9FxJsBpB9oseJvuDOI7M/8eI39Ir59lfGB7xa1IkMDxPBHazV7Vxg21iQGn907kknI4O9QL/9fX9IKMXbX1pUs6Hj9nxoHhHk2QRiKYFXNvgxpkwOcoVyPE/Eul9mB6/lnyrN6A0oP5Ts=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A10531FD5E6CE7418A5C23B5407F53BF@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1dd83bc-b604-4682-f045-08d6edcc47b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 17:51:34.9732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jocke@infinera.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3299
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCAyMDE5LTA2LTEwIGF0IDE3OjEyICswMDAwLCBMZW8gTGkgd3JvdGU6DQo+ID4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBKb2FraW0gVGplcm5sdW5kIDxKb2Fr
aW0uVGplcm5sdW5kQGluZmluZXJhLmNvbT4NCj4gPiBTZW50OiBNb25kYXksIEp1bmUgMTAsIDIw
MTkgMjo1MiBBTQ0KPiA+IFRvOiBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47IGxpbnV4LXVz
YkB2Z2VyLmtlcm5lbC5vcmcNCj4gPiBTdWJqZWN0OiBmc2xfdWRjIHN0YXR1cz8NCj4gPiANCj4g
PiBXZSBhcmUgdHJ5aW5nIHRvIGdldCBmc2xfdWRjIHVwIGFuZCBydW5uaW5nIG9uIGEgVDEwNDIg
d2l0aCB3aXRob3V0IHN1Y2Nlc3MuDQo+ID4gU2VlbXMgbGlrZSB0aGlzIGRyaXZlciBpcyBsYWdn
aW5nIGJlaGluZCB0aGUgY29ycmVzcG9uZGluZyBob3N0IGRyaXZlcihtcGgpLg0KPiA+IFRoZSBt
cGggZHJpdmVyIGhhcyBhIG51bWJlciBvZiBVU0IgZXJyYXRhIHdvcmthcm91bmRzIHdoaWxlIHVk
YyBoYXMgbm9uZS4NCj4gPiBBdCBsZWFzdCBlcnJhdGFzIEEwMDc3OTIgc2VlbXMgYXBwbGljYWJs
ZSBmb3IgdWRjIHRvby4NCj4gPiANCj4gPiBJcyB0aGUgZnNsX3VkYyBkcml2ZXIgZnVuY3Rpb25h
bCBvbiA0LjE0Lngod2hpY2ggd2UgdXNlKT8gV2hhdCBpcyBtaXNzaW5nID8NCj4gDQo+IFdlIGFy
ZSBjdXJyZW50bHkgcHJvdmlkaW5nIDQuMTQgc3VwcG9ydCB3aXRoIG91ciBRb3JJUSBTREsuICBZ
b3UgY2FuIHRyeSB0aGUga2VybmVsIHRyZWUgYXQgaHR0cHM6Ly9uYW0wMy5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGc291cmNlLmNvZGVhdXJvcmEu
b3JnJTJGZXh0ZXJuYWwlMkZxb3JpcSUyRnFvcmlxLWNvbXBvbmVudHMlMkZsaW51eCUyRmxvZyUy
RiUzRmglM0RsaW51eC00LjE0JmFtcDtkYXRhPTAyJTdDMDElN0NKb2FraW0uVGplcm5sdW5kJTQw
aW5maW5lcmEuY29tJTdDMTEyN2U1ZmYyMjg5NDNjNjg2M2YwOGQ2ZWRjNmU0Y2QlN0MyODU2NDNk
ZTVmNWI0YjAzYTE1MzBhZTJkYzhhYWY3NyU3QzElN0MwJTdDNjM2OTU3ODM1ODMyMzgzNzc2JmFt
cDtzZGF0YT1GSXI4Ym5VVldGd3M1UlpKdkFTZE44REFOU3RSb08yOUZmd2c4R0NKNTgwJTNEJmFt
cDtyZXNlcnZlZD0wLiAgSSB0aGluayBpdCBpcyB0ZXN0ZWQgb24gVDEwNDIuDQo+IA0KPiBJIHNl
ZSB0aGF0IHRoZXJlIGFyZSBhIGZldyB1ZGMgcmVsYXRlZCBwYXRjaGVzIHRoYXQgb25seSBleGlz
dCBvbiBvdXIgU0RLIGNvZGUgYmFzZS4gIEFkZGluZyBSYW4gV2FuZyB3aG8gaXMgbWFpbnRhaW5p
bmcgdGhlc2UgVVNCIHBhdGNoZXMgaW50ZXJuYWxseS4gIFdlIHNob3VsZCBkZWZpbml0ZWx5IHRy
eSB0byB1cHN0cmVhbSB0aGVtIGluc3RlYWQgb2YgbWFpbnRhaW5pbmcgdGhlbSBpbnRlcm5hbGx5
IGZvcmV2ZXIuDQoNCkhpIExlbw0KDQpJIGNoZWNrZWQgYW5kIGNoZXJyeS1waWNrZWQgdGhlIGZl
dyBjaGFuZ2VzIHRoZXJlIHdlcmUgaW4geW91ciByZXBvIGludG8gbXkgNC4xNC54IHN0YWJsZSBh
bmQgbm8gam95IDooDQpBbnlob3csIEkgc3VzcGVjdCB1ZGMgZ2FkZ2V0IHdhcyBuZXZlciB0ZXN0
ZWQgb24gVDEwNDIgYXMgdGhpcyBkcml2ZXIgaGFzIG5vIHN1cHBvcnQgZm9yIGVycmF0YSBBMDA3
NzkyLA0Kd2l0aG91dCB0aGF0IHNpbXBsZSB3b3JrYXJvdW5kIHRoZSBVU0IgSS9GIGlzIGNvbXBs
ZXRlbHkgZGVhZC4NCg0KQ291bGQgeW91IGNoZWNrIGlmIHVkYy9nYWRnZXQgd29ya3Mgb24gVDEw
NDJSREIob3IgYW55IFQxMHh5KT8NCklzIHRoZXJlIGEgYmV0dGVyIGRyaXZlciBub3dhZGF5cyB0
aGFuIGZzbF91ZGMgPw0KDQogSm9ja2UNClBTLg0KDQpXaXRoIHNvbWUgZXh0cmEgZGVidWcgaW4g
SVJRIGhhbmRsaW5nIGFuZCB0aGUgQTAwNzc5MiB3ZSBvbmx5IGdldCB0aGlzIGZhcjoNCiAgIDEy
Ljk5OTU5Ml0gdWRjOltmc2xfdWRjX2lycV0gIGlycV9zcmMgWzB4ICAgICAgNDBdDQpbICAgMTIu
OTk5NTk4XSB1ZGM6W2ZzbF91ZGNfaXJxXSAgcmVzZXQgaW50DQpbICAgMTIuOTk5NjAxXSB1ZGM6
W3Jlc2V0X2lycV0gIEJ1cyByZXNldA0KWyAgIDEzLjAwMTg2MF0gdWRjOltmc2xfdWRjX2lycV0g
IGlycV9zcmMgWzB4ICAgICAgIDRdDQpbICAgMTMuMDAxODYzXSB1ZGM6W2ZzbF91ZGNfaXJxXSAg
cG9ydCBjaGFuZ2UNClsgICAxMy4yMTUzOTVdIHVkYzpbZnNsX3VkY19pcnFdICBpcnFfc3JjIFsw
eCAgICAgIDQwXQ0KWyAgIDEzLjIxNTM5OF0gdWRjOltmc2xfdWRjX2lycV0gIHJlc2V0IGludA0K
WyAgIDEzLjIxNTQwMV0gdWRjOltyZXNldF9pcnFdICBCdXMgcmVzZXQNClsgICAxMy4yMTc2Njdd
IHVkYzpbZnNsX3VkY19pcnFdICBpcnFfc3JjIFsweCAgICAgICA0XQ0KWyAgIDEzLjIxNzY3MF0g
dWRjOltmc2xfdWRjX2lycV0gIHBvcnQgY2hhbmdlDQpbICAgMTMuMzI2MDM1XSB1ZGM6W2ZzbF91
ZGNfaXJxXSAgaXJxX3NyYyBbMHggICAgICAxMF0NClsgICAxMy4zMjYwMzhdIHVkYzpbZnNsX3Vk
Y19pcnFdICBFcnJvciBJUlEgMTANClsgICAxOC42MzE0NjNdIHVkYzpbZnNsX3VkY19pcnFdICBp
cnFfc3JjIFsweCAgICAgIDQwXQ0KWyAgIDE4LjYzMTQ2OV0gdWRjOltmc2xfdWRjX2lycV0gIHJl
c2V0IGludA0KWyAgIDE4LjYzMTQ3M10gdWRjOltyZXNldF9pcnFdICBCdXMgcmVzZXQNClsgICAx
OC42MzM3MzJdIHVkYzpbZnNsX3VkY19pcnFdICBpcnFfc3JjIFsweCAgICAgICA0XQ0KWyAgIDE4
LjYzMzczNV0gdWRjOltmc2xfdWRjX2lycV0gIHBvcnQgY2hhbmdlDQpbICAgMTguODQzOTM2XSB1
ZGM6W2ZzbF91ZGNfaXJxXSAgaXJxX3NyYyBbMHggICAgICAxMF0NClsgICAxOC44NDM5MzldIHVk
YzpbZnNsX3VkY19pcnFdICBFcnJvciBJUlEgMTANClsgICAyNC4yNjM2NTZdIHVkYzpbZnNsX3Vk
Y19pcnFdICBpcnFfc3JjIFsweCAgICAgIDQwXQ0KWyAgIDI0LjI2MzY2MV0gdWRjOltmc2xfdWRj
X2lycV0gIHJlc2V0IGludA0KWyAgIDI0LjI2MzY2NV0gdWRjOltyZXNldF9pcnFdICBCdXMgcmVz
ZXQNClsgICAyNC4yNjU5MjZdIHVkYzpbZnNsX3VkY19pcnFdICBpcnFfc3JjIFsweCAgICAgICA0
XQ0KWyAgIDI0LjI2NTkyOV0gdWRjOltmc2xfdWRjX2lycV0gIHBvcnQgY2hhbmdlDQpbICAgMjQu
NDc5MTQ0XSB1ZGM6W2ZzbF91ZGNfaXJxXSAgaXJxX3NyYyBbMHggICAgIDEwMF0NClsgICAyNC40
NzkxNDddIHVkYzpbZnNsX3VkY19pcnFdICBzdXNwZW5kIGludA0KLi4uLg0KIkVycm9yIElSUSAx
MCIgaXMgVVNCX1NUU19TWVNfRVJSIGFuZCB0aGF0IGlzIHdlcmUgd2UgYXJlIHN0dWNrLg0KDQog
ICBKb2NrZQ0K
