Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF09C36BB31
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 23:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234257AbhDZV1y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 17:27:54 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:37892 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234146AbhDZV1x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Apr 2021 17:27:53 -0400
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 62495C008F;
        Mon, 26 Apr 2021 21:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619472431; bh=AYwWhCEhx8HErteZpbon44cY9FEkcVCZwdINq3+dikE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Q0rdn7frTp6ntnJZcsqszpxk8T5la6gXQzTbEvrJOfNPcJgj+2tHX8hNhngin058W
         x0h5TPdopiL1/s7tPlRVN3uZDhJtv+bKoPhsOBEO+r9o2+UMqgHz2C1KwvP8YLHPGo
         dKFuNfVmZ4ftO1oJY1S//uREVs7RcFxO3wHkmY1RhbX+54cR+rkKO4eQC0sVyANRJu
         4gMJ1ptxkagflPARcjMOhfJ4gDotsmoUW9A5S256NnIhevrW4shngXpjrhonMdIJMz
         LiEb7klB+Cxnj766TIMwrYIPR8VMVNQTt5VtrbAZ9MVOiG7GxrJNVetUjfoa9BUT85
         Ywdj905Ref2kA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 23B0FA007A;
        Mon, 26 Apr 2021 21:27:10 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5BFDF400F9;
        Mon, 26 Apr 2021 21:27:10 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Qg8urmXA";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=We0SAul1cmYAcBvEKdIq+Jods+H+oMGfnNVeN2toQ79RbSLp0oEYRFLuAky5PnEUKyAhkmVRCJ7GNjg13k2bSlAkwEyWLMPsH7oymQW8YTD7vJHS4WwxrLz1V9QN7AIlmAH9uoAcNl2G96OwpAkSj2V1+8cFNep59u9Ek5dCO1BYm5ov/JQZsZRYT/UcNcOZNeERQxuljpEO4Qbl8pd60UevAejKT87/mNz5V7Yt00UyqgSFDfMKomK9dKcntkALj5el+VCg+JFzDKCiEkOi8PrmFzxyG/ty57gF38FhiwtdrlUz+4vHvM7FX8mJOBNxGFWQJZnbPCYKiXf1Y0QKGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYwWhCEhx8HErteZpbon44cY9FEkcVCZwdINq3+dikE=;
 b=jOtSGeVpDeMHgUxyVeUUdydnIOg9FoGBuLCo1CBlmKzaViPBeyhNdZQEN9+KKplsxoD5jjMLXAMdTiOzU+W6DwYib3pBz0bIHunQyoU5XfPT8ETb8V25ceB09TL6sidMsqTm+cQes3WvwI2HFZ3o36mg0iM0hMrnI0jg0qdRBRdWOlVeoaorRrCdxObmTCflReW+g3rlr/f9d+A9MUAuaWAfxvkDYWp9wkHUfUqpaVrTA/dC1vSvSxi/p6FMduPjYZKdM0/4eQTYRWlk/Sdvpm3xOW64ltOMs/LLrkymKkpySkpbFu5wL2WNM8oABShyAKlCHVxGVLXQArF19kHGfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYwWhCEhx8HErteZpbon44cY9FEkcVCZwdINq3+dikE=;
 b=Qg8urmXAAz7q/xbnMuCxGSTg8t97aRVBPwcCq4wrQVsKoG52B83eGLHf51evcQ3QHO0cP7stE4wjXCXMz0EF3HGDmKK2k99erfI3KRF3bS3Iec3o9CgitOrX2fH2nCtSgOpb54V8XP1Uu0KmQHb5lxymw1Vz4n59j6KsXQAY63E=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4242.namprd12.prod.outlook.com (2603:10b6:a03:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Mon, 26 Apr
 2021 21:27:08 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 21:27:08 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 2/2] usb: dwc3: gadget: Handle DEV_TXF_FLUSH_BYPASS
 capability
Thread-Topic: [PATCH 2/2] usb: dwc3: gadget: Handle DEV_TXF_FLUSH_BYPASS
 capability
Thread-Index: AQHXN9JzuUdfe8dHBEm8i91M8RZevarBnu4AgAW3PoA=
Date:   Mon, 26 Apr 2021 21:27:08 +0000
Message-ID: <15c8cc72-0b74-d909-5149-13c71d7f577f@synopsys.com>
References: <cover.1619134559.git.Thinh.Nguyen@synopsys.com>
 <65c3070c666cd6b8beeee62d7f8e3e704ebf2d32.1619134559.git.Thinh.Nguyen@synopsys.com>
 <874kfxmszt.fsf@kernel.org>
In-Reply-To: <874kfxmszt.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37a82b56-ce0f-473a-2b3e-08d908fa0bfb
x-ms-traffictypediagnostic: BY5PR12MB4242:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB42425DB42D6A7386CE57BE26AA429@BY5PR12MB4242.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UZaFbCSnxAnja2GYJIVo+v4ryczlv3gz+jJMoT3bEjJOg9GOHC+dx+/iKPns5QfFLQ1dWAe1wdYIkXizzRvVN4qabDVsxt339hgrZXI5zPyJjFezZvsD3j7V7fbP/HSHoYPfCOhvGjajVy45GjPio9ZResINhszjZfA7orFNEwmXtljMyHpT4+MkHV8NSrmRBWc5zioELR+FYjZpLXw2pq99XSL0OUPszDIkmWI1lIEpWJ9o/O7zEVuwsjkd09GTGIuSYiaq8vEamnaTv9Mhei9tpdf9ZRTPJfTGKGkVBSlIyxbw+wFjMY5wa1JvHyPMhIp/fNDnduZGSYVkZ5fd5sMICTnZ9rijK3iLW0b0A7+dZO9sk5Rn6lsVGmXCK/Id4O/HSSCn2y2Euvj+V3/O5wwxelgbWq8ewDrAvqCHNrlhHIZPkEgWnBHgWCp9pbKCLjRHqLA3se1rzr1O74CPFWocdZkOiy4kNjXNNV4l3lf5TFw4EDbgdFwccsKVVLguhnYyLrIQK2+Fs6yOthwiahP1rstC4ah94Kw+VHGw4AlD5SNDTwOeOmTXyrqaOdcboDPB2uakoMKWubOcnp/N1phDrm+IijF2+aypam5o0HOySUO4VOH/7hbcZf8GUR55O4xUQFfobfQbWGFhBEKJ7HkSuQb7n8SbZJRe7eB1l+02NsA34TLrtS04foNL8gKF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(366004)(346002)(396003)(376002)(136003)(76116006)(316002)(4744005)(110136005)(2906002)(66556008)(66476007)(8936002)(8676002)(31696002)(478600001)(66446008)(64756008)(66946007)(5660300002)(6506007)(86362001)(38100700002)(122000001)(186003)(6512007)(26005)(71200400001)(107886003)(6486002)(31686004)(4326008)(2616005)(36756003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UjByZW1NTFE2SlBiUFFrT2t6YjlaaXM4L0UwR2dVRlJxbFphc0d1bGFwZkJC?=
 =?utf-8?B?WjFLZS9yZzd1TmJuMzJ3RGxxYjFNNzYrZEcrZEVUOVkrWHhuOFo3M0p2U25U?=
 =?utf-8?B?Yk9NV1lLaXNWbkRQNEpkakw2R2hIc0xnMU9BUlNnZDZtWUliSHZOK3l1Sld0?=
 =?utf-8?B?ZUVLa0xEZWRGYXA0akY0T0VQdXNJR1hCeUl1Yk1kVHg0RG9WK0RlV0tQU3JN?=
 =?utf-8?B?L1JYZllyWURhSTdHczhNK29PV0psZ1puaExPWFg2QkdjZFEyY3NHR3pna2li?=
 =?utf-8?B?cEg4YlE3cHNUL3NkWVdEZVpPM1ByUnQyTGVkVXI5elJDZWRxR2xFY2U3Skt6?=
 =?utf-8?B?VlVpaDgzaUxuN2kyMUYzNmw3Si9EUzd5cnFxS2xaSTYyUmF3c3lDbTNlYWN1?=
 =?utf-8?B?YW1FS3FHbTFBN2tRUFdSOFk0WlBhK3ZTRFlIbXM1TlE5bnY3MnEvNEtSNmUz?=
 =?utf-8?B?a1FmUTA1b0liVUhGVEc4bTFvdk1Qb2tjZ0Z0ZXpGU09ESW1DU2NlOUdXWC94?=
 =?utf-8?B?SHlCOUd3WW1Td1FESEt6UGs3NVlTR09QTktNcnI4aHJtajhPYm9NclNaazRW?=
 =?utf-8?B?bStPYlZobG1waDIwZEdhL0pNcHM5TFU5eGhrem1GYTJqYjZvb0p5dG1keW5Y?=
 =?utf-8?B?QmJxbndQN0xLMjVYTzVPdGZpKzJwaTFob1ZGL2xoYUVweHdiNGpLK2ErVXY0?=
 =?utf-8?B?ZmVkNDRKaFB1UFpWd0NNaGJUOHRrTzlJSTNnY0kxQTM0eFpGWFlvb0tyN2Zv?=
 =?utf-8?B?VTIxR0NkUWd3cW44NTNyQkpzNWZ2MFE0YjZnZEVtOGhJMmJTcVV2dVhremtB?=
 =?utf-8?B?eHdpdDEwVDJoODllQ1Y2cUtuTU5iTkVhanFlZWlmbE9IUjNsTXB5N3h5Uy9s?=
 =?utf-8?B?YTlORHZPNEV6blA5bytpYzQ3YnhlMkhuVmNBWTNvL3JHVWFMb2RXeE9NWk5k?=
 =?utf-8?B?NTYzb0VXMENqQUxteExBai84S1I5OGZJQTN4bmM4SEhTMEZ1SjVBcnpCQjg0?=
 =?utf-8?B?UmJXMGxnWXRJWmI4ZTEwQmpUL3JWOUp3cHFLajg2UmRsQ1NWQU1NRzRZU0Fr?=
 =?utf-8?B?MFgySlBFTFAvdW9ka3VrUU56d2FkSWpFN1VPeFZTdVNQbk52V2o2MHN6NVlL?=
 =?utf-8?B?bWFETnFncStwZ2VxT0ppQzFiK2lya0cwSDFyMERDR0xJZXBBNkk0YU9TNFRx?=
 =?utf-8?B?YmlOdURNbi9YeS9XM3ZOZHg3WnlwblZYZk5IU05ON1VZNEgyNjIwTm51T3Jh?=
 =?utf-8?B?S1B4ZU9tazFnc1d1NDVkeisrWEl3cjJJdTFISHk4c1kvMXoyTXFuMzI2bmRv?=
 =?utf-8?B?LzRxSXgvVHUrS2F3N0ZURHJQQVQxVlpSYmZmeWhXNURuVmdtUEhaTFR6UWtN?=
 =?utf-8?B?ZzVjL3hpdUtmMCtOL2RsWjRXbnBlSWhnTkF2YWdiYWVzcnpuWTRDOWpZUVZ3?=
 =?utf-8?B?UVduWlhXUGRZRWFpZzB5d2JsS3NIZlNMZGdNREpWM28rRktYK3RrcVBoVlZj?=
 =?utf-8?B?ZlIveVNFeHpqbms1WWZsNDZsV0NGYlYzNy9ZYUtCbkkvbDRDd0dia083U3NB?=
 =?utf-8?B?MnR2dlFsMkpITFF6TmtKRENlNG1TWTYxeVUzelBqTzFtbFVobVZ2dHduNjlS?=
 =?utf-8?B?alBQVDgxQ0xlbERYVW1tZS9pcW5tT3llOWdQVmdHNEVvZ0JyQlM3TUo5bncy?=
 =?utf-8?B?V1RvYk5IMkFGcDJpaUdhNXRqYW8rbWFkY0tEeVc1b1puRUVRRUhHQU1yYm1a?=
 =?utf-8?Q?Pl7Zkm0PmMpZcnCWNxcGfRh4HcorDAbmnT88IwJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7100293FC450A6498DE989CEBD24C60A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a82b56-ce0f-473a-2b3e-08d908fa0bfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2021 21:27:08.3932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VvcCh0s5vwB+LszXVUlLDWACv93JSsfTDPwaxYJpSAhpa3Vcr/z8WauRfGiNNsU1j8s7OVwTsHhwzZ2jLZJvXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4242
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RmVsaXBlIEJhbGJpIHdyb3RlOg0KPiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5
cy5jb20+IHdyaXRlczoNCj4gDQo+PiBEV0NfdXNiMzIgSVAgaW50cm9kdWNlcyBhIG5ldyBiZWhh
dmlvciB3aGVuIGhhbmRsaW5nIE5vU3RyZWFtIGV2ZW50IGZvcg0KPj4gSU4gZW5kcG9pbnRzLiBJ
ZiB0aGUgY29udHJvbGxlciBpcyBjYXBhYmxlIG9mIERFVl9UWEZfRkxVU0hfQllQQVNTLCB0aGVu
DQo+PiB0aGUgZHJpdmVyIGRvZXMgbm90IG5lZWQgdG8gZm9yY2UgdG8gcmVzdGFydCBzdHJlYW0g
Zm9yIElOIGVuZHBvaW50cy4NCj4+IFRoZSBjb250cm9sbGVyIHdpbGwgZ2VuZXJhdGUgRVJEWSBh
bmQgcmVzdGFydCB0aGUgc3RyZWFtIHBlcmlvZGljYWxseS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQo+IA0KPiBzbyB3ZSBz
dGlsbCBuZWVkIHRvIGZvcmNlIHJlc3RhcnQgZm9yIFJYPyBKdXN0IG1ha2luZyBzdXJlLiBPdGhl
ciB0aGFuDQo+IHRoYXQ6DQo+IA0KPiBBY2tlZC1ieTogRmVsaXBlIEJhbGJpIDxiYWxiaUBrZXJu
ZWwub3JnPg0KPiANCg0KWWVzLCBpdCdzIG9ubHkgZm9yIFR4LiBTYW1lIGJlaGF2aW9yIHJlbWFp
bnMgZm9yIFJ4LiBXZSBoYXZlIHNvbWUNCnVwZGF0ZXMgdG8gc2ltcGxpZnkgb3VyIGRlc2lnbiBo
YW5kbGluZyBUeCBkaXJlY3Rpb24uDQoNClRoYW5rcywNClRoaW5oDQo=
