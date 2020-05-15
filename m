Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E743B1D42D0
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 03:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbgEOBX2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 21:23:28 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:44604 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726168AbgEOBX1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 21:23:27 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0547E4011D;
        Fri, 15 May 2020 01:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1589505807; bh=esOyszp9LPwAZTDnLzv1atAV/Kejv4xkXY2j8Q0YY+E=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=ib70wvu1N1nIE8cXOl00qunpFeBQ5zKhqcHRwyx4MmEeDsVv3GdrgSQ0OWyNBq39U
         aykDPacKmqxIIaxJtGVZABVM0wD8IKnMlHdDJDiqpR/0ksQUidWxAasb/+G3+3wSmy
         I9+7KR7+3o1JX0kCrbdeDktGXa96rMVX2UUVvgIG3BE+GyxXVZevS2WS02NjidrvA4
         3SQZFwsFoA1LksPrU8FL6Pmomce6usD43URVihQpKY5aZE/Sz9c7uVmzf5q3EzcHpn
         SP777ibVXVjhV1Y/fY7iIr5PGQxHpirAc0DUP3RuGzwdO8bMpEahXQdsgWyuezWYjZ
         SvAktxh2IG8+A==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id A4F18A006A;
        Fri, 15 May 2020 01:23:26 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 14 May 2020 18:23:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Thu, 14 May 2020 18:23:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyrvdRpxtGVzIBIWC901BPT41u+lrMfBGPGooWh3CHxr3kMrYVWAs8RupxLiCU7Zrl9vN4SOhq85xO+P7vBVI9kAhgUSEA6bIVgZ9E8Q8hZ+nQQ0z9QVZy/emYA9kjcsKCalOl4B5gIzZrSlyPx3ZYh2qR6SHMH7/uw70tytc9HtToi606CCXTsfrLwDfKCuTTSp5Ro3RAP4gWjLoyUhS4xEVmwUwpj8Q3uY3p+RKyZ/OvrngBne8tt108GyhzK48RQnW+r2yxLszAwRdHXZz3Oua9nmGjYFZxpi6R5mdioC5tKjTdSWdSH8Itoi+ehQ0e6w30nkRWExic8ue+iO/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esOyszp9LPwAZTDnLzv1atAV/Kejv4xkXY2j8Q0YY+E=;
 b=CcPbXDXb4Bm7i0HZIxUBkglO10IvgXmsF5Cty29CHGG1bSySK1asBZ0aSX3a95M+F9etAaaa4VdtzIbBBZcj66uMpOFvbnNi54zLC7jjynhEk+FBZNooHdAL2oeN9aer7RdKzkY5OMq0kzEnH/0RFQTGVYt1h1PHCu6HohBu6+7pE1Ii/1h8g3dEmj0pcTCm2TcFsjcd9IBB+XCec7zIPcFrIrnIjnayIZH6+kYq6+q4X8nZQhKkhOQpgzKG0z9hqhRCaI9itY+awxqyT++X/9oV8Lyg+Xa0OJzip4nzsFcoWSgygcmuEgB2e3YbjNtbJF+s9ZGb75Io5KTplGiT4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esOyszp9LPwAZTDnLzv1atAV/Kejv4xkXY2j8Q0YY+E=;
 b=BxDnaDPcUN4nV5bZhQ0qWz3EJAqNB5evI9wlKS6My26AzsQ9JOHGpGgJjrrCL91xF9aS6djtPCm/oeWCqE0cPZZcp8yKM++HO6Flcxm3umpxz0UJV68XCMR3lL3KlBaKSKVz4mU2vU/W0FqlbOD7HS2YL9PjRfzioDjB+CTAL00=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB3478.namprd12.prod.outlook.com (2603:10b6:a03:ad::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Fri, 15 May
 2020 01:23:17 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3860:a61:5aeb:a248]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3860:a61:5aeb:a248%7]) with mapi id 15.20.3000.022; Fri, 15 May 2020
 01:23:17 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 4/5] usb: dwc3: gadget: Handle transfer completion
Thread-Topic: [PATCH 4/5] usb: dwc3: gadget: Handle transfer completion
Thread-Index: AQHWHOMqWgV25rtuykKU0ADVs2o1M6iPu08AgAEk5gCAFp2HgIAA902A
Date:   Fri, 15 May 2020 01:23:17 +0000
Message-ID: <132ac9e9-4f9a-a93c-f309-58d6f8677495@synopsys.com>
References: <cover.1588025916.git.thinhn@synopsys.com>
 <70555c2202529c6e0bdd23124003d0d4bc637cdc.1588025916.git.thinhn@synopsys.com>
 <87blna20n3.fsf@kernel.org>
 <ad3a0e37-c611-c6e9-959b-7351fb82ed0a@synopsys.com>
 <87o8qq4x9s.fsf@kernel.org>
In-Reply-To: <87o8qq4x9s.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63926d2a-5cc4-4f8d-031a-08d7f86e8bf0
x-ms-traffictypediagnostic: BYAPR12MB3478:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB34780C01C02363633B522131AABD0@BYAPR12MB3478.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 04041A2886
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2kXVc6Xr+C9kU6V+fJHNM7d0kz/pm2tpmZVY13OU4SMkqXmhHTz9g9wKkI2aa6GYPzEXoSa2AdyoQGXzLsjlPV4CFRc4VIuiIeCe8TaQJqOFtoWX25L3CQEUMuPjsEDXdXcsvT3k0cagY9Nx97Gmmo9jXogHcIZn+KoA/E4LUaTYDvXMYoBpt36hR+hw/61z3Mqbipd9daZykAoqTwFtkx+Isep663TymSlQJxHry5QsqjlS93oc1Ve3Rq4/S+3my1oE/qYQq0AsQeWFseSF52mz3zKGIadiI1c0ja+hbvm6P9lHUlYLKy0iD9TH9BO1rL3ipEBIxQ8ZFN4vrQ5FoA0dMdGc2pn8c6Qx/qu8Bk0S/NaCc4rDm7Oo83ULTYGMeJEJUNCuPlAH6P+2EZezr11C3Vz2pgXMhgEgbh3QnDnRI6fPtCu0pOaHwV5AjzIbmwG+p5gciJj1tY98Q5s93d8BtQsM24JBfeE7HE62cZGgRpNJYNeXNq0rGmDG0MmytdglzzQ+rkRJ1dZa8WSuFgd9rHrl1E75bowfLfDsE0E5qkBqh9NIJxJi/Mq4WNQdJWFy3zShp28DpJl6FeEVYGdfZHCDYiawXGWmRVPNV/1wdR+OtdSwswYYyrdPrClNDt5cZih2+UwJT1ZIqWRqRCnWeJB/QfUWK42v28etn5H6MNrg6OF2uw/P2idMUKDkKEJ/gd3Dat23Jj2sKE4TtA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(376002)(366004)(39860400002)(136003)(396003)(346002)(4326008)(2616005)(316002)(4744005)(2906002)(110136005)(66446008)(66476007)(64756008)(6486002)(76116006)(66556008)(66946007)(36756003)(5660300002)(8936002)(478600001)(71200400001)(26005)(186003)(6512007)(6506007)(86362001)(8676002)(107886003)(31696002)(31686004)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: /oz0VglXIZKicWG2Ogs/Hd2JRe9JXW3SyiFpXirBhjm003LVhWcUO5yODjMGPBTV35uJuJm9krcww8FkenhmYYyJTEZVogmEmIZGbNBTvZRMeXu6swN8v+ZhP0EnNWmyQj6QHKTPITnz3mI5Y9Zt01yWoSAlbgxJdLNtQzwmix87s3V1tsMd0fsq3WOj/uQUX114jCq74nST3FpPdaY/V26u67jYAUFoPDMKwQ8q75ClhreL30KkfvjcbtC27FTW36/cIByxTxKgQVecSkjcsSAYt4YGN5J86KTsQk5+P1TXhOK7jqu5WwUld9hFbsQ4Ac1PSj2IiVBNtue33XteY1BjmimDNsEkfESqHVS6WDt+fIP7d7ZzYwDKCJO3XYPgo29PfZMqdhF8NmjZLRtu1GcLLEV/Opwlgk0J209bwZtbDsyUEIAWJPUabSx5au5siDbIGh7zz65O51GAp1YteY08tSnqMOKGZGHc7pGHzfQ=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5BD4B4B72DE8840B4650B860EA6CE68@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 63926d2a-5cc4-4f8d-031a-08d7f86e8bf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2020 01:23:17.2069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bpEjnVR9wAOdeHQJtPnroTaxAZGYHG/bKbauUR9jhDRdSRJNCaIFUGVKvcWqw/z0XpEG1zO0irB736OFZh6+Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3478
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RmVsaXBlIEJhbGJpIHdyb3RlOg0KPiBIaSwNCj4NCj4gVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5
ZW5Ac3lub3BzeXMuY29tPiB3cml0ZXM6DQo+Pj4+IEBAIC0xMjIzLDYgKzEyMzEsMTAgQEAgc3Rh
dGljIHZvaWQgZHdjM19wcmVwYXJlX3RyYnMoc3RydWN0IGR3YzNfZXAgKmRlcCkNCj4+Pj4gICAg
DQo+Pj4+ICAgIAkJaWYgKCFkd2MzX2NhbGNfdHJic19sZWZ0KGRlcCkpDQo+Pj4+ICAgIAkJCXJl
dHVybjsNCj4+Pj4gKw0KPj4+PiArCQkvKiBEb24ndCBwcmVwYXJlIGFoZWFkLiBUaGlzIGlzIG5v
dCBhbiBvcHRpb24gZm9yIERXQ191c2IzMi4gKi8NCj4+Pj4gKwkJaWYgKHJlcS0+cmVxdWVzdC5p
c19sYXN0KQ0KPj4+PiArCQkJcmV0dXJuOw0KPj4+IHRoaXMgcmVxdWlyZXMgc29tZSBiZXR0ZXIg
ZGVzY3JpcHRpb24uIFdoeSBpc24ndCBpdCBhbiBvcHRpb24gZm9yIGR3Y191c2IzMj8NCj4+IElu
dGVybmFsbHksIERXQ191c2IzMiBkb2VzIHNvbWUgYWR2YW5jZSBjYWNoaW5nIGFuZCBidXJzdCB0
aGF0IHdlIHNob3VsZA0KPj4gbm90IHByZXBhcmUgbW9yZSBUUkIgdW50aWwgdGhlIHRyYW5zZmVy
IGlzIGNvbXBsZXRlZC4NCj4+IFRoaXMgZG9lc24ndCBhcHBseSBmb3IgaXNvYywgbWlzc2VkIGEg
Y2hlY2sgaGVyZS4gTmVlZCB0byBhcHBseSBvbiB0aGUNCj4+IG5leHQgdmVyc2lvbi4NCj4gRG8g
eW91IG1pbmQgcmUtd29yZGluZyB0aGlzIHN0YXRlbWVudCBhcyBhIGNvbW1lbnQgaW4gdGhlIGNv
ZGU/DQoNClllcywgSSByZXdvcmRlZCBpdCBhbmQgYWRkZWQgdGhlIGNvbW1lbnQgaW4gdGhlIGNv
ZGUgYW5kIGNvbW1pdCBtZXNzYWdlIA0KaW4gdGhlIHYyLiBZb3UgYWxyZWFkeSBoYXZlIGl0IG9u
IHlvdXIgdGVzdGluZy9uZXh0IGJyYW5jaC4NCg0KVGhhbmtzLA0KVGhpbmgNCg==
