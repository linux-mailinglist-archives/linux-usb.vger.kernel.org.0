Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1073629EC19
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 13:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgJ2MoJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 08:44:09 -0400
Received: from mail-db8eur05on2071.outbound.protection.outlook.com ([40.107.20.71]:34400
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725778AbgJ2MoI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Oct 2020 08:44:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJaoomoa4Ip6JceqqwUkECUKTsct7XLV/wAlCol6YiThWxZjAcVv/2lullldVL5hZPRdbQUpbLH1lTVP50hnhpjnWfWKN931ZnivMj7oP1M/7I6JpGBrxgbRc24K8jdjpdBNcRymyLG3bT2f03ZQ1myyfzJuxk91OwzoUJO6yin2m07ckZ6Dq2VUtU8hQS8nyZTARrmUZXv7kqm1BmAOy+S5HgXdILSVddAzqJ+XiJM5H0gbni+H+Pm/ZrCrRnhpPHRji0Uvu4FmbkL5My1uY1HK0aEjvhl3GZjnfn34oYyxLV2xjqzOCi9yQSB5QwcQY8H80FXGEfSIpB0FGq9wyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDeQRT861XmrH0B2REfkznkHeRyaGprT4ea/Xek0r2A=;
 b=WuHkhI4CuXBD4TC+lOnM1qYPIn0SgrcLkzVsxTNe7Rxic+jl/rUy7TTo97y1gyhDknMM3bb9uAJWi+8wHm5URfApd9++lC29ZZ5ChkL5cq/sjF0uVLygArnmAOe9gGgTwG8LDbjTvTMsGhxPeJvKXlINLSvcoLtSGgsfDiZItiSWyMkdoEYiVzqbP3MuVPWIF+WKd3hJ8cZJ0FasHbKGLpyLuBiM9euB21PI3hZWiodc57MtXB6MePz+k7rvw9i8Wchn7Hu/3kmN62PTyQrMxUxfKAGfESe+sd23eTdpakgbi+QBsfdgSn0Yd2aXIn4SSeoX31H7RpPycJadQh4C7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDeQRT861XmrH0B2REfkznkHeRyaGprT4ea/Xek0r2A=;
 b=OZSdQ6gul4c7YDx6asBI/wJy6hd/Wj1iOx4tZUnF+CBYbH9SKJKPgaX5cF6fyNXoiZHZOpmQ6ww2kAd1doCA6d7B9tHdKPdYIS0vSCWWdIxo88wZ7B1DNAmeirhBqUfp9Gl/qIoB1aaefEZN3R2pNA2jGZO4mpc9nbL5IxEG1B0=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6717.eurprd04.prod.outlook.com (2603:10a6:803:129::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 29 Oct
 2020 12:44:03 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::852e:24d5:4c9f:5bdf]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::852e:24d5:4c9f:5bdf%6]) with mapi id 15.20.3499.027; Thu, 29 Oct 2020
 12:44:03 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     Mike Galbraith <efault@gmx.de>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: RE: [PATCH 3/3] xhci: Don't create stream debugfs files with spinlock
 held.
Thread-Topic: [PATCH 3/3] xhci: Don't create stream debugfs files with
 spinlock held.
Thread-Index: AQHWrWkkCR4qtkz2JEe9KPalNa285KmuF4sAgAA9C4CAABk1AIAAAuoAgAAEZ4CAAA+nEA==
Date:   Thu, 29 Oct 2020 12:44:02 +0000
Message-ID: <VE1PR04MB6528891AFF32D58FDF6AA31389140@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <20201028203124.375344-1-mathias.nyman@linux.intel.com>
 <20201028203124.375344-4-mathias.nyman@linux.intel.com>
 <1cbb8b7defb1db1d4747995c11ebebb3dd9a66ec.camel@gmx.de>
 <30dd5079-375d-a2a3-cab3-1b2740661ea8@linux.intel.com>
 <c8a67a65091404e528297ef5c6b9c59cdc03a2c9.camel@gmx.de>
 <a5d5a21c-d6ff-1097-b9ca-e0147658c8c6@linux.intel.com>
 <20201029113805.tdsissnjq4acemle@linutronix.de>
In-Reply-To: <20201029113805.tdsissnjq4acemle@linutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linutronix.de; dkim=none (message not signed)
 header.d=none;linutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.64.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 31b43f07-dbcb-404e-85ae-08d87c0850d0
x-ms-traffictypediagnostic: VE1PR04MB6717:
x-microsoft-antispam-prvs: <VE1PR04MB671739E0C050C0C4DCE0F08389140@VE1PR04MB6717.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XCnTE51CYUe8RU+PmYYB767AtHX16zAdHZ3AtFJV9mfP+zrD6e7RTZJVpcNqMaqbECJoTRxEfT3E2+qxJypsIKqZ+qsHmyGrhWqmv9bR8IcfP8zS7QQU+Xa0/F+tHvWOZuVt/oqvanOlx7/mp6tNhq+sp91xdP6fug4ssCVmSRwKAlIa/G++GGTRNxvzFokb0Ysw3J7GbFZo4267ZHsLI9goJnQ6xlHrYjFj3hlnjjrOtkg43W0ikO9fvfScAI3uk4COFhhywwVA4KUzHJIY5ZMHxWMdW/JB+iNlMQWrrTnjkMZQFhogT4ofbU2Bj5PzlJZ6gqxAYX8SLqTVtYZTcA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(39850400004)(376002)(110136005)(4326008)(54906003)(8676002)(4001150100001)(2906002)(186003)(53546011)(6506007)(44832011)(76116006)(66556008)(66476007)(64756008)(66446008)(66946007)(478600001)(86362001)(71200400001)(26005)(9686003)(5660300002)(33656002)(55016002)(52536014)(83380400001)(7696005)(8936002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: drmFdsubpEtuhVq0iaqaENrqdpTmEd/CQaHciWHkiv3Uu6+mXWjZc6M+vJlCANh4f74idHhkJeX+JEp0+kmUHS7J4gEuFiRdMoHkDs5EfFL/9v3t8RhWkZgAq9uNR2bWtLVsyrqmbyF5gxd32hIBEKPNtImyXUg36Aibz+evp/8AIGcpxzvAxH0pEByX3zrFL+YtvbkRtxql36lVCaKVRc+9Blj5hsdp8mCaGDPGoDx7LgPPIogIWGqKtLzfpr8qeMupLtNSx1qOW4u68GSmKLkVoGvtrCL4Iul6s0YKJpmiPu+ExQK26EpfzBZXzdFqgvgcf8yaR1Cydz19hnsm0i643ew0mifV9SV22g6qerJGsDGTumy7gIbiYfteTJ9pOGCxXKx4l1GgWLcbv/Wv/mIFTJiX98hePqBSdofGKZhXwqoqXZTQjzIHncv6C6FLLm7hnOf4C0R1z15YIqKhnRdImkDx9zdDPzhd8dJ7moY5w+f/gZDQke3EAyzI69xdWWxrEzEagZKXE88WndCq2JfMMUXjd1f7HsrmLzsspnBitsSLcYGqx/ppHKVfJmNxC0SlPrjSVFFLMd9T8H7WtpVMawn4Fwo/OhmqnBpEn8PgcxRUo+rTJ70jguPbcADFApsRPnGe4rpSbGJ/VCiORA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b43f07-dbcb-404e-85ae-08d87c0850d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 12:44:02.9401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k8sKOaDIsq79eRuOt3qZ/LpBfp+AAHTJsCGGB/niW0hxu+GFo/oYOLqRdshHtqDM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6717
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2ViYXN0aWFuIEFuZHJ6
ZWogU2lld2lvciA8YmlnZWFzeUBsaW51dHJvbml4LmRlPg0KPiBTZW50OiBUaHVyc2RheSwgT2N0
b2JlciAyOSwgMjAyMCA3OjM4IFBNDQo+IFRvOiBNYXRoaWFzIE55bWFuIDxtYXRoaWFzLm55bWFu
QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IE1pa2UgR2FsYnJhaXRoIDxlZmF1bHRAZ214LmRlPjsg
Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7DQo+IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7
IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+OyBKdW4gTGkNCj4gPGp1bi5saUBu
eHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvM10geGhjaTogRG9uJ3QgY3JlYXRlIHN0
cmVhbSBkZWJ1Z2ZzIGZpbGVzIHdpdGggc3BpbmxvY2sNCj4gaGVsZC4NCj4gDQo+IE9uIDIwMjAt
MTAtMjkgMTM6MjI6MjAgWyswMjAwXSwgTWF0aGlhcyBOeW1hbiB3cm90ZToNCj4gPiBPbiAyOS4x
MC4yMDIwIDEzLjExLCBNaWtlIEdhbGJyYWl0aCB3cm90ZToNCj4gPiA+IE9uIFRodSwgMjAyMC0x
MC0yOSBhdCAxMTo0MSArMDIwMCwgTWF0aGlhcyBOeW1hbiB3cm90ZToNCj4gPiA+PiBDYW4geW91
IGNoZWNrIGlmIHRoaXMgY2FuIGJlIHJlcHJvZHVjZWQgd2l0aCA1Ljkga2VybmVsPw0KPiA+ID4N
Cj4gPiA+IE5vcGUsIDUuOS4yIGRpZG4ndCByZXByb2R1Y2UuDQo+ID4gPg0KPiA+DQo+ID4gVmVy
eSBvZGQuDQo+ID4gSXQgbWlnaHQgYmUgaGFyZCB0byByZXByb2R1Y2UgYXMgaXQgcmVxdWlyZXMg
eGhjaSByaW5nIGV4cGFuc2lvbiB0bw0KPiA+IHRyaWdnZXIgaXQsIG1lYW5pbmcgYXQgc29tZSBw
b2ludCB0aGVyZSBpcyBzbyBtdWNoIGRhdGEgcXVldWVkIHRvIGENCj4gPiBkZXZpY2UgdGhlIGN1
cnJlbnQgcmluZyBidWZmZXIgY2FuJ3QgZml0IGl0Lg0KPiA+DQo+ID4gT3RoZXIgcG9zc2liaWxp
dHkgaXMgdGhhdCB0aGVyZSB3ZXJlIHNvbWUgcmFkaXggdHJlZSBjaGFuZ2VzIGluIDUuMTAtcmMx
LA0KPiBoYXZlbid0IGxvb2tlZCBpbnRvIHRob3NlLg0KPiANCj4gVGhpcyBjYW1lIHdpdGggY29t
bWl0DQo+ICAgIDY3M2Q3NDY4MzYyN2IgKCJ1c2I6IHhoY2k6IGFkZCBkZWJ1Z2ZzIHN1cHBvcnQg
Zm9yIGVwIHdpdGggc3RyZWFtIikNCj4gDQo+IHdoaWNoIGlzIGFwcGVhcmVkIGluIHY1LjEwLXJj
MS4gVGhpcyBodW5rIGJlbG93IHdvcmtzIGFyb3VuZCBpdDoNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3VzYi9ob3N0L3hoY2kuYyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jIGluZGV4DQo+
IDQ4MmZlOGM1ZTNiNDcuLjY5OTc3N2ZiNTIzYjYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNi
L2hvc3QveGhjaS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jDQo+IEBAIC0zNTMz
LDExICszNTMzLDEzIEBAIHN0YXRpYyBpbnQgeGhjaV9hbGxvY19zdHJlYW1zKHN0cnVjdCB1c2Jf
aGNkICpoY2QsDQo+IHN0cnVjdCB1c2JfZGV2aWNlICp1ZGV2LA0KPiAgCQl4aGNpX2RiZyh4aGNp
LCAiU2xvdCAldSBlcCBjdHggJXUgbm93IGhhcyBzdHJlYW1zLlxuIiwNCj4gIAkJCSB1ZGV2LT5z
bG90X2lkLCBlcF9pbmRleCk7DQo+ICAJCXZkZXYtPmVwc1tlcF9pbmRleF0uZXBfc3RhdGUgfD0g
RVBfSEFTX1NUUkVBTVM7DQo+IC0JCXhoY2lfZGVidWdmc19jcmVhdGVfc3RyZWFtX2ZpbGVzKHho
Y2ksIHZkZXYsIGVwX2luZGV4KTsNCj4gIAl9DQo+ICAJeGhjaV9mcmVlX2NvbW1hbmQoeGhjaSwg
Y29uZmlnX2NtZCk7DQo+ICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmeGhjaS0+bG9jaywgZmxh
Z3MpOw0KPiANCj4gKwlmb3IgKGkgPSAwOyBpIDwgbnVtX2VwczsgaSsrKQ0KPiArCQl4aGNpX2Rl
YnVnZnNfY3JlYXRlX3N0cmVhbV9maWxlcyh4aGNpLCB2ZGV2LCBlcF9pbmRleCk7DQo+ICsNCj4g
IAkvKiBTdWJ0cmFjdCAxIGZvciBzdHJlYW0gMCwgd2hpY2ggZHJpdmVycyBjYW4ndCB1c2UgKi8N
Cj4gIAlyZXR1cm4gbnVtX3N0cmVhbXMgLSAxOw0KPiANCj4gVGhpcyBtYWtlcyB0aGUgd2Fybmlu
ZyBnbyBhd2F5IGhlcmUsIEknbSBub3QgMTAwJSBzdXJlIHRoYXQgdGhpcyBva2F5Lg0KPiBPbmUg
dGhpbmcgSSBub3RpY2VkOiBmcmVlX3N0cmVhbXMoKSBkb2VzIG5vdCByZW1vdmUgdGhlIGRlYnVn
ZnMgZmlsZSBzbzoNCj4gfCAkIGNkIC9zeXMvYnVzL3VzYi9kcml2ZXJzL3Vhcw0KPiB8ICQgZWNo
byAyLTE6MS4wID4gYmluZA0KPiB8ICQgZWNobyAyLTE6MS4wID4gdW5iaW5kDQo+IA0KPiBhbmQg
dGhlIGtlcm5lbCBsb2cgc2hvd3M6DQo+IHxzZCA3OjA6MDowOiBbc2RiXSBTeW5jaHJvbml6aW5n
IFNDU0kgY2FjaGUgc2QgNzowOjA6MDogW3NkYl0NCj4gfFN5bmNocm9uaXplIENhY2hlKDEwKSBm
YWlsZWQ6IFJlc3VsdDogaG9zdGJ5dGU9RElEX0VSUk9SDQo+IHxkcml2ZXJieXRlPURSSVZFUl9P
Sw0KPiB8ZGVidWdmczogRmlsZSAnc3RyZWFtX2lkJyBpbiBkaXJlY3RvcnkgJ2VwMDcnIGFscmVh
ZHkgcHJlc2VudCENCj4gfGRlYnVnZnM6IEZpbGUgJ3N0cmVhbV9jb250ZXh0X2FycmF5JyBpbiBk
aXJlY3RvcnkgJ2VwMDcnIGFscmVhZHkgcHJlc2VudCENCj4gfGRlYnVnZnM6IEZpbGUgJ3N0cmVh
bV9pZCcgaW4gZGlyZWN0b3J5ICdlcDA3JyBhbHJlYWR5IHByZXNlbnQhDQo+IHxkZWJ1Z2ZzOiBG
aWxlICdzdHJlYW1fY29udGV4dF9hcnJheScgaW4gZGlyZWN0b3J5ICdlcDA3JyBhbHJlYWR5IHBy
ZXNlbnQhDQo+IHxzY3NpIGhvc3Q3OiB1YXMNCj4gfHNjc2kgNzowOjA6MDogRGlyZWN0LUFjY2Vz
cyAgICAgUUVNVSAgICAgUUVNVSBIQVJERElTSyAgICAyLjUrIFBROiAwIEFOU0k6DQo+IDUNCj4g
fHNkIDc6MDowOjA6IEF0dGFjaGVkIHNjc2kgZ2VuZXJpYyBzZzIgdHlwZSAwIHNkIDc6MDowOjA6
IFtzZGJdIDI2MjE0NA0KPiB8NTEyLWJ5dGUgbG9naWNhbCBibG9ja3M6ICgxMzQgTUIvMTI4IE1p
Qikgc2QgNzowOjA6MDogW3NkYl0gV3JpdGUNCj4gfFByb3RlY3QgaXMgb2ZmIHNkIDc6MDowOjA6
IFtzZGJdIE1vZGUgU2Vuc2U6IDYzIDAwIDAwIDA4IHNkIDc6MDowOjA6DQo+IHxbc2RiXSBXcml0
ZSBjYWNoZTogZW5hYmxlZCwgcmVhZCBjYWNoZTogZW5hYmxlZCwgZG9lc24ndCBzdXBwb3J0IERQ
TyBvcg0KPiB8RlVBIHNkIDc6MDowOjA6IFtzZGJdIEF0dGFjaGVkIFNDU0kgZGlzaw0KDQpUaGlz
IGlzIGJlY2F1c2UgeW91ciBjaGFuZ2UgaXMgdXNpbmcgd3JvbmcgKmVwX2luZGV4KiB3aGVuIGNy
ZWF0ZQ0Kc3RyZWFtIGZpbGVzLCBpZiB5b3UgdXNlIHRoZSBiZWxvdyBwYXRjaCBmcm9tIE1hdGhp
YXMsIHlvdSB3aWxsIG5vdA0KaGF2ZSB0aGlzIHByb2JsZW0uDQoNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9ob3N0L3hoY2kuYyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jIGluZGV4IDQ4MmZl
OGM1ZTNiNC4uZDRhOGQwZWZiYmM0IDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvaG9zdC94aGNp
LmMNCisrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jDQpAQCAtMzUzMywxMSArMzUzMywxNCBA
QCBzdGF0aWMgaW50IHhoY2lfYWxsb2Nfc3RyZWFtcyhzdHJ1Y3QgdXNiX2hjZCAqaGNkLCBzdHJ1
Y3QgdXNiX2RldmljZSAqdWRldiwNCiAJCXhoY2lfZGJnKHhoY2ksICJTbG90ICV1IGVwIGN0eCAl
dSBub3cgaGFzIHN0cmVhbXMuXG4iLA0KIAkJCSB1ZGV2LT5zbG90X2lkLCBlcF9pbmRleCk7DQog
CQl2ZGV2LT5lcHNbZXBfaW5kZXhdLmVwX3N0YXRlIHw9IEVQX0hBU19TVFJFQU1TOw0KLQkJeGhj
aV9kZWJ1Z2ZzX2NyZWF0ZV9zdHJlYW1fZmlsZXMoeGhjaSwgdmRldiwgZXBfaW5kZXgpOw0KIAl9
DQogCXhoY2lfZnJlZV9jb21tYW5kKHhoY2ksIGNvbmZpZ19jbWQpOw0KIAlzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZ4aGNpLT5sb2NrLCBmbGFncyk7DQogDQorCWZvciAoaSA9IDA7IGkgPCBudW1f
ZXBzOyBpKyspIHsNCisJCWVwX2luZGV4ID0geGhjaV9nZXRfZW5kcG9pbnRfaW5kZXgoJmVwc1tp
XS0+ZGVzYyk7DQorCQl4aGNpX2RlYnVnZnNfY3JlYXRlX3N0cmVhbV9maWxlcyh4aGNpLCB2ZGV2
LCBlcF9pbmRleCk7DQorCX0NCiAJLyogU3VidHJhY3QgMSBmb3Igc3RyZWFtIDAsIHdoaWNoIGRy
aXZlcnMgY2FuJ3QgdXNlICovDQogCXJldHVybiBudW1fc3RyZWFtcyAtIDE7DQoNCkxpIEp1bg0K
PiANCj4gPiAtTWF0aGlhcw0KPiANCj4gU2ViYXN0aWFuDQo=
