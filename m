Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 844A130B61F
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 05:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbhBBD7S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 22:59:18 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:54586 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229872AbhBBD7Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Feb 2021 22:59:16 -0500
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 08BF2400A3;
        Tue,  2 Feb 2021 03:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612238296; bh=yOJdACjFw5iDEd78+fdLREou9FvhFE1W57JkFU2N4D0=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=VZ/WNiQX5C3nrN88syvYVQ5DotX6/z/dMTMcSYXyAj47DNiRFbTmPYbLj3ifQbeRe
         8HZfCDy6JqVWy3ZjViCz0pY1RtCJfK+NByUz22yE9z0MJQRWTmQVYEir/xanUm5eSG
         twEvtF81pSc24s0lASY01iz4SHupiR7HhupBxQkiNE+8LwmtSNWUI1oBq5QYagnQ7/
         hhG7kFGqeaeNI0e6MKECDsyQjP+b+3ONgxeoQr4KHrNFdLacxjyi4IkTEGOdOybndR
         Yf5kau19+T6dYb40LxK7GgJVtNLc8yUeYAyaiah342TnJUhADpkz9fPw5YqKaHFHH/
         iq+jfT8yyM8YQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 8C4E6A0077;
        Tue,  2 Feb 2021 03:58:12 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0CA54400A1;
        Tue,  2 Feb 2021 03:58:10 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="u+3oYWKp";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikbe7pEK+9x60TwpIrO5/xgzt0sFR/obVK8oc/hy0ZTT+p0WhEpCDDCYuv38NgHSbmpJwWFr6oaJegRfYhj/9f1M1jVk5kWn9KQfCMeI3etF35dNhJWI53ymEH+u5Y+8ZBZMSusz+GZYvJBxD7+bazmr/78uRXhEOH0IaxqX3oY8pK52IFqXbxPsqrLEPPQSxXpCrN0oIXee7FT7EGBsaAMlHs8yJ1HbBSC55dp/cG/tUY4uSeh4Of5wuu4dspYAM+DU+Nby9YmBeDCcDaJoNjKtxhkGx1pCqLyEm09SVNIZmwfmXA+SbUsHv/vXb50nrG0htE082fuakIyZgUeekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOJdACjFw5iDEd78+fdLREou9FvhFE1W57JkFU2N4D0=;
 b=XXkYc0I7k29ndr3YYHkaCj2rQol+3TjwD9afAl/Ancb1vgze7qVeoaqHCk0N3LPx9Vw68Ej/Mt2iy3l74jwymuYSM+s+m1pjUzEuEtW02Bs5G29EZRVXulGC+80jrFH5tAIF+4Ktgrwj8X9Uy12e7HVLqe8WAbv/lzleTPqUe1gHu+wxEkOxv4DISV7onWKVobzBirSbNV6EgCQ3VR1NtO8bzFkYASwxAEew75QteR1MhyIXfIBnIpUqUPbhIq4gZfm2hQvvl13W4NAQABhbIb1qJQWoJJRo3rWW/nQGTsNFi+hBf5F0J/z63y3WalNTasq3kseJm4FF/PjfcWpvkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOJdACjFw5iDEd78+fdLREou9FvhFE1W57JkFU2N4D0=;
 b=u+3oYWKpHguKB9Zdh8WywMfv3zQq2ZQLzSSjKO1ogV37dmAUyKkoOX1G+OB50GEleP9bVL1gacKcZn5R5de6l2QdRbX5wuLW+iGRUY3eynkrPbf8OIKNmEq76A7TsR9UruePsFF9QuYzJfM9xOZdPrD+9j3d8gdHGqo+REKUr4Q=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3206.namprd12.prod.outlook.com (2603:10b6:a03:130::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Tue, 2 Feb
 2021 03:58:09 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3805.026; Tue, 2 Feb 2021
 03:58:09 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Hardik Gajjar <hgajjar@de.adit-jv.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Allen Pais <allen.lkml@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        Romain Perier <romain.perier@gmail.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>
Subject: Re: [RFC PATCH 1/8] usb: core: Track SuperSpeed Plus GenXxY
Thread-Topic: [RFC PATCH 1/8] usb: core: Track SuperSpeed Plus GenXxY
Thread-Index: AQHW+RVroWeLopWkwkKWg6GgXLcWXKpEOxqAgAAB9YA=
Date:   Tue, 2 Feb 2021 03:58:08 +0000
Message-ID: <2d8ad81a-6f5e-4cd3-618d-8e6d943792f5@synopsys.com>
References: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
 <3ea65aec93bca0e4e44a786a5af5b669d8c6570d.1612237179.git.Thinh.Nguyen@synopsys.com>
 <3b486e82-fa5d-f39e-069e-7bae4424cb86@embeddedor.com>
In-Reply-To: <3b486e82-fa5d-f39e-069e-7bae4424cb86@embeddedor.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
authentication-results: embeddedor.com; dkim=none (message not signed)
 header.d=none;embeddedor.com; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 714730db-415a-44fd-776d-08d8c72ec0da
x-ms-traffictypediagnostic: BYAPR12MB3206:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3206A4FC9758F24FC5E4DDF6AAB59@BYAPR12MB3206.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 110T19e+yWB7cCJCwX9EeJmrNOMktvQQhLENGFIIZXbQeg2h6tWqj6X2+KZVv+muJ4IYjMJUKrP5x7yGhLrMRh4PXqncKQzfUma9atIVWk3byTYhnMcb/Gk+T8x0MYndNzCVPL7S1qhzDmt9L7nycYumUrXKP453wVMHgdGvunpeAWnOy3NfaAa87pFqK5IADIR54T/x+tFpAkipTOAQ6wq+q4Iqd7MMxba9RK+p8jEEswO11dOiowuv7CKjl2wcInMVopnhSviOr2/MLtamc3nXO3MtZAbtHAM77XG2o5PikNsC447pu7F8Y7mOSX4cgRmX2EBTPr80hNF/XInwbbMOG5FGfhRujgxnZwodYnwdFGCdJmzXbRLDffzjTsHfQEhDEchK5M69gDqR255EyzcYMxTgdvrdtFL4D2KR8TMKBMNk+w0JI1TDmD6FlV3r1+MX5Ow/u0GNmNtUzE7eJ9VuLwJMzGedZ0Bk6kTCQjncWl8fYBJgAmJI8e9w449QEPcyf3M8gn5v4shV5Joy6X82zpictyxbgRUiFJ68QTsl4/DAH6Cr2wnMzLCMFT0ycebe9ygbK29LLddtgmRijj4vZRhyqgblVYsccBncGRpXICwpKDtV58YL/q/6RPOl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(346002)(136003)(39860400002)(376002)(396003)(366004)(2616005)(66446008)(36756003)(7416002)(186003)(64756008)(76116006)(316002)(110136005)(8936002)(66946007)(8676002)(2906002)(478600001)(53546011)(31696002)(66556008)(26005)(31686004)(83380400001)(6506007)(71200400001)(6486002)(5660300002)(6512007)(86362001)(66476007)(921005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?bjAvbnhHeFRkSVZuTGJOazVYOVVIM2o2Z0NSQTREZnZxa0lKYjA1UzlxNVUr?=
 =?utf-8?B?MjhaaGJXblM3MDV0ck14ZzRCYit2QXo0bU52czZlVmtQQ0tiMnZJb2t6TEUx?=
 =?utf-8?B?ZjN3YlNYTFZ4YkNndHNlencwQWw2bG9nN1JCcVBxUzBOTGZHcWNNdmFVdUJt?=
 =?utf-8?B?bGVVTDhMVmpNWG5qTGdJM2lKaExReTBEMjUrRnZoa1lHRVlrVk9HZmIrai9Q?=
 =?utf-8?B?Ti92SkxEWlEvTkZyVVhrK3p6cnVXQ1ZqaHJCUkkxUitPS2xEMkRVUVYzT2x4?=
 =?utf-8?B?TFVYaGJoaisyOTdRNkdTNVZGZmNnekJJSVlrdEdyYWx6Y1FIOHp4aEVqQk1Q?=
 =?utf-8?B?aG16Ri9LYVUyYUVkYmxDYWNzRkNOWXJEZzFCVEhaZTBIWDJVcHFRT1cvbndi?=
 =?utf-8?B?eDRTb1Bib1RiOTBFL2ZVV29CbmNheFNSODBQYVIzQzJodWVlTDdEbE9MT3Bj?=
 =?utf-8?B?Sm1XVFVoc2VvZkIzdWF6dFZ2Vys1UDNJS1RCNVo5M0c5ME56WDVxb0dRbC9W?=
 =?utf-8?B?bGc0aTd2d2RMZXVyNUlrMksrZlR6aW9PMkxKWDdGUzl3KzRDZXMvdG81OXZy?=
 =?utf-8?B?eFlMdExiQkJvdCtVNDdBNElRUTJUWVNoRHVZNU1CSUlCY3NMckxlWmhtTmN4?=
 =?utf-8?B?blBhOXFGL054YmpsdVJITFJkRVpMUlYrdjM1RGpQdklXYjhLOEdMOWg5eWNo?=
 =?utf-8?B?b1dHYTBQMlh3d01SaW1ZVFRTdGdrUExOYmJnS1dFd3BEZ3NzMWpnTkRQWG5Q?=
 =?utf-8?B?QXlyNUlFeW01WkRVeFY3ZHFhZnJXVDBpcGRlOERGZnRGL2RLQ1dZN1EzeVZL?=
 =?utf-8?B?VGNPbHFQY0tCdTNsZzJYZElZL1pwNzF5alpkT3A1NUJPMkgwWjZaL2tGNllH?=
 =?utf-8?B?QXhub29zN2tZcHRrdnFvN0ZISVhnYjlJS3BuNUFmUkZ2d2xkWHdhaE9heVBr?=
 =?utf-8?B?SzA0V25OSWpaRDdWV1VJaXZsS21TWStRWEFhVlVuNDNLY0VlNllsZjZzL2Vk?=
 =?utf-8?B?NUxWbk14NG5sNFNTaWVvWEY0SjgrVEZXNS85MWUvdjBXbFRFY0ttVnRCNzNT?=
 =?utf-8?B?d1ZMS2JUdnlFZ0R4UzF4M1pjUWtsQWowbjNCN3BmVnJGa1I2a2RSQi9vSFBV?=
 =?utf-8?B?RW1rSXNBRHRZV3VaRzFYNm1GZkRMSTZ1N1R4bFJ4YXdVK3B1K1VIQUxQVzg0?=
 =?utf-8?B?N3AyYlFXTlg5eU5raFNtUHk5OHk3L1IzYngvaTNyR1Brc1BmVGNodWZXS2Mx?=
 =?utf-8?B?QmZzTmVHVW5mOE9OdEhRRHhGUUgzcE9EMmlzTEVLd3pyRzR6MnFwUTc0emlK?=
 =?utf-8?B?dHJlMFFSOS9OWUpJSzMwUklURnpZdWlYVWRpN3JoTHU5UEI1RnNySUU4b0Vs?=
 =?utf-8?B?NFcxOXplWXU2Y1hGdlVSY1hjeUYzZFZuL3BocjNIYmY1YWNaeDdPY3IvTjVH?=
 =?utf-8?Q?Uc5kFU47?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <92A246BE6DB97347A09271DF6FBD713B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714730db-415a-44fd-776d-08d8c72ec0da
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 03:58:08.9631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0xEOIO0KI9s76fTqfCiwo+eAdVVZHxM9/jfVbPYqIRJJK7qm472GSL/LPgzb+fp3Z0OG/HNz4qxGohPO5hMyEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3206
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

R3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToNCj4gSGksDQo+DQo+IE9uIDIvMS8yMSAyMTo0Miwg
VGhpbmggTmd1eWVuIHdyb3RlOg0KPj4gSW50cm9kdWNlIHNzcF9yYXRlIGZpZWxkIHRvIHVzYl9k
ZXZpY2Ugc3RydWN0dXJlIHRvIGNhcHR1cmUgdGhlDQo+PiBjb25uZWN0ZWQgU3VwZXJTcGVlZCBQ
bHVzIHNpZ25hbGluZyByYXRlIGdlbmVyYXRpb24gYW5kIGxhbmUgY291bnQgd2l0aA0KPj4gdGhl
IGNvcnJlc3BvbmRpbmcgdXNiX3NzcF9yYXRlIGVudW0uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
VGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KPj4gLS0tDQo+PiAgZHJp
dmVycy91c2IvY29yZS9oY2QuYyB8ICA2ICsrKy0NCj4+ICBkcml2ZXJzL3VzYi9jb3JlL2h1Yi5j
IHwgNzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgaW5j
bHVkZS9saW51eC91c2IuaCAgICB8ICAyICsrDQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCA4NSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L2NvcmUvaGNkLmMgYi9kcml2ZXJzL3VzYi9jb3JlL2hjZC5jDQo+PiBpbmRleCBhZDVhMGY0MDVh
NzUuLjU1ZGUwNGRmMzAyMiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdXNiL2NvcmUvaGNkLmMN
Cj4+ICsrKyBiL2RyaXZlcnMvdXNiL2NvcmUvaGNkLmMNCj4+IEBAIC0yNzIxLDYgKzI3MjEsNyBA
QCBpbnQgdXNiX2FkZF9oY2Qoc3RydWN0IHVzYl9oY2QgKmhjZCwNCj4+ICANCj4+ICAJcmhkZXYt
PnJ4X2xhbmVzID0gMTsNCj4+ICAJcmhkZXYtPnR4X2xhbmVzID0gMTsNCj4+ICsJcmhkZXYtPnNz
cF9yYXRlID0gVVNCX1NTUF9HRU5fVU5LTk9XTjsNCj4+ICANCj4+ICAJc3dpdGNoIChoY2QtPnNw
ZWVkKSB7DQo+PiAgCWNhc2UgSENEX1VTQjExOg0KPj4gQEAgLTI3MzgsOCArMjczOSwxMSBAQCBp
bnQgdXNiX2FkZF9oY2Qoc3RydWN0IHVzYl9oY2QgKmhjZCwNCj4+ICAJY2FzZSBIQ0RfVVNCMzI6
DQo+PiAgCQlyaGRldi0+cnhfbGFuZXMgPSAyOw0KPj4gIAkJcmhkZXYtPnR4X2xhbmVzID0gMjsN
Cj4+IC0JCWZhbGx0aHJvdWdoOw0KPj4gKwkJcmhkZXYtPnNzcF9yYXRlID0gVVNCX1NTUF9HRU5f
MngyOw0KPj4gKwkJcmhkZXYtPnNwZWVkID0gVVNCX1NQRUVEX1NVUEVSX1BMVVM7DQo+PiArCQli
cmVhazsNCj4+ICAJY2FzZSBIQ0RfVVNCMzE6DQo+PiArCQlyaGRldi0+c3NwX3JhdGUgPSBVU0Jf
U1NQX0dFTl8yeDE7DQo+PiAgCQlyaGRldi0+c3BlZWQgPSBVU0JfU1BFRURfU1VQRVJfUExVUzsN
Cj4+ICAJCWJyZWFrOw0KPj4gIAlkZWZhdWx0Og0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L2NvcmUvaHViLmMgYi9kcml2ZXJzL3VzYi9jb3JlL2h1Yi5jDQo+PiBpbmRleCA3ZjcxMjE4Y2Mx
ZTUuLmU3OGIyZGQ3ODAxYSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdXNiL2NvcmUvaHViLmMN
Cj4+ICsrKyBiL2RyaXZlcnMvdXNiL2NvcmUvaHViLmMNCj4+IEBAIC0zMSw2ICszMSw3IEBADQo+
PiAgI2luY2x1ZGUgPGxpbnV4L3BtX3Fvcy5oPg0KPj4gICNpbmNsdWRlIDxsaW51eC9rb2JqZWN0
Lmg+DQo+PiAgDQo+PiArI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+DQo+PiAgI2luY2x1ZGUg
PGxpbnV4L3VhY2Nlc3MuaD4NCj4+ICAjaW5jbHVkZSA8YXNtL2J5dGVvcmRlci5oPg0KPj4gIA0K
Pj4gQEAgLTI2NjgsNiArMjY2OSw4MSBAQCBpbnQgdXNiX2F1dGhvcml6ZV9kZXZpY2Uoc3RydWN0
IHVzYl9kZXZpY2UgKnVzYl9kZXYpDQo+PiAgCXJldHVybiByZXN1bHQ7DQo+PiAgfQ0KPj4gIA0K
Pj4gKy8qKg0KPj4gKyAqIGdldF9wb3J0X3NzcF9yYXRlIC0gTWF0Y2ggdGhlIGV4dGVuZGVkIHBv
cnQgc3RhdHVzIHRvIFNTUCByYXRlDQo+PiArICogQGhkZXY6IFRoZSBodWIgZGV2aWNlDQo+PiAr
ICogQGV4dF9wb3J0c3RhdHVzOiBleHRlbmRlZCBwb3J0IHN0YXR1cw0KPj4gKyAqDQo+PiArICog
TWF0Y2ggdGhlIGV4dGVuZGVkIHBvcnQgc3RhdHVzIHNwZWVkIGlkIHRvIHRoZSBTdXBlclNwZWVk
IFBsdXMgc3VibGluayBzcGVlZA0KPj4gKyAqIGNhcGFiaWxpdHkgYXR0cmlidXRlcy4gQmFzZSBv
biB0aGUgbnVtYmVyIG9mIGNvbm5lY3RlZCBsYW5lcyBhbmQgc3BlZWQsDQo+PiArICogcmV0dXJu
IHRoZSBjb3JyZXNwb25kaW5nIGVudW0gdXNiX3NzcF9yYXRlLg0KPj4gKyAqLw0KPj4gK3N0YXRp
YyBlbnVtIHVzYl9zc3BfcmF0ZSBnZXRfcG9ydF9zc3BfcmF0ZShzdHJ1Y3QgdXNiX2RldmljZSAq
aGRldiwNCj4+ICsJCQkJCSAgIHUzMiBleHRfcG9ydHN0YXR1cykNCj4+ICt7DQo+PiArCXN0cnVj
dCB1c2Jfc3NwX2NhcF9kZXNjcmlwdG9yICpzc3BfY2FwID0gaGRldi0+Ym9zLT5zc3BfY2FwOw0K
Pj4gKwl1MzIgYXR0cjsNCj4+ICsJdTggc3BlZWRfaWQ7DQo+PiArCXU4IHNzYWM7DQo+PiArCXU4
IGxhbmVzOw0KPj4gKwlpbnQgaTsNCj4+ICsNCj4+ICsJaWYgKCFzc3BfY2FwKQ0KPj4gKwkJZ290
byBvdXQ7DQo+PiArDQo+PiArCXNwZWVkX2lkID0gZXh0X3BvcnRzdGF0dXMgJiBVU0JfRVhUX1BP
UlRfU1RBVF9SWF9TUEVFRF9JRDsNCj4+ICsJbGFuZXMgPSBVU0JfRVhUX1BPUlRfUlhfTEFORVMo
ZXh0X3BvcnRzdGF0dXMpICsgMTsNCj4+ICsNCj4+ICsJc3NhYyA9IGxlMzJfdG9fY3B1KHNzcF9j
YXAtPmJtQXR0cmlidXRlcykgJg0KPj4gKwkJVVNCX1NTUF9TVUJMSU5LX1NQRUVEX0FUVFJJQlM7
DQo+PiArDQo+PiArCWZvciAoaSA9IDA7IGkgPD0gc3NhYzsgaSsrKSB7DQo+IFdoeSBhIGxlc3Mg
dGhhbiBvciBlcXVhbCB0byBjb21wYXJpc29uIGhlcmU/DQo+IFdoeSBub3QganVzdCBhIGxlc3Mg
dGhhbiBjb21wYXJpc29uIChpIDwgc3NhYykgPw0KPg0KPiBUaGFua3MNCj4gLS0NCj4gR3VzdGF2
bw0KDQpUaGUgU1NBQyBoZXJlIG1hdGNoZXMgd2l0aCB0aGUgU1NBQyAoU3VibGluayBTcGVlZCBB
dHRyaWJ1dGUgQ291bnQpIGZyb20NCnRoZSBVU0IgMy4yIHNwZWMuIEl0J3MgemVybyBiYXNlZC4g
RS5nLiBzbyBTU0FDIG9mIDMgaXMgNCBudW1iZXIgb2YNClN1YmxpbmsgU3BlZWQgQXR0cmlidXRl
cy4gVGhhdCdzIHdoeSAiPD0iLg0KDQpUaGluaA0KDQo+DQo+PiArCQl1OCBzc2lkOw0KPj4gKw0K
Pj4gKwkJYXR0ciA9IGxlMzJfdG9fY3B1KHNzcF9jYXAtPmJtU3VibGlua1NwZWVkQXR0cltpXSk7
DQo+PiArCQlzc2lkID0gRklFTERfR0VUKFVTQl9TU1BfU1VCTElOS19TUEVFRF9TU0lELCBhdHRy
KTsNCj4+ICsJCWlmIChzcGVlZF9pZCA9PSBzc2lkKSB7DQo+PiArCQkJdTE2IG1hbnRpc3NhOw0K
Pj4gKwkJCXU4IGxzZTsNCj4+ICsJCQl1OCB0eXBlOw0KPj4gKw0KPj4gKwkJCS8qDQo+PiArCQkJ
ICogTm90ZTogY3VycmVudGx5IGFzeW1tZXRyaWMgbGFuZSB0eXBlcyBhcmUgb25seQ0KPj4gKwkJ
CSAqIGFwcGxpY2FibGUgZm9yIFNTSUMgb3BlcmF0ZSBpbiBTdXBlclNwZWVkIHByb3RvY29sDQo+
PiArCQkJICovDQo+PiArCQkJdHlwZSA9IEZJRUxEX0dFVChVU0JfU1NQX1NVQkxJTktfU1BFRURf
U1QsIGF0dHIpOw0KPj4gKwkJCWlmICh0eXBlID09IFVTQl9TU1BfU1VCTElOS19TUEVFRF9TVF9B
U1lNX1JYIHx8DQo+PiArCQkJICAgIHR5cGUgPT0gVVNCX1NTUF9TVUJMSU5LX1NQRUVEX1NUX0FT
WU1fVFgpDQo+PiArCQkJCWdvdG8gb3V0Ow0KPj4gKw0KPj4gKwkJCWlmIChGSUVMRF9HRVQoVVNC
X1NTUF9TVUJMSU5LX1NQRUVEX0xQLCBhdHRyKSAhPQ0KPj4gKwkJCSAgICBVU0JfU1NQX1NVQkxJ
TktfU1BFRURfTFBfU1NQKQ0KPj4gKwkJCQlnb3RvIG91dDsNCj4+ICsNCj4+ICsJCQlsc2UgPSBG
SUVMRF9HRVQoVVNCX1NTUF9TVUJMSU5LX1NQRUVEX0xTRSwgYXR0cik7DQo+PiArCQkJbWFudGlz
c2EgPSBGSUVMRF9HRVQoVVNCX1NTUF9TVUJMSU5LX1NQRUVEX0xTTSwgYXR0cik7DQo+PiArDQo+
PiArCQkJLyogQ29udmVydCB0byBHYnBzICovDQo+PiArCQkJZm9yICg7IGxzZSA8IFVTQl9TU1Bf
U1VCTElOS19TUEVFRF9MU0VfR0JQUzsgbHNlKyspDQo+PiArCQkJCW1hbnRpc3NhIC89IDEwMDA7
DQo+PiArDQo+PiArCQkJaWYgKG1hbnRpc3NhID49IDEwICYmIGxhbmVzID09IDEpDQo+PiArCQkJ
CXJldHVybiBVU0JfU1NQX0dFTl8yeDE7DQo+PiArDQo+PiArCQkJaWYgKG1hbnRpc3NhID49IDEw
ICYmIGxhbmVzID09IDIpDQo+PiArCQkJCXJldHVybiBVU0JfU1NQX0dFTl8yeDI7DQo+PiArDQo+
PiArCQkJaWYgKG1hbnRpc3NhID49IDUgJiYgbGFuZXMgPT0gMikNCj4+ICsJCQkJcmV0dXJuIFVT
Ql9TU1BfR0VOXzF4MjsNCj4+ICsNCj4+ICsJCQlnb3RvIG91dDsNCj4+ICsJCX0NCj4+ICsJfQ0K
Pj4gKw0KPj4gK291dDoNCj4+ICsJcmV0dXJuIFVTQl9TU1BfR0VOX1VOS05PV047DQo+PiArfQ0K
Pj4gKw0KPj4gIC8qDQo+PiAgICogUmV0dXJuIDEgaWYgcG9ydCBzcGVlZCBpcyBTdXBlclNwZWVk
UGx1cywgMCBvdGhlcndpc2UNCj4+ICAgKiBjaGVjayBpdCBmcm9tIHRoZSBsaW5rIHByb3RvY29s
IGZpZWxkIG9mIHRoZSBjdXJyZW50IHNwZWVkIElEIGF0dHJpYnV0ZS4NCj4+IEBAIC0yODUwLDkg
KzI5MjYsMTEgQEAgc3RhdGljIGludCBodWJfcG9ydF93YWl0X3Jlc2V0KHN0cnVjdCB1c2JfaHVi
ICpodWIsIGludCBwb3J0MSwNCj4+ICAJCS8qIGV4dGVuZGVkIHBvcnRzdGF0dXMgUnggYW5kIFR4
IGxhbmUgY291bnQgYXJlIHplcm8gYmFzZWQgKi8NCj4+ICAJCXVkZXYtPnJ4X2xhbmVzID0gVVNC
X0VYVF9QT1JUX1JYX0xBTkVTKGV4dF9wb3J0c3RhdHVzKSArIDE7DQo+PiAgCQl1ZGV2LT50eF9s
YW5lcyA9IFVTQl9FWFRfUE9SVF9UWF9MQU5FUyhleHRfcG9ydHN0YXR1cykgKyAxOw0KPj4gKwkJ
dWRldi0+c3NwX3JhdGUgPSBnZXRfcG9ydF9zc3BfcmF0ZShodWItPmhkZXYsIGV4dF9wb3J0c3Rh
dHVzKTsNCj4+ICAJfSBlbHNlIHsNCj4+ICAJCXVkZXYtPnJ4X2xhbmVzID0gMTsNCj4+ICAJCXVk
ZXYtPnR4X2xhbmVzID0gMTsNCj4+ICsJCXVkZXYtPnNzcF9yYXRlID0gVVNCX1NTUF9HRU5fVU5L
Tk9XTjsNCj4+ICAJfQ0KPj4gIAlpZiAoaHViX2lzX3d1c2IoaHViKSkNCj4+ICAJCXVkZXYtPnNw
ZWVkID0gVVNCX1NQRUVEX1dJUkVMRVNTOw0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
dXNiLmggYi9pbmNsdWRlL2xpbnV4L3VzYi5oDQo+PiBpbmRleCA3ZDcyYzRlMDcxM2MuLmMzMzQz
ODdmOTUwZSAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvbGludXgvdXNiLmgNCj4+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvdXNiLmgNCj4+IEBAIC01NjAsNiArNTYwLDcgQEAgc3RydWN0IHVzYjNfbHBt
X3BhcmFtZXRlcnMgew0KPj4gICAqIEBzcGVlZDogZGV2aWNlIHNwZWVkOiBoaWdoL2Z1bGwvbG93
IChvciBlcnJvcikNCj4+ICAgKiBAcnhfbGFuZXM6IG51bWJlciBvZiByeCBsYW5lcyBpbiB1c2Us
IFVTQiAzLjIgYWRkcyBkdWFsLWxhbmUgc3VwcG9ydA0KPj4gICAqIEB0eF9sYW5lczogbnVtYmVy
IG9mIHR4IGxhbmVzIGluIHVzZSwgVVNCIDMuMiBhZGRzIGR1YWwtbGFuZSBzdXBwb3J0DQo+PiAr
ICogQHNzcF9yYXRlOiBTdXBlclNwZWVkIFBsdXMgcGh5IHNpZ25hbGluZyByYXRlIGFuZCBsYW5l
IGNvdW50DQo+PiAgICogQHR0OiBUcmFuc2FjdGlvbiBUcmFuc2xhdG9yIGluZm87IHVzZWQgd2l0
aCBsb3cvZnVsbCBzcGVlZCBkZXYsIGhpZ2hzcGVlZCBodWINCj4+ICAgKiBAdHRwb3J0OiBkZXZp
Y2UgcG9ydCBvbiB0aGF0IHR0IGh1Yg0KPj4gICAqIEB0b2dnbGU6IG9uZSBiaXQgZm9yIGVhY2gg
ZW5kcG9pbnQsIHdpdGggKFswXSA9IElOLCBbMV0gPSBPVVQpIGVuZHBvaW50cw0KPj4gQEAgLTYz
Niw2ICs2MzcsNyBAQCBzdHJ1Y3QgdXNiX2RldmljZSB7DQo+PiAgCWVudW0gdXNiX2RldmljZV9z
cGVlZAlzcGVlZDsNCj4+ICAJdW5zaWduZWQgaW50CQlyeF9sYW5lczsNCj4+ICAJdW5zaWduZWQg
aW50CQl0eF9sYW5lczsNCj4+ICsJZW51bSB1c2Jfc3NwX3JhdGUJc3NwX3JhdGU7DQo+PiAgDQo+
PiAgCXN0cnVjdCB1c2JfdHQJKnR0Ow0KPj4gIAlpbnQJCXR0cG9ydDsNCj4+DQoNCg==
