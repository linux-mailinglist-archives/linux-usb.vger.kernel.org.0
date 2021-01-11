Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D21B42F22E0
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 23:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728062AbhAKWgQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 17:36:16 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:51416 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389544AbhAKWgP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jan 2021 17:36:15 -0500
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D7FFBC008A;
        Mon, 11 Jan 2021 22:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610404514; bh=VARPQ+21OtuOsb/dEc2+lWQMaKIrN1selO28txKh/aE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=F7xPeSXAbOy7XyxmSt0XkCuObuvykxAaXSvQFqUmZMqknqO/hecXBMOnexBfqrbY8
         ftk4Mf1MpiQxSsLCOTwhikLXnAjRxg6CpE06IvwJNDEZoPfwJNRe8l93WY6sYPLAPh
         NndJOm8fnimm+IvO7dHbZAEhh5FU11T8ShKVPaiBd81EfAELGScBA1KRh7YJOv127B
         BwIfv5uNZaa2NvglMCIsron156N5ftIbJ4z9i268xi7h/bq4+OrLVBHR+FQWAAHimQ
         O0ElcQoJeBSAlvaVd73s0Jk2J0AOhS1IGgEHbqK/6cXB6N35L0sqB8R40nHf/8VUq2
         sLfLpA0yU6eqA==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 88391A0082;
        Mon, 11 Jan 2021 22:35:11 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 59EE7802BD;
        Mon, 11 Jan 2021 22:35:09 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="bKHKdNFR";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvhXD6ZVCYOBAwDhKkV9PLNLLV8TR2v8ooJnpbPefkkEE6Qs+aoUVVQ7xXTVjOc1buBiI6zP93zq8knUgTPFomJn8Ab+To+1pVpJjZGVoVE08OY5abUblULNfp7TJ4CEQPWPppd2ePucmEp/eyh3saIk5XYJJLA+cmBtn3so5qqLLFGQavE4RP5Qs3AxwIeAw9gCfVnOmJSDLw15bIgDgs05gtxr/onppsbJBndx4sOk2LdNRGHSiYRS4JYiFfgJbQw6XWAmUGPS7IL2jeoWLHAYJuoALP7FMC16TQM2OP58M+VRz+eBYB9QdODIF91VXEEBrE0sjdmANvIVyeWkhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VARPQ+21OtuOsb/dEc2+lWQMaKIrN1selO28txKh/aE=;
 b=HkmG7xg+bp97XC2FLeOq9tZUo4bb8c5BnO0gxkBC80CgY79U3BXZf/bJ6cYiZIgnf8WcyslXCQgX6MPkA6wKK7ldOZXwoZXsgtENZubjtkfKVkvRqh5qPE1B4JNd2Jc5dUmCYSsW3hN4upmdXRnT4fgg4tfUkkA7Z68GDuTjPu6H4OJZdB2IJ49OnJSKKdSwsRkG9kFtvPA/dj0ftJYCZxfZMC6j38qI7DkdW25vO0bY+I8VILzwyNEq2rD1zemluf9qyZHYdNM/E5CyylW8cclBwLWzqRhABgoTgVB3dil5r/p3HTnnjURtFNiew2mHhiRh0EoyIhZzK8rNBtcF/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VARPQ+21OtuOsb/dEc2+lWQMaKIrN1selO28txKh/aE=;
 b=bKHKdNFRl+FMVDFYh7PXYK/Qovwjyt8D6+jLQ4AvK7V8pN38Adt9dSYQBWOX0vsZQvZdxtLDH99RGYMiSJnIjGz8loun261PUNxasgAEcPQah4H34o+RM+u+gaiXRZXlF1uyTFiO5cR2D5lyHwIfpwh2Boh9bMYxsLfMk/O5UdA=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3095.namprd12.prod.outlook.com (2603:10b6:a03:a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 22:35:07 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::895b:620d:8f20:c4d6%6]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 22:35:07 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>
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
Thread-Index: AQHW6Fn42t/s7d2V5ECRC4W61zuEWKoi8RqAgAAEU4CAAA3kAA==
Date:   Mon, 11 Jan 2021 22:35:07 +0000
Message-ID: <21c4feb3-a74b-3374-d401-438f1e62a477@synopsys.com>
References: <a7c4112fcd4dc2f0169af94a24f5685ca77f09fd.1610395599.git.Thinh.Nguyen@synopsys.com>
 <20210111212955.GA1209265@rowland.harvard.edu>
 <1e5bbddf-df52-d293-d27d-9cb034eadce8@synopsys.com>
In-Reply-To: <1e5bbddf-df52-d293-d27d-9cb034eadce8@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 8608246a-5fd8-4d68-244a-08d8b68125a3
x-ms-traffictypediagnostic: BYAPR12MB3095:
x-microsoft-antispam-prvs: <BYAPR12MB3095641219200436394226ADAAAB0@BYAPR12MB3095.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aA0wcVSJBgU71L77ahilQN7tSJQbGrgtlVwdi1NIyuOSpyhzKOyi2yJq+YM6ZtPnnWp8gJDWXGu5S6PM06kb8hRyQf4RJYQQUst1pRy0xpFaU7hvH5YhF4LpN4MKtcC7ToZH7/jCy8hkbNphfANlkY0QovxeTEY4Yi/bjFZ96oLjEwGcI368j4CzhFuJU0lXpndS7Uwc6ZpKUzT1EV0TWi67ZZFuc6TowQoVy3Jr7Du8Gm/Oiu8BmshqGEJMFQbPKy3noN6JyToShNuz0G/eFI+trQwaxWJKtQFTEmJsPZzrD5/PYoi+8wUuso/9qNl1sOCud5fgqHhWgGGpegbbaYMTdu2bGCF+u/kWgr/nDms9BbEcIFILi/rF9M3tJTSbxBT+4mTayEtNJ3qBYhaaN8KNwhoGjF85M0K1nZD06ZaOsthkNPeUk1FXGMz/z9D8jMDENkwJHrS+VZzjHZqeFfEnBaCuer3KGLRQmwktwTc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(136003)(39860400002)(376002)(346002)(8676002)(66446008)(2616005)(76116006)(478600001)(64756008)(71200400001)(66556008)(86362001)(54906003)(66476007)(66946007)(31686004)(83380400001)(31696002)(2906002)(6486002)(6916009)(6512007)(186003)(316002)(26005)(8936002)(4326008)(36756003)(5660300002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UWQ3T0JaaTQ3WDNGaXNLc3Q2eXArSFJKUkVxdUtXVWMxUnBXcDU2S08vTTg3?=
 =?utf-8?B?SkZncU5WUEU2TjJHSFRCTnFmOVJIN1hmN1BUU1dBTmtkaGJuNmVOUGdQVUdZ?=
 =?utf-8?B?Q3NPbWdRVUZSUG1vUk9CSFh4MVgrUUI1TTlrOERUbUJwQkhnUzJ1VmJFUFc1?=
 =?utf-8?B?bW9ib3p6MlJ0Y3Fqd3Jtd0NZbm9qMTZ4Qllla0dkeHNoY3B2YmlHNHF4dDhX?=
 =?utf-8?B?THZGc2ZtallzTTI0ZTNqd1NXY3I0d0hRdmk0d2RORTVjR1p6MENmc3ZzcGZ1?=
 =?utf-8?B?LzVtYitoOWVDWEJBQTgwRkFvbGNCZHUrakhkOFVOOXRCS1RoWmRtZU9CTGRq?=
 =?utf-8?B?dTdwTTFodVVjYThXdnMyR3M0ZHNaY1JtR29KTVVJZFlrWVoxbThNaTZYeVZC?=
 =?utf-8?B?MlJGOW4vWFN6aFdFOHFvRjh5czZYZXZSUmhHbmhybGUwZTNNajdPNU9Ebkt6?=
 =?utf-8?B?eXd5QjI2VGcyMzk1c3I3YkNqN1JjSzVjeGU4dGIwZ0F2eHFwdWxvWk1YVjlM?=
 =?utf-8?B?L2x0RkJaTzJXM3M5N05oUis3MDV6U2xwM3JNeWFlbUtKc20rM050UFhGL2tj?=
 =?utf-8?B?RlpqNE01bFdlTXRBVmxSQ0RlUmZOY3VWNndQZnZXTVZkK0RVeFUrQWN5VDVk?=
 =?utf-8?B?aWZnK3F0aVlVb3JYMnBUR2RPYkhyN0RCVDQraWZEenRjR1hOaWhEZ0R3cXVG?=
 =?utf-8?B?SHRndXdmQU9HZ2VoZGxkL2FnK24vc3ROZVdPbDQyL2ZJOFJTMWJ0dTlUUGNG?=
 =?utf-8?B?cDU1Y2NPbEZCdFpOMG12Yk12WGJ4N2RGWUNXUGVncTV6VXh5RWJmWGpXL0ZR?=
 =?utf-8?B?dGx4dGpScTVSdkFmMWVWYXFBcXk3VmZFa3RYSDZqaXpOZkJUaitoWEpnYnF6?=
 =?utf-8?B?cFpMMy9FU2d1RlluU3dCU2F2ekNOQ3BpbTlTN1o1LzkzSEhYN2drNHUwSUU4?=
 =?utf-8?B?S0Q0YkRoZXBXK2hnSXRjOS8rNWh3STJnZy9mL2tob3doYXU2RktidDFBaHcr?=
 =?utf-8?B?ajhFMmtvaW95R3FRbk1VZXVJZmFNU3FLZ3V3Y3BxTE9IQUtUU3ZCR3plK094?=
 =?utf-8?B?NmtmQU1vZkVlYlB6VUthNFA0RFZHZTN0Y0ZnUi9vVmtBZ3FzeXBBQjBRdUlU?=
 =?utf-8?B?RkVPclkwWXhtL2NrdWpFcE81akZhTXFlZXkyd1dESVBzMkJvV2VkUCtFYTZh?=
 =?utf-8?B?Mld3YlBZV0czWEhxKzA4a2VWbHNEUkQ3WHMyOTNFdGY0OUtobW80d3JXSHp4?=
 =?utf-8?B?dFdMem5hVGxBMXo3RlRYNHFjcGZGL1FiSkJtd3FORjFCYWFReXhVM2VBKzVh?=
 =?utf-8?Q?4VRrVIb0sN+w0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <08E3DEF6F4A00A499CEBDAAF01E4F5FF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8608246a-5fd8-4d68-244a-08d8b68125a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2021 22:35:07.0360
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CpoA/1f0rmjYQ16Wj/iRd8wrNgfq9ByZY/9ER9aYVxrYdo8ekwlACUNVN8wltxqEILb0SswekiAaGZQTiqQj7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3095
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VGhpbmggTmd1eWVuIHdyb3RlOg0KPiBIaSwNCj4NCj4gQWxhbiBTdGVybiB3cm90ZToNCj4+IE9u
IE1vbiwgSmFuIDExLCAyMDIxIGF0IDEyOjM4OjA1UE0gLTA4MDAsIFRoaW5oIE5ndXllbiB3cm90
ZToNCj4+PiBGb3Igc29tZSBVRENzLCB0aGUgaW5pdGlhbGl6YXRpb24gc2VxdWVuY2UgYnkgdWRj
X3N0YXJ0KCkgc2hvdWxkIG5vdCBiZQ0KPj4+IHJlcGVhdGVkIHVudGlsIGl0IGlzIHByb3Blcmx5
IGNsZWFuZWQgdXAgd2l0aCB1ZGNfc3RvcCgpIGFuZCB2aXNlIHZlcnNhLg0KPj4+IFdlIG1heSBy
dW4gaW50byBzb21lIGNsZWFudXAgZmFpbHVyZSBhcyBzZWVuIHdpdGggdGhlIERXQzMgZHJpdmVy
IGR1cmluZw0KPj4+IHRoZSBpcnEgY2xlYW51cC4gVGhpcyBpc3N1ZSBjYW4gb2NjdXIgd2hlbiB0
aGUgdXNlciB0cmlnZ2Vycw0KPj4+IHNvZnQtY29ubmVjdC9zb2Z0LWRpc2Nvbm5lY3QgZnJvbSB0
aGUgc29mdF9jb25uZWN0IHN5c2ZzLiBUbyBhdm9pZA0KPj4+IGFkZGluZyBjaGVja3MgdG8gZXZl
cnkgVURDIGRyaXZlciwgYXQgdGhlIFVEQyBmcmFtZXdvcmssIGludHJvZHVjZSBhDQo+Pj4gInN0
YXJ0ZWQiIHN0YXRlIHRvIHRyYWNrIGFuZCBwcmV2ZW50IHRoZSBVREMgZnJvbSByZXBlYXRpbmcg
dGhlDQo+Pj4gdWRjX3N0YXJ0KCkgYW5kIHVkY19zdG9wKCkgaWYgaXQgaGFkIGFscmVhZHkgc3Rh
cnRlZC9zdG9wcGVkLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogVGhpbmggTmd1eWVuIDxUaGlu
aC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KPj4gSXMgdGhlIG5ldyAic3RhcnRlZCIgZmllbGQgc3Vi
amVjdCB0byByYWNlcz8gIFdoYXQgaGFwcGVucyBpZiB0aGVyZSBhcmUgDQo+PiBjb25jdXJyZW50
IHJlcXVlc3RzIHRvIHN0YXJ0IGFuZCBzdG9wIHRoZSBVREM/DQo+Pg0KPj4gQWxhbiBTdGVybg0K
PiBUaGUgY2FsbGVyIG9mIHRoaXMgdXNiX2dhZGdldF91ZGNfc3RhcnQvc3RvcCgpIHNob3VsZCB0
YWtlIGNhcmUgb2YgdGhlDQo+IGxvY2tpbmcuIEl0J3MgYWxyZWFkeSBkb25lIGluIHRoZSBjYXNl
IG9mIGRyaXZlciBwcm9iZS9yZW1vdmUsIGJ1dCBub3QNCj4gZm9yIHRoZSBzeXNmcyBzb2Z0X2Nv
bm5lY3QuIE1heWJlIEkgc2hvdWxkIGFkZCB0aGF0IHRvIHRoaXMgcGF0Y2guDQo+DQoNCkFjdHVh
bGx5LCBJIHN0aWxsIHRoaW5rIHRoYXQgdGhlIGxvY2tpbmcgZm9yIHNvZnRfY29ubmVjdF9zdG9y
ZSgpIHNob3VsZA0KYmUgZG9uZSBpbiBhIHNlcGFyYXRlIHBhdGNoIHNpbmNlIHRoYXQncyBuZWVk
ZWQgdGhlcmUgcmVnYXJkbGVzcyB3aGV0aGVyDQp3ZSBpbnRyb2R1Y2VkIHRoaXMgbmV3IGZpZWxk
LiBMZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBhbnkgY29uY2Vybi4NCg0KVGhhbmtzLA0KVGhpbmgN
Cg0KDQo=
