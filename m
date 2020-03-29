Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6813F19711D
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 01:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbgC2Xo2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Mar 2020 19:44:28 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:53632 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726403AbgC2Xo2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Mar 2020 19:44:28 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9B97B40181;
        Sun, 29 Mar 2020 23:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585525467; bh=V0QRwQvFRuYrYVs6thIjt0sHjFW7EfmnSyPgTwChQxQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=WJe4Ba/HgPEm5dYdjS+kS8kxZ+EIo84KgboAl18gcQB9liVQWPxzY1kO+wFNYW2zL
         lnVXNDXjNlws7688uDTKx92lrvnMqgtuRHnW5DfizBAz094sqdzHEkH6t5iW9zYYJo
         w2YBNUkd/8y4NpVIXdWuQfgJd004oBApvNgy7G6MozmLt3p2Sxx+hJvjoqExgtFAhj
         srVj7dwXHUxiF7eTlAC38TccpqSRIf6a5D0KVL0cwYiLQrVmGaT8QJi0ZGdhHJ/Dct
         1tAQBS0R7EK2NaAGH+2c2h/Q1hAaqH/GfYY/WoLcndEd1gg2hPJuK6dJLWgSGTOt41
         g9dDHrwLzwIaA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 57690A006F;
        Sun, 29 Mar 2020 23:44:27 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Sun, 29 Mar 2020 16:44:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Sun, 29 Mar 2020 16:44:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMWbzQZljWDkl1H83bOci8o9lEZlrwS4A+t6/+qY9RF1HAbC7GYGpZ7WMHhuSGdNE5SoZO9tsbaafYOhIiveqiOP4OrAlwxKgCnxinMVU4n8+2snBiZak2rKyNiAvJupAW9iW5twieyOFP31EXcDJZ3hqIWhCcqQA4SD6dGBq2fBZ6Flq/02ZOrzxTghWu3oHCuyRReu5T62/Qa9UFO0fiq985GRp3ZRMzJCUR+6pQL3c3YPOAP6/8IEyx8dzjJz8kv5CAcS31EWsjU1tJORpNEsoN8yUryl5oAoMMa2wlOZM6j4syMxMuxTYkyXVgc+YgiiFLkH5J9oIhAqQFTlKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0QRwQvFRuYrYVs6thIjt0sHjFW7EfmnSyPgTwChQxQ=;
 b=BtpnPb4NVnBiBIchrBG9UtjPo16emrX6h6SCimGh8Yf/tHnaQrkDeRRYH6zqBdCGPX0qfe8K/Pl4qKbA8YURY6AGySx6Vxqf0o78BxcxRi3esNWsHGWZ6vn1iXTho4Vtu/lOJXJ+ibRUsYdZ/u8BvYSdzQIxVcW1Wbf1fI6OG/Xe5v5CGgWKAachNZAYnWTE3bYNN+wq5ahLLDrRMPs4EoTwzxTX8DgteQ+2Pk6XkUyo7gPqdxVtnlV7AZNS4c6OthILLMECBV+zHlHjMw/+TlUv9y2wO+kDxpJwzC+1pka5CGK11mU7Awn+QpCKt9hXUCZCh0eYMeV3ga+88j50ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0QRwQvFRuYrYVs6thIjt0sHjFW7EfmnSyPgTwChQxQ=;
 b=GKhdHfsGLw+6VgkBt2WhF6IQHFUgdCFBXEbzE1/289pjbUHnaXWVOYm8eNO3IsErfSbwEdYFNtcoBD0xOWKItoK64UBITxAZDRvusAw4Ry2Jn5QEd/uexRQe9ccQf8l7iSl2MR+QzDafih1Y/8y2qMYHLBVWLYUmZAZ3hmzsGLA=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB3048.namprd12.prod.outlook.com (2603:10b6:a03:ad::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Sun, 29 Mar
 2020 23:44:24 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2856.019; Sun, 29 Mar 2020
 23:44:24 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Remove incomplete check
Thread-Topic: [PATCH] usb: dwc3: gadget: Remove incomplete check
Thread-Index: AQHV82muQmX55NMUl0emMsblflREJqhJbrQAgAD/cgCAAGwZAIAA5GqAgBObrwCAAQbKAA==
Date:   Sun, 29 Mar 2020 23:44:24 +0000
Message-ID: <eca2ea69-89dc-3ccc-b280-c1b080ad263f@synopsys.com>
References: <660a74249e64b3b62ca9b394584387baee67a119.1583466150.git.thinhn@synopsys.com>
 <87d09ef01l.fsf@kernel.org>
 <df600201-0063-bb5f-19be-ecbeaada37f0@synopsys.com>
 <87blow239f.fsf@kernel.org>
 <9a2504a3-6a89-39f2-3a9c-9ee933903d8e@synopsys.com>
 <87v9mn37vb.fsf@kernel.org>
In-Reply-To: <87v9mn37vb.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b30b72b8-3a6d-49b3-2af6-08d7d43b1cdf
x-ms-traffictypediagnostic: BYAPR12MB3048:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB304870A716B88D5C88953CADAACA0@BYAPR12MB3048.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 035748864E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2710.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(396003)(366004)(39840400004)(346002)(376002)(136003)(86362001)(31696002)(6506007)(110136005)(186003)(66446008)(107886003)(81166006)(64756008)(81156014)(76116006)(2616005)(66476007)(5660300002)(316002)(4326008)(8936002)(31686004)(66556008)(26005)(6512007)(66946007)(2906002)(6486002)(8676002)(478600001)(71200400001)(36756003);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vU4f0lc6AKV8ZuEA/1x8clMQ5u1tBXBud9sDBte9gmcdnnkR3QOBy5OLRlRmQp4fvtVDnisoZRin6A9SCDJtv0m7+htXKm6Ko6XpBRi+TgmNiJy1P2U54ja94P5p4Kh9aFC+XT2tS0JUWT1G/rwvPloGmLtj2QePF9WN5MtpFiLhzDRuOyU9c36uRE7EGiRlqGwDjfxyQX/WkfxLKt69YhK5DoWJZPL3RMK0DEW7PO9GTj0g7cOnkBqPw4qfyEGtfwCg/EzodUyINtnfVVGZAAezX9nS6hXOmwBm3tYP4dgzwSuc0M3SebNPDVBlP6Dh+KKCNQte3JqSvzX+vGltdnIoFD+L+kFNTY+jhroRerOjttL9dxNBIBYmKyvtuKSBvnXTzeCVEGh9Gx5rd9cMXlkaAJnVek6ovLffiJDRzld3Gv7XoEG6xWcGDl7dbfZy
x-ms-exchange-antispam-messagedata: fEsDkETMOxE5wpxA3/fvhx3uI9BYAWaDaBKekyN2eNAX4OpqeSkS1GDAMdAwVkfQfTw+p8aaoJYs6g6/bc8OWotXiNZ991WoSP8Jp3qkbB1Dun2gfEEI/frwB1/Hj0Ycx+MLPRM5/4KXuiY402qw1Q==
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F38FD5F453D64439F427430340271EB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b30b72b8-3a6d-49b3-2af6-08d7d43b1cdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2020 23:44:24.7112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vypHOlOYTZ6bU8ZZ8UXHMcl+0Gy+f/wprF0MWIUyV+5UvQFBeA/QCj7Xf19CaTQSwe+HoNo8p7XE2wyn1a/xaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3048
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmVsaXBlLA0KDQpGZWxpcGUgQmFsYmkgd3JvdGU6DQo+IEhpLA0KPg0KPiBUaGluaCBOZ3V5
ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+IHdyaXRlczoNCj4+PiBPbmUgdGhpbmcgSSBk
b24ndCBnZXQgZnJvbSB5b3VyIHBhdGNoIGlzIHdoeSB5b3UncmUgY29tcGxldGVseSByZW1vdmlu
Zw0KPj4+IHRoZSBmdW5jdGlvbiBhbmQgd2h5IGlzbid0IHJlcS0+ZGlyZWN0aW9uIGFuZCBhY3R1
YWwgPT0gbGVuZ3RoIG5vdA0KPj4+IG5lZWRlZCBhbnltb3JlLiBDb3VsZCB5b3UgZXhwbGFpbj8N
Cj4+IEl0J3MgYmVjYXVzZSB0aGVyZSdzIG5vIHVzZSBmb3IgdGhhdCBmdW5jdGlvbiBvdXRzaWRl
IG9mIGNoZWNraW5nIGZvcg0KPj4gbnVtYmVyIG9mIHBlbmRpbmcgU0dzIGFuZCByZXN1bWUuDQo+
IHdhaXQsIGh1aD8gV2hhdCBhYm91dCBjYXNlcyB3aGVuIHVzZXIgdW5wbHVncyBjYWJsZSBtaWR0
cmFuc2Zlcj8gV2UgaGF2ZQ0KPiB2ZXJzaW9ucyBvZiBkd2MzIEhXIHdoaWNoIGZhaWwgdG8gcHJv
ZHVjZSBkaXNjb25uZWN0IGludGVycnVwdCwgcmlnaHQ/DQoNClRoZXJlIHdvbid0IGV2ZW4gZW50
ZXIgdGhpcyBjb2RlIHBhdGggaWYgZGlzY29ubmVjdCBldmVudCBpcyBnZW5lcmF0ZWQgDQpvciBu
b3QuDQoNCj4NCj4+PiBAQCAtMjQ5MSw2ICsyNDkyLDE2IEBAIHN0YXRpYyBib29sIGR3YzNfZ2Fk
Z2V0X2VwX3JlcXVlc3RfY29tcGxldGVkKHN0cnVjdCBkd2MzX3JlcXVlc3QgKnJlcSkNCj4+PiAg
ICAJaWYgKCFyZXEtPmRpcmVjdGlvbikNCj4+PiAgICAJCXJldHVybiB0cnVlOw0KPj4+ICAgIA0K
Pj4+ICsJLyoNCj4+PiArCSAqIElmIHRoZXJlIGFyZSBwZW5kaW5nIHNjYXR0ZXJsaXN0IGVudHJp
ZXMsIHdlIHNob3VsZA0KPj4+ICsJICogY29udGludWUgcHJvY2Vzc2luZyB0aGVtLg0KPj4+ICsJ
ICovDQo+Pj4gKwlpZiAocmVxLT5udW1fcGVuZGluZ19zZ3MpDQo+Pj4gKwkJcmV0dXJuIGZhbHNl
Ow0KPj4+ICsNCj4+PiArCWlmICh1c2JfZW5kcG9pbnRfeGZlcl9pc29jKGRlcC0+ZW5kcG9pbnQu
ZGVzYykpDQo+Pj4gKwkJZG9fc29tZXRoaW5nKCk7DQo+PiBkb19zb21ldGhpbmcoKSB3aWxsIGFs
d2F5cyByZXR1cm4gdHJ1ZSBoZXJlLg0KPiBXaWxsIGRvICJkb19zb21ldGhpbmciLCB0aGVuIHJl
dHVybiB0cnVlIG9yIHNpbXBseSByZXR1cm4gdHJ1ZT8NCg0KSSBtZWFuIHNpbXBseSByZXR1cm4g
dHJ1ZSBoZXJlLg0KDQo+DQo+Pj4gICAgCXJldHVybiByZXEtPnJlcXVlc3QuYWN0dWFsID09IHJl
cS0+cmVxdWVzdC5sZW5ndGg7DQo+PiBUaGlzIHNob3VsZCBhbHdheXMgYmUgdHJ1ZSBpZiB0aGUg
cmVxdWVzdCBjb21wbGV0ZXMuIEJ5IHNwZWMsIGJ1bGsgYW5kDQo+PiBpbnRlcnJ1cHQgZW5kcG9p
bnRzIGRhdGEgZGVsaXZlcnkgYXJlIGd1YXJhbnRlZWQsIGFuZCB0aGUgcmV0cnkvZXJyb3INCj4+
IGRldGVjdGlvbiBpcyBkb25lIGF0IHRoZSBsb3dlciBsZXZlbC7CoCBJZiBieSBjaGFuY2UgdGhh
dCB0aGUgaG9zdCBmYWlscw0KPj4gdG8gcmVxdWVzdCBmb3IgZGF0YSBtdWx0aXBsZSB0aW1lcyBh
dCB0aGUgcGFja2V0IGxldmVsLCBpdCB3aWxsIGlzc3VlIGENCj4+IENsZWFyRmVhdHVyZShoYWx0
X2VwKSByZXF1ZXN0IHRvIHRoZSBlbmRwb2ludC4gVGhpcyB3aWxsIHRyaWdnZXIgZHdjMyB0bw0K
Pj4gc3RvcCB0aGUgZW5kcG9pbnQgYW5kIGNhbmNlbCB0aGUgdHJhbnNmZXIsIGFuZCB3ZSBzdGls
bCB3b24ndCByZXN1bWUNCj4+IHRoaXMgdHJhbnNmZXIuDQo+IHdlIGNhbiB1bnBsdWcgdGhlIGNh
YmxlIGF0IGFueSB0aW1lLCBldmVuIG1pZC10cmFuc2Zlci4NCj4NCg0KVGhhdCdzIGZpbmUgaWYg
dGhlcmUncyBhIGRpc2Nvbm5lY3Rpb24gbWlkLXRyYW5zZmVyLiBUaGUgdHJhbnNmZXIgaXMgDQpj
YW5jZWxsZWQgaW4gdGhhdCBjYXNlLCB3aHkgd291bGQgd2Ugd2FudCB0byBraWNrX3RyYW5zZmVy
IGFnYWluPyBBbHNvLCANCnRoZSBjb250cm9sbGVyIHdvdWxkIG5vdCBnZW5lcmF0ZSBYZmVySW5Q
cm9ncmVzcyBldmVudCB0byBub3RpZnkgVFJCIA0KY29tcGxldGlvbiBmb3IgdGhlIGRyaXZlciB0
byBlbnRlciB0aGlzIGNvZGUgcGF0aC4NCg0KVGhlIGNvbmRpdGlvbiBoZXJlIGlzIGlmICghcmVx
dWVzdF9jb21wbGV0ZSgpKSwgdGhlbiBraWNrX3RyYW5zZmVyKCkuIA0KTGV0J3MgdGFrZSBhIGxv
b2sgYXQgd2hhdCBraWNrX3RyYW5zZmVyKCkgZG86DQoNCmtpY2tfdHJhbnNmZXIoKSB3aWxsIHBy
ZXBhcmUgbmV3IFRSQnMgYW5kIGlzc3VlIFNUQVJUX1RSQU5TRkVSIGNvbW1hbmQgDQpvciBVUERB
VEVfVFJBTlNGRVIgY29tbWFuZC4gVGhlIGVuZHBvaW50IGlzIGFscmVhZHkgc3RhcnRlZCwgYW5k
IG5vdGhpbmcgDQppcyBjYXVzaW5nIGl0IHRvIGVuZCBhdCB0aGlzIHBvaW50LiBTbyBpdCBzaG91
bGQganVzdCBiZSBVUERBVEVfVFJBTlNGRVIgDQpjb21tYW5kLiBVUERBVEVfVFJBTlNGRVIgY29t
bWFuZCB0ZWxscyB0aGUgY29udHJvbGxlciB0byB1cGRhdGUgaXRzIFRSQiANCmNhY2hlIGJlY2F1
c2UgdGhlcmUgd2lsbCBiZSBuZXcgVFJCcyBwcmVwYXJlZCBmb3IgdGhlIHJlcXVlc3QuDQoNCklm
IHRoaXMgaXMgbm9uLVNHL25vbi1jaGFpbmVkIFRSQiByZXF1ZXN0LCB0aGVuIHRoZXJlJ3Mgb25s
eSAxIFRSQiBwZXIgDQpyZXF1ZXN0IGZvciBJTiBlbmRwb2ludHMuIElmIHRoYXQgVFJCIGlzIGNv
bXBsZXRlZCwgdGhhdCBtZWFucyB0aGF0IHRoZSANCnJlcXVlc3QgaXMgY29tcGxldGVkLiBUaGVy
ZSdzIG5vIHJlYXNvbiB0byBpc3N1ZSBraWNrX3RyYW5zZmVyKCkgYWdhaW4uIA0KV2hlbiB0aGUg
ZnVuY3Rpb24gZHJpdmVyIHF1ZXVlcyBhIG5ldyByZXF1ZXN0LCB0aGVuIHRoZXJlIHdpbGwgYmUg
bmV3IA0KVFJCcyB0byBwcmVwYXJlIGFuZCB0aGVuIHRoZSBkcml2ZXIgY2FuIGtpY2tfdHJhbnNm
ZXIoKSBhZ2Fpbi4NCg0KU28sIHRoaXMgY29uZGl0aW9uIHRvIGNoZWNrIGlmIHJlcXVlc3RfY29t
cGxldGUoKSBpcyBvbmx5IHZhbGlkIGZvciBhIA0KcmVxdWVzdCB3aXRoIG11bHRpcGxlIGNoYWlu
ZWQgVFJCcy4gU2luY2Ugd2UgY2FuIG9ubHkgY2hlY2sgZm9yIElOIA0KZGlyZWN0aW9uLCB0aGUg
Y2hhaW5lZCBUUkIgc2V0dXAgcmVsYXRlZCB0byBPVVQgZGlyZWN0aW9uIHRvIGZpdCANCk1heFBh
Y2tldFNpemUgZG9lcyBub3QgYXBwbHkgaGVyZS4gV2hhdCBsZWZ0IGlzIGNoYWluZWQgVFJCcyBm
b3IgU0cuIEluIA0KdGhpcyBjYXNlLCB3ZSBkbyB3YW50IHRvIGtpY2tfdHJhbnNmZXIgYWdhaW4u
IFRoaXMgbWF5IGhhcHBlbiB3aGVuIHdlIA0KcnVuIG91dCBvZiBUUkJzIGFuZCB3ZSBoYXZlIHRv
IHdhaXQgZm9yIGF2YWlsYWJsZSBUUkJzLiBXaGVuIHRoZXJlIGFyZSANCmF2YWlsYWJsZSBUUkJz
IGFuZCBzdGlsbCBwZW5kaW5nIFNHcywgdGhlbiB3ZSB3YW50IHRvIHByZXBhcmUgdGhlIHJlc3Qg
DQpvZiB0aGUgU0cgZW50cmllcyB0byBmaW5pc2ggdGhlIHJlcXVlc3QuIFNvIGtpY2tfdHJhbnNm
ZXIoKSBtYWtlcyBzZW5zZSANCmhlcmUuDQoNCkxldCBtZSBrbm93IGlmIHRoZXJlJ3Mgc29tZXRo
aW5nIG5vdCBjbGVhci4NCg0KVGhhbmtzLA0KVGhpbmgNCg0K
