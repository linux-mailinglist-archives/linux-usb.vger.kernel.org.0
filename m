Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A2022D6FF
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 13:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgGYLSH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 07:18:07 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:37026 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726745AbgGYLSH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 07:18:07 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BBC89401EF;
        Sat, 25 Jul 2020 11:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595675886; bh=5prgx78k3HDNQp6orXmouICFMVvPJIqM8/cyZb35joI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=b79ICjQFqPJFCZgJ5dE/t7apHvXf1BHANs+cKA9PA0gKR/RoblM7SmfgHTIj5bDRs
         LIPyFCxOHHgy+OAC45Ml0N5OwhSx4LP48VKWzco7EqBjv16LTIxANBHrQsUSuRHYp7
         Xlh4AEVpdFNHTGGa9/Gm/1FKxii0RROp5dTvYmarJYmh2Yw2eEnqnPs/Cp5Y93LLiZ
         wOG1qR0I56FdgM7FhkZsMfeXgu0knAUaUt+ZBo5AHCT0IzI+WkRYw/3WQ8uslBoCZc
         PTVi2yGAiXIDivmNq3Pjdpnw3/SIKZp8NDb7kL1BSzyHXDhqA+159Yh5unG/fNeBr0
         y2hM68mJMMDmw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6D648A0083;
        Sat, 25 Jul 2020 11:18:06 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id DB565801BF;
        Sat, 25 Jul 2020 11:18:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="obrkLvCd";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STFmeB4cAoLvTgC/oG1WHSr9vtfqIvClb0BrLDyeH0BpePuIFk1/JMnOnnGTD9BPqpg1FrJE/X12Rtm+rYoMl5oMKj8ZD28Ao6ecg7JkEDbplbYhyiBXKfP35aTZjAEmrsbSDzrKbP8zkcLweukTiaW4GuGtKRfA7Hhfy6wPH4ol8B7i++x778T954j8t9UUTG3A5RGsrzrvZQ4cNylbTsTjBPckQAoFRb+bXzXCOnWKTbEVln0wdu1BFWK6ljX4gWc1LvLQTW+MteOFWMVJhlgDGOuTqNX+t3ckIypb1323EumvjhOMkBIACpcDH2/1ZttvSucVphQ7tEuWkNcCgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5prgx78k3HDNQp6orXmouICFMVvPJIqM8/cyZb35joI=;
 b=DycX7J/41j0xBUQKHRGjFLCAkxv0ZsT1S9iH1ukZAbY1wrlVR+JF54AyEiTOdalDei1E0Ny4nSjaXRywMUMqS2WXPMVB+B5i/e1jYRXKjI8VV+gqso20R82H8mymB945y//QBTOo6vR8omW2AyHU+PHUlFUeI/XMdyAaNNf3Swq9CWtVtT7XwLjveHx58BnPTyIjWR3Ih2Wql4lh0naDfMh/N5FVU7u2Ex4gcTsbLaurK9qC0iEIJ7NKRlL8GN8RvBjDi3AcF1i2QbXCg2JJxD9K/13bNXKr6x5IzYyEwmyVY332OycS1Z/eLtektXBOZczrllCtJSAyNRZfMxv9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5prgx78k3HDNQp6orXmouICFMVvPJIqM8/cyZb35joI=;
 b=obrkLvCd1xSo+Vzh17UfycaifpYEBKuEFytMD2b2ejPfgLiV+pfQXaxwd9D9titgXyOrveMDy3wzckqoxfVx7gAkII3JaaU1cos9tJ1m/fcNImM5oweZRD/wb4Fu2BGFYKZjwDcv5lZn3xyVRf3mmyhTuaF+9p2quwcArIFMysI=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB4307.namprd12.prod.outlook.com (2603:10b6:a03:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.25; Sat, 25 Jul
 2020 11:18:03 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3216.028; Sat, 25 Jul 2020
 11:18:02 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 07/12] usb: common: Add function to get num_lanes and
 transfer rate
Thread-Topic: [PATCH v3 07/12] usb: common: Add function to get num_lanes and
 transfer rate
Thread-Index: AQHWYhOjeRkVZXshpUGFMJg4gOAOx6kYFBSAgAAKwwCAAARagIAAAywA
Date:   Sat, 25 Jul 2020 11:18:02 +0000
Message-ID: <e9d4aa85-04fd-109a-334d-d0a2b83fffdc@synopsys.com>
References: <cover.1595631457.git.thinhn@synopsys.com>
 <d86ccd4f97469cfe67cbce549b37d4df7cd8cb27.1595631457.git.thinhn@synopsys.com>
 <20200725101235.GA1093846@kroah.com>
 <4c6bba0f-71fe-e96b-2be1-8177be2701da@synopsys.com>
 <20200725110641.GB396778@kroah.com>
In-Reply-To: <20200725110641.GB396778@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [149.117.7.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fa00ce1-54b0-42f8-bec9-08d8308c656d
x-ms-traffictypediagnostic: BY5PR12MB4307:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4307E7BC0982691C2C09844CAA740@BY5PR12MB4307.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qs4+gtNyxOESmZ7ht8wCqTDfgTp7Y12wSrehEi2kBGmJP7XrM+FDXc+YNqWoeeLnIa+mtxRcBZE7AvXJf1uSvF8YsUIaoXTSTH02ZbeyMcqouZlrt4K1WMkk2w2U0oPWewGHY1V+hXCz9FVcR1KbVeDQ9eip4YiLq0I1sVQ77ElVb+vESOeiPeaXKkaghZuuKykozdqWFa+rn5U7Bw9qS+JCUGbPiPXcE1mTJQhrIosSpdxcmVcfUEjxZkRrf1ZN17W+own9adHIHlAuvAWZQ9va7nxsAXt+VPu9FdtPYkD4l75utKkAzxG9v2s1GXilT5mdhDXTxcYQBDsS+sMPzXS4h9BLeUMnaRXNz/3egA7scgCw2Wmen6M5BgurtxrEeG2kW4dJtd3K+NEFs2KypNOfg6yoFr1FBVp5pz6vYhbuzk3yWma9lMNjrTi6CtkXK9i9HBuQOvMCDPqLkO3Mnw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(136003)(346002)(39860400002)(366004)(376002)(2906002)(966005)(26005)(31696002)(31686004)(5660300002)(6512007)(86362001)(83380400001)(2616005)(186003)(6506007)(478600001)(66476007)(110136005)(54906003)(316002)(36756003)(71200400001)(64756008)(66946007)(8936002)(6486002)(8676002)(66446008)(76116006)(4326008)(66556008)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: noqAtWAU4cKixIt0kcyeWk/clN0twjZ8c6oZToH2gTcGdwaY9btkO6X5xbyZSI9vYbHBoUWYw+YDF+LhpFNrL/UQjUYCgh+MSwIhv4VgJRAJPV8TYbUPa4rACIyA6q0EBqnV0OWct8T1oWDqL3wbxm2KOvwHl+8YSz/PkcbcXTw3z3pQB2127rjsz6Zr7TQzGvFWs1Ry13LtEVsDEsOowrQ5T2TGchnONqY+aIm6ZwLJSiNoR7VLDtDIVLga2/U502ubS/QO37n5W9BkjIqpjM3xOy2BTS2lf8ozQ21J+S8HsV3xN/tW5wb9VfF4u05iXpJPzXZG3mde7W9zysmRMAAtQG/LhaxgsiSSjkLRXPU1+OfZnJuuNA0Ozd+BsxE26HH0RtUaGqw+MX1bvQ17fn0j62NJBpkE4XYPmQ5GL+jqt92ZvbXCC2BfAfsY3S1lIpbVQ/OCUtcvvGzHPQfida4FV4gKaX81vNq3aPldY6Q=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2D141F92FC1634897283D486E63AA9F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa00ce1-54b0-42f8-bec9-08d8308c656d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2020 11:18:02.6601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wozZr0u1bUOlPlw/m/AoSIY/ri5ZxBf6w97RlWo+87n2lKO9cQsVXtNBI3zb9NWucwkBbf6dYtOeODymVGioLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4307
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

R3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiBPbiBTYXQsIEp1bCAyNSwgMjAyMCBhdCAxMDo1
MTowN0FNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBHcmVnIEtyb2FoLUhhcnRtYW4g
d3JvdGU6DQo+Pj4gT24gRnJpLCBKdWwgMjQsIDIwMjAgYXQgMDQ6Mzk6MTFQTSAtMDcwMCwgVGhp
bmggTmd1eWVuIHdyb3RlOg0KPj4+PiBBZGQgYSBuZXcgY29tbW9uIGZ1bmN0aW9uIHRvIHBhcnNl
IG1heGltdW1fc3BlZWQgcHJvcGVydHkgc3RyaW5nIGZvcg0KPj4+PiB0aGUgc3BlY2lmaWVkIG51
bWJlciBvZiBsYW5lcyBhbmQgdHJhbnNmZXIgcmF0ZS4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1i
eTogVGhpbmggTmd1eWVuIDx0aGluaG5Ac3lub3BzeXMuY29tPg0KPj4+PiAtLS0NCj4+Pj4gQ2hh
bmdlcyBpbiB2MzoNCj4+Pj4gLSBBZGQgbmV3IGZ1bmN0aW9uIHRvIHBhcnNlICJtYXhpbXVtLXNw
ZWVkIiBmb3IgbGFuZXMgYW5kIHRyYW5zZmVyIHJhdGUNCj4+Pj4gLSBSZW1vdmUgc2VwYXJhdGUg
ZnVuY3Rpb25zIGdldHRpbmcgbnVtX2xhbmVzIGFuZCB0cmFuc2ZlciByYXRlIHByb3BlcnRpZXMN
Cj4+PiBObywgd2h5IGhhdmUgeW91IHNwbGl0IHRoaXMgaW50byBhIHNpbmdsZSBmdW5jdGlvbiB0
aGF0IGZvciBzb21lIHJlYXNvbg0KPj4+ICJjYW4gbm90IGZhaWwiPw0KPj4gVGhpcyBwYXRjaCB3
YXMgdXBkYXRlZCB0byByZWFkIGZyb20gYSBzaW5nbGUgcHJvcGVydHkgIm1heGltdW0tc3BlZWQi
IHRvDQo+PiBnZXQgdGhlIGRldmljZSBzcGVlZCwgZ2VuLCBhbmQgbnVtYmVyIG9mIGxhbmVzLiBT
byB3ZSB1c2UgYSBzaW5nbGUNCj4+IGZ1bmN0aW9uIHRvIHBhcnNlIHRoaXMgcHJvcGVydHkuDQo+
Pg0KPj4gVGhpcyBjYW1lIHVwIGZyb20gb24gUm9iJ3MgY29tbWVudHM6DQo+PiBodHRwczovL3Vy
bGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiL2Y2OGYz
OTVjLTA4MjEtOWUzNC1mNmNmLTc1ZmE2MGM5YTM1YkBzeW5vcHN5cy5jb20vVC8qbWFjM2E0ZDBi
MWMwMjg2NmUzYmRiZDY4MDk1MDZmYmJlZThiZjg0YzJfXztJdyEhQTRGMlI5R19wZyFKdkdNdUhl
YWNTZFRSa04tMVNDVXNlYnFmUHNrVkNkdEZqNnhVa011dnRrd0JjR0s1TjR2NW51a2hIWktJLWxL
ZEZFRSQNCj4+DQo+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtdXNiLzA4MThlODc2LWVhNWItOWViYy03NDI3LThlMjZiNjI3ZTZiNEBz
eW5vcHN5cy5jb20vVC8qbTg3MTkxMzMzY2IxMGE3ZjBjYWFmNTMzYmZhMTk4NzI0ZDMzYzI1MTlf
XztJdyEhQTRGMlI5R19wZyFKdkdNdUhlYWNTZFRSa04tMVNDVXNlYnFmUHNrVkNkdEZqNnhVa011
dnRrd0JjR0s1TjR2NW51a2hIWktJMFNGRzFGayQNCj4+DQo+Pg0KPj4+PiBDaGFuZ2VzIGluIHYy
Og0KPj4+PiAtIE5ldyBjb21taXQNCj4+Pj4NCj4+Pj4gICAgZHJpdmVycy91c2IvY29tbW9uL2Nv
bW1vbi5jIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
DQo+Pj4+ICAgIGluY2x1ZGUvbGludXgvdXNiL2NoOS5oICAgICB8IDI1ICsrKysrKysrKysrKysr
KysrKysrKysrKw0KPj4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jb21tb24v
Y29tbW9uLmMgYi9kcml2ZXJzL3VzYi9jb21tb24vY29tbW9uLmMNCj4+Pj4gaW5kZXggMTQzMzI2
MGQ5OWI0Li41M2I0OTUwYzQ5ZTQgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvdXNiL2NvbW1v
bi9jb21tb24uYw0KPj4+PiArKysgYi9kcml2ZXJzL3VzYi9jb21tb24vY29tbW9uLmMNCj4+Pj4g
QEAgLTc3LDE4ICs3Nyw1OSBAQCBjb25zdCBjaGFyICp1c2Jfc3BlZWRfc3RyaW5nKGVudW0gdXNi
X2RldmljZV9zcGVlZCBzcGVlZCkNCj4+Pj4gICAgfQ0KPj4+PiAgICBFWFBPUlRfU1lNQk9MX0dQ
TCh1c2Jfc3BlZWRfc3RyaW5nKTsNCj4+Pj4gICAgDQo+Pj4+IC1lbnVtIHVzYl9kZXZpY2Vfc3Bl
ZWQgdXNiX2dldF9tYXhpbXVtX3NwZWVkKHN0cnVjdCBkZXZpY2UgKmRldikNCj4+Pj4gK3ZvaWQg
dXNiX2dldF9tYXhpbXVtX3NwZWVkX2FuZF9udW1fbGFuZXMoc3RydWN0IGRldmljZSAqZGV2LA0K
Pj4+PiArCQkJCQkgZW51bSB1c2JfZGV2aWNlX3NwZWVkICpzcGVlZCwNCj4+Pj4gKwkJCQkJIGVu
dW0gdXNiX3BoeV9nZW4gKmdlbiwNCj4+Pj4gKwkJCQkJIHU4ICpudW1fbGFuZXMpDQo+Pj4gV2hh
dCBpcyB3cm9uZyB3aXRoIGp1c3QgaGF2aW5nIG11bHRpcGxlIGRpZmZlcmVudCBmdW5jdGlvbnMg
aW5zdGVhZD8NCj4+IFNlZSBteSBjb21tZW50IGFib3ZlLg0KPj4NCj4+DQo+Pj4+ICAgIHsNCj4+
Pj4gICAgCWNvbnN0IGNoYXIgKm1heGltdW1fc3BlZWQ7DQo+Pj4+ICsJZW51bSB1c2JfZGV2aWNl
X3NwZWVkIG1hdGNoZWRfc3BlZWQgPSBVU0JfU1BFRURfVU5LTk9XTjsNCj4+Pj4gKwllbnVtIHVz
Yl9waHlfZ2VuIG1hdGNoZWRfZ2VuID0gVVNCX1BIWV9HRU5fVU5LTk9XTjsNCj4+Pj4gKwl1OCBt
YXRjaGVkX251bV9sYW5lcyA9IDA7DQo+Pj4+ICAgIAlpbnQgcmV0Ow0KPj4+PiAgICANCj4+Pj4g
ICAgCXJldCA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX3N0cmluZyhkZXYsICJtYXhpbXVtLXNwZWVk
IiwgJm1heGltdW1fc3BlZWQpOw0KPj4+PiAgICAJaWYgKHJldCA8IDApDQo+Pj4+IC0JCXJldHVy
biBVU0JfU1BFRURfVU5LTk9XTjsNCj4+Pj4gKwkJZ290byBkb25lOw0KPj4+PiAgICANCj4+Pj4g
ICAgCXJldCA9IG1hdGNoX3N0cmluZyhzcGVlZF9uYW1lcywgQVJSQVlfU0laRShzcGVlZF9uYW1l
cyksIG1heGltdW1fc3BlZWQpOw0KPj4+PiArCWlmIChyZXQgPj0gMCkgew0KPj4+PiArCQltYXRj
aGVkX3NwZWVkID0gcmV0Ow0KPj4+PiArCQlnb3RvIGRvbmU7DQo+Pj4+ICsJfQ0KPj4+PiArDQo+
Pj4+ICsJaWYgKHN0cm5jbXAoInN1cGVyLXNwZWVkLXBsdXMtZ2VuMngyIiwgbWF4aW11bV9zcGVl
ZCwgMjMpID09IDApIHsNCj4+Pj4gKwkJbWF0Y2hlZF9zcGVlZCA9IFVTQl9TUEVFRF9TVVBFUl9Q
TFVTOw0KPj4+PiArCQltYXRjaGVkX2dlbiA9IFVTQl9QSFlfR0VOXzI7DQo+Pj4+ICsJCW1hdGNo
ZWRfbnVtX2xhbmVzID0gMjsNCj4+Pj4gKwl9IGVsc2UgaWYgKHN0cm5jbXAoInN1cGVyLXNwZWVk
LXBsdXMtZ2VuMngxIiwgbWF4aW11bV9zcGVlZCwgMjMpID09IDApIHsNCj4+Pj4gKwkJbWF0Y2hl
ZF9zcGVlZCA9IFVTQl9TUEVFRF9TVVBFUl9QTFVTOw0KPj4+PiArCQltYXRjaGVkX2dlbiA9IFVT
Ql9QSFlfR0VOXzI7DQo+Pj4+ICsJCW1hdGNoZWRfbnVtX2xhbmVzID0gMTsNCj4+Pj4gKwl9IGVs
c2UgaWYgKHN0cm5jbXAoInN1cGVyLXNwZWVkLXBsdXMtZ2VuMXgyIiwgbWF4aW11bV9zcGVlZCwg
MjMpID09IDApIHsNCj4+PiBXaGVyZSBhcmUgYWxsIG9mIHRoZXNlIGRldmljZSBwcm9wZXJ0aWVz
IGRvY3VtZW50ZWQ/DQo+PiBJdCdzIGNvbWluZyBmcm9tIGEgc2luZ2xlIHByb3BlcnR5ICJtYXhp
bXVtLXNwZWVkIiwgZG9jdW1lbnRlZCBpbiBwYXRjaA0KPj4gNi8xMsKgICJ1c2I6IGRldmljZXRy
ZWU6IEluY2x1ZGUgVVNCIFNTUCBHZW4gWCB4IFkiDQo+Pg0KPj4gaHR0cHM6Ly91cmxkZWZlbnNl
LmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8zYmM0ZmI2YTBkN2Mx
YTllYTRkNWQ5Mzg0YWRlMjZjOTA2NmM4N2QwLjE1OTU2MzE0NTcuZ2l0LnRoaW5obkBzeW5vcHN5
cy5jb20vVC8qdV9fO0l3ISFBNEYyUjlHX3BnIUp2R011SGVhY1NkVFJrTi0xU0NVc2VicWZQc2tW
Q2R0Rmo2eFVrTXV2dGt3QmNHSzVONHY1bnVraEhaS0k2ZC1FS1RFJA0KPj4NCj4+Pg0KPj4+DQo+
Pj4+ICsJCW1hdGNoZWRfc3BlZWQgPSBVU0JfU1BFRURfU1VQRVJfUExVUzsNCj4+Pj4gKwkJbWF0
Y2hlZF9nZW4gPSBVU0JfUEhZX0dFTl8xOw0KPj4+PiArCQltYXRjaGVkX251bV9sYW5lcyA9IDI7
DQo+Pj4+ICsJfQ0KPj4+PiArDQo+Pj4+ICtkb25lOg0KPj4+PiArCWlmIChzcGVlZCkNCj4+Pj4g
KwkJKnNwZWVkID0gbWF0Y2hlZF9zcGVlZDsNCj4+Pj4gKw0KPj4+PiArCWlmIChudW1fbGFuZXMp
DQo+Pj4+ICsJCSpudW1fbGFuZXMgPSBtYXRjaGVkX251bV9sYW5lczsNCj4+Pj4gKw0KPj4+PiAr
CWlmIChnZW4pDQo+Pj4+ICsJCSpnZW4gPSBtYXRjaGVkX2dlbjsNCj4+Pg0KPj4+PiArfQ0KPj4+
PiArRVhQT1JUX1NZTUJPTF9HUEwodXNiX2dldF9tYXhpbXVtX3NwZWVkX2FuZF9udW1fbGFuZXMp
Ow0KPj4+PiArDQo+Pj4+ICtlbnVtIHVzYl9kZXZpY2Vfc3BlZWQgdXNiX2dldF9tYXhpbXVtX3Nw
ZWVkKHN0cnVjdCBkZXZpY2UgKmRldikNCj4+Pj4gK3sNCj4+Pj4gKwllbnVtIHVzYl9kZXZpY2Vf
c3BlZWQgc3BlZWQ7DQo+Pj4+ICAgIA0KPj4+PiAtCXJldHVybiAocmV0IDwgMCkgPyBVU0JfU1BF
RURfVU5LTk9XTiA6IHJldDsNCj4+Pj4gKwl1c2JfZ2V0X21heGltdW1fc3BlZWRfYW5kX251bV9s
YW5lcyhkZXYsICZzcGVlZCwgTlVMTCwgTlVMTCk7DQo+Pj4gSGVyZSdzIGFuIGV4YW1wbGUgb2Yg
d2h5IHRoaXMgaXNuJ3QgYSBnb29kIGZ1bmN0aW9uLg0KPj4+DQo+Pj4gSXQgaXNuJ3Qgc2VsZi1k
ZXNjcmliaW5nLiAgV2h5IGRvIHlvdSBwYXNzIGluIDMgcG9pbnRlcnMgeWV0IHRoZSBuYW1lDQo+
Pj4gb25seSBjb250YWlucyAyIHRoaW5ncz8NCj4+IFJpZ2h0Li4uIEkgY2FuIHJldmlzZS4NCj4+
DQo+Pj4gdXNiX2dldF9tYXhpbXVtX3NwZWVkX2FuZF9udW1fbGFuZXNfYW5kX2dlbmVyYXRpb24o
KSBzaG93cyB0aGF0IHRoaXMgaXMNCj4+PiBub3QgYSBnb29kIHRoaW5nLCByaWdodD8NCj4+Pg0K
Pj4+IEFnYWluLCAzIGRpZmZlcmVudCBmdW5jdGlvbnMgcGxlYXNlLg0KPj4gU2hvdWxkIHdlIGhh
dmUgMyBzZXBhcmF0ZSBwcm9wZXJ0aWVzIHRvIGRlc2NyaWJlIHRoZSBkZXZpY2U/IElmIHNvLCB0
aGlzDQo+PiB3YXMgZG9uZSBpbiB2MiBvZiB0aGlzIHNlcmllcywgYnV0IFJvYiBoYXMgZGlmZmVy
ZW50IGlkZWFzLiBQbGVhc2UgYWR2aXNlLg0KPiBJIGRvbid0IGNhcmUgYWJvdXQgdGhlIHByb3Bl
cnRpZXMsIHRoYXQgc2hvdWxkIGJlIGluZGVwZW5kYW50IG9mIHRoZQ0KPiBmdW5jdGlvbiBjYWxs
IG1hZGUgdG8gZGV0ZXJtaW5lIHRoaXMgaW5mb3JtYXRpb24uICBEb24ndCBsZXQgdGhlIGRhdGEN
Cj4gZm9ybWF0cyBmb3JjZSB5b3UgdG8gd3JpdGUgaG9ycmlibGUgY29kZSA6KQ0KDQpPay4gV2ls
bCByZXZpc2UuDQoNClRoYW5rcywNClRoaW5oDQo=
