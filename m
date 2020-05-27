Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8AFB1E3DBA
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 11:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbgE0Jku (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 05:40:50 -0400
Received: from mail-dm6nam10on2041.outbound.protection.outlook.com ([40.107.93.41]:26260
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727909AbgE0Jkt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 May 2020 05:40:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvVfezDRMw5tj3zIAqukwBf+6e/nf2qaagvTI8IcjF2GAUHWAhzGmLablbvV9m7RH/Y0q0wmieDowejeDatJgpnLsyETS5/wOB+Lrh2KeGBduI8BFUYrUaSHWHIbxLnEzPrL9F6KO1w+E6wNXHFezP73oZSkucpXHXFqI9boK/Rsp0wFSSJRPmfs2BIHiRUw68LmHRWvQi5/Hn23X6ciOjC+bigsPtB3SKb8B6k3lNBMxGnXMU1I9wr1GawSnBVkGfjWdm5d8WeucOfbRFZItWESp9RqP97ZDeFrDJepnrKOiAIgkQIT1GKtZpRmRpdNANrONfw2/MvLBFxXLjFMmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2miadqWlNLdCsvsRoLnuPMXxj/GqaKTKkWp/bUmG0o=;
 b=aoM2K8fJN3GNhZQeEFFLSrxH8E0WR+q2TFZ1NfhpNjiEjGZ68wCcZHTtY6f7ta22OC1bctWTGA/fBjANTH4dsIBVVnHe7Acq8pr2EQrYoU1zYYPl31I9NnU4HsnKKwKCsnKaKEvkw7tpubiPogFQr8LHXwvuSYWNs1bKQ+h4t8hmKY6PikblLKK3O/CZtvYs3y7ZzD2pcN7htz63qCocO9caj1cADUe+PJGMLOspSQNM9u7mGTdp2jA2rXPaYJcotL5tTKOroF2wEuFH2+zeGx3nl/T+GxKgLAXRPhSxPBRvoIqmKmfQjC1Z56yVlbv3yZ4lR5mO8bZVWHryT8IlqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2miadqWlNLdCsvsRoLnuPMXxj/GqaKTKkWp/bUmG0o=;
 b=O1Mv71s6PGvj4B+foTRu62JbDv7/w1CjsKvpRFSd1gCspsKUZT5hXuBxYCNwNDmCGokynFdKYgL0yRBWTQ/prxmL4u1qNXMOeGFm5J1gPCLJXxEOOQj7j/EwjdhaKRgExJAyyjFaTB3B0D/bKl/aoeGgewmLTsMBMyOrdAyMtM0=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3139.namprd10.prod.outlook.com (2603:10b6:408:d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 27 May
 2020 09:40:47 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941%2]) with mapi id 15.20.3021.029; Wed, 27 May 2020
 09:40:47 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "oneukum@suse.com" <oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Topic: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Index: AQHWMqM6W5iP9Jkv9UCEGIiDuBaJw6i45d+AgAADdICAABpkAIABC5qAgAADbYCAABTvAIAAbWUAgAAJUgCAAQCagIAAEYeA
Date:   Wed, 27 May 2020 09:40:47 +0000
Message-ID: <f4a809ba4ca132266e476ca1805e4ff9e5663f9f.camel@infinera.com>
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
In-Reply-To: <1590568683.2838.42.camel@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de837a7a-ce9f-4667-c388-08d8022208f9
x-ms-traffictypediagnostic: BN8PR10MB3139:
x-microsoft-antispam-prvs: <BN8PR10MB3139C24C011F4A78935BF0F0F4B10@BN8PR10MB3139.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 04163EF38A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rcQQEXeWi/bKNNvjkfdaJcCWaWLTl1iRGi4NhOqBnwvEzZJq8IiczJ9HcUmczW29pdCLFyN9cbev3HcFQMo2pGpsBOZ74FvjcyrOfsz8bQ/YHily1+60+mDKvWuNAx9Sop2VTz1GGisS9vjmQQp/4ixvALyzJoaLstGT3NtmNaIbqjTkKdRurZqcabV9piQ6alcoJFsxIkrFBVLpvdnOis9kuCkf9C99JvJpf4KMRqzyPsYyHN8OwHlfKBNg3Qz4YcRNnuLmmO9Q84w5w6iqNWwYO58p08XsMQ9Jn7mD7EGYNUmJiVqajWXpuKTl2diEYBOLFdIwfvSaGaSEAomKxA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3540.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(376002)(366004)(346002)(39850400004)(316002)(6512007)(8676002)(478600001)(5660300002)(66476007)(6486002)(76116006)(66946007)(8936002)(64756008)(66556008)(66446008)(2906002)(86362001)(91956017)(4744005)(186003)(71200400001)(110136005)(6506007)(36756003)(2616005)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: QrnBAVufS3riWCePTSWSbWrKOT7vUNCqPZOdMt/YOzOSgyhdZ59N0/vHABY+p7q4hI+Kc/K6ribk6788trqPRhTHzRIuKodF2azXqytkPWL7mB/xoD8u0j3Kg77G+jR2K4SwVZ9V/uS+6PlH6LerFmLvcguFPuOD2oIz5xrKpbjmcCR++Mu9sJp+9+RcmBWWVf2yyFouKKuCNCK7WRJRe2C/k+4TRridlComUnHuVe1iV33SacSu0T2JtS5I3VnoV3egr5ipo+pNYNUY9xG1Q9atOegQ1lX3TZoxcEgkvZtDdbG9RpMXxprxFcp3DiwnRRec7soraUP/hsaR1/woUOyiNG/74fltAVBlwQ5bWOBGaR3awuL0xFl/rcUXeuq+OMEJ5OrdfPReDuOQ2u3X2XvaaJhJ4v0DgzqWU9HmjzM1q9u/hi+AZkt4toS9tfClGyDB4UrqXsQ5ZXTGoSRODaSG9QQlfYpclJpwFqvOoHQC7mYqGFcdTeimF3rgoSu0
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CF1E3273D8FC644897B68A298F64478@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de837a7a-ce9f-4667-c388-08d8022208f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2020 09:40:47.3896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G9RnRhyHgqqXAdpanQaw7JPiAKNiSLIgnsiJw1oo0sfxffwePVZEvztU3XiTUo7SHK1jK2oI9gM595NbVqNdIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3139
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCAyMDIwLTA1LTI3IGF0IDEwOjM4ICswMjAwLCBPbGl2ZXIgTmV1a3VtIHdyb3RlOg0K
PiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdh
bml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4g
DQo+IA0KPiBBbSBEaWVuc3RhZywgZGVuIDI2LjA1LjIwMjAsIDE3OjE5ICswMDAwIHNjaHJpZWIg
Sm9ha2ltIFRqZXJubHVuZDoNCj4gPiANCj4gPiBUaGlzICJ1LWJvb3QgU1BMIiBpcyB0aGUgZmly
c3QgdGhpbmcgdS1ib290IHdyaXRlcyBhbmQgc29tZWhvdyB0aGlzIGlzIHJlbWVtYmVyZWQsIEkg
YXNzdW1lLCBieSBjZGNfYWNtDQo+ID4gYW5kIGdldHMgZWNob2VkIGJhY2sgd2hlbiBJIG9wZW4g
dHR5QUNNMA0KPiANCj4gSGksDQo+IA0KPiB0aGF0IG1ha2VzIHNlbnNlLCBidXQgaXQgaXMgbm90
IHNvbWV0aGluZyB0aGF0IHdlIGNvdWxkIHJlYWxseQ0KPiBjaGFuZ2UgaW4gQ0RDLUFDTSwgSSBh
bSBhZnJhaWQuDQoNCldoeSBub3Q/IENEQy1BQ00gc2hvdWxkIGVjaG8gYmFjayBhbnl0aGluZyBp
dCBoYXMgcmVjZWl2ZWQgYmVmb3JlIG9wZW4gb2YgdHR5QUNNDQoNCiBKb2NrZQ0K
