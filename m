Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2965E224670
	for <lists+linux-usb@lfdr.de>; Sat, 18 Jul 2020 00:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgGQWml (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jul 2020 18:42:41 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:39088 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726204AbgGQWmk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jul 2020 18:42:40 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A80CBC00AF;
        Fri, 17 Jul 2020 22:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595025759; bh=Taj5NMrRVKvzpI+LmvC18QcKXVpepNQ85qvH1T4HEjY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Fm3K44IlxKIBc5EJ8pyXm2oRPA4TvWd1m5ZOLOoMDQ4izUVLwLbpMm0TCBFrjMOLu
         XkwlzFiG/Jleq0M9LADAeXu4QQaXPJ2ws0HvrHpWK9pxHfyFb2orxcuXNflBcpGp0a
         82V8mP/nozLCsaEvz9LDd/DWv/PRSvP/fPfNLA/ZzKBkTryXrQeh9r4eSzes5YX2my
         pfhPmCPKbwfbNRi422Nw8T0csy2MBk8Dx0LvVujsD4RyS5R2fL/kHH6sgKjWY/XlGD
         54qsOVsN/5iuRRjPrpVjM62q4dESE+2AacDZ926xpXxYlZ0QO5cUWEcTkPZ5kz9kpM
         ufmrNDe6pJxYg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id ADA60A005A;
        Fri, 17 Jul 2020 22:42:37 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id DDBB340046;
        Fri, 17 Jul 2020 22:42:35 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="o3qyOSKf";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTo+JQLCQs0xQQf+rcOsVIQTkDAitcbP/iWqBYIVbrmGSq4EvEzvpEEnqc6eBTmfT6B3XPtiu2gxX6i3umdeYj+LIAZU6RxauRuZMFAGv13tJ+jc9jXtbu6R1L5dhXp5PcFXXOfLyu+LqsLpLp3VRgt3fevNPPElVnIaBaVn8K3q/qJoq2UQZ6wDyVVT8ZXiKZpDgIR/2VmGbTsuX/Qk9y/uJJ8gBtaKVbj3/ICWl1FDd+j2b7wEMboEsmyt4ewFd39YrTrEO8Lj44pZimq7TWbCfFGbrp2nqpidvqOjQX7Uj1x5DEjmsGALlcB3CYzuUKqYPAka9TVnne8yHxqr3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Taj5NMrRVKvzpI+LmvC18QcKXVpepNQ85qvH1T4HEjY=;
 b=jvVw/2b7i1JZYrV/KtZpCmuKCNmxiuO/OXQ8C7hd9HC7NVee340F9KDWHuTRPkNzZWWkTnTTzlTPfSXdtgkM1LAIk0+GiWMK1Z6cQgLpq2cQTIxBCGWW9+qOC7KlWwb0/sMYKpozT3mEK4szL7PW+hepSwNQFJEh0v2D0hLtbRyG/UgZ2fgKgqbjVg1N1QwSsgHsagru4lRU4xgLNJu/J2OPoLkQ6ouatXORtNI5L2SRTwQJsfSM59DpZ+lvy9ATOOSEjlSy7LahBGeU5CekaE2ZhDuflc7uxGlg9jrQL2VZ/8uJg0Y4bGikcKDjwjKiwlWDRAesneRE4vMa4MdCSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Taj5NMrRVKvzpI+LmvC18QcKXVpepNQ85qvH1T4HEjY=;
 b=o3qyOSKfdFc3d+8PcMXCKY7qtOT6vNY6Nph7cA2JB32aS71HVGk94Oe1ARGpnBmV47ZaNNiSehALxUSUy07A7BMYIbFa7413v0OgOkeurq0K+wDnpSE7nIlHPKbnxbYlkX/8pYLS3SOygDh4dEaTn4NyNvaOww8PXjrL4uPD+Z0=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB3891.namprd12.prod.outlook.com (2603:10b6:a03:1a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Fri, 17 Jul
 2020 22:42:34 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3195.022; Fri, 17 Jul 2020
 22:42:34 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 01/11] usb: ch9: Add sublink speed struct
Thread-Topic: [PATCH 01/11] usb: ch9: Add sublink speed struct
Thread-Index: AQHWW7xD0Vg483QXNUGm0Me/HENawqkLdfwAgADpqoA=
Date:   Fri, 17 Jul 2020 22:42:33 +0000
Message-ID: <55f98f59-c65d-87b6-a017-95e80303ed34@synopsys.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
 <90961eec3e1ed3c27e41e7169353cc295c551604.1594935978.git.thinhn@synopsys.com>
 <ce783c83-84d5-5c2c-5619-39384147fed0@gmail.com>
In-Reply-To: <ce783c83-84d5-5c2c-5619-39384147fed0@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b590529-f773-448d-7755-08d82aa2b282
x-ms-traffictypediagnostic: BY5PR12MB3891:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB389153D40F92F62DDAD663E1AA7C0@BY5PR12MB3891.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V4q5Q8DFWug+BlkIb5ZFyznzhBkwWR1QAoQYwbeli/vWr3QJdkdLd+aFPrIyAsD+3M2C3VS0xsuKZ6+wE7qsuYGc/Kdt6xbSvNVYqf5UXXkLIfRvxmiIaNaNIx7gwoXGSHF6q48oOSJKYY7xTCgDrMS4A9F699I5jL3zGd7Dg1SZsCPvFD5BKfpgUCE+twMRMovq8spaXBcZiKjjI9J8dnQV0QPuEvL3EDrBNan6qJVQmmZcczI3iLmZjgvq1sbiKcJzVn5mdnaR87kMhsgYawimY1mol3ZfjuIm4jo9rzvxw/sxUmeLMG5VZxlMn3toERWAxxZRQVvKef5JvvKLxa1SNLYX/FZ3xFiI4EM2+08OQTcQVviWpdMiBjdDsfKZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(376002)(396003)(136003)(39860400002)(71200400001)(5660300002)(86362001)(31696002)(6512007)(36756003)(8676002)(6486002)(107886003)(66946007)(76116006)(66446008)(66556008)(64756008)(4326008)(26005)(66476007)(2906002)(478600001)(53546011)(186003)(6506007)(8936002)(316002)(110136005)(31686004)(2616005)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: SvzBPPD7KFxExg94aoStGmohnN3OeWKFu0enW4XciVKDminRIfpucydEw43yZKt6gAKAXDXMeogA2QLad/qjjFKodJPna+2IJqnoA7EiO7UEk5pbVOgHmmDVCqryBBEJsjN7GUmF98ZoUfUHrWEEWXKjAFHqUs/Bkf9u+x22cSM/mUzIH4u3ff33qgTpoXNhEyKCvz6QzWLJVWgaIjL8dw9PTgIrxVTQrHX+xn24voK1i+YI7kIut+kvu+3vr1tuhFpq0JOaE9EEv1ogmxCAjTOPk56e9+W/tEuxU5TAiYqkZ3sLWQnojK9acy6A6I26HzazWJOq2zJd1Mt3mRZe41nmLXCVbirrwlNeaMdKH4PETYFmUmG8c+pC5izkfdvT5eDjzA2+jgRssXPBnUM+or4zCtu5BFoicdAb5yAhLqHvdWWNg4tMdGxPju5OXqxtZ+WAkyCVoAe5P+VjlEI3cThDzp9kAvEJ0VGwkK+I5B4=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBA17663581B1240BD7BC893793FD6D5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b590529-f773-448d-7755-08d82aa2b282
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 22:42:33.9888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w753GvvoPi8bLdd9LUNBgX6wGvNJyZhAPWIMAnycFLjW1jWBc/HU1oQVyV4H99Zyx5oiCjVjMjkQqGjKJi3mOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3891
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

U2VyZ2VpIFNodHlseW92IHdyb3RlOg0KPiBIZWxsbyENCj4NCj4gT24gMTcuMDcuMjAyMCAwOjU4
LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+DQo+PiBVU0IgMy4yIHNwZWNpZmljYXRpb24gc3VwcG9y
dHMgZHVhbC1sYW5lIGZvciBzdXBlci1zcGVlZC1wbHVzLiBVU0INCj4+IGRldmljZXMgbWF5IG9w
ZXJhdGUgYXQgZGlmZmVyZW50IHN1Ymxpbmsgc3BlZWRzLiBUbyBhdm9pZCB1c2luZyBtYWdpYw0K
Pj4gbnVtYmVycyBhbmQgY2FwdHVyZSB0aGUgc3VibGluayBzcGVlZCBiZXR0ZXIsIGludHJvZHVj
ZSB0aGUNCj4+IHVzYl9zdWJsaW5rX3NwZWVkIHN0cnVjdHVyZSBhbmQgdmFyaW91cyBzdWJsaW5r
IHNwZWVkIGF0dHJpYnV0ZSBlbnVtLg0KPj4NCj4+IFNlZSBTU1AgQk9TIGRlc2NyaXB0b3IgaW4g
VVNCIDMuMiBzcGVjaWZpY2F0aW9uIHNlY3Rpb24gOS42LjIuNQ0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IFRoaW5oIE5ndXllbiA8dGhpbmhuQHN5bm9wc3lzLmNvbT4NCj4+IC0tLQ0KPj4gwqAgaW5j
bHVkZS91YXBpL2xpbnV4L3VzYi9jaDkuaCB8IDQyIA0KPj4gKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9u
cygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdXNiL2NoOS5oIGIv
aW5jbHVkZS91YXBpL2xpbnV4L3VzYi9jaDkuaA0KPj4gaW5kZXggMmI2MjNmMzZhZjZiLi5kNGZk
NDAzYTM2NjQgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvdXNiL2NoOS5oDQo+
PiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvdXNiL2NoOS5oDQo+PiBAQCAtMTE0NSw2ICsxMTQ1
LDQ4IEBAIGVudW0gdXNiX2RldmljZV9zcGVlZCB7DQo+PiDCoMKgwqDCoMKgIFVTQl9TUEVFRF9T
VVBFUl9QTFVTLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogdXNiIDMuMSAqLw0KPj4gwqAgfTsN
Cj4+IMKgICsvKiBVU0IgMy4yIHN1Ymxpbmsgc3BlZWQgYXR0cmlidXRlcyAqLw0KPj4gKw0KPj4g
K2VudW0gdXNiX2xhbmVfc3BlZWRfZXhwb25lbnQgew0KPj4gK8KgwqDCoCBVU0JfTFNFX0JQUyA9
IDAsDQo+PiArwqDCoMKgIFVTQl9MU0VfS0JQUyA9IDEsDQo+PiArwqDCoMKgIFVTQl9MU0VfTUJQ
UyA9IDIsDQo+PiArwqDCoMKgIFVTQl9MU0VfR0JQUyA9IDMsDQo+PiArfTsNCj4+ICsNCj4+ICtl
bnVtIHVzYl9zdWJsaW5rX3R5cGUgew0KPj4gK8KgwqDCoCBVU0JfU1RfU1lNTUVUUklDX1JYID0g
MCwNCj4+ICvCoMKgwqAgVVNCX1NUX0FTWU1NRVRSSUNfUlggPSAxLA0KPj4gK8KgwqDCoCBVU0Jf
U1RfU1lNTUVUUklDX1RYID0gMiwNCj4+ICvCoMKgwqAgVVNCX1NUX0FTWU1NRVRSSUNfVFggPSAz
LA0KPj4gK307DQo+PiArDQo+PiArZW51bSB1c2JfbGlua19wcm90b2NvbCB7DQo+PiArwqDCoMKg
IFVTQl9MUF9TUyA9IDAsDQo+PiArwqDCoMKgIFVTQl9MUF9TU1AgPSAxLA0KPj4gK307DQo+PiAr
DQo+PiArLyoqDQo+PiArICogc3RydWN0IHVzYl9zdWJsaW5rX3NwZWVkIC0gc3VibGluayBzcGVl
ZCBhdHRyaWJ1dGUNCj4+ICsgKiBAaWQ6IHN1Ymxpbmsgc3BlZWQgYXR0cmlidXRlIElEIChTU0lE
KQ0KPj4gKyAqIEBtYW50aXNzYTogbGFuZSBzcGVlZCBtYW50aXNzYQ0KPj4gKyAqIEBleHBvbmVu
dDogbGFuZSBzcGVlZCBleHBvbmVudA0KPj4gKyAqIEBzdWJsaW5rIHR5cGU6IHN1YmxpbmsgdHlw
ZQ0KPg0KPiDCoMKgIEl0J3MgY2FsbGVkIGp1c3QgJ3R5cGUnIGJlbG93Lg0KPg0KDQpXaWxsIGZp
eC4NCg0KVGhhbmtzLA0KVGhpbmgNCg==
