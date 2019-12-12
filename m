Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAD7911D963
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 23:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730943AbfLLWdc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 17:33:32 -0500
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:57546 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730799AbfLLWdc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Dec 2019 17:33:32 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4BA3FC00F4;
        Thu, 12 Dec 2019 22:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576190010; bh=aRMWhL5ttGk2WFGtZ5aHyKh/POBRIip5FrR5HtNTjkE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Junh22/ANaGtQbLbE8v7ZJlCBlVS0Tve1jL4kfYQo1bGkIFF3CQcLb+j4mz4G/p1x
         T0zJ7YZXxRizxFlI/bjqf7XUSpRapaCTr+ESVO8UVRGTcG5ZtjfIp900hYo4dS980P
         /qdEvTL72T4RWkptrCycsSbKBk5LCZ+Ovh20PUbFvxDJh95Z6/Y27S5x36GHs4o+WX
         t1lWxsTzPicjv6TiGMRti9Z3OiKdIn91Z31uaKb5jZOcu1Y6eFwHqoklGV07N2XN83
         9pWVZoWxcUI6Yu1NFdNwGEqW1xGLSk/YG5TQ+mngYB4nK8qZc2AW4PxTLEX+vS+7q2
         XZpnxx0C6FvLw==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 65C43A0087;
        Thu, 12 Dec 2019 22:33:29 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 12 Dec 2019 14:33:16 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 12 Dec 2019 14:33:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hn5XgKm5NX2YftcN6LLhWT468G1UTkJ6Hmj0NiWg9xvPWBNUlJHwl2gRuyWt3EBQMwIXnoktsF9o7DUivbreXCYgxlprMpAnboslZG0HMpcrLEiNiiMr6iSL7mttFs32b6gp8PMtOgYzWNf56CNjlCPO77zoc2yJn3/ofVqKgaX5QMaQoiSjHwp5dhoW81CrXDHK4VbdwVxwrbeusKpnLf9jRfRKLsHW08MS0/CDDsVbgumep7hgGpeAs6DBk91968QRkiRMe5pPDKb9k5lzSRcBD1O+iot9sjGwHwYG1xP4C4EKyzaYqNFS/uVzwDRXoqP7w4UlODnTjl+edBXazw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRMWhL5ttGk2WFGtZ5aHyKh/POBRIip5FrR5HtNTjkE=;
 b=f7dxHa6bNJcWn0yWe2WfBf2MiJkksNfYhpIh9PI4u6us0I3fXDdSgNymAPaBcX5zoAoOYZpUg2t0FT2JTV6uvceARlYfZitGGccS4QifRMnWmTI7Ig0V9cdwZbLXiGtBMHWsbDtTaRtffG8M4yNigKiXs+sNx0gOdxJl2y4T17XwfarZHdDhkUUHxz3sVHJ7GcKKyrzrr9GMqVO4628R7xRaJqHY7vel2Sn11QQMdLEtS3cUxQMbX3UsPx49WNfpyrtwuQjf4i0gmgEw8qnNKhjfGmNARSliHoXZk8RcbANuNRDnjGwhubMQStHE+fxxrPEvTwzuZ7Ai2xdwY+mVWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRMWhL5ttGk2WFGtZ5aHyKh/POBRIip5FrR5HtNTjkE=;
 b=NPCJL+Ru+pOiXJ5BeEkFZZI7oX1CvCdDmKccGpo3feYv8vWwRbcODPiXNPWdQHdqZ2qlPcfHao2ZxlisRuYtjrpxbJdV97FI+VQTbUjBAwEJe9afihKHE98h4joOF9vaLxbBFSddZCfpH+FMVOH+DHg5wMVDby7jtiaGtFCeUvI=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB0184.namprd12.prod.outlook.com (10.172.78.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Thu, 12 Dec 2019 22:33:14 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4%8]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 22:33:14 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Roger Quadros <rogerq@ti.com>,
        zhengbin <zhengbin13@huawei.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 02/14] usb: gadget: Add callback to set lane and
 transfer rate
Thread-Topic: [RFC PATCH 02/14] usb: gadget: Add callback to set lane and
 transfer rate
Thread-Index: AQHVsJbWCSjGFN0f8kOm0BRko8SBs6e2IrQAgACDpQCAAHDBAA==
Date:   Thu, 12 Dec 2019 22:33:14 +0000
Message-ID: <f315858e-4a47-aeaa-1976-577ff781bf0e@synopsys.com>
References: <Pine.LNX.4.44L0.1912121047120.14053-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1912121047120.14053-100000@netrider.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c40de60-1779-4f77-22a2-08d77f534730
x-ms-traffictypediagnostic: CY4PR1201MB0184:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB01846E5D7A856A403B8288A3AA550@CY4PR1201MB0184.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(136003)(346002)(39860400002)(376002)(199004)(189003)(4326008)(186003)(76116006)(8936002)(66946007)(26005)(5660300002)(107886003)(36756003)(66446008)(31696002)(8676002)(81156014)(81166006)(2616005)(71200400001)(31686004)(2906002)(64756008)(478600001)(6512007)(54906003)(6486002)(316002)(110136005)(66476007)(6506007)(66556008)(86362001);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB0184;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gfgcRjtIrrcaVHaalj9AxKZvZetlnjRW5Z0j4676FGwchf1LiSOSCfjEklPt//MaCrIGQQT37grp3B0mhxjdpM3vQ2vRHLe3t6qwaY3k85MPciu8NVgKBc3aFZLodC3PjfgXurFV0ifsUlT4SQq69Xm29mQZhAvL/3vSdeR4vKqgFrePHUeWnCQYOxKWkrnaqGTOw6j3/bPJZnzbUst2UcuzEpFyuT1RTjyIUHZwse0LxBv3nP84oy1TG7fTmLb153UIlh4K2/i3Gr1ZHi0XrjVAGqA8KjWTOQN7W6vM2bAYh7oTrBwXPR4Pm7O2ysGXi/AKEysjOX5HC1ymWyfxpYHls135ueE4a3Ki7cnsqLD+Dp+o5nPi3KkzowG5S7BOR/c3UIPMXeg7JGgeYJznRb0kLtD0pveqK4WwQIBlwM3lr2fCjJEMPRMu1QogNLy5
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B45088B1DE289449BB658A814BAE249@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c40de60-1779-4f77-22a2-08d77f534730
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 22:33:14.8235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T8Rn2XEDoRN4VWKscRh5soxZVdpPVtkfP0qrAsfUeNUOD3qkuZMORCs+QlLub2+nREpvrtVy+ilvzDQ2Fg7rnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0184
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIFRodSwgMTIgRGVjIDIwMTksIEZlbGlwZSBC
YWxiaSB3cm90ZToNCj4NCj4+IEhpLA0KPj4NCj4+IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVu
QHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4+IEludHJvZHVjZSBnYWRnZXQgb3B0cyB1ZGNfc2V0
X3N1Ymxpbmtfc3BlZWQgY2FsbGJhY2sgdG8gc2V0IHRoZSBsYW5lDQo+Pj4gY291bnQgYW5kIHRy
YW5zZmVyIHJhdGUgKGluIGxhbmUgc3BlZWQgbWFudGlzc2Egb2YgR2JwcykgZm9yIFN1cGVyU3Bl
ZWQNCj4+PiBQbHVzIGNhcGFibGUgZ2FkZ2V0cy4gSW4gdGhlIHNhbWUgd2F5IHVkY19zZXRfc3Bl
ZWQsIHRoaXMgZnVuY3Rpb24gY2FuDQo+Pj4gY29udHJvbCB0aGUgZ2FkZ2V0J3Mgc3VibGluayBh
dHRyaWJ1dGVzIGZvciBTdXBlclNwZWVkIFBsdXMuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBU
aGluaCBOZ3V5ZW4gPHRoaW5obkBzeW5vcHN5cy5jb20+DQo+Pj4gLS0tDQo+Pj4gICBkcml2ZXJz
L3VzYi9nYWRnZXQvY29tcG9zaXRlLmMgICAgICAgICAgIHwgIDIgKysNCj4+PiAgIGRyaXZlcnMv
dXNiL2dhZGdldC9sZWdhY3kvbWFzc19zdG9yYWdlLmMgfCAgMiArKw0KPj4gSSB3b3VsZCByYXRo
ZXIgbm90IGFkZCBuZXcgZmVhdHVyZXMgdG8gdGhlIGxlZ2FjeSBnYWRnZXRzIGFuZCBmb2N1cyBv
bg0KPj4gb3VyIGNvbmZpZ2ZzIGludGVyZmFjZSBmb3IgYW55dGhpbmcgbmV3LiBNb3Jlb3Zlciwg
dXNpbmcgdGhlIGZlYXR1cmUNCj4+IHlvdSBpbnRyb2R1Y2VkIGNvdWxkLCBhcmd1YWJseSwgYmUg
ZG9uZSBhcyBhIHNlcGFyYXRlIHBhdGNoLg0KPj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvZ2FkZ2V0L2NvbXBvc2l0ZS5jIGIvZHJpdmVycy91c2IvZ2FkZ2V0L2NvbXBvc2l0ZS5jDQo+
Pj4gaW5kZXggM2I0ZjY3MDAwMzE1Li5hNGRlNWE4YzBmMTkgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJp
dmVycy91c2IvZ2FkZ2V0L2NvbXBvc2l0ZS5jDQo+Pj4gKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0
L2NvbXBvc2l0ZS5jDQo+Pj4gQEAgLTIzNTMsNiArMjM1Myw4IEBAIGludCB1c2JfY29tcG9zaXRl
X3Byb2JlKHN0cnVjdCB1c2JfY29tcG9zaXRlX2RyaXZlciAqZHJpdmVyKQ0KPj4+ICAgCWdhZGdl
dF9kcml2ZXItPmZ1bmN0aW9uID0gIChjaGFyICopIGRyaXZlci0+bmFtZTsNCj4+PiAgIAlnYWRn
ZXRfZHJpdmVyLT5kcml2ZXIubmFtZSA9IGRyaXZlci0+bmFtZTsNCj4+PiAgIAlnYWRnZXRfZHJp
dmVyLT5tYXhfc3BlZWQgPSBkcml2ZXItPm1heF9zcGVlZDsNCj4+PiArCWdhZGdldF9kcml2ZXIt
Pm1heF9sYW5lX2NvdW50ID0gZHJpdmVyLT5tYXhfbGFuZV9jb3VudDsNCj4+PiArCWdhZGdldF9k
cml2ZXItPm1heF9sc20gPSBkcml2ZXItPm1heF9sc207DQo+Pj4gICANCj4+PiAgIAlyZXR1cm4g
dXNiX2dhZGdldF9wcm9iZV9kcml2ZXIoZ2FkZ2V0X2RyaXZlcik7DQo+Pj4gICB9DQo+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC9sZWdhY3kvbWFzc19zdG9yYWdlLmMgYi9kcml2
ZXJzL3VzYi9nYWRnZXQvbGVnYWN5L21hc3Nfc3RvcmFnZS5jDQo+Pj4gaW5kZXggZjE4Zjc3NTg0
ZmMyLi5hMDkxMmM1YWZmZmMgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L2xl
Z2FjeS9tYXNzX3N0b3JhZ2UuYw0KPj4+ICsrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC9sZWdhY3kv
bWFzc19zdG9yYWdlLmMNCj4+PiBAQCAtMjIzLDYgKzIyMyw4IEBAIHN0YXRpYyBzdHJ1Y3QgdXNi
X2NvbXBvc2l0ZV9kcml2ZXIgbXNnX2RyaXZlciA9IHsNCj4+PiAgIAkubmFtZQkJPSAiZ19tYXNz
X3N0b3JhZ2UiLA0KPj4+ICAgCS5kZXYJCT0gJm1zZ19kZXZpY2VfZGVzYywNCj4+PiAgIAkubWF4
X3NwZWVkCT0gVVNCX1NQRUVEX1NVUEVSX1BMVVMsDQo+Pj4gKwkubWF4X2xhbmVfY291bnQJPSAy
LA0KPj4+ICsJLm1heF9sc20JPSAxMCwNCj4+IFJpZ2h0LCBhcyBtZW50aW9uZWQsIEknZCBwcmVm
ZXIgbm90IHRvdWNoIHRoZSBsZWdhY3kgZ2FkZ2V0cy4gQnV0IGluIGFueQ0KPj4gY2FzZSwgd2h5
IGlzIGl0IHNvIHRoYXQgdGhlIGdhZGdldCBpcyB0ZWxsaW5nIHlvdSBhYm91dCBtYXggbGFuZSBj
b3VudA0KPj4gYW5kIGxzbT8gVGhhdCBzaG91bGQgYmUgYWJzdHJhY3RlZCBhd2F5IGZyb20gdGhl
IGdhZGdldCBkcml2ZXIuIEdhZGdldA0KPj4gZHJpdmVyIHNob3VsZG4ndCBoYXZlIGtub3dsZWRn
ZSBvZiBudW1iZXIgb2YgbGFuZXMgYmVjYXVzZSwgYXQgdGhlIGVuZA0KPj4gb2YgdGhlIGRheSwg
dGhhdCBkb2Vzbid0IHJlYWxseSBjaGFuZ2UgYW55dGhpbmcgaW4gcHJhY3RpY2UuIFVubGlrZSBI
Uw0KPj4gdnMgU1Mgd2hpY2ggY2hhbmdlcyBhIGJ1bmNoIG9mIHRoaW5ncy4NCj4gSSBhZ3JlZSBj
b21wbGV0ZWx5LiAgRnVydGhlcm1vcmUsIGl0IGlzbid0IGF0IGFsbCBjbGVhciB3aGVyZSB0aG9z
ZSB0d28NCj4gbnVtYmVycyBjYW1lIGZyb20uICBXaHkgd291bGQgZy1tYXNzLXN0b3JhZ2UgY2Fy
ZSB0aGF0IGxhbmVfY291bnQgPD0gMg0KPiBhbmQgbHNtIDw9IDEwPw0KPg0KPiBBbGFuIFN0ZXJu
DQo+DQoNClJpZ2h0LCBJJ2xsIHJlbW92ZSB0aGlzIGFuZCB1cGRhdGUgYWNjb3JkaW5nIHRvIEZl
bGlwZSdzIHN1Z2dlc3Rpb25zLg0KDQpUaGFua3MsDQpUaGluaA0KDQo=
