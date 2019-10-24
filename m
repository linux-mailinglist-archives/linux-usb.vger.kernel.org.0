Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5B3E27FB
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 04:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436565AbfJXCKf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 22:10:35 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:58446 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2408092AbfJXCKf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 22:10:35 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E61CCC0264;
        Thu, 24 Oct 2019 02:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1571883034; bh=ZrCIuuE89bYm6Om1Tlmiet8sJrb3eAy5oWJdpVS79ro=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=QIwuKj4ixVDrTvFahjfh1oSqykDViiS8hyX+Jmp0Gba5pOqTwHfrsjIWnCtudg78V
         23bFDuiRf4BuLdN78u59M8ze/GrlVqmuUuc0ia2tAGw8v5bDeYzXZoWwhPaa3Bx0Ee
         dHCo4dGRX7xAjSwbPR4lOzuVyMqcYG24rA4zB7dp+WcGtQ4YK+BA4/OJUUCXnh1q9/
         LK47GI0I6klippBQgqNFiLbug//BVcPe7/iO4NbdrvQPYAjJ4/jaN/ic0ISFZIOqs6
         gDI4ePhVi01nZJAjlHV3jt/ZLYb+W7x9U+ya/iNADQSEaXySiKEiNZKSft/UJJXWsq
         LFzeLlQmOuvIQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 495DBA0069;
        Thu, 24 Oct 2019 02:10:33 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 23 Oct 2019 19:10:07 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 23 Oct 2019 19:09:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrRXp53AlawqAMxiDSAJK+r/OvzKE12WJ+X38sWM8Lp5Urr4I0TUeugWZGsrdgQYMFmE5jOJaOKvdajv19Gozm+kF5ukK8D8QbdxuvOBEOqRkODfwfIKAjk5m1ue/71IZBD+Vdn9GsOOHbD/L+b1cSZc+tu/Cfn7crCwAbULnFKk2w/s0EgeP7e0IWXQnquMK08g1b9EGEQe8aWY5F9JlzQUB+M1TwCJfc6wsW7tI2DTsjHUTUnY8N94V7TOdXJ32cfut22sTiJ8qJajFj+S0IDgcZ5BHhfeL3gTqutUND3+vpFjHBRWzgqk/3FDDZeJ04EnUTrBYWgCIgjLwFt+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrCIuuE89bYm6Om1Tlmiet8sJrb3eAy5oWJdpVS79ro=;
 b=lu1alRtcoBdApNA8KswePo3hDdjU6q1PkXfUGvG2ApGKWaH6vytq3hxnGMaPQyH/JmzDdH+cqjTLAGxs8AUGuDWmfxL5sTqLx5NG8MKL92qWHrVFkWMwhX9ktM2hCbwp23VxvAJ70iR9AEbVyIwxaz5+WO3F3MptcKFWUb8xH34y7D5tcrZWjWspA+M9ufFLyhBudYA3hMTMvT6ttUs1BZQrLPscRxa9K+vQJe8IZIhQQGS6OLe+Xz2su/qSvWj2ll0BylNZqiatqeS0z/H3vM36iuj9c8gpWwfUG1TP+Su0Prtr2kuX3FdR1C2i341p9rY40VboVJBmhVYM3ogS7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrCIuuE89bYm6Om1Tlmiet8sJrb3eAy5oWJdpVS79ro=;
 b=aXVPIdTNROtv1rQZJ3M7h6w9fy66qXgOqp4ULypdpxHV8OnxL9rVKtT7aT9OxtJforxSPBPRwZE9OX9OkrZ9K0vdmtcIdvJdFsRYO1HtJszY/lLEtMnL9yptMgr8Pzz8d9ePV3UerExIQu5qC9zBuOPxgP9u/zT3GgnyeG/qeTI=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB0087.namprd12.prod.outlook.com (10.172.77.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 24 Oct 2019 02:10:05 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::c816:e066:10f8:a6da]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::c816:e066:10f8:a6da%6]) with mapi id 15.20.2387.021; Thu, 24 Oct 2019
 02:10:04 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/4] usb: dwc3: gadget: Don't send unintended link state
 change
Thread-Topic: [PATCH 1/4] usb: dwc3: gadget: Don't send unintended link state
 change
Thread-Index: AQHViQxaC2UQw1d00kedTHfw2xTtuqdnwhIAgAFMIQA=
Date:   Thu, 24 Oct 2019 02:10:04 +0000
Message-ID: <b0a64a1f-f78e-4d96-06bc-abf0176f812c@synopsys.com>
References: <cover.1571770732.git.thinhn@synopsys.com>
 <c493e890dc8f02500fa1356353b5ab6c830b9cf1.1571770732.git.thinhn@synopsys.com>
 <87blu8j82n.fsf@gmail.com>
In-Reply-To: <87blu8j82n.fsf@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8ebaa0a-490b-4721-8d20-08d758274913
x-ms-traffictypediagnostic: CY4PR1201MB0087:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0087591C5A8342B5EDD568A4AA6A0@CY4PR1201MB0087.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 0200DDA8BE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(366004)(136003)(396003)(39860400002)(199004)(189003)(99286004)(2501003)(229853002)(305945005)(14454004)(316002)(7736002)(31686004)(2906002)(14444005)(256004)(8676002)(110136005)(25786009)(81156014)(81166006)(8936002)(3846002)(6116002)(71190400001)(71200400001)(64756008)(5660300002)(6246003)(76116006)(36756003)(66476007)(6506007)(66556008)(66066001)(446003)(11346002)(66946007)(86362001)(102836004)(478600001)(476003)(2616005)(76176011)(6436002)(66446008)(6486002)(107886003)(486006)(4326008)(6512007)(186003)(26005)(31696002);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB0087;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N8ldt5CroLUqGgX1dHmvBAoJ3INTVc+sD2XPpytfcpOheLeQWDv64qr+CJQvuZF/j9KHOO/xK8MkxwpM35yg7C3pdH1zK3KNCOChFIhFESvut2BHzBqwDM69imn5yNiRqcx8t0K76mpvr0chho9cYG0EyrQTsTJ+Cs56SQl64iYjKRFzj7AIAhw+kvuKHH3VAC8XzrBrkfMl+4G0YZUVFtI4YHW4u4L95cNpns9RqEaNUHy2JcDWW4sUnECExR/hZl9Wpz3at2tD9AXNOP7YwzcXeXTdZwY9kP5O7hXVs9GbD2Yqi/rlOjoPpevawwBPgfFwVxiJy/yO979wdqmfTkKnnJyvmgMElcPB4YVhVaAdFlGdg2O3H0FFQNREa6TbVA0G/k/Npg/AXIwBIY2EVTHgGpqwP163B4f5HBf9NSAjw1nY4dVF2//qcnk8+BOS
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EC9C11923FAF645B13929F55F199061@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ebaa0a-490b-4721-8d20-08d758274913
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 02:10:04.7092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2pX4cazcZYJNAwk482Ee6G1yUO5FmDb9km6nCKmeCpS2eHpRsRiTvc8OMqJlzHiRAZde5v8r9bPI8pYPjgQkTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0087
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkZlbGlwZSBCYWxiaSB3cm90ZToNCj4gVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5A
c3lub3BzeXMuY29tPiB3cml0ZXM6DQo+PiBEQ1RMLlVMU1RDSE5HUkVRIGlzIGEgd3JpdGUtb25s
eSBmaWVsZC4gV2hlbiBkb2luZyBhIHJlYWQtbW9kaWZ5LXdyaXRlDQo+PiB0byBEQ1RMLCB0aGUg
ZHJpdmVyIG11c3QgbWFrZSBzdXJlIHRoYXQgdGhlcmUncyBubyB1bmludGVuZGVkIGxpbmsgc3Rh
dGUNCj4+IGNoYW5nZSByZXF1ZXN0IGZyb20gd2hhdGV2ZXIgaXMgcmVhZCBmcm9tIERDVEwuVUxT
VENITkdSRVEuIFNldCBsaW5rDQo+PiBzdGF0ZSBjaGFuZ2UgdG8gbm8tYWN0aW9uIHdoZW4gdGhl
IGRyaXZlciB3cml0ZXMgdG8gRENUTC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaGluaCBOZ3V5
ZW4gPHRoaW5obkBzeW5vcHN5cy5jb20+DQo+IFdIQVQgQSBHUkVBVCBDQVRDSCEhISBIb3dldmVy
LCBsZXQncyBkbyBvbmUgc21hbGwgY2hhbmdlIGhlcmU6DQo+DQo+PiAtLS0NCj4+ICAgZHJpdmVy
cy91c2IvZHdjMy9nYWRnZXQuYyB8IDIxICsrKysrKysrKysrKysrKysrKysrKw0KPj4gICAxIGZp
bGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi9kd2MzL2dhZGdldC5jIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPj4gaW5kZXgg
ODZkYzFkYjc4OGE5Li4yNDE3OGI0YjlkNDYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3VzYi9k
d2MzL2dhZGdldC5jDQo+PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+PiBAQCAt
NTcsNiArNTcsOCBAQCBpbnQgZHdjM19nYWRnZXRfc2V0X3Rlc3RfbW9kZShzdHJ1Y3QgZHdjMyAq
ZHdjLCBpbnQgbW9kZSkNCj4+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4+ICAgCX0NCj4+ICAgDQo+
PiArCS8qIERvbid0IHNlbmQgbGluayBzdGF0ZSBjaGFuZ2UgcmVxdWVzdCAqLw0KPj4gKwlyZWcg
Jj0gfkRXQzNfRENUTF9VTFNUQ0hOR1JFUV9NQVNLOw0KPj4gICAJZHdjM193cml0ZWwoZHdjLT5y
ZWdzLCBEV0MzX0RDVEwsIHJlZyk7DQo+IExldCdzIGEgc21hbGwgbWFjcm8gb3IgYSBsaXR0bGUg
ZnVuY3Rpb24gdG8gd3JhcCB0aGlzLiBTb21ldGhpbmcNCj4gZHdjM19kY3RsX3dyaXRlX3NhZmUo
KSBvciBzb21ldGhpbmcgbG9uZyB0aG9zZSBsaW5lLg0KPg0KPiBUaGVuIHRoYXQgbWFjcm8vZnVu
Y3Rpb24gd2lsbCBtYWtlIHN1cmUgdG8gY2xlYXIgdGhvc2UgYml0cy4NCg0KU3VyZS4gSSdsbCBy
ZXNlbmQgd2l0aCB0aGUgY2hhbmdlLg0KDQpUaGFua3MsDQpUaGluaA0K
