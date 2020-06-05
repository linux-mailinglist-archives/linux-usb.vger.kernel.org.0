Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F157E1EF50B
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jun 2020 12:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgFEKJp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jun 2020 06:09:45 -0400
Received: from mail-mw2nam10on2072.outbound.protection.outlook.com ([40.107.94.72]:6595
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726297AbgFEKJp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jun 2020 06:09:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDwBXB60wyPhaoo0nZBssrumq7sSHfTADDl/i8jMzGEw45ULkkiv+IuEJJM83Qf903VaaD53KYk8ptgcVDHbCudWLqAsTYkm34OrRRNkUKF7n5H9J+Us57MeDfvMxPVxnT5TtUXszxwRs2LfP2nNJylSRv6eKUU4L0cOb1yFOdMwsoBu8xG956pherFN0OtB6FhjLSWvSvq8QeAUBOZYOZq7+mGWLHu2sLDBH6IawmGgPjV5XaRFOg4XQxSbrZ0ebJEsnSVGcOoH52kmObnY/mM41S921PRjoZeExHdvWTHBBHD8xaha545S44kaOuWNBGv5LqZMFeGJVxABSqix2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jn9vNZs0xl/5BQa/suDJ10PGWUtPgNizszWd5qysB0Q=;
 b=ThdhSIfj+CHVMWADWhPCo9vrNkGlEiCne2dEq8jI0DkoqZpJeN9cGCR1ptGzdBDSvhqzQNlkY5E9I/iY6DahmFUdGRXXgercT0SvkJtjUzwEIP+gC8DkDCJLRxFcPNZ4qCtKEpP4ATr5XiXgeegS59lSJcyimmpR6ghlYDPMewW/28QeILgLCdCOw5xX2ozdfHQnu+5suNYxsA7X+ZGMk6EiVarzk8U9jHlB8AOWbPn7NGw+PoHBlMvTHz4HrhPKAK1biSfo+I8GVs2dmwGxfRFX1ugHFCfOa0Ut3WgEvOnfcB0qOsjR6zKtUs8gRuOwZCZ1pypp0p71Ts132cbLlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jn9vNZs0xl/5BQa/suDJ10PGWUtPgNizszWd5qysB0Q=;
 b=PcLAnSE8kDBUnbF6OfKMD7ICn4ZshD97L1rT1GtEMh9sH3GuvtVu0mfRp5kEJsFIMTJbkCZGUAtQP+VhbIIgZioKMIU6tfq7YFgEAQLVoQP7+u8qvDt8nGhQU0PVh7u1HuAHu533AWu2ZFYQZUbjaH82eFkDViPrKyqy2yEPCA8=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3220.namprd10.prod.outlook.com (2603:10b6:408:c8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Fri, 5 Jun
 2020 10:09:42 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941%2]) with mapi id 15.20.3066.022; Fri, 5 Jun 2020
 10:09:42 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "oneukum@suse.com" <oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Topic: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Index: AQHWMqM6W5iP9Jkv9UCEGIiDuBaJw6i45d+AgAADdICAABpkAIABC5qAgAADbYCAABTvAIAAbWUAgAAJUgCAAQCagIAAEYeAgAAQ3QCAACtYAIAAKHAAgA3IaoA=
Date:   Fri, 5 Jun 2020 10:09:42 +0000
Message-ID: <9971e8a97ea0f9d63864829fd8f2f4db897fc131.camel@infinera.com>
References: <6a4fe396ab5ae6cda548e904c57bc823103999d7.camel@infinera.com>
         <1590418977.2838.16.camel@suse.com>
         <b39259fc7f397b27f4af145eeafb33ec36638660.camel@infinera.com>
         <a3f4a9bbde9efd2827b2a02c46f86c8ba7853bc6.camel@infinera.com>
         <1590482853.2838.26.camel@suse.com>
         <8cf71160e703a18b28d27a844406d42f6cadf39b.camel@infinera.com>
         <1590488084.2838.34.camel@suse.com>
         <42c92312c74e90e5507de4103bd15bbbe175f98d.camel@infinera.com>
         <4c2bd25aa7f6672cb132487f7af6a787ffc1fab6.camel@infinera.com>
         <1590568683.2838.42.camel@suse.com>
         <f4a809ba4ca132266e476ca1805e4ff9e5663f9f.camel@infinera.com>
         <1590576068.2838.56.camel@suse.com>
         <c2c3eed27aa13f981690779aca00c420ce0beb06.camel@infinera.com>
         <d7f2750db8c2616fb74fc2e7ea006354e546c7fc.camel@infinera.com>
In-Reply-To: <d7f2750db8c2616fb74fc2e7ea006354e546c7fc.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00dc2815-b044-4220-9075-08d8093890d5
x-ms-traffictypediagnostic: BN8PR10MB3220:
x-microsoft-antispam-prvs: <BN8PR10MB32205B1404837C2F23C136D7F4860@BN8PR10MB3220.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0425A67DEF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f3WLiIyh8JDAb3s9zaim1Ih55VG9Mp/xwWD6KyGXAZzvGAvlJLaSfmEU8UHh8ZNRKEe8cCFY2ZAx8v6l58dfD0o1Xs70FGBB11dhOqF9JNfPourgb2K5lGstLj+AVuRU5iQMVnbM6z4fxuAOyi57fBtKC7k8KkJbMWYP9poHbmTULTbBG8CJe4VKWSeOVP8q63KoAPztRRQVmI0WJ9FoNplFnKWHE0hvT/OfCqUElTgH+wMkAKH7KdnmQgKNiJfZWxJfEJZtoENUqsz5dNAv5dfM0QquWpWel2+kx11BFQyTPln5rA0rdu50EH0Qat9vLx6JLayvvSZXQ3kGaHz1JQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3540.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(478600001)(6512007)(6506007)(66946007)(8676002)(26005)(64756008)(66556008)(71200400001)(66446008)(66476007)(2906002)(186003)(36756003)(316002)(91956017)(2616005)(86362001)(110136005)(5660300002)(6486002)(8936002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: TtjAkVGey+DHYe5huO0SFqjYK8pGN0rw/eSBlH4VwgMB4cPD8r3fajTNnClN6mNeXktW99X5m/z6WgedPjdGbvtkdJ0hVF5CE7PEMOIVysjpS3XKKh32jOrk6hdp40QuqVny3eQ6Tn9surL8HSVfTlZoT1D8BDCR42mMJv0UHB6h7o9aMb1rgxmtJhJDyzPQG3SiBKjeowFciF16H1IHdxOKvPvrGTNGjWquEY0kZqqYu4Cm3IS6SqcCA873jJPYVPTeHM4SomkBjUcwR0XFgJEiOr9JCglyU+yd19/6UsubEJmejJog2ymoOjPo729HZGcvfi6H2NOiUdr0Q4zDn5ClSwAdoGL3GE+E1wMbmo7iwhCBo0L3Chb6DPJA1XRJ7yfO6eFBwyRFCAy5B7bF47OPmcV4klDllwvzUovxclDs6YFfotvIU5rFBYjqa59EmnfMkn2/QMMftr8BqpYsCLQ4Oa8ROk1em4h0DaTyFuQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E694978D59CEF549AA4B9CEAB344704B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00dc2815-b044-4220-9075-08d8093890d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2020 10:09:42.4849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nr11gTpPwJ6ZHpGCq7JL+Ty26eeVIZP3jnhfHXZA3dqe9YyFL4NAZCZtTEYQnSW42xVxPCZ4Tp1wGvs23FdH0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3220
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCAyMDIwLTA1LTI3IGF0IDE3OjQxICswMjAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3Rl
Og0KPiBPbiBXZWQsIDIwMjAtMDUtMjcgYXQgMTU6MTYgKzAyMDAsIEpvYWtpbSBUamVybmx1bmQg
d3JvdGU6DQo+ID4gT24gV2VkLCAyMDIwLTA1LTI3IGF0IDEyOjQxICswMjAwLCBPbGl2ZXIgTmV1
a3VtIHdyb3RlOg0KPiA+ID4gQW0gTWl0dHdvY2gsIGRlbiAyNy4wNS4yMDIwLCAwOTo0MCArMDAw
MCBzY2hyaWViIEpvYWtpbSBUamVybmx1bmQ6DQo+ID4gPiA+IE9uIFdlZCwgMjAyMC0wNS0yNyBh
dCAxMDozOCArMDIwMCwgT2xpdmVyIE5ldWt1bSB3cm90ZToNCj4gPiA+ID4gPiBDQVVUSU9OOiBU
aGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXpl
IHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gPiA+ID4gPiANCj4g
PiA+ID4gPiANCj4gPiA+ID4gPiBBbSBEaWVuc3RhZywgZGVuIDI2LjA1LjIwMjAsIDE3OjE5ICsw
MDAwIHNjaHJpZWIgSm9ha2ltIFRqZXJubHVuZDoNCj4gPiA+ID4gPiA+IFRoaXMgInUtYm9vdCBT
UEwiIGlzIHRoZSBmaXJzdCB0aGluZyB1LWJvb3Qgd3JpdGVzIGFuZCBzb21laG93IHRoaXMgaXMg
cmVtZW1iZXJlZCwgSSBhc3N1bWUsIGJ5IGNkY19hY20NCj4gPiA+ID4gPiA+IGFuZCBnZXRzIGVj
aG9lZCBiYWNrIHdoZW4gSSBvcGVuIHR0eUFDTTANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBIaSwN
Cj4gPiA+ID4gPiANCj4gPiA+ID4gPiB0aGF0IG1ha2VzIHNlbnNlLCBidXQgaXQgaXMgbm90IHNv
bWV0aGluZyB0aGF0IHdlIGNvdWxkIHJlYWxseQ0KPiA+ID4gPiA+IGNoYW5nZSBpbiBDREMtQUNN
LCBJIGFtIGFmcmFpZC4NCj4gPiA+ID4gDQo+ID4gPiA+IFdoeSBub3Q/IENEQy1BQ00gc2hvdWxk
IGVjaG8gYmFjayBhbnl0aGluZyBpdCBoYXMgcmVjZWl2ZWQgYmVmb3JlIG9wZW4gb2YgdHR5QUNN
DQo+ID4gPiANCj4gPiA+IFdlbGwsIHRoZXJlIGlzIGFuIGluaGVyZW50IHJhY2UgY29uZGl0aW9u
IHdpdGggbG9hZGluZyB0aGUgbW9kdWxlIEkgYW0NCj4gPiA+IGFmcmFpZC4gQnkgZGVmYXVsdCBj
ZGMtYWNtIHNob3VsZCBhY3R1YWxseSBlY2hvLiBZb3UgY2FuIHNldCB0aGUNCj4gPiA+IERJU0FC
TEVfRUNITyBlY2hvIHF1aXJrIGZvciB5b3VyIGRldmljZSBpZiB5b3Ugd2FudCB0byBnZXQgcmlk
IG9mIGl0Lg0KPiA+ID4gDQo+ID4gPiBJcyBDREMtQUNNIHZpb2xhdGluZyBzb21lIHN0YW5kYXJk
IHdpdGggcmVzcGVjdCB0byBlY2hvaW5nPyBDaGFuZ2luZw0KPiA+ID4gZGVmYXVsdHMgcmVhbGx5
IGh1cnRzIHVzZXJzLCBubyBtYXR0ZXIgd2hhdCB5b3UgZG8uDQoNCkkgY2FuIHNlZSB0aGF0IHdo
ZW4gSSBvcGVuIHRoZSB0dHksIGEgVVNCIHJlYWQgaXMgcGVyZm9ybWVkIGFuZCB0aGVuIGVjaG9l
ZCBiYWNrLg0KU2hvdWxkIGFuIG9wZW4gcmVhbGx5IGRvIHRoYXQ/DQpJZiBzbywgYW4gZmxhZyB0
byBvcGVuKDIpLCB0ZWxsaW5nIGl0IHRvIGRyb3AgdGhlIGlucHV0IGJ1ZmZlciB3b3VsZCBiZSBy
ZWFsbHkgaGFuZHkuDQoNCiBKb2NrZQ0K
