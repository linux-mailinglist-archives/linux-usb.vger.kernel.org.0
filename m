Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88DC62F221E
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 22:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730445AbhAKVqd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 16:46:33 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:49418 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388333AbhAKVqc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jan 2021 16:46:32 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EA17BC0354;
        Mon, 11 Jan 2021 21:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610401531; bh=oASROCYKW8RTXigwoSA3M0VuIdHJUZI1ZG/G2rYjHhc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=GsK4Xs1IkqlapCWzFvPgfgyVflsH+R0im9UQYdVbZT5U1QI6D15n8qwTaAhuXxsFS
         PRYD/Ne/BmJ/LFuAseRkxpReS8Wgj/AoLIlIzwjsATiVURL9izYOKwcKgnmnj/MSPS
         cSCaHnf5wunDxzj3YPAwT6GenUtqVtCUu8Aei9V2eXOPKgbPIYTCGub28iNHFvSGzC
         lz8vHBDFTdueVess1q3YifhlkyB/bxoEiWfr1aiW2OffNI/+fM/QgRlCasKzN5CWqc
         kR1P9cLDa8pOTHivSsWVK54Ef3m1TQG9kr+OEkPkMhDVsdifbeHvdsGX3E93sMrb1F
         ncwMsX9I7py6g==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6529BA0096;
        Mon, 11 Jan 2021 21:45:28 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id AF7044009F;
        Mon, 11 Jan 2021 21:45:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="OfBM44HP";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sp/+xC8uAyjuK3L611X0zHSDCRWenP0tRrb8YvbyxNutsUSUvkYxmh4MB3HleCD6S5nh8abL+5uEwRRmZt1gF8NytlXOgyhFiGiV6xwusc6iyqDfIIw3JC9ASnqx9dG5hqQnPyE4xSVqQLUp3ZCTlT4qr1JtFdUVIUmBXqXbbKimEqRi0D4xV7eVWezzMRGH3mYQ35U8WvbdvrkZ0jIm3fSVS9DW8NnhZGBfC0P/qHl01IP3w0veRurZZISUSCahTvjqC9FnDNLHLozKgoPReZObnw7TWTSJF4sg6+g166ePU1hy3CDJsSPphDyR4JIfz4D6B8HEiUeLbo2oIlG9Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oASROCYKW8RTXigwoSA3M0VuIdHJUZI1ZG/G2rYjHhc=;
 b=AHoIX0bpdwuXPa4HYm9/0jdHsiiXIASagNndnJtxqE7ZmCd1JsJGCXKr6chE1KsvD+sB2O8igduXx02qsgLFDQKIn24rNOqsnv2W1k/OtTIyWWiL2/QbP1QnOd5MBve+IUjk0ZtxME0/Mm68/z8A3zLUP9afOVvEjnziCT0b5w9yOndoGnnH1KRDm47m4QiFK/z4M4wLP5Ag+bJUwo2nxiGPHv9c9hVVjGxpNWKc8TOQQgpHPMzf8PW6lSOs3e2KrAqDhYhQHZjq25pvSskhD8b5nxdhTHFhQTIdwiYBj0iWdkxnLktVjWGFTuljjH45VKUG9LyDL6/XbehraQQIEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oASROCYKW8RTXigwoSA3M0VuIdHJUZI1ZG/G2rYjHhc=;
 b=OfBM44HPriipETBBh/FXBP3bTp/a2MAK5sqGeVkQLA6mct8tjPdHy8KjhOTGUXw7IE9Ya7EDh3s9cJRMRSLlJ21D6jDqiRWkw1EpNewg0o+9vRt3CIwlEcTsSvP4q2Na5lDe9NiyYy9iMZmBU+Dos8RcwCAqqmTartDsbEYodng=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4097.namprd12.prod.outlook.com (2603:10b6:a03:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 21:45:24 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 21:45:24 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] usb: udc: core: Introduce started state
Thread-Topic: [PATCH] usb: udc: core: Introduce started state
Thread-Index: AQHW6Fn42t/s7d2V5ECRC4W61zuEWKoi8RqAgAAEU4A=
Date:   Mon, 11 Jan 2021 21:45:24 +0000
Message-ID: <1e5bbddf-df52-d293-d27d-9cb034eadce8@synopsys.com>
References: <a7c4112fcd4dc2f0169af94a24f5685ca77f09fd.1610395599.git.Thinh.Nguyen@synopsys.com>
 <20210111212955.GA1209265@rowland.harvard.edu>
In-Reply-To: <20210111212955.GA1209265@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54b623dc-9039-4f7b-cf32-08d8b67a340d
x-ms-traffictypediagnostic: BY5PR12MB4097:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4097EF20A6C5897836C76C97AAAB0@BY5PR12MB4097.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7kahGnPPdzAO49tBAD/QKa21v0k6zmN8batTwcCIQEbZrV6RgSOgRWQQhQq9MK9tL5Ysw0kFKWrA20UhsSGzX+bikod5L4mx/+jy7K8iHBOZQra57WQ/FSA/tVndG+V05yY34qTqmT6muvjn1xKg9rEZJL+CKunOvrtZzZ1vzJiK60xqZG2dA2GMMP8JeVAszkWQFSy0gzG3pRgJd1b1HB1jUgIg3tlKs51IgBC2icosu8HDo+8masxSMOnz8zlBWzOF6V4mTFyp8GQt6LYzV786WAxUg+HWqh0CSKl8wQLBwlOgLvFsmQu+z0b+T/WyAl8acISsn1wxU1Jvo0hTbftwD0EV+cirNDnAhYZufcTVt/LghQWIoRtIJ2JeMJefhWl9a+fT4wM6wKUnZwYWMOyfWf2J6Pk4z4TlGUSkgGKKDiI2FsbQKZI+QqX0NaLyrQoWsb0wpF7bVldqETNhOPbvcXbeyjHEUFFF4Qysbsk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(376002)(346002)(39860400002)(64756008)(66556008)(66946007)(6486002)(66446008)(8676002)(76116006)(66476007)(83380400001)(86362001)(110136005)(6506007)(8936002)(31686004)(5660300002)(36756003)(6512007)(478600001)(31696002)(54906003)(71200400001)(2906002)(4326008)(316002)(186003)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Z1Q1a2wrNUdwT05GNDlJSnJrbTZvOWNtN3lsc1JYQ1ZKZjU5dSsrZlM2MEUr?=
 =?utf-8?B?NHhaalRkK0hVYWx4b0QvSE1ZNnl2M0tDdXBsQzVBeGMvUEhrbWc0OGliblhu?=
 =?utf-8?B?KzBFQkVKNXZYQUQ0alZmRVZ0NmJwaEJWNExPV3B5NThTbHMrN0dxU0w0ekdt?=
 =?utf-8?B?aGEvYlVnRjBBaXovSFh3ZUppd1lRMytSeGlTb21ya1l4RXdnVnM2aDhzWDIz?=
 =?utf-8?B?cEo3OERzalBpMC9vYW9ibWxqZXBwYm16NGlLQ2lsR2wyOERRemR2UU94Zmda?=
 =?utf-8?B?MmcyZWorWllYMHJYeVZjNW5pZjZrbkZ4WENxUGhtWG1wby9EMlc5OGl6WFJq?=
 =?utf-8?B?aVE5eGlmUld5dE41R1pLcXpaMW5sQ0ZmdmR2L3EwczFzZjdrWml5RnBFV0Nr?=
 =?utf-8?B?ZDlEM2FkMHJyNEw0YW9wZlpra2EycklRakhxQjRJKzMwZFRVMkxJSEY4bmtR?=
 =?utf-8?B?NzZNQTJubmRKc1ZoL3JqTVBQdTQ1NEhBZ0pQaklHdVhRdS9EaDIzbjZJcTlW?=
 =?utf-8?B?MFNUclZtNDZiazZhOVRrUkZBNHJlRktxTE9XZHhoMWdMbDAzYkRWRWF1ajlt?=
 =?utf-8?B?dGJGdmx1ODFCS1BGVFVaQVFJaU1PMWRtTFJHWlE0QU9XRnNENWNMUVBJM2N6?=
 =?utf-8?B?bThYSTcrQXhZaUJXSXF1ODl5NGhFWGt4QUVnS0w0N0NkT28vOG84ZElzVkhO?=
 =?utf-8?B?eHZCT2lnZGlrM0F2cmF3RER0VHRIUTYyQXVnaFUwVXNHZnFXVU5MMXVwRHhH?=
 =?utf-8?B?VjRoV3JTQ1dBUngzMDZ4eWtxY3pjUEZxRG8vMjVhaW1YSEFQVm4rbTdwZzZW?=
 =?utf-8?B?bXlGeWJiZGJXaXpSV0Fhc3pvK2t1UXFab1hGYVVpdmRZQklPUUdWNjRHUzRy?=
 =?utf-8?B?d1ZaczFoWGJ0b1VLYW9IZU5BODI2NUVqVkRJNVdoQmJiaW9MU2ZBeWIvNXV0?=
 =?utf-8?B?OGhpM25MTGJGYk9lOCtrMHdYY1NZV1J3RFJ3N2I3Z0hTY2VWSFA5a3ZPQTJW?=
 =?utf-8?B?SlZRQXM1SDRrMUVqYlVBVWRkb1YzM2N4ZlVxN2YwWmQ1bFdnZ3pQOEV3NDNm?=
 =?utf-8?B?Ykt4bEoyRVkzejFOMjQ0ZU8xTFM3NEtwaGtRcmhVMTFNbmEvZit4SEpWUG95?=
 =?utf-8?B?OWVDWGVZZWV6dnNFK1cvcnJmQi9aUXFMak5YSDlQbXY2T1NKcDdWOUNOaFBy?=
 =?utf-8?B?NXlBRi9RNCtUWEpSdnlTb1BuYVZrSXlweHVOOTV6VWU4aU9JQjhSbVgrL3py?=
 =?utf-8?B?bVJvQU9IRnlzUXViZ3k1QUVRZmIrREVPZTl0ZUpIYmVHdXp5ajc0T1JQOWV0?=
 =?utf-8?Q?BJVBaQ4KzZSAI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7AACB02FB09B77478E41615BF797F837@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b623dc-9039-4f7b-cf32-08d8b67a340d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2021 21:45:24.7401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OAjtAp6ZdIoe2/owc7K58b9Hrhm/m+p1GUQCuQb4jRf/4TvtWwO0LAedKF1BRekvq22svMufDxO8tBD8Fns9Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4097
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIE1vbiwgSmFuIDExLCAyMDIxIGF0IDEyOjM4
OjA1UE0gLTA4MDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+IEZvciBzb21lIFVEQ3MsIHRoZSBp
bml0aWFsaXphdGlvbiBzZXF1ZW5jZSBieSB1ZGNfc3RhcnQoKSBzaG91bGQgbm90IGJlDQo+PiBy
ZXBlYXRlZCB1bnRpbCBpdCBpcyBwcm9wZXJseSBjbGVhbmVkIHVwIHdpdGggdWRjX3N0b3AoKSBh
bmQgdmlzZSB2ZXJzYS4NCj4+IFdlIG1heSBydW4gaW50byBzb21lIGNsZWFudXAgZmFpbHVyZSBh
cyBzZWVuIHdpdGggdGhlIERXQzMgZHJpdmVyIGR1cmluZw0KPj4gdGhlIGlycSBjbGVhbnVwLiBU
aGlzIGlzc3VlIGNhbiBvY2N1ciB3aGVuIHRoZSB1c2VyIHRyaWdnZXJzDQo+PiBzb2Z0LWNvbm5l
Y3Qvc29mdC1kaXNjb25uZWN0IGZyb20gdGhlIHNvZnRfY29ubmVjdCBzeXNmcy4gVG8gYXZvaWQN
Cj4+IGFkZGluZyBjaGVja3MgdG8gZXZlcnkgVURDIGRyaXZlciwgYXQgdGhlIFVEQyBmcmFtZXdv
cmssIGludHJvZHVjZSBhDQo+PiAic3RhcnRlZCIgc3RhdGUgdG8gdHJhY2sgYW5kIHByZXZlbnQg
dGhlIFVEQyBmcm9tIHJlcGVhdGluZyB0aGUNCj4+IHVkY19zdGFydCgpIGFuZCB1ZGNfc3RvcCgp
IGlmIGl0IGhhZCBhbHJlYWR5IHN0YXJ0ZWQvc3RvcHBlZC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQo+IElzIHRoZSBuZXcg
InN0YXJ0ZWQiIGZpZWxkIHN1YmplY3QgdG8gcmFjZXM/ICBXaGF0IGhhcHBlbnMgaWYgdGhlcmUg
YXJlIA0KPiBjb25jdXJyZW50IHJlcXVlc3RzIHRvIHN0YXJ0IGFuZCBzdG9wIHRoZSBVREM/DQo+
DQo+IEFsYW4gU3Rlcm4NCg0KVGhlIGNhbGxlciBvZiB0aGlzIHVzYl9nYWRnZXRfdWRjX3N0YXJ0
L3N0b3AoKSBzaG91bGQgdGFrZSBjYXJlIG9mIHRoZQ0KbG9ja2luZy4gSXQncyBhbHJlYWR5IGRv
bmUgaW4gdGhlIGNhc2Ugb2YgZHJpdmVyIHByb2JlL3JlbW92ZSwgYnV0IG5vdA0KZm9yIHRoZSBz
eXNmcyBzb2Z0X2Nvbm5lY3QuIE1heWJlIEkgc2hvdWxkIGFkZCB0aGF0IHRvIHRoaXMgcGF0Y2gu
DQoNClRoYW5rcywNClRoaW5oDQo=
