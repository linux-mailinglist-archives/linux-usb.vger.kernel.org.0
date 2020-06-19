Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D65200002
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 04:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729143AbgFSCFW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jun 2020 22:05:22 -0400
Received: from mail-eopbgr50071.outbound.protection.outlook.com ([40.107.5.71]:59618
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725912AbgFSCFU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Jun 2020 22:05:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLhFu/SH9H+ZGpr8FKuIOH1hi+2wEjR74kJbfq55h+CvvXOyCU3U1P/8bi2wMEY2Q53gla7UHIcrGT5sjFpsFfQ5ruWfvc3FcSXHi23qQtFCLaFZvIkxoy8V7gizbzyYI8t1IyYbdxmoIhPsaYz04BbcLef1VvKMwNJ6SrmUyNiHGFTiiYP0rpD/mrfKBi04yYxS3pQZ+/TT4P/PehZV+nzl4u/VA5hQGZd2BXZR0v/+YYGMiOTsNLDQfpLyDNllr91zJ3MFz1B2T0oBmkG/jf0JzseBsezHqwRx8z5R2fA20cdEfKqHl1sedpKgCwqzqOqm9DCTXuRKTRkmVueYww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64ykf/RUhkqDdIcHuqeALE8pStftwBd1vkDjQ7Dkq28=;
 b=gJYlo+nVuDdd6nye4J1JvYyZ/LTMtaDNjkH0I1azoJH5TRwR5b/8E5TrcewJSmSOj72dnZAICp2tdMYEcr+KuP85kWjVU1IHs/rSB33LUoJw8slepn167rYc88WRjJospoEMBvtACQBz+DeWBZe9mRj2zn6vhNyKQOcy7ZoKAbBmmU/OSqPbLczn+YCnvy1Vkt+9xjTt4UBJoMTxQhoFz3MS6y4bv69K+PhudhGtC+B2xJpb/IHeU/VRYTkDZ/nP7Zgnl9jX0Cww1sh2oJAYinwCpL2YmgcZrS9bwSc8VyNbpA2uspPPA4GrJ3hQasQK4loGSUvsnCQ3xIdnrXtqFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64ykf/RUhkqDdIcHuqeALE8pStftwBd1vkDjQ7Dkq28=;
 b=sz0BJTqndZVynRnQH0NxNF+pPVdhAvBJBydY5/gYjTQW2iUFbuF75gKfpBCzKEsNeOGTtAt6XYDpP8c3ZKxeuvgsVLVD6NVtpb+Gxp65725EMHsMJR+UHXKUNjZ5Sgl8qSPCfjeqxZ2RmfRFcJ0derx3KLNvFT2zezeVVNC4Yho=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 02:05:16 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 02:05:16 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Philippe Schenker <philippe.schenker@toradex.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Stefan Agner <stefan.agner@toradex.com>
Subject: RE: USB difficulties with an iMX6ULL
Thread-Topic: USB difficulties with an iMX6ULL
Thread-Index: AQHWRX6bY1fYG3LvHU+Nxv9VFjLuK6jfLU+w
Date:   Fri, 19 Jun 2020 02:05:16 +0000
Message-ID: <AM7PR04MB715741EAEAE277594DC0DE3B8B980@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <87837d44165d71ecfb0ec22ec2dae6460cb0503c.camel@toradex.com>
In-Reply-To: <87837d44165d71ecfb0ec22ec2dae6460cb0503c.camel@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: toradex.com; dkim=none (message not signed)
 header.d=none;toradex.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [222.65.251.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3b5634f0-17cb-4f88-caea-08d813f53605
x-ms-traffictypediagnostic: AM7PR04MB7046:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AM7PR04MB7046399CF6E909963B2A563C8B980@AM7PR04MB7046.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tCPEDCfUS/R6Ms0Jex1V2UjzTXSexhyMg2GM+wnmzPIiNjf5rIPJlNJ/+WuyQpk0t4XidKjlZiNsPT/FWCFp4xxKmweUzibEVrJQ9llbBTgYZssQ5f+wx5Kz9nQnuNp314onTLUJt2veOSCSzm4kFX0UrfIJLDpcFekYVxVR/4ZrGmd8NnJvFjV0rllBTqR8wOCg+I9yzNgd0gTSX24AUOCHUfD1n+efFcXjkJrNFDJpuXCjHjSs2CocB1PGwal7T7HZx5QIRAMfi515xZsS2SfPt5wGG2z//OOYd5sV1nohU517A9bnLnDQzWUkGI8IFQqvN6D/djIQKSNRBLYtF1ix75dP19P/vZ4b2eo/I6Z539o0pPdWVviwaKbK9jxx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(478600001)(9686003)(76116006)(7696005)(66946007)(5660300002)(110136005)(66556008)(64756008)(6506007)(316002)(66476007)(66446008)(86362001)(52536014)(186003)(26005)(4326008)(8676002)(71200400001)(33656002)(2906002)(54906003)(8936002)(44832011)(55016002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: yvXLsehb4/clJwBima3QoRVnTOw46YAgW/88ftT3KEwi3F5svYPzu6BVJg65XiZCe9IdfQnSnfqQdP/ck6FTtNY+0rsvjrY5AJrcXT9uv658qG1ZpnmRnBv+MOWrzD7Js/b7ayqYfCySNxOqhllut4SVt7dRSvUFwgrIUl8BGyZzO/LF6F2Pch/1ql5pz8Vac05ELIv5qDHfjlx6nCddkjLXrhl7uyk4V3aAFK8cJGXG7qmkye3o/AuDeWpR+WImqgURzdjRDYDjUUCBa/zFJszw+6Y9gEB1AjJHkYLac/VHnFUXw/SW0KpifQVUdaQeJqIFZT9zh35XzLps2HQtWcghRXtGC5YoqKjQfP1cd4LmQmS1zOjOSbL6iWwndQUg0eHSHe5M+yUwmC9OvaxEsZN/uUgGXYwUBoERCcrTCRfh8JKIdTS2Xbx2ASPsiPNlkq21HOBP08+L8VPLZucbkE4FgJ/E+s6DccEP+CEnMuw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5634f0-17cb-4f88-caea-08d813f53605
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 02:05:16.6462
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wm1rsk7h/V/2gZ17hUI+wxdONybqks4Ms6XS9LhQQM3xr44GlRyXIZJ8ogpvWmMUkI/uhycTtlPkMCq6lmLPZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7046
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiANCj4gDQo+IDFzdCBwcm9ibGVtIC0gUk5ESVMNCj4gV2UgdHJ5IHRvIHVzZSBSTkRJUyBv
biBvbmUgb2YgdGhlIFVTQiBwb3J0cyB0aGUgQ29saWJyaSBpTVg2VUxMIGhhcy4gRm9yIHRoaXMN
Cj4gcHVycG9zZSBJJ20gdXNpbmcgdGhlIHVzYl9mX3JuZGlzLmtvIGtlcm5lbCBtb2R1bGUgYW5k
IHNldHRpbmcgZHJfbW9kZSBvZg0KPiAmdXNib3RnMSB0byAicGVyaXBoZXJhbCINCj4gVGhpcyB3
b3JrcyBmaW5lIG9uIGlNWDcgYnV0IGRvZXMgbm90IG9uIGlNWDZVTEwuIE9uIHRoZSBVTEwgYm9h
cmQgSSBjYW4gc2VlIGENCj4gImNpX2hkcmMuMCIgaW4gL3N5cy9jbGFzcy91ZGMgYWZ0ZXIgYm9v
dC4gSWYgSSBhZGQgbm93IGFuIFVTQiBHUElPIGV4dGNvbiB0byB1c2JvdGcNCj4gdGhpcyBjaGFu
Z2VzIHRvICJjaV9oZHJjLjEiIGFuZCBldmVyeXRoaW5nIHdvcmtzIGZpbmUgYWZ0ZXIgYm9vdCwg
YnV0IG5vdCBhZnRlcg0KPiB1bnBsdWdnaW5nIFVTQiBhbmQgcmVwbHVnZ2luZy4NCj4gVG8gc2V0
dXAgUk5ESVMgSSB1c2UgdGhlIGNvbW1hbmRzIFsxXSBJIHB1dCBhdCB0aGUgZW5kIG9mIHRoaXMg
ZW1haWwgZm9yIHJlZmVyZW5jZS4NCj4gDQoNCklmIHRoZSBib2FyZCBkZXNpZ25zIGZvciBVU0Ig
cGFydCBhcmUgdGhlIHNhbWUgYmV0d2VlbiBpTVg3IHZlcnNpb24gYW5kIGlNWDZVTEwgdmVyc2lv
biwNCmtlZXAgZHRzIGNvbnRlbnQgYXJlIHRoZSBzYW1lIGV4Y2VwdCBmb3IgdGhlIFVTQiBQSFkg
cG9ydCAoaW5jbHVkaW5nIHRoZSBwaGFuZGxlIGZvciBpdCksDQp0aGVzZSB0d28gU29DcyB1c2Vz
IHRoZSBkaWZmZXJlbnQgVVNCIFBIWS4gDQoNCklmIHRoZSBSTkRJUyBjb3VsZCB3b3JrIGF0IHRo
ZSBmaXJzdCB0aW1lLCBpdCBzZWVtcyB5b3VyIGNvbmZpZ2ZzIHNjcmlwdCBzaG91bGQgYmUgT0su
DQoNCj4gMm5kIHByb2JsZW0gLSBjb25zdGFudCByZXNldHRpbmcNCj4gV2hlbiBJIGNvbXBpbGUg
YSBwbGFpbiBtYWlubGluZSBrZXJuZWwgd2l0aCAiaW14X3Y2X3Y3X2RlZmNvbmZpZyIgYW5kIGJv
b3QgdGhlDQo+IGlNWDZVTEwgd2l0aCBpdCBJIHNlZSB0aGF0IHRoZSBVU0IgaXMgY29uc3RhbnRs
eSByZXNldHRpbmcgdGhlIGh1YiB0aGF0IGlzIHByZXNlbnQgb24NCj4gdGhlIENvbGlicmkgRXZh
bHVhdGlvbiBjYXJyaWVyIGJvYXJkLg0KPiANCj4gWyAgIDQ5LjY1NDYyMV0gdXNiIDEtMTogcmVz
ZXQgaGlnaC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciAyIHVzaW5nDQo+IGNpX2hkcmMNCj4gWyAg
IDUyLjE4MDc4MV0gdXNiIDEtMTogcmVzZXQgaGlnaC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciAy
IHVzaW5nDQo+IGNpX2hkcmMNCj4gWyAgIDU0LjY5OTY3OF0gdXNiIDEtMTogcmVzZXQgaGlnaC1z
cGVlZCBVU0IgZGV2aWNlIG51bWJlciAyIHVzaW5nDQo+IGNpX2hkcmMNCj4gDQoNClRyeSB0byBh
ZGQgZXh0ZXJuYWwgcG93ZXIgdG8gdGhlIFVTQiBIVUIgYXZvaWQgdGhlIGJvYXJkIGNhbid0IHN1
cHBseSBlbm91Z2ggcG93ZXIuDQpJZiBub3QsIHRyeSB0byBkaXNhYmxlIHJ1bnRpbWUgcG0sIGFu
ZCBzZWUgaWYgaXQgd29ya3MuDQoNCiA1OSBzdGF0aWMgY29uc3Qgc3RydWN0IGNpX2hkcmNfaW14
X3BsYXRmb3JtX2ZsYWcgaW14NnVsX3VzYl9kYXRhID0gew0KIDYwICAgICAgICAgLmZsYWdzID0g
Q0lfSERSQ19TVVBQT1JUU19SVU5USU1FX1BNIHwNCiA2MSAgICAgICAgICAgICAgICAgQ0lfSERS
Q19UVVJOX1ZCVVNfRUFSTFlfT04sDQogNjIgfTsNCiA2MyANCg0KPiANCj4gVGhpcyBsb29rcyB0
byBtZSBsaWtlIHNvbWV0aGluZyBpcyBzdGlsbCBub3QgcXVpdGUgcmlnaHQgZm9yIHRoZSB1c2Ut
IGNhc2Ugb2YgVUxMLiBJDQo+IGRvdWJ0IHRoYXQgb3VyIGhhcmR3YXJlIGlzIHRoZSBwcm9ibGVt
IGFzIHdlIG5ldmVyIGhhdmUgc2VlbiB0aG9zZSBwcm9ibGVtcw0KPiBkb3duc3RyZWFtLg0KDQpZ
b3UgbWVhbiB5b3VyIGhhcmR3YXJlIHNob3VsZCBiZSBOTyBwcm9ibGVtIGFzIHRoZSBkb3duc3Ry
ZWFtIGNvZGUgcnVucyBPSz8NCg0KUGV0ZXINCg0KIA0K
