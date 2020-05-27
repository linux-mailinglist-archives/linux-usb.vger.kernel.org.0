Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D27791E47BE
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 17:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729629AbgE0PlE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 11:41:04 -0400
Received: from mail-bn7nam10on2060.outbound.protection.outlook.com ([40.107.92.60]:10336
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727804AbgE0PlD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 May 2020 11:41:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZyiAvZBKvyxjuvdUT1VbvQPNs24tXShFNvLLhO9GwotR8Mt1Hka16jWngsjIOlmc8vNQhFC2TszQFsqZMTJSfmetB7fcl85EtrWn6qIn1xoo4C6MSV/D/huSZA22ffyVr/4gzmMDqjNsNCs4UuEqR81ZT8mgHRci85iFLVRhqxXZ9K55d3iUJpuvm/2K/U0MgygVZ4xSILsSdgc6ilhefquoo7H2Bdcrzjizg+h2rAdSuziVJSkaWF/Hq6M1RrTDR6TWfE1Udhuuro2pqTgBNe5OSM3VdoBpKtfJzOnfiSe6BAbEPKPkaxqUC4QdLmPq7NTffm9BUxsHg8HrMyMN6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkhX44VCrv8kxabe3oWR3PRQPU5Icz42zKAXA9L/PfY=;
 b=GhXwIk+gOksLCNgsyy3AZ5HKRzXz9AfhDz1lJG9dVHGCI1lfGR8ynL0P2n9gGUuMHTlrfkkxIhYvWF/a8tI7iBdWSWhHgf5t5ulHHH41uYiRodAF9lHA0wAYda/+NshJ0MynXIF/cOtiS9E1pbyHQxeMB6qnUmWoq27ALyvbz2tkFbiHOdiN8k1bd0D1i8/80x2wTXgAe5qAv2bcQn3dQAAY3vU8kMxuoKeReLU8Vd14a+I3vGJHPR3DW43CRXHoC0U0NEDrm9raj00LqXLReyG02xXUzodmPy1E2Juvf/PVrs8tJEsut+l0mqnODCbIThF2k4i5lxBAKV/72GbD/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkhX44VCrv8kxabe3oWR3PRQPU5Icz42zKAXA9L/PfY=;
 b=D5jJXSxph2XAOPlrwi+VnZNvPNSZWpRWiJlPboOi5TGZkZBuOEkpAHS1jrOtRGa/Dg0jyrsuDP+b5P5feB/FBwyrTHBpYuJ4reGJTjFmNC1JoCSeGtiVO/BkJ0jjkSa305P1qsXuzJAc6V1Amjqdo2kJ60YrEz1vKbgX/M2e0HE=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3697.namprd10.prod.outlook.com (2603:10b6:408:b3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Wed, 27 May
 2020 15:41:01 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941%2]) with mapi id 15.20.3021.029; Wed, 27 May 2020
 15:41:01 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "oneukum@suse.com" <oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Topic: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Index: AQHWMqM6W5iP9Jkv9UCEGIiDuBaJw6i45d+AgAADdICAABpkAIABC5qAgAADbYCAABTvAIAAbWUAgAAJUgCAAQCagIAAEYeAgAAQ3QCAACtYAIAAKHAA
Date:   Wed, 27 May 2020 15:41:00 +0000
Message-ID: <d7f2750db8c2616fb74fc2e7ea006354e546c7fc.camel@infinera.com>
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
In-Reply-To: <c2c3eed27aa13f981690779aca00c420ce0beb06.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 041e4077-b5cd-4a9c-df7c-08d802545b97
x-ms-traffictypediagnostic: BN8PR10MB3697:
x-microsoft-antispam-prvs: <BN8PR10MB3697A645C7816DDBF14FC772F4B10@BN8PR10MB3697.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04163EF38A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LKn9JxGEEgECV0NMl0lVfV0Egub2rTn5WA4LAsc2CAK4+1d4I2AWw5EVpP8nRI1MU5sXPIHjqz8Nb9LE+FsHgSw4B8/CtoYu67dTuNUCNRSSoPj6/t8jLcZyk411cASVmYTXLoblqmgejBUb9IEqvzqYneP57OXU1N1kkBw+MDqMTLkmMn5BIAD1DAWWECnNzvyVQfoRYoXltrjWvyYd6Bh1i54wAoYTjMzzQNPZ1UHdv6+J1wiQv18j0mGQZoDgZnIi4L5Zyq+I/SPw1J1FQNmwaEk9U94OIvuSLrWpekvdeesoqT6bRa9q4jR/fAeCw3tHlO16sf7HNTga/r3anQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3540.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(5660300002)(2616005)(71200400001)(478600001)(8676002)(66556008)(8936002)(91956017)(66946007)(66446008)(64756008)(6506007)(316002)(76116006)(66476007)(26005)(6512007)(6486002)(2906002)(86362001)(110136005)(186003)(83380400001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 16lE24X/gKURULC6l6yp8PkSROGFmDVrJYUM8t5ch9pDEK5BbIyjUNo3QLA+Ovvbzq/5t1jTtnw9kVpkvV7zdPa2pw8sMTuBxr/00tdWeS6IsHzykLr7GF08Tz4D/b73X9RAuyCOs6A1Qz4XFyQ70rg3APGBdNew+ANL+Na7nQvlzOpFJ/K6te9C86jOcvDDGPYQtkBlLDN3qSk67RIZIuDW6XX45UzHi+UexBjZEEE0twC65L6+x6P/vIceGH0rEZSwRgvo9VBxfJy+qtVaWz4sSiH3xAubdncua3MWgSY3ZINIbIF/Y6jj26YLQbTnRKINv8DVHMWCUqJOuECjtozkE0Ag6KU3t6vxo7d6YbX+dnXepnyAguuSRj+j9E1kO1w2y3lqy7B+s3JOlHRVebko56MeX6dnqrE97afR6aJyBeVd34Y7u0j9qS5RKxK9ZvVKt3uCTZH0UVYGX32djvrvUT1XT7QtghfrwnQlt0g0pSfyw/dJcB89PEvdQYSy
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0B0483B59844B40A532E1BE5854A483@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 041e4077-b5cd-4a9c-df7c-08d802545b97
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2020 15:41:00.8334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gOpbxPcBQlii7QK+FIqgAss0gOlsglSwJDH4AyiBIKNeg5z9mwxp0eJr4tGqa5xIMy0ixu2LRhJ1NUtuV1uAHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3697
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCAyMDIwLTA1LTI3IGF0IDE1OjE2ICswMjAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3Rl
Og0KPiBPbiBXZWQsIDIwMjAtMDUtMjcgYXQgMTI6NDEgKzAyMDAsIE9saXZlciBOZXVrdW0gd3Jv
dGU6DQo+ID4gQW0gTWl0dHdvY2gsIGRlbiAyNy4wNS4yMDIwLCAwOTo0MCArMDAwMCBzY2hyaWVi
IEpvYWtpbSBUamVybmx1bmQ6DQo+ID4gPiBPbiBXZWQsIDIwMjAtMDUtMjcgYXQgMTA6MzggKzAy
MDAsIE9saXZlciBOZXVrdW0gd3JvdGU6DQo+ID4gPiA+IENBVVRJT046IFRoaXMgZW1haWwgb3Jp
Z2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBh
bmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+
IEFtIERpZW5zdGFnLCBkZW4gMjYuMDUuMjAyMCwgMTc6MTkgKzAwMDAgc2NocmllYiBKb2FraW0g
VGplcm5sdW5kOg0KPiA+ID4gPiA+IFRoaXMgInUtYm9vdCBTUEwiIGlzIHRoZSBmaXJzdCB0aGlu
ZyB1LWJvb3Qgd3JpdGVzIGFuZCBzb21laG93IHRoaXMgaXMgcmVtZW1iZXJlZCwgSSBhc3N1bWUs
IGJ5IGNkY19hY20NCj4gPiA+ID4gPiBhbmQgZ2V0cyBlY2hvZWQgYmFjayB3aGVuIEkgb3BlbiB0
dHlBQ00wDQo+ID4gPiA+IA0KPiA+ID4gPiBIaSwNCj4gPiA+ID4gDQo+ID4gPiA+IHRoYXQgbWFr
ZXMgc2Vuc2UsIGJ1dCBpdCBpcyBub3Qgc29tZXRoaW5nIHRoYXQgd2UgY291bGQgcmVhbGx5DQo+
ID4gPiA+IGNoYW5nZSBpbiBDREMtQUNNLCBJIGFtIGFmcmFpZC4NCj4gPiA+IA0KPiA+ID4gV2h5
IG5vdD8gQ0RDLUFDTSBzaG91bGQgZWNobyBiYWNrIGFueXRoaW5nIGl0IGhhcyByZWNlaXZlZCBi
ZWZvcmUgb3BlbiBvZiB0dHlBQ00NCj4gPiANCj4gPiBXZWxsLCB0aGVyZSBpcyBhbiBpbmhlcmVu
dCByYWNlIGNvbmRpdGlvbiB3aXRoIGxvYWRpbmcgdGhlIG1vZHVsZSBJIGFtDQo+ID4gYWZyYWlk
LiBCeSBkZWZhdWx0IGNkYy1hY20gc2hvdWxkIGFjdHVhbGx5IGVjaG8uIFlvdSBjYW4gc2V0IHRo
ZQ0KPiA+IERJU0FCTEVfRUNITyBlY2hvIHF1aXJrIGZvciB5b3VyIGRldmljZSBpZiB5b3Ugd2Fu
dCB0byBnZXQgcmlkIG9mIGl0Lg0KPiA+IA0KPiA+IElzIENEQy1BQ00gdmlvbGF0aW5nIHNvbWUg
c3RhbmRhcmQgd2l0aCByZXNwZWN0IHRvIGVjaG9pbmc/IENoYW5naW5nDQo+ID4gZGVmYXVsdHMg
cmVhbGx5IGh1cnRzIHVzZXJzLCBubyBtYXR0ZXIgd2hhdCB5b3UgZG8uDQo+ID4gDQo+IA0KPiAJ
LyoNCj4gCSAqIFN1cHByZXNzIGluaXRpYWwgZWNob2luZyBmb3Igc29tZSBkZXZpY2VzIHdoaWNo
IG1pZ2h0IHNlbmQgZGF0YQ0KPiAJICogaW1tZWRpYXRlbHkgYWZ0ZXIgYWNtIGRyaXZlciBoYXMg
YmVlbiBpbnN0YWxsZWQuDQo+IAkgKi8NCj4gCWlmIChhY20tPnF1aXJrcyAmIERJU0FCTEVfRUNI
TykNCj4gCQl0dHktPnRlcm1pb3MuY19sZmxhZyAmPSB+RUNITzsNCj4gDQo+IFRoYXQgc2VlbXMg
dG8gYmUgd2hhdCBJIG5lZWRlZCwgc2hvdWxkIGJlIGRlZmF1bHQgSSB0aGluayAuLi4NCj4gTmVl
ZCB0byB0ZXN0IHNvbSBtb3JlIGJ1dCBsb29rcyBtdWNoIGJldHRlci4NCj4gSSBndWVzcyBhbGwg
Y2RjX2FjbSdzIGFyZSBjb3VsZCBzdWZmZXIgZnJvbSB0aGlzPyBXaWxsIGRlcGVuZCB0aGUgdGFy
Z2V0IGluIHRoZSBvdGhlcg0KPiBlbmQuDQo+IA0KDQpXb3VsZCBiZSBuaWNlIGlmIHRoZSBFQ0hP
IGNvdWxkIGJlIGRlbGF5IHVudGlsIGZpcnN0IHJlYWQoMikvdGVybWlvc19zZXQsIHRoZSBiYXVk
cmF0ZSBjb3VsZCBiZSAxMTUwMCB1bnRpbCBvcGVuKDIpIHRvbywgbWF5YmUNCg0KSG93ZXZlciwg
dGhlIGJpZ2dlciBxdWVzdGlvbjogSXMgdGhlIGEgd2F5IHRvIGNvbmZpZ3VyZSBXaW5kb3dzIHRv
IGRlZmF1bHQgdG8gfkVDSE8gdG9vID8NCg0KICAgIEpvY2tlIA0K
