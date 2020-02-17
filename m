Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2885E160DE2
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 09:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728639AbgBQI63 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 03:58:29 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:40956 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728388AbgBQI62 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Feb 2020 03:58:28 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C153AC00A6;
        Mon, 17 Feb 2020 08:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1581929907; bh=iOnxmgvrdJqxNL+hXanzDVTZhEIyaxEmwRtTJnRIF24=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=Vs79YHxb6SOlkUPam61VpieWFgMy7Bi/150iN7Wg1aQoakS4P8r7HZS74FMsbkSgn
         bsSrSkE29FnPrtkwFd3NaCvjtYwQHz8BAdk2hplEpGyrQZQ1ZVY9UEORzFQ629H5wH
         KY49PCgHd3a+9F9QmL4ZytWiNAUfLXVWYPfneq+PvAsogDEZdZKxPmsTLuYb1jhtkK
         EM37x+MJ59Dr+ZbxTDFvp9w7NYXhPGH9Uvr7VxH84nVRV1C/lIcoyXMrQPsRi/NSHS
         SS1I/RKfjN55PTixTifO6pbXjle1/pEaVirjazAYK7zUPYVseesl2nkEElgEuRnz+I
         Z+XvpHKBGOVFw==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 55D55A0067;
        Mon, 17 Feb 2020 08:58:13 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 17 Feb 2020 00:58:13 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 17 Feb 2020 00:58:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7O6GYBIiO1GSQHvhOGRIWOCliClRj9AckRzqMoxWzaoK8SV3pQy3/cpnkgAoXZ7TkABg04SF39xKl8qFKJJbbRwAih66+oIrzFqo7kFXrcs63OzY1udd+jxDFNaC4aHH/uaKFjBedcGsec6GSiIuROQafsmyvMDGrS3YxGsHqPG8fxffUL/7+XPPlOedlokWoCb11+ddA/rmtkxo8DPxfWmeFnbDDta4f7er9SVBWTSS4tqtF76rjNstcg8k4u1LcxYDN+wUBos6Z9LjA6UgA/10kIBk20l09674nZvdyjQId8QewK4dXczdnPnjld6Fn9UzUUi4NCRmY+DGXj6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOnxmgvrdJqxNL+hXanzDVTZhEIyaxEmwRtTJnRIF24=;
 b=OBd3BSWO3ROBCQffy7NthdkUcO8ts4Dv0Gp+S1Pjh9SZyRIv9Zo2JmmA57SlZeLPss5yOry4qg9on4nhPHU5g8qNLuAElqp0hMeNjmdu1g67yrFecST0na5AEnNTQ1RRbV1rQ07rpS6moUDHiApx4Qm4l9+dxa8UGQgnqlsE9hNFmjAbZEGVwZQuP4NPVSMV6CkCMkLdKp9I1prhUyDvFUShYrgNDhds5+RIVpuat/7jOzDFfElk3cUR5UYN4FPgWsINGoXd/CL4IUJ93EFYy1yqdC8RvcAkmnpeFbhhAzjTZbdl8V6bUFF529F93fhYH2YM9uVzAFY0efobD14Gqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOnxmgvrdJqxNL+hXanzDVTZhEIyaxEmwRtTJnRIF24=;
 b=ie/H+3Ev9CixJxr7HH1inLw0T+ol2hFAA53KmdXKfecGfGWWdZd2byg4V/KN0nUm4On6LGWH4qn4hqBANAwAbyKK/L0C5l5lYjim4xAkotuv9mk2IrreLzjlGN30dMIeXj4m1pR/ppVFpiyMiqFr9h9CfV7ArYVpvra+kLFsmA8=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) by
 MN2PR12MB3949.namprd12.prod.outlook.com (10.255.237.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Mon, 17 Feb 2020 08:58:11 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8%7]) with mapi id 15.20.2729.031; Mon, 17 Feb 2020
 08:58:11 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Otavio Salvador <otavio.salvador@ossystems.com.br>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Johan Hovold <johan@kernel.org>
Subject: Re: USB DWC2 stops responding when insert/remove cable multiple times
Thread-Topic: USB DWC2 stops responding when insert/remove cable multiple
 times
Thread-Index: AQHV4zxylJsWeUZ0JUKEDMOhhpCodKgfGkgA
Date:   Mon, 17 Feb 2020 08:58:11 +0000
Message-ID: <41a7bfe7-54b1-84eb-091f-469d971ab968@synopsys.com>
References: <CAP9ODKprPi8N-dU8NaKwneXH-3b0ipSEDpU5mDbGntxuyhGhJw@mail.gmail.com>
In-Reply-To: <CAP9ODKprPi8N-dU8NaKwneXH-3b0ipSEDpU5mDbGntxuyhGhJw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [46.162.196.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c53388e-2eb4-4bd1-0239-08d7b3878449
x-ms-traffictypediagnostic: MN2PR12MB3949:
x-microsoft-antispam-prvs: <MN2PR12MB3949D20EF40CC522961D3820A7160@MN2PR12MB3949.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0316567485
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(39860400002)(346002)(396003)(136003)(189003)(199004)(110136005)(31686004)(26005)(5660300002)(36756003)(31696002)(71200400001)(478600001)(8936002)(2906002)(8676002)(81166006)(81156014)(45080400002)(2616005)(316002)(186003)(76116006)(91956017)(86362001)(6486002)(66946007)(66446008)(66476007)(53546011)(6506007)(66556008)(64756008)(6512007);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB3949;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vkLw8dj9/zw9Q8XWNrECnekVp7s8P/O5gH6wunpZHG/iQF5ZVna6VFJO7ptKQbtyNc3cEC4cZ4e1qmqUK2YSiN5k2ikoh21RR3vlV/YiqA/Q/Ig4/r9eh4Vs1gAeLV8gsB8xCJNQeGAY22vGdFUaHLhejaXibTl5HhNr55TCuETK55nXDRlsBr4mcd5fcwGfOZae0hMXj9H+HtC3EobTGG85gsctHboITdliEsIYZsXsaO9MtAUTVF/C8eDLUOwXdGy7kprjhfupXM/MVoLUKGnb5GhBxU2brQ0Il1Irq+rcFNfF8r7C642p/beVh+s7WVKxmVDqksh7tGsIxBOocBb+HOHpK13o/t0ORwTRa7evr0W6vzZi4crvZbhmqAAQAKd6834yCUXoFwHiyBhNHTkrytpAVTQ8xOZEbwLWS8562uDkdgzGnR6PNjxy2qrY
x-ms-exchange-antispam-messagedata: GlwN/VwYvCx6J/tAioq+FG7Uu1jCQkvsPNMo93Ko1DcZdEYfpDp/BFpBWcPAgcNt1vef6WzGe9Yjt8g5M0h3dSFAbxO0bx3I2BV/ZK1LUWrG5KDn9+G562HLZTLsgF4Jxjkmjkq+XKdTPp2tr56VBw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8607DFE13831C844ADD3AB7A0F1FFEBB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c53388e-2eb4-4bd1-0239-08d7b3878449
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2020 08:58:11.6463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /oVXyqfQ/Mm88mxSLD+1fhSohLTcJilYPZM4N6dphzVJX3OUIjJyI1jjjdD7uTQjxMFI6pG6reLaPU7pW/j2Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3949
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgT3RhdmlvLA0KDQpPbiAyLzE0LzIwMjAgNTo0MCBQTSwgT3RhdmlvIFNhbHZhZG9yIHdyb3Rl
Og0KPiAgIHRoZSBVU0IgcG9ydCBzdG9wcyByZXNwb25kaW5nLiBUbyByZWNvdmVyIHRoZSBwb3J0
IHdlIG5lZWQgdG8gcmVsb2FkDQo+IHRoZSBnX3NlcmlhbCBtb2R1bGUuDQo+IA0KPiBJIGhhdmUg
cmVwb3J0cyBvZiBpdCBoYXBwZW5pbmcgaW4gdGhlIGZpZWxkLCBvbiB0aGUgZGV2aWNlIGJ1dCwg
dW50aWwNCj4gcmVjZW50bHksIGl0IHZlcnkgaGFyZCB0byByZXByb2R1Y2UuIFdlIGZvdW5kIHRo
YXQgaXQgaXMgdmVyeSBlYXN5IHRvDQo+IHJlcHJvZHVjZSB3aGVuIHdlIHVzZSB0aGUgTWljcm9z
b2Z0IFN1cmZhY2UgRG9jaywgYXMgaHViLg0KPiANCj4gRGVzY3JpcHRpb24gb2YgdGhlIGhvc3Q6
DQo+IA0KPiAgICAgIE9wZXJhdGluZyBTeXN0ZW06IFdpbmRvd3MgMTAgUHJvDQo+ICAgICAgRHJp
dmVyOiBsaWJ1c2ItMS4wIDEuMC4yMg0KPiANCj4gRGVzY3JpcHRpb24gb2YgdGhlIHRhcmdldDoN
Cj4gDQo+ICAgICAgU29DOiBSb2NrY2hpcCBSVjExMDhHDQo+ICAgICAgR2FkZ2V0OiBnX3Nlcmlh
bA0KPiAgICAgIExpbnV4OiA1LjQuMTkNCj4gDQo+IGRtZXNnOg0KPiAgICAgIFsgICA1OS42NDc3
NDZdIGdfc2VyaWFsIGdhZGdldDogR2FkZ2V0IFNlcmlhbCB2Mi40DQo+ICAgICAgWyAgIDU5LjY0
ODE3OF0gZ19zZXJpYWwgZ2FkZ2V0OiBnX3NlcmlhbCByZWFkeQ0KPiAgICAgIFsgICA1OS42NTM5
MjBdIGR3YzIgMzAxODAwMDAudXNiOiBib3VuZCBkcml2ZXIgZ19zZXJpYWwNCj4gICAgICBbICAg
NTkuOTEyMzY0XSBkd2MyIDMwMTgwMDAwLnVzYjogbmV3IGRldmljZSBpcyBoaWdoLXNwZWVkDQo+
ICAgICAgWyAgIDU5Ljk0OTk4MV0gZHdjMiAzMDE4MDAwMC51c2I6IG5ldyBhZGRyZXNzIDEyDQo+
ICAgICAgWyAgIDYwLjAzNDkzN10gZ19zZXJpYWwgZ2FkZ2V0OiBoaWdoLXNwZWVkIGNvbmZpZyAj
MjogQ0RDIEFDTSBjb25maWcNCj4gICAgICBbICAgNjUuOTgwMzgyXSBwaHkgcGh5LTEwMzAwMDAw
LnN5c2Nvbjp1c2IyLXBoeUAxMDAuMDogY2hhcmdlciA9DQo+IFVTQl9DRFBfQ0hBUkdFUg0KPiAg
ICAgIFsgICA2Ni4zMTMyNjddIGR3YzIgMzAxODAwMDAudXNiOiBuZXcgZGV2aWNlIGlzIGhpZ2gt
c3BlZWQNCj4gICAgICBbICAgNjYuMzUwOTAyXSBkd2MyIDMwMTgwMDAwLnVzYjogbmV3IGFkZHJl
c3MgMTMNCj4gICAgICBbICAgNjYuMzg4MDY1XSBnX3NlcmlhbCBnYWRnZXQ6IGhpZ2gtc3BlZWQg
Y29uZmlnICMyOiBDREMgQUNNIGNvbmZpZw0KPiAgICAgIFsgIDMxMS42MDQyNTFdIGR3YzIgMzAx
ODAwMDAudXNiOiBuZXcgZGV2aWNlIGlzIGhpZ2gtc3BlZWQNCj4gICAgICBbICAzMTEuNjQxNzk4
XSBkd2MyIDMwMTgwMDAwLnVzYjogbmV3IGFkZHJlc3MgMTQNCj4gICAgICBbICAzMTEuNzQ1NTk3
XSBnX3NlcmlhbCBnYWRnZXQ6IGhpZ2gtc3BlZWQgY29uZmlnICMyOiBDREMgQUNNIGNvbmZpZw0K
PiAgICAgIFsgIDMxMi45MDUxMDJdIGR3YzIgMzAxODAwMDAudXNiOiBuZXcgZGV2aWNlIGlzIGhp
Z2gtc3BlZWQNCj4gICAgICBbICAzMTIuOTQ0MzAxXSBkd2MyIDMwMTgwMDAwLnVzYjogbmV3IGFk
ZHJlc3MgMTUNCj4gICAgICBbICAzMTIuOTY3ODY3XSBnX3NlcmlhbCBnYWRnZXQ6IGhpZ2gtc3Bl
ZWQgY29uZmlnICMyOiBDREMgQUNNIGNvbmZpZw0KPiAgICAgIFsgIDMxNC44MjgxNzNdIGR3YzIg
MzAxODAwMDAudXNiOiBuZXcgZGV2aWNlIGlzIGhpZ2gtc3BlZWQNCj4gICAgICBbICAzMTQuODY2
OTQzXSBkd2MyIDMwMTgwMDAwLnVzYjogbmV3IGFkZHJlc3MgMTYNCj4gICAgICBbICAzMTQuODg5
NTUwXSBnX3NlcmlhbCBnYWRnZXQ6IGhpZ2gtc3BlZWQgY29uZmlnICMyOiBDREMgQUNNIGNvbmZp
Zw0KPiANCg0KSSBhc3N1bWUgaGVyZSB5b3UgZmV3IHRpbWUgZGlzY29ubmVjdGVkIGFuZCB0aGVu
IGNvbm5lY3RlZCBjYWJsZSBhbmQgDQphZnRlciBsYXN0IGNvbm5lY3Rpb24gZXZlbiB3aGVuIGdf
c2VyaWFsIHNlZW4gaW4gbGFzdCBsaW5lIGl0IHN0b3Agd29yay4gDQpDb3JyZWN0Pw0KDQo+IA0K
PiBUaGUgIlsgIDMxNC44ODk1NTBdIGdfc2VyaWFsIGdhZGdldDogaGlnaC1zcGVlZCBjb25maWcg
IzI6IENEQyBBQ00NCj4gY29uZmlnIiBtZXNzYWdlIGlzIHRoZSBsYXN0IHRpbWUgaXQgaXMgZGV0
ZWN0ZWQuIEFzIG1lbnRpb25lZCwgdG8NCj4gcmVzdG9yZSB0aGUgcG9ydCB0byB3b3JrLCB3ZSBu
ZWVkIHRvIHJlbG9hZCB0aGUgZ19zZXJpYWwgbW9kdWxlLg0KPiANCj4gV2hlbiB3ZSByZWxvYWQg
aXQsIGZvbGxvd2luZyBleGNlcHRpb24gaGFwcGVuczoNCj4gDQoNCkFjdHVhbGx5IGV4Y2VwdGlv
biBoYXBwZW4gaW4gZ19zZXJpYWwgbm90IGR3YzIuIFdoeSB5b3UgYXNzdW1lIHRoYXQgaXQgDQpi
ZWNhdXNlIG9mIGR3YzI/DQoNCj4gICAgICBbICA5MjMuOTYyNTQ3XSA5ZmUwOiAwMDAwMDAwMiBi
NjM0NjY4OCBiNjU0NzhkMCBiNmY0ODY3YyA2MDBmMDAxMA0KPiBmZmZmZmY5YyAwMDAwMDAwMCAw
MDAwMDAwMA0KPiAgICAgIFsgIDkyMy45NjMzMDRdIFs8YzA4NTA2Mzg+XSAoX3Jhd19zcGluX2xv
Y2tfaXJxKSBmcm9tIFs8YmYwNDVkNDQ+XQ0KPiAoZ3NfY2xvc2UrMHgyYy8weDFmMCBbdV9zZXJp
YWxdKQ0KPiAgICAgIFsgIDkyMy45NjQxMTddIFs8YmYwNDVkNDQ+XSAoZ3NfY2xvc2UgW3Vfc2Vy
aWFsXSkgZnJvbQ0KPiBbPGMwNGY5NmU4Pl0gKHR0eV9yZWxlYXNlKzB4ZjAvMHg0OWMpDQo+ICAg
ICAgWyAgOTIzLjk2NDg2M10gWzxjMDRmOTZlOD5dICh0dHlfcmVsZWFzZSkgZnJvbSBbPGMwNGZi
NWE0Pl0NCj4gKHR0eV9vcGVuKzB4MTE4LzB4NDUwKQ0KPiAgICAgIFsgIDkyMy45NjU1MjZdIFs8
YzA0ZmI1YTQ+XSAodHR5X29wZW4pIGZyb20gWzxjMDJiNTA5Yz5dDQo+IChjaHJkZXZfb3Blbisw
eGUwLzB4MWI0KQ0KPiAgICAgIFsgIDkyMy45NjYxODhdIFs8YzAyYjUwOWM+XSAoY2hyZGV2X29w
ZW4pIGZyb20gWzxjMDJhYzUzOD5dDQo+IChkb19kZW50cnlfb3BlbisweDExNC8weDNmNCkNCj4g
ICAgICBbICA5MjMuOTY2ODk3XSBbPGMwMmFjNTM4Pl0gKGRvX2RlbnRyeV9vcGVuKSBmcm9tIFs8
YzAyYmY3Nzg+XQ0KPiAocGF0aF9vcGVuYXQrMHgyZjgvMHgxMTI4KQ0KPiAgICAgIFsgIDkyMy45
Njc2MTNdIFs8YzAyYmY3Nzg+XSAocGF0aF9vcGVuYXQpIGZyb20gWzxjMDJjMTkzMD5dDQo+IChk
b19maWxwX29wZW4rMHg3NC8weGU0KQ0KPiAgICAgIFsgIDkyMy45NjgyOTBdIFs8YzAyYzE5MzA+
XSAoZG9fZmlscF9vcGVuKSBmcm9tIFs8YzAyYWRiNWM+XQ0KPiAoZG9fc3lzX29wZW4rMHgxNzQv
MHgyMDgpDQo+ICAgICAgWyAgOTIzLjk2ODk4NV0gWzxjMDJhZGI1Yz5dIChkb19zeXNfb3Blbikg
ZnJvbSBbPGMwMTAxMDAwPl0NCj4gKHJldF9mYXN0X3N5c2NhbGwrMHgwLzB4NTQpDQo+ICAgICAg
WyAgOTIzLjk2OTY3NV0gRXhjZXB0aW9uIHN0YWNrKDB4YzY3MzlmYTggdG8gMHhjNjczOWZmMCkN
Cj4gICAgICBbICA5MjMuOTcwMTM2XSA5ZmEwOiAgICAgICAgICAgICAgICAgICAwMDNlNGZmMCAw
MDY3NDQ1MCBmZmZmZmY5Yw0KPiAwMDNlNGZmMCAwMDAwMDkwMiAwMDAwMDAwMA0KPiAgICAgIFsg
IDkyMy45NzA4NjhdIDlmYzA6IDAwM2U0ZmYwIDAwNjc0NDUwIDAwMDAwMDBkIDAwMDAwMTQyIGI1
N2ZmMDExDQo+IDAwMDQwMDAwIDAwMDQwMDAwIGI2MzQ2ODc0DQo+ICAgICAgWyAgOTIzLjk3MTU5
N10gOWZlMDogMDAwMDAwMDIgYjYzNDY2ODggYjY1NDc4ZDAgYjZmNDg2N2MNCj4gICAgICBbICA5
MjMuOTcyMDY1XSBDb2RlOiBmNTdmZjA1YiBlMTJmZmYxZSBmMTBjMDA4MCBmNTkwZjAwMCAoZTE5
MDNmOWYpDQo+ICAgICAgWyAgOTIzLjk3MjYxOF0gLS0tWyBlbmQgdHJhY2UgMDJlZGJiYjk5NDhj
MTU5YyBdLS0tDQo+ICAgICAgWyAgOTM4LjkwODcxNl0gZ19zZXJpYWwgZ2FkZ2V0OiBHYWRnZXQg
U2VyaWFsIHYyLjQNCj4gICAgICBbICA5MzguOTA5MTUyXSBnX3NlcmlhbCBnYWRnZXQ6IGdfc2Vy
aWFsIHJlYWR5DQo+ICAgICAgWyAgOTM4LjkxNzE0OF0gZHdjMiAzMDE4MDAwMC51c2I6IGJvdW5k
IGRyaXZlciBnX3NlcmlhbA0KPiAgICAgIFsgIDkzOS4xNzYxNzldIGR3YzIgMzAxODAwMDAudXNi
OiBuZXcgZGV2aWNlIGlzIGhpZ2gtc3BlZWQNCj4gICAgICBbICA5MzkuMjE1NDU5XSBkd2MyIDMw
MTgwMDAwLnVzYjogbmV3IGFkZHJlc3MgMTcNCj4gICAgICBbICA5MzkuNDIyMDM3XSBnX3Nlcmlh
bCBnYWRnZXQ6IGhpZ2gtc3BlZWQgY29uZmlnICMyOiBDREMgQUNNIGNvbmZpZw0KPiANCj4gU28s
IEkgYW0gYSBiaXQgbG9zdCBob3cgdG8gZGVidWcgdGhpcyBzbyBJJ2QgbGlrZSB0byBrbm93IHdo
YXQga2luZCBvZg0KPiBpbmZvcm1hdGlvbiBtaWdodCBiZSB1c2VmdWwgdG8gZmluZCB0aGUgcm9v
dCBjYXVzZSBvZiBpdD8NCg0KQW5kIGRlc3BpdGUgb2YgYWJvdmUgZXhjZXB0aW9uLCBnX3Nlcmlh
bCBlbnVtZXJhdGVkIGl0IHdvcmtzIGZpbmU/DQoNCg0KUGxlYXNlIHByb3ZpZGUgbWUgZHVtcCBv
ZiBmb2xsb3cgZHdjMiBkZWJ1Z2ZzJ3M6IHJlZ2R1bXAsIGh3X3BhcmFtcywgcGFyYW1zLg0KDQpU
aGFua3MsDQpNaW5hcw0KDQo=
