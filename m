Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 385AE11D913
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 23:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731298AbfLLWLQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 17:11:16 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:59382 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731142AbfLLWLP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Dec 2019 17:11:15 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5D756422DE;
        Thu, 12 Dec 2019 22:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576188674; bh=njXsqLsIZ80mSl8dhIX9LxKtHrvNENg0lw2xa49zZpM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Wln5yIlR09xVuhxZEpCDcjI4TVTiD31a6i7sZVqyrdu0uQsRZvQbJ23C+c7LYnIKJ
         e0N3VbNymkKOqymfUUSWf2qc0ZMlI5TFcBX+/ADv4YYDVogyX9Rco3hFeBCeWPFMC4
         H0c9YPaUfLpylszXqUZwock1YnVJwygL9GY43W+kaJw/o1myQNsBcSn7mIILu+pVm7
         VIbeCCX8jv3J+XYzGERzKqu0zr7kTYUy9r24zF3rs/G4syyMzWXHU8HNxv94VZlSlC
         hQkQfzTXw+3RT0vaFPhTLVuPHTiFLKbF6YBAzNOIEjwKh3cPL/LSynwdjeQpQN9FMv
         CKuJxsM0cBWqQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6ACC1A0087;
        Thu, 12 Dec 2019 22:11:13 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 12 Dec 2019 14:10:06 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 12 Dec 2019 14:10:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7GMQBAxC0p90Z0cVCkBgmKOeT59GXkF87UpfagJ1rMFSAhikykK9ecyVHOLNFTRA9KjnjEEDEtzOBXGiU8coQmlsDFbw6VAfI4UdwQXQ91RQqv0RONY0QF0v4c4V/SZAzp1BxnEY6ZhuBNrqT8wP1Kt4SVBVXSWlKBWJPXeBIN9gmCdGP093W4Nm0gsUEun6zJgOMikExUvhgOQZmEaWU0hHytNeVthjkQ8GlerOrZ8F9qO7A3DVFlB3doo8yPsGypFHy+SYGKA3lOd+nVDcUdLJLMlMJBYp1MpKWP/GgpXBoW1LhK69RgcOB7ufBRh0aZq+DNQ5eRjM8R9RFZs4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njXsqLsIZ80mSl8dhIX9LxKtHrvNENg0lw2xa49zZpM=;
 b=ZCyWjgaHQztQFTst0W+0rGUQBEQEmaS6nEGFfsLqTUfUjitFHUjx1NHfHmyYRojdcFG0MI5FPLd8OVE9S4UuwwfotrKK5Dy/m1SgT6R4m3xyFyhqu296VzuHAKxJXnitslENihXDHx1oM6ueHGpvEy9vVMPRkCbRRYx0YevDowjkM6+iRG6prMJ8nDfOoZ1pihx6ELNG8KcIaoAz2JdrHKY/mIv64Kd9YiQeiwpnBPIb+uHZ3Nk6IwNGU/PlFdB4caLS0AFEdEghypa7pa930+eVlKZ+L9tOLCDkGIPMnQfYSLDD54JBOvDnnzsd8RcGnguXsp++NohwAezJEudT+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njXsqLsIZ80mSl8dhIX9LxKtHrvNENg0lw2xa49zZpM=;
 b=P5MZhsnPIDL0511iLme1x5VS5CP/mm/6DIO50L1r45imiwbvSC9lTEObKF+xf59170HKPBQ6uR0ULd6gf/K715s883vghI2adW1soVsjPDjt+RdKMJOZLpPXJtbSmRIss3xZlEg7aPLjsg1p+hrglP1mF1aBkF99l8JIfRq/2xc=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB2518.namprd12.prod.outlook.com (10.172.119.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Thu, 12 Dec 2019 22:10:05 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4%8]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 22:10:05 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Roger Quadros <rogerq@ti.com>, zhengbin <zhengbin13@huawei.com>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 02/14] usb: gadget: Add callback to set lane and
 transfer rate
Thread-Topic: [RFC PATCH 02/14] usb: gadget: Add callback to set lane and
 transfer rate
Thread-Index: AQHVsJbWCSjGFN0f8kOm0BRko8SBs6e2IrQAgADt7QA=
Date:   Thu, 12 Dec 2019 22:10:04 +0000
Message-ID: <40f63473-187a-e7ed-a931-d49c895120a6@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
 <25394a433bb79ddf36d0ec52bc998b164e373bf4.1576118671.git.thinhn@synopsys.com>
 <874ky6x9eh.fsf@kernel.org>
In-Reply-To: <874ky6x9eh.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e0f89af-46a9-478a-58b8-08d77f500ac1
x-ms-traffictypediagnostic: CY4PR1201MB2518:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB2518985E19C0E88981E8C12CAA550@CY4PR1201MB2518.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39860400002)(346002)(376002)(136003)(396003)(51914003)(189003)(199004)(36756003)(66556008)(64756008)(66446008)(478600001)(66476007)(8936002)(8676002)(81156014)(81166006)(71200400001)(6512007)(5660300002)(107886003)(2906002)(110136005)(316002)(4326008)(66946007)(31696002)(31686004)(186003)(26005)(76116006)(86362001)(6486002)(2616005)(6506007);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB2518;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ln9om2zjCQ2mfcCyaVdRvJDpQZCNPapA0gL0kGJxSEJ6GiLifFAflLgvYBqNhaeQo4d8mv5QLqMXEuq7i9zMfbFSD7tT45mXI9nFzpEAOAVUIBdKBFOkj6ty+kPdG9JBqrb+AqMnIvIuPX3ygsH6InieAu0//pF0vV+33I593cMuvBNZs/r1rP5BugPtRvcjFemeJ+f9sv7Sb7YvsDc233qAK6gV0Gq2OvP6iy3VwFHtbazfAaF0DEWOu00NrQLH+5nvbxVbnRZIZXEI3XQKO4dscGCnt4IuOFZnYVQVCysfwX3Lyd8EfbG36jMP2yg3LIqCpmBumFfiCBnfXshm/fLGF3kMeswZtcXfrZRWIzg8oAYIaiBxlawolGiJtcxgCrmd91AylOuvIWagBzU4Zf3UXkyQBjd20dDjwzkYLFknZZCTwNM4Ne776Hgn4vwuiGgKDIMZhQ5FirQIlonsmt2g0qJOlFQ2FaF/MRGkf/FOHzHOB8lNikkKTCTnwg9Z
Content-Type: text/plain; charset="utf-8"
Content-ID: <7559F2E40FE13A42B3521EB50B55FE61@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0f89af-46a9-478a-58b8-08d77f500ac1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 22:10:04.8470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: khXoRCGGzE9jGosGicJkUwt3SnzQbA2T54Fl6gXNfc3whwnpOrXwnLg4wWFvMVfXbJ8nc8j9JyngzMgUMJw5fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2518
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkZlbGlwZSBCYWxiaSB3cm90ZToNCj4gSGksDQo+DQo+IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4gSW50cm9kdWNlIGdhZGdldCBvcHRz
IHVkY19zZXRfc3VibGlua19zcGVlZCBjYWxsYmFjayB0byBzZXQgdGhlIGxhbmUNCj4+IGNvdW50
IGFuZCB0cmFuc2ZlciByYXRlIChpbiBsYW5lIHNwZWVkIG1hbnRpc3NhIG9mIEdicHMpIGZvciBT
dXBlclNwZWVkDQo+PiBQbHVzIGNhcGFibGUgZ2FkZ2V0cy4gSW4gdGhlIHNhbWUgd2F5IHVkY19z
ZXRfc3BlZWQsIHRoaXMgZnVuY3Rpb24gY2FuDQo+PiBjb250cm9sIHRoZSBnYWRnZXQncyBzdWJs
aW5rIGF0dHJpYnV0ZXMgZm9yIFN1cGVyU3BlZWQgUGx1cy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBUaGluaCBOZ3V5ZW4gPHRoaW5obkBzeW5vcHN5cy5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVy
cy91c2IvZ2FkZ2V0L2NvbXBvc2l0ZS5jICAgICAgICAgICB8ICAyICsrDQo+PiAgIGRyaXZlcnMv
dXNiL2dhZGdldC9sZWdhY3kvbWFzc19zdG9yYWdlLmMgfCAgMiArKw0KPiBJIHdvdWxkIHJhdGhl
ciBub3QgYWRkIG5ldyBmZWF0dXJlcyB0byB0aGUgbGVnYWN5IGdhZGdldHMgYW5kIGZvY3VzIG9u
DQo+IG91ciBjb25maWdmcyBpbnRlcmZhY2UgZm9yIGFueXRoaW5nIG5ldy4gTW9yZW92ZXIsIHVz
aW5nIHRoZSBmZWF0dXJlDQo+IHlvdSBpbnRyb2R1Y2VkIGNvdWxkLCBhcmd1YWJseSwgYmUgZG9u
ZSBhcyBhIHNlcGFyYXRlIHBhdGNoLg0KDQpTdXJlLiBJJ2xsIHJldmlzZSB0aGlzLg0KDQo+DQo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L2NvbXBvc2l0ZS5jIGIvZHJpdmVycy91
c2IvZ2FkZ2V0L2NvbXBvc2l0ZS5jDQo+PiBpbmRleCAzYjRmNjcwMDAzMTUuLmE0ZGU1YThjMGYx
OSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC9jb21wb3NpdGUuYw0KPj4gKysr
IGIvZHJpdmVycy91c2IvZ2FkZ2V0L2NvbXBvc2l0ZS5jDQo+PiBAQCAtMjM1Myw2ICsyMzUzLDgg
QEAgaW50IHVzYl9jb21wb3NpdGVfcHJvYmUoc3RydWN0IHVzYl9jb21wb3NpdGVfZHJpdmVyICpk
cml2ZXIpDQo+PiAgIAlnYWRnZXRfZHJpdmVyLT5mdW5jdGlvbiA9ICAoY2hhciAqKSBkcml2ZXIt
Pm5hbWU7DQo+PiAgIAlnYWRnZXRfZHJpdmVyLT5kcml2ZXIubmFtZSA9IGRyaXZlci0+bmFtZTsN
Cj4+ICAgCWdhZGdldF9kcml2ZXItPm1heF9zcGVlZCA9IGRyaXZlci0+bWF4X3NwZWVkOw0KPj4g
KwlnYWRnZXRfZHJpdmVyLT5tYXhfbGFuZV9jb3VudCA9IGRyaXZlci0+bWF4X2xhbmVfY291bnQ7
DQo+PiArCWdhZGdldF9kcml2ZXItPm1heF9sc20gPSBkcml2ZXItPm1heF9sc207DQo+PiAgIA0K
Pj4gICAJcmV0dXJuIHVzYl9nYWRnZXRfcHJvYmVfZHJpdmVyKGdhZGdldF9kcml2ZXIpOw0KPj4g
ICB9DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L2xlZ2FjeS9tYXNzX3N0b3Jh
Z2UuYyBiL2RyaXZlcnMvdXNiL2dhZGdldC9sZWdhY3kvbWFzc19zdG9yYWdlLmMNCj4+IGluZGV4
IGYxOGY3NzU4NGZjMi4uYTA5MTJjNWFmZmZjIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy91c2Iv
Z2FkZ2V0L2xlZ2FjeS9tYXNzX3N0b3JhZ2UuYw0KPj4gKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0
L2xlZ2FjeS9tYXNzX3N0b3JhZ2UuYw0KPj4gQEAgLTIyMyw2ICsyMjMsOCBAQCBzdGF0aWMgc3Ry
dWN0IHVzYl9jb21wb3NpdGVfZHJpdmVyIG1zZ19kcml2ZXIgPSB7DQo+PiAgIAkubmFtZQkJPSAi
Z19tYXNzX3N0b3JhZ2UiLA0KPj4gICAJLmRldgkJPSAmbXNnX2RldmljZV9kZXNjLA0KPj4gICAJ
Lm1heF9zcGVlZAk9IFVTQl9TUEVFRF9TVVBFUl9QTFVTLA0KPj4gKwkubWF4X2xhbmVfY291bnQJ
PSAyLA0KPj4gKwkubWF4X2xzbQk9IDEwLA0KPiBSaWdodCwgYXMgbWVudGlvbmVkLCBJJ2QgcHJl
ZmVyIG5vdCB0b3VjaCB0aGUgbGVnYWN5IGdhZGdldHMuIEJ1dCBpbiBhbnkNCj4gY2FzZSwgd2h5
IGlzIGl0IHNvIHRoYXQgdGhlIGdhZGdldCBpcyB0ZWxsaW5nIHlvdSBhYm91dCBtYXggbGFuZSBj
b3VudA0KPiBhbmQgbHNtPyBUaGF0IHNob3VsZCBiZSBhYnN0cmFjdGVkIGF3YXkgZnJvbSB0aGUg
Z2FkZ2V0IGRyaXZlci4gR2FkZ2V0DQo+IGRyaXZlciBzaG91bGRuJ3QgaGF2ZSBrbm93bGVkZ2Ug
b2YgbnVtYmVyIG9mIGxhbmVzIGJlY2F1c2UsIGF0IHRoZSBlbmQNCj4gb2YgdGhlIGRheSwgdGhh
dCBkb2Vzbid0IHJlYWxseSBjaGFuZ2UgYW55dGhpbmcgaW4gcHJhY3RpY2UuIFVubGlrZSBIUw0K
PiB2cyBTUyB3aGljaCBjaGFuZ2VzIGEgYnVuY2ggb2YgdGhpbmdzLg0KDQpPaywgdGhhdCBtYWtl
cyBzZW5zZS4gSSdsbCByZW1vdmUgdGhpcy4NCg0KPg0KPj4gICAJLm5lZWRzX3NlcmlhbAk9IDEs
DQo+PiAgIAkuc3RyaW5ncwk9IGRldl9zdHJpbmdzLA0KPj4gICAJLmJpbmQJCT0gbXNnX2JpbmQs
DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9jb3JlLmMgYi9kcml2ZXJz
L3VzYi9nYWRnZXQvdWRjL2NvcmUuYw0KPj4gaW5kZXggNTFmYTYxNGI0MDc5Li5hM2IxMDZhMjJh
NmUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2NvcmUuYw0KPj4gKysr
IGIvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9jb3JlLmMNCj4+IEBAIC0xMTIwLDYgKzExMjAsMzUg
QEAgc3RhdGljIGlubGluZSB2b2lkIHVzYl9nYWRnZXRfdWRjX3NldF9zcGVlZChzdHJ1Y3QgdXNi
X3VkYyAqdWRjLA0KPj4gICAJfQ0KPj4gICB9DQo+PiAgIA0KPj4gKy8qKg0KPj4gKyAqIHVzYl9n
YWRnZXRfdWRjX3NldF9zdWJsaW5rX2F0dHIgLSB0ZWxscyB1c2IgZGV2aWNlIGNvbnRyb2xsZXIg
dGhlIHN1YmxpbmsNCj4+ICsgKiAgICBhdHRyaWJ1dGVzIHN1cHBvcnRlZCBieSB0aGUgY3VycmVu
dCBkcml2ZXINCj4+ICsgKiBAdWRjOiBUaGUgZGV2aWNlIHdlIHdhbnQgdG8gc2V0IG1heGltdW0g
c3BlZWQNCj4+ICsgKiBAbGFuZV9jb3VudDogVGhlIG1heGltdW0gbnVtYmVyIG9mIGxhbmVzIHRv
IGNvbm5lY3QNCj4+ICsgKiBAbHNtOiBUaGUgbWF4aW11bSBsYW5lIHNwZWVkIG1hbnRpc3NhIGlu
IEdicHMgdG8gcnVuDQo+PiArICoNCj4+ICsgKiBJbiB0aGUgc2FtZSB3YXkgYXMgdXNiX2dhZGdl
dF91ZGNfc2V0X3NwZWVkKCksIHRoaXMgZnVuY3Rpb24gY2FuIHNldCB0aGUNCj4+ICsgKiBnYWRn
ZXQncyBzdWJsaW5rIGF0dHJpYnV0ZXMgZm9yIFN1cGVyU3BlZWQgUGx1cy4NCj4+ICsgKg0KPj4g
KyAqIFRoaXMgY2FsbCBpcyBpc3N1ZWQgYnkgdGhlIFVEQyBDbGFzcyBkcml2ZXIgYmVmb3JlIGNh
bGxpbmcNCj4+ICsgKiB1c2JfZ2FkZ2V0X3VkY19zdGFydCgpIGluIG9yZGVyIHRvIG1ha2Ugc3Vy
ZSB0aGF0IHdlIGRvbid0IHRyeSB0bw0KPj4gKyAqIGNvbm5lY3Qgb24gc3BlZWRzIHRoZSBnYWRn
ZXQgZHJpdmVyIGRvZXNuJ3Qgc3VwcG9ydC4NCj4+ICsgKi8NCj4+ICtzdGF0aWMgaW5saW5lIHZv
aWQgdXNiX2dhZGdldF91ZGNfc2V0X3N1YmxpbmtfYXR0cihzdHJ1Y3QgdXNiX3VkYyAqdWRjLA0K
Pj4gKwkJCQkJCSAgIHVuc2lnbmVkIGludCBsYW5lX2NvdW50LA0KPj4gKwkJCQkJCSAgIHVuc2ln
bmVkIGludCBsc20pDQo+IGRvIHdlIGVudmlzaW9uIGEgcG9zc2liaWxpdHkgb2YgZnV0dXJlIFVT
QiBzcGVjIHJlbGVhc2VzIGFkZGluZyBtb3JlDQo+IGRhdGEgaGVyZT8gSG93IGFib3V0IGludHJv
ZHVjaW5nIGEgc3RydWN0IHVzYl9zdWJsaW5rX2F0dHIgdG8gYmUgcGFzc2VkDQo+IGFyb3VuZD8g
Q291bGQgYmUgdXNlZCBieSBib3RoIGhvc3QgYW5kIGdhZGdldCBzdGFja3MuDQoNCkdvb2QgaWRl
YS4gVGhhdCdkIGJlIG11Y2ggYmV0dGVyLiBUaGFua3MuDQoNCj4NCj4+ICt7DQo+PiArCWlmICh1
ZGMtPmdhZGdldC0+b3BzLT51ZGNfc2V0X3N1YmxpbmtfYXR0cikgew0KPj4gKwkJdW5zaWduZWQg
aW50IHJhdGU7DQo+PiArCQl1bnNpZ25lZCBpbnQgbGFuZXM7DQo+PiArDQo+PiArCQlyYXRlID0g
bWluKGxzbSwgdWRjLT5nYWRnZXQtPm1heF9sc20pOw0KPj4gKwkJbGFuZXMgPSBtaW4obGFuZV9j
b3VudCwgdWRjLT5nYWRnZXQtPm1heF9sYW5lX2NvdW50KTsNCj4gY29uc2lkZXJpbmcgdGhhdCBs
c20gYW5kIGxhbmVfY291bnQgYXJlIGZyb20gMCB0byB0aGVpciByZXNwZWN0aXZlIG1heA0KPiB2
YWx1ZXMsIGRvIHlvdSBuZWVkIGEgbWluKCkgaGVyZT8gTWlnaHQgYmUgYmV0dGVyIHRvIFdBUk4o
KSB3aGVuIGVpdGhlcg0KPiBpbiBvdmVyIHRoZWlyIG1heCB2YWx1ZXMuDQoNClN1cmUuIFRoYXQn
ZCBiZSBiZXR0ZXIuDQoNCj4NCj4+ICsJCXVkYy0+Z2FkZ2V0LT5vcHMtPnVkY19zZXRfc3VibGlu
a19hdHRyKHVkYy0+Z2FkZ2V0LA0KPj4gKwkJCQkJCSAgICAgICBsYW5lcywgcmF0ZSk7DQo+IGlu
ZGVudGF0aW9uIHVzaW5nIHNwYWNlcz8gKHNhbWUgYWJvdmUsIHBsZWFzZSBmaXgpDQoNCkl0J3Mg
Ym90aCB0YWIgYW5kIHNwYWNlcyB0byBhbGlnbiB0byBuZXh0IHRvIHRoZSBhYm92ZSBvcGVuIHBh
cmVudGhlc2VzLiANCkl0J3MgYmFzZWQgb24gY2hlY2twYXRjaC4NCg0KPg0KPj4gQEAgLTEzNTMs
NyArMTM4MiwxNCBAQCBzdGF0aWMgaW50IHVkY19iaW5kX3RvX2RyaXZlcihzdHJ1Y3QgdXNiX3Vk
YyAqdWRjLCBzdHJ1Y3QgdXNiX2dhZGdldF9kcml2ZXIgKmRyaQ0KPj4gICAJdWRjLT5kZXYuZHJp
dmVyID0gJmRyaXZlci0+ZHJpdmVyOw0KPj4gICAJdWRjLT5nYWRnZXQtPmRldi5kcml2ZXIgPSAm
ZHJpdmVyLT5kcml2ZXI7DQo+PiAgIA0KPj4gLQl1c2JfZ2FkZ2V0X3VkY19zZXRfc3BlZWQodWRj
LCBkcml2ZXItPm1heF9zcGVlZCk7DQo+PiArCWlmICh1ZGMtPmdhZGdldC0+b3BzLT51ZGNfc2V0
X3N1YmxpbmtfYXR0ciAmJg0KPj4gKwkgICAgdWRjLT5nYWRnZXQtPm1heF9zcGVlZCA9PSBVU0Jf
U1BFRURfU1VQRVJfUExVUyAmJg0KPj4gKwkgICAgZHJpdmVyLT5tYXhfbHNtICYmIGRyaXZlci0+
bWF4X2xhbmVfY291bnQgJiYNCj4+ICsJICAgIGRyaXZlci0+bWF4X3NwZWVkID09IFVTQl9TUEVF
RF9TVVBFUl9QTFVTKQ0KPiBTbyBpZiBkcml2ZXIgZG9lc24ndCBwcm92aWRlIG1heF9sc20gYW5k
IG1heF9zcGVlZCB5b3UgZG9uJ3Qgc2V0IHN1YmxpbmsNCj4gYXR0cj8gV29uJ3QgdGhpcyBjYXVz
ZSBwcm9ibGVtcz8gQWxzbywgdGhlIHN1YmxpbmtfYXR0ciBpcyBzdGlsbCwNCj4gY29uY2VwdHVh
bGx5LCBzZXR0aW5nIHRoZSBtYXggc3BlZWQgZm9yIHRoZSBidXMsIHJpZ2h0PyBTbyB5b3UgbWF5
IHdhbnQNCj4gdG8gY2FsbCB1c2JfZ2FkZ2V0X3VkY19zZXRfc3VibGlua19hdHRyKCkgZnJvbSBp
bnNpZGUNCj4gdXNiX2dhZGdldF91ZGNfc2V0X3NwZWVkKCksIHRoZW4gd2UgZG9uJ3QgbmVlZCB0
byBtb2RpZnkgYWxsIHRoZSBjYWxsZXJzLg0KPg0KDQpUaGUgaWRlYSB3YXMgdGhhdCBpZiB0aGUg
ZHJpdmVyIGRvZXNuJ3QgcHJvdmlkZSBtYXhfbHNtIGFuZCBtYXhfc3BlZWQsIA0KdGhlbiBpdCdz
IG5vdCBjb25zdHJhaW5lZCBieSB0aGUgbnVtYmVyIG9mIGxhbmVzIG9yIGxzbS4gSXQgd2lsbCAN
CmZhbGxiYWNrIHRvIHRoZSB1c2JfZ2FkZ2V0X3VkY19zZXRfc3BlZWQoKS4NCg0KSSBkaWRuJ3Qg
dGhpbmsgYWJvdXQgY3JlYXRpbmcgYSBuZXcgdXNiX3N1YmxpbmtfYXR0ciBzdHJ1Y3R1cmUsIHNv
IEkgDQpjb3VsZG4ndCB1c2UgdXNiX2dhZGdldF91ZGNfc2V0X3N1YmxpbmtfYXR0cigpIGluc2lk
ZSANCnVzYl9nYWRnZXRfdWRjX3NldF9zcGVlZCgpIGJlZm9yZS4NCg0KVGhhbmtzIGZvciB0aGUg
cmV2aWV3IQ0KDQpUaGluaA0KDQo=
