Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58D361860D0
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 01:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729290AbgCPAdV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 20:33:21 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:42776 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729228AbgCPAdV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 20:33:21 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B6670C04D7;
        Mon, 16 Mar 2020 00:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1584318800; bh=TsAo79iaUjIHY7bc2l714x5LiZEjTzBAxC3djBsgkd8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=QR+WHQGksL8px46RNOgBUYJsDHqm9h2N+fAKW7y/Xjw+E4xFGdq6x7EtnLt4TWAUS
         SsZoHK3CiPkkfnArGVTDg8AeyWoi9dtfTQbFQ7Yhxdy5KjYHpKIXmrAcO1OE6oqdZc
         TaiRjQU3xJzLkVbWge5nIw2j5RZyIL4uzBZqLKlhZPxbtBDz/k6WvHvLwfvp6eTsiF
         +/9yWKdI7nIpqCdfCJNCg+ev8n44idFv2WZha1U5PIpk+XX7s8l5w4wBX+r/caYmVV
         v++hmeeTkTyPvdsQXyVHqMjh9iAEatPJ5fLLBxwzxa4OmDSXlDcGqS43e5kWRprHwM
         xAec60UNhY2Hg==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6EC7BA006B;
        Mon, 16 Mar 2020 00:33:20 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Sun, 15 Mar 2020 17:33:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Sun, 15 Mar 2020 17:33:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vi2YDvhdXT2B+JxfXlx/ZLuDB1fQj9+DJu61KqJMokqaRkNP72D7pODMkE45r0OOjEl1KPiXRpQdnuZovaPMqySHjnvHxRmXe8WNufX0wQq+5/HeIO7kuWSkrZFREEqDBS1zT6yYndVrTq9S8tvsRMT0q0hQ2XTqxdD7VFQ5b58Ml97vjei4T0b/cML02Owv/6zPANlUoPXG1TD9nsqxd4xpIGUZEVs9WTn7E5eHFLwaUM5KxHJGFZlb7MIatl/ZBaJ0pEWfU7thT/QqqTHCl5eRuG7Y6B/F44XWiyMdL5f0d0rf0bBbDWwfzyarCP2cIqPwrzqAr7k1ZxV2fXu/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsAo79iaUjIHY7bc2l714x5LiZEjTzBAxC3djBsgkd8=;
 b=QmqQUKABXzhWDDYEXH+5jqLIKvuhNsdjHbZs1HrmqyJlVlGTPFFA69GSJaTDLttBvTZp9C1F6/sUK7Af3gymoFPHcHAjywz8+fJBqCD3dhlHPUq45yJ1kQTxXgl7y0y2vEsA9hkWxbFZ8bD6BDy7GO44LAUVaxBSqkawl8w94Px4eN8/MJKVogRlcpwDSE2qH7AikGKW9KEdw10VAlE133fT6Zx/C8e53Q87JV7PgU/1/JXG+MVsVtsCQ2qLqIZ+YNZX+S39yAYrzh/VelmxYz5hrufArXrxqF2+5NSSutSoN44sp9wLT7FDgMCyIsUNB51pXqAIcCwGVYjVS7FQCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsAo79iaUjIHY7bc2l714x5LiZEjTzBAxC3djBsgkd8=;
 b=JVjN8QTThykD2IMKJfWgGW5DV0Oy6kle8Q644Xl3v1QZsXsNUowElhoAlMfs4ZzndNbhaKs4LVJOqzmDBbql0ynlqQB32a5FalXDZgsZ6GjaN7MhVFBygUJ19iCxJc8wRU1EVuTG/r8X6bY5gcq9DYp6Amd030sqF3WRAZZNNrs=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB2728.namprd12.prod.outlook.com (2603:10b6:a03:61::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.22; Mon, 16 Mar
 2020 00:33:19 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2814.021; Mon, 16 Mar 2020
 00:33:18 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Remove incomplete check
Thread-Topic: [PATCH] usb: dwc3: gadget: Remove incomplete check
Thread-Index: AQHV82muQmX55NMUl0emMsblflREJqhJbrQAgAD/cgA=
Date:   Mon, 16 Mar 2020 00:33:18 +0000
Message-ID: <df600201-0063-bb5f-19be-ecbeaada37f0@synopsys.com>
References: <660a74249e64b3b62ca9b394584387baee67a119.1583466150.git.thinhn@synopsys.com>
 <87d09ef01l.fsf@kernel.org>
In-Reply-To: <87d09ef01l.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e3b33b1-d45a-4f68-5b67-08d7c9419ff3
x-ms-traffictypediagnostic: BYAPR12MB2728:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2728E1EF25A30C767213F167AAF90@BYAPR12MB2728.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03449D5DD1
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(39850400004)(396003)(366004)(346002)(136003)(199004)(478600001)(36756003)(81166006)(81156014)(8676002)(31686004)(26005)(186003)(6486002)(4326008)(8936002)(5660300002)(107886003)(6512007)(2616005)(71200400001)(110136005)(4744005)(64756008)(86362001)(6506007)(31696002)(66556008)(76116006)(66446008)(66946007)(316002)(66476007)(2906002);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR12MB2728;H:BYAPR12MB2710.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YioVkZeXHL6yFSrZvdVe9qWZr63g0ftW4Adue/0sSYbAgPX3Zn6EO6mkJx+23dxI9YkTLly9fbl/djSirKPd3EJKXf84Rqrkhv7wEWftFrzupmdba/eWnCbHFXV7e3sf8CFsHzrnHPsMRCVS45OrTCciBThkf9UmaDI4EGqPccU4ch3bnCE3OHlcyYpXYlGzrQs6batNhx27BHJm41hpFZdNArh32OUiw1MdEU+/2cJ3QALk+o91+LlkjdYt+nqRRip83AXg5MmjIArd1/S2hRQBCK7d/+B+uJ/IOGMbAmmbLDLu6mXkBPX+ceYpCJ6YUFBA1DXiKcerdtkfh7KSRbmSeyIcY0Js6I+hoTUu7+a/d+3uniEVO6ycrH7/2WAvWNZokKhhRHLCekGXbwP/aaw7JavLtt5MJjWZqfM8LMHYax3hnGWCdGzNDLQHgMx3
x-ms-exchange-antispam-messagedata: m0+HSLmfBeJMVktv+7OAKvvc/fblrbI+1i8WCume+ad5T3mSWU8VZlRXShA8uVQIdYtxR9NqcAxb2f4Xm4c9R941nXzxTzpblfYb95X4e7iB/7VN/vEfs6nqh36RDEa+oIG5Fj8EjKof0BBkG+bttQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <37A4FFA74DA3B14AA15D48EE870C19F8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3b33b1-d45a-4f68-5b67-08d7c9419ff3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2020 00:33:18.7499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9+E65kmhAdGhQLuUOCGNONhl2+ATYC/euS/+uL3VP0DJpi6ZlMgNpOoDkzgAy951IR4XvlBY4Kl3/5AQOarRTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2728
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmVsaXBlLA0KDQpGZWxpcGUgQmFsYmkgd3JvdGU6DQo+IEhpLA0KPg0KPiBUaGluaCBOZ3V5
ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+IHdyaXRlczoNCj4+IFdlIG9ubHkgY2FyZSB0
byByZXN1bWUgdHJhbnNmZXIgZm9yIFNHIGJlY2F1c2UgdGhlIHJlcXVlc3QgbWF5YmUNCj4+IHBh
cnRpYWxseSBjb21wbGV0ZWQuIGR3YzNfZ2FkZ2V0X2VwX3JlcXVlc3RfY29tcGxldGVkKCkgZG9l
c24ndCBjaGVjaw0KPj4gdGhhdCBvZiBhIHJlcXVlc3QsIGF0IGxlYXN0IG5vdCBmdWxseS4NCj4+
DQo+PiAxKSBJdCBkb2Vzbid0IGFjY291bnQgZm9yIE9VVCBkaXJlY3Rpb24uDQo+PiAyKSBJdCBk
b2Vzbid0IGFjY291bnQgZm9yIGlzb2MuIEZvciBpc29jLCBhIHJlcXVlc3QgbWF5YmUgY29tcGxl
dGVkIHdpdGgNCj4+IHBhcnRpYWwgZGF0YS4NCj4gSSB3b3VsZCByYXRoZXIgZml4IHRoZSBmdW5j
dGlvbiBmb3IgdGhlc2UgY2FzZXMgaW5zdGVhZCBvZiByZW1vdmluZyBpdA0KPiBjb21wbGV0ZWx5
LiBXaGlsZSBhdCB0aGF0LCBhbHNvIG1vdmUgdGhlIHJlcS0+bnVtX3BlbmRpbmdfc2dzIGNoZWNr
DQo+IGluc2lkZSBkd2MzX2dhZGdldF9lcF9yZXF1ZXN0X2NvbXBsZXRlZCgpDQo+DQoNCklmIHdl
IHdhbnQgdG8ga2VlcCB0aGlzIGZ1bmN0aW9uLCB0aGUgb25seSB0aGluZyB0aGlzIGZ1bmN0aW9u
IGRvZXMgaXMgDQp0byBjaGVjayByZXEtPm51bV9wZW5kaW5nX3Nncy4gV2UnZCBvbmx5IHJlc3Vt
ZSB0aGUgcmVxdWVzdCBiZWNhdXNlIA0KdGhlcmUgYXJlIHBlbmRpbmcgVFJCcyBmcm9tIFNHIG5v
dCBjb21wbGV0ZWQgeWV0LiBJZiBhbGwgdGhlIFRSQnMgb2YgYSANCnJlcXVlc3QgYXJlIGNvbXBs
ZXRlZCwgcmVnYXJkbGVzcyBpZiBhbGwgdGhlIGRhdGEgYXJlIHJlY2VpdmVkL3NlbnQsIHdlIA0K
ZG9uJ3QgcXVldWUgdGhlbSBhZ2Fpbi4gRG8geW91IHN0aWxsIHdhbnQgdG8gaGF2ZSB0aGlzIGZ1
bmN0aW9uPw0KDQpCUiwNClRoaW5oDQo=
