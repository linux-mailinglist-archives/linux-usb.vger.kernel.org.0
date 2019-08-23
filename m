Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2B09A481
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2019 03:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732095AbfHWBCG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 21:02:06 -0400
Received: from mail-eopbgr10072.outbound.protection.outlook.com ([40.107.1.72]:59779
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731592AbfHWBCG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Aug 2019 21:02:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YM/x3K4/EziYSII9VxcEz5dhWYrqTzIaqjObVkvwD4+8UE9dGshDHP0pu/WfSulxQq7VCJ28FPZwd6cvM0SBloNoQRCxbqSwOI1HX87dI+8CGn//ItDyrk/BCEADdTzECgt7iVFA3pZ+IHgT/5Oz4ArnnXRLmKTFFSl19l9F6GPW3czDOj5i6n/a1j1iPl4729qv2yxg1x/7AxOniitEzR9PdgD149bjKpY3Y5LBAiK3eaeoJVj+QO53VlsrE/c5BIp8QIQLWytRIqdqeiKMgFWtLrFuPxkprV/PP+FvESYNs7WWgJ7ptb56oDrhFH8P/md3ghzBNABvpTt9gsgE7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7L14ivppljTf1VQFUZhNR7iyt3mEgbCDqarg8GXbO2g=;
 b=Gjr6bFEgY1gTYmNmzLQAZ6n+AZAzvdfgh/1nMiJqvDuGKSC+QTLs9tcze/X+ds6xWASppyGYdBk+nTcksFOR1BkjJ78edATsJoYQIygbDb5lCHDtvA++vuY2+0zqWokjzf7/0WmvovqOtJUAAYCoCJchAyDqXxLBep7J+f087vqRNVi/vU0Gc+Kzdc7AjSkcjgdBnA5z8t05V7djz5YaljZk33xVprYZnhKK7LRLMU3MoZwfXXkAmwONl24vqPBZQlgjysmURCTDKFA/yqYMbeLzV8hwGnxxUQTxu1IjNWG6hINYZhgvLmKD9Mug49s4ZsPXPZ6/YlVNE3xdF20g6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7L14ivppljTf1VQFUZhNR7iyt3mEgbCDqarg8GXbO2g=;
 b=GmLK7LgHTSgMep0YpP3yE7wqyKzRzrFzCUnebzT5/wEQk0Lbq3PsgE2uDTm3YYZ1wB2kfQ10ZJy9aFW7RKN7roPfZktK8zWnPgKupEfArvPei7msPwXSPs4ZPe8k10l1zalvnagHBWXEZgWNEQB41p57U2FwybixJmFuS9LWLds=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB4061.eurprd04.prod.outlook.com (10.171.182.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 23 Aug 2019 01:02:00 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a%4]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 01:02:00 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Ran Wang <ran.wang_1@nxp.com>
Subject: Re: [PATCH 1/1] usb: xhci: avoid VBus glitch during controller reset
 operation
Thread-Topic: [PATCH 1/1] usb: xhci: avoid VBus glitch during controller reset
 operation
Thread-Index: AQHVV88qu74WcWDk3UKcEVqZOYC8KacHBDgAgADoJAA=
Date:   Fri, 23 Aug 2019 01:01:59 +0000
Message-ID: <20190823005918.mlcvlbzdai74t6xf@b29397-desktop>
References: <20190821031602.1030-1-peter.chen@nxp.com>
 <ce4fc3ec-2290-2902-1cf9-95add5b428b9@linux.intel.com>
In-Reply-To: <ce4fc3ec-2290-2902-1cf9-95add5b428b9@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffab1da7-d754-4c53-42d5-08d7276580c3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VI1PR04MB4061;
x-ms-traffictypediagnostic: VI1PR04MB4061:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB40615ADBCC0296494380356D8BA40@VI1PR04MB4061.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(189003)(199004)(43544003)(14454004)(53936002)(8676002)(305945005)(6486002)(4326008)(9686003)(3846002)(7736002)(6116002)(14444005)(256004)(33716001)(66066001)(6506007)(6916009)(316002)(53546011)(478600001)(54906003)(1076003)(5660300002)(6512007)(2906002)(486006)(86362001)(99286004)(6246003)(76116006)(71190400001)(71200400001)(91956017)(44832011)(446003)(11346002)(476003)(81166006)(66476007)(25786009)(66556008)(76176011)(66946007)(66446008)(64756008)(8936002)(229853002)(26005)(81156014)(6436002)(102836004)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4061;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QswfMYW2V+qPocnjVVooITOwE+K1CkDZoh9qkJrGTREziYpaxILqU6lLVVGO6rxsOLkqWofCC2KSCW9IGm34RFh/B84pOfAA8zaC5WIRWoOioOslX90Yk91lfb4uBwVHUTXVGBbYI3KD8hrvQcOCmtlXKzQ4sInTvbhZC++YwAe/yFUHYTCDQgp1YNhJ8Soit/gUDh/z5CbOyrySPkzEhBnCJA3e699PM6RXRHnt9hNyz6XLhukFT57EVtDhIJEtUdCQSgx3CasLuBcvaG+vC4Q96xfOEUnPHOSu4a68qRxpe/vqIqXW8HXtcbcYnpFiJQ5Mlh5QGZXPambVFjcJmKS+/Ivkx+mHZm9s9htkpZN96CnI4W6PTOqPkWRgyZEB0oQ11AN36Qo+W8T/AUDXrpypyRiLMQV1K412v42p7IA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B96D4D0C34E1E4C9BE66B06C2828815@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffab1da7-d754-4c53-42d5-08d7276580c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 01:02:00.0135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5DQeKUmRfdh0HK+raxBw7Gn9OHfIVVsLapGaaD1CdZKPzKiXkv5cVK6hLd9KF2+U8nS+Xc+d/bI6UOquJFFqmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4061
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMTktMDgtMjIgMTQ6MDg6MjYsIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+IE9uIDIxLjguMjAx
OSA2LjE4LCBQZXRlciBDaGVuIHdyb3RlOg0KPiA+IEFjY29yZGluZyB0byB4SENJIDEuMSBDSDQu
MTkuNCBQb3J0IFBvd2VyOg0KPiA+IAlXaGlsZSBDaGlwIEhhcmR3YXJlIFJlc2V0IG9yIEhDUlNU
IGlzIGFzc2VydGVkLA0KPiA+ICAgICAgICAgCXRoZSB2YWx1ZSBvZiBQUCBpcyB1bmRlZmluZWQu
IElmIHRoZSB4SEMgc3VwcG9ydHMNCj4gPiAgICAgICAgIAlwb3dlciBzd2l0Y2hlcyAoUFBDID0g
4oCYMeKAmSkgdGhlbiBWQnVzIG1heSBiZSBkZWFzc2VydGVkDQo+ID4gICAgICAgICAJZHVyaW5n
IHRoaXMgdGltZS4gUFAgKGFuZCBWQnVzKSBzaGFsbCBiZSBlbmFibGVkIGltbWVkaWF0ZWx5DQo+
ID4gICAgICAgICAJdXBvbiBleGl0aW5nIHRoZSByZXNldCBjb25kaXRpb24uDQo+ID4gDQo+ID4g
VGhlIFZCdXMgZ2xpdGNoIG1heSBjYXVzZSBzb21lIFVTQiBkZXZpY2VzIHdvcmsgYWJub3JtYWws
IHdlIG9ic2VydmUNCj4gPiBpdCBhdCBOWFAgTFMxMDEyQUZXUlkvTFMxMDQzQVJEQi9MWDIxNjBB
UURTL0xTMTA4OEFSREIgcGxhdGZvcm1zLiBUbw0KPiA+IGF2b2lkIHRoaXMgVmJ1cyBnbGl0Y2gs
IHdlIGNvdWxkIHNldCBQUCBhcyAwIGJlZm9yZSBIQ1JTVCwgYW5kIHRoZSBQUA0KPiA+IHdpbGwg
YmFjayB0byAxIGFmdGVyIEhDUlNUIGFjY29yZGluZyB0byBzcGVjLg0KPiANCj4gSXMgdGhpcyBn
bGl0Y2ggY2F1c2luZyBpc3N1ZXMgYWxyZWFkeSBhdCB0aGUgZmlyc3QgeEhDIHJlc2V0IHdoZW4g
d2UgYXJlDQo+IGxvYWRpbmcgdGhlIHhoY2kgZHJpdmVyLCAgb3Igb25seSBsYXRlciByZXNldHMs
IGxpa2UgeEhDIHJlc2V0IGF0IHJlc3VtZT8NCg0KVGhlIGZpcnN0IHRpbWUsIFJhbiB3b3VsZCB5
b3UgcGxlYXNlIGNvbmZpcm0/DQoNCj4gDQo+ID4gDQo+ID4gUmVwb3J0ZWQtYnk6IFJhbiBXYW5n
IDxyYW4ud2FuZ18xQG54cC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgQ2hlbiA8cGV0
ZXIuY2hlbkBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy91c2IvaG9zdC94aGNpLmMg
fCAxNSArKysrKysrKysrKysrKy0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hv
c3QveGhjaS5jIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLmMNCj4gPiBpbmRleCA2YjM0YTU3M2Mz
ZDkuLmY1YTdiNWQ2MzAzMSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ku
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jDQo+ID4gQEAgLTE2Nyw3ICsxNjcs
OCBAQCBpbnQgeGhjaV9yZXNldChzdHJ1Y3QgeGhjaV9oY2QgKnhoY2kpDQo+ID4gICB7DQo+ID4g
ICAJdTMyIGNvbW1hbmQ7DQo+ID4gICAJdTMyIHN0YXRlOw0KPiA+IC0JaW50IHJldDsNCj4gPiAr
CWludCByZXQsIGk7DQo+ID4gKwl1MzIgcG9ydHNjOw0KPiA+ICAgCXN0YXRlID0gcmVhZGwoJnho
Y2ktPm9wX3JlZ3MtPnN0YXR1cyk7DQo+ID4gQEAgLTE4MSw2ICsxODIsMTggQEAgaW50IHhoY2lf
cmVzZXQoc3RydWN0IHhoY2lfaGNkICp4aGNpKQ0KPiA+ICAgCQlyZXR1cm4gMDsNCj4gPiAgIAl9
DQo+ID4gKwkvKg0KPiA+ICsJICogS2VlcCBQT1JUU0MuUFAgYXMgMCBiZWZvcmUgSENSU1QgdG8g
ZWxpbWluYXRlDQo+ID4gKwkgKiBWYnVzIGdsaXRjaCwgc2VlIENIIDQuMTkuNC4NCj4gPiArCSAq
Lw0KPiA+ICsJZm9yIChpID0gMDsgaSA8IEhDU19NQVhfUE9SVFMoeGhjaS0+aGNzX3BhcmFtczEp
OyBpKyspIHsNCj4gPiArCQlfX2xlMzIgX19pb21lbSAqcG9ydF9hZGRyID0gJnhoY2ktPm9wX3Jl
Z3MtPnBvcnRfc3RhdHVzX2Jhc2UgKw0KPiA+ICsJCQkJTlVNX1BPUlRfUkVHUyAqIGk7DQo+ID4g
KwkJcG9ydHNjID0gcmVhZGwocG9ydF9hZGRyKTsNCj4gPiArCQlwb3J0c2MgJj0gflBPUlRfUE9X
RVI7DQo+ID4gKwkJd3JpdGVsKHBvcnRzYywgcG9ydF9hZGRyKTsNCj4gDQo+IE5vdCBhbGwgYml0
cyByZWFkIGZyb20gUE9SVFNDIHNob3VsZCBiZSB3cml0dGVuIGJhY2ssIHlvdSBtaWdodCBuZWVk
DQo+IHBvcnRzYyA9IHhoY2lfcG9ydF9zdGF0ZV90b19uZXV0cmFsKHBvcnRzYykgaGVyZS4NCg0K
V2lsbCBjaGFuZ2UuDQoNCj4gDQo+IE5vcm1hbGx5IEknZCByZWNvbW1lbmQgdXNpbmcgdGhlIHho
Y2lfc2V0X3BvcnRfcG93ZXIoKSBoZWxwZXIgaW5zdGVhZCwgYnV0DQo+IGlmIHRoaXMgaXMgaXMg
bmVlZGVkIGF0IGRyaXZlciBsb2FkIHRpbWUgdGhlbiBwb3J0IGFycmF5cyBtYXkgbm90IGJlIHNl
dCB1cCB5ZXQuDQo+IHhoY2lfc2V0X3BvcnRfcG93ZXIoKSB3b3VsZCB0YWtlIGNhcmUgb2YgcG9z
c2libGUgQUNQSSBtZXRob2QgY2FsbHMsIGFuZCBhZGQgc29tZSBkZWJ1Z2dpbmcuDQo+IA0KDQpJ
dCBpcyBuZWVkZWQgYXQgbG9hZCB0aW1lLCBzbyBJIGRpZCBub3QgdXNlIHBvcnQgYXJyYXkuDQoN
Cj4gTm90IHN1cmUgaWYgdGhpcyB3aWxsIGltcGFjdCBzb21lIG90aGVyIHBsYXRmb3JtcywgbWF5
YmUgaXQgd291bGQgYmUgYmV0dGVyIHRvIG1vdmUgdGhpcyB0bw0KPiBhIHNlcGFyYXRlIGZ1bmN0
aW9uLCBhbmQgY2FsbCBpdCBiZWZvcmUgeGhjaV9yZXNldCgpIGlmIGEgcXVpcmsgaXMgc2V0Lg0K
PiANCg0KSXQgZm9sbG93cyBzcGVjLCBub3QgYXQgcXVpcmsuIFdlIHRhbGtlZCB3aXRoIFN5bm9w
c2lzIGVuZ2luZWVyDQooY2FzZTogODAwMTIzNTQ3OSksIHRoZXkgY29uZmlybWVkIHRoaXMgYmVo
YXZpb3VyIGZvbGxvd3Mgc3BlYy4NCkJlc2lkZXMsIEkgdHJpZWQgYXQgYm90aCBkd2MzIGFuZCBj
YWRlbmNlMyB4SENJIHBsYXRmb3JtcywNCnRoZSBQT1JUX1BPV0VSIHdpbGwgYmUgc2V0IGFnYWlu
IGFmdGVyIGNvbnRyb2xsZXIgc2V0Lg0KDQpXaGF0J3MgcG90ZW50aWFsIGlzc3VlIHlvdSBjb25z
aWRlcj8NCg0KVGhhbmtzLA0KUGV0ZXINCg==
