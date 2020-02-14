Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 254A015D3EC
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2020 09:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728332AbgBNIgm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Feb 2020 03:36:42 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:57246 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725938AbgBNIgl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Feb 2020 03:36:41 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 906F640847;
        Fri, 14 Feb 2020 08:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1581669400; bh=gsOwQW+g1QGpooQeSMzg7busdGvcJM1AYMCoG5bZbyk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=X3QD9eNZ05r6OSyiljdf9KrGao7qbzqvt+sYV4fivWwhJWNMbd84qiqnghbjEq3I8
         TkQUhG+qNlyBTd+iJD8VLDoy+IkeGNQKoxfSg8MXo3iCg8BWMnaEcSbZ+U+BCJqa2I
         SqGXnXIsn2Uw+uZhT99GyxObXKpZeRhwdSXZQau+cHjKokY9sScdlRO2E0FfRx7ipl
         7xi8ImPaob+q//1GbtUZlm4WxikGiy+rEOPfFZLR19H5AJ+gyaPvSpkGn9YLGAkEEe
         +1OWg1HcZclUjGlWJux6l/6mzYpJFTszZ5IQRgKd9NXUGHhJ3nhqb9/QLKOOqypyZE
         Wt/ZCseEM9EBg==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 33417A006A;
        Fri, 14 Feb 2020 08:36:40 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 14 Feb 2020 00:36:40 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 14 Feb 2020 00:36:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gM/Nysdzl3pGWB1Brb756l5ZmlhQv3XnX4I6/PnIEe9UW1plEYNNQGPGu2ioG+iozmiRhDq54sFvGCR8z6kLrfsB+Kr5FRuaQ+8H0HVIu73dx8OSAnPs2X4J3s3XWU5J3lnEmuNpBl1FkxxOQiNRAclfGoPrsEmrmsz24fDgFRioqO5lfdm43oiC4PRWXopkbEsCDcKtAq/zbOlH99n/MEng4E8tRsMpo2PWn4CoDMoQfcw2wx/hpJ2jNfrcIsn789MnDrFaiAm2Xw8LNF0e0DP5mWPEj9vipJ6Z55LAfNXy1e8qOlFA6K3OoigHYoUg5DWwyKy6OwAqlQ8PAW/6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsOwQW+g1QGpooQeSMzg7busdGvcJM1AYMCoG5bZbyk=;
 b=I6SIDGj4OK22GZWfbZsXJ/MtCV0upJ7I4W0OR7KtlSSuVJgIXui8E79bFBkLdx69NhwdfVrwQZ/SSxUz7XcxZo+Bn3szLnjyLZnJt661aC2OmAC/+FMB+O5SkgOLHdnOLFPahXjk0CgdjfrRZAIGQLO3+vNtKjD4OI3N4KcR5igiG7wIYwxbTI5Togwvj6YDj1b3liUDMjsherGFPR5M9vDk3qN6LXx+4Blb+rf4YSAxX8VlsnuizcV6yAGIkcbVz5DwXidSAv8CTQgt4uHnavrNvPNHzikTsU8OGjqlyok8pe9s8t3mNhaRcocA8d4WEzUM6rkkZPzTQDt8xfFegw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsOwQW+g1QGpooQeSMzg7busdGvcJM1AYMCoG5bZbyk=;
 b=bEZjcW4UGZ5KXcuyRibGk60P+XTPcZ/ddaWXOx7pwQ3qXLgZqEVIHQmjhlNpq46OmLpYxpRtcdcgmbapLq0AMKpE/0I3C/j5tGUP06OQ+Uv1WhviHN44rlVw083Rxwob8CWFiL3kRUxDuN2SXodCdIcImNHVQD+P1l7L4febBIY=
Received: from BN7PR12MB2802.namprd12.prod.outlook.com (20.176.27.97) by
 BN7PR12MB2705.namprd12.prod.outlook.com (20.176.27.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.23; Fri, 14 Feb 2020 08:36:38 +0000
Received: from BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::e420:5711:3657:f3ca]) by BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::e420:5711:3657:f3ca%3]) with mapi id 15.20.2729.025; Fri, 14 Feb 2020
 08:36:38 +0000
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 1/4] usb: xhci: Synopsys xHC consolidate TRBs
Thread-Topic: [RFC PATCH 1/4] usb: xhci: Synopsys xHC consolidate TRBs
Thread-Index: AQHVtzsCoOCUmqsy60eqZZ0dzKJK/qfZO6UAgDcK6ICAB7aKAIACuDCA
Date:   Fri, 14 Feb 2020 08:36:38 +0000
Message-ID: <f304b12f-2e64-a1b2-5638-d4e71c30aeb0@synopsys.com>
References: <cover.1576848504.git.joglekar@synopsys.com>
 <08d08f2fd6da50e382852d014a08e371f2182382.1576848504.git.joglekar@synopsys.com>
 <3b09e3ef-d322-f8c8-f00a-34341509c350@linux.intel.com>
 <7d042091-66b5-c245-73c8-f4491ea037c3@synopsys.com>
 <85616a55-6f83-bd9d-b225-fa0ebe2d5862@linux.intel.com>
In-Reply-To: <85616a55-6f83-bd9d-b225-fa0ebe2d5862@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=joglekar@synopsys.com; 
x-originating-ip: [198.182.52.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82c3de49-153b-400b-b651-08d7b129024f
x-ms-traffictypediagnostic: BN7PR12MB2705:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR12MB270580544CB3A2C2039562E3A4150@BN7PR12MB2705.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03137AC81E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(366004)(346002)(39850400004)(396003)(189003)(199004)(86362001)(31686004)(31696002)(26005)(478600001)(81166006)(53546011)(186003)(6506007)(107886003)(71200400001)(8676002)(8936002)(81156014)(6512007)(2906002)(91956017)(66476007)(76116006)(36756003)(4326008)(316002)(66556008)(5660300002)(6486002)(110136005)(64756008)(66446008)(66946007)(2616005);DIR:OUT;SFP:1102;SCL:1;SRVR:BN7PR12MB2705;H:BN7PR12MB2802.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PxbukiNskgIoHv851IpHLe+FwUIsreiDVkek7+kQvb8jN+CCeYgmR+VuQyeX/6GDFB+9KCrArBlPOuGq12TqGLL+YXYDyej0DBVO6mR4eHSCcfyfBo5bQFnL7b64eRD4PD5kArbbIkRaNLCSyfen28RDXmZE/maL8Tw/M1yYWMMJU5MvRHQCO3+d/YawsLNFGT5J5uHdUKdnbQ3o1uafi3BK0pYTROvHMMTQXmIyFLKD3vchk1Ycx8af4rBRmHn8mnEep7UpNR1dyp0ldwVkz2b6HB0Wgr/2/jvTvnjHO9ziII4lwxoKqnkGhmrwtlkzhSId0k0daagterBOuk7kIsoPwRcMZLnbt0RH0moaxA16O1u2NNwYoogI4v4Ocw0upJtsSJ/xIqunFF+utbLopSEXYUV0jIyJ9HTKs662/zh4naSaUrS4zFp0YI2P4Fm+
x-ms-exchange-antispam-messagedata: 74Tq17A9r+IocUofdKN2fp8802CKwYTBam1Cyn7jhkpHH7wKKgUnZJXDevnbeTcD6wtCpHMPl8rM/EjLZKxfnxbt4z1qENYrdXvYJ58xSYLiDVaoZrHCIWOzVnhqMGn60O9RZZjSvUWCGOAa/2aR+g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FBF6FCFC23887409AD85755D991658A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c3de49-153b-400b-b651-08d7b129024f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2020 08:36:38.6378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WKjOmkOKvIfHYxE6y2LsAd1LNZ0E6UGOhtRTehtJc3bI+zKF5nQOQva3YPsQxmXiIDOOQIAFccIVgCo4ccPmcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2705
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQpPbiAyLzEyLzIwMjAgODozNCBQTSwgTWF0aGlhcyBOeW1hbiB3cm90ZToNCj4gT24gNy4y
LjIwMjAgMTkuMTcsIFRlamFzIEpvZ2xla2FyIHdyb3RlOg0KPj4gSGksDQo+PiBUaGFua3MgZm9y
IHRoZSByZXZpZXcgY29tbWVudHMuDQo+PiBPbiAxLzMvMjAyMCAxMDoxNCBQTSwgTWF0aGlhcyBO
eW1hbiB3cm90ZToNCj4+PiBPbiAyMC4xMi4yMDE5IDE1LjM5LCBUZWphcyBKb2dsZWthciB3cm90
ZToNCj4+Pj4gVGhlIFN5bm9wc3lzIHhIQyBoYXMgYW4gaW50ZXJuYWwgVFJCIGNhY2hlIG9mIHNp
emUgVFJCX0NBQ0hFX1NJWkUgZm9yDQo+Pj4+IGVhY2ggZW5kcG9pbnQuIFRoZSBkZWZhdWx0IHZh
bHVlIGZvciBUUkJfQ0FDSEVfU0laRSBpcyAxNiBmb3IgU1MgYW5kIDgNCj4+Pj4gZm9yIEhTLiBU
aGUgY29udHJvbGxlciBsb2FkcyBhbmQgdXBkYXRlcyB0aGUgVFJCIGNhY2hlIGZyb20gdGhlIHRy
YW5zZmVyDQo+Pj4+IHJpbmcgaW4gc3lzdGVtIG1lbW9yeSB3aGVuZXZlciB0aGUgZHJpdmVyIGlz
c3VlcyBhIHN0YXJ0IHRyYW5zZmVyIG9yDQo+Pj4+IHVwZGF0ZSB0cmFuc2ZlciBjb21tYW5kLg0K
Pj4+Pg0KPj4+PiBGb3IgY2hhaW5lZCBUUkJzLCB0aGUgU3lub3BzeXMgeEhDIHJlcXVpcmVzIHRo
YXQgdGhlIHRvdGFsIGFtb3VudCBvZg0KPj4+PiBieXRlcyBmb3IgYWxsIFRSQnMgbG9hZGVkIGlu
IHRoZSBUUkIgY2FjaGUgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvIDENCj4+Pj4gTVBTLiBP
ciB0aGUgY2hhaW4gZW5kcyB3aXRoaW4gdGhlIFRSQiBjYWNoZSAod2l0aCBhIGxhc3QgVFJCKS4N
Cj4+Pj4NCj4+Pj4gSWYgdGhpcyByZXF1aXJlbWVudCBpcyBub3QgbWV0LCB0aGUgY29udHJvbGxl
ciB3aWxsIG5vdCBiZSBhYmxlIHRvIHNlbmQNCj4+Pj4gb3IgcmVjZWl2ZSBhIHBhY2tldCBhbmQg
aXQgd2lsbCBoYW5nIGNhdXNpbmcgYSBkcml2ZXIgdGltZW91dCBhbmQgZXJyb3IuDQo+Pj4+DQo+
Pj4+IFRoaXMgY2FuIGJlIGEgcHJvYmxlbSBpZiBhIGNsYXNzIGRyaXZlciBxdWV1ZXMgU0cgcmVx
dWVzdHMgd2l0aCBtYW55DQo+Pj4+IHNtYWxsLWJ1ZmZlciBlbnRyaWVzLiBUaGUgWEhDSSBkcml2
ZXIgd2lsbCBjcmVhdGUgYSBjaGFpbmVkIFRSQiBmb3IgZWFjaA0KPj4+PiBlbnRyeSB3aGljaCBt
YXkgdHJpZ2dlciB0aGlzIGlzc3VlLg0KPj4+Pg0KPj4+PiBUaGlzIHBhdGNoIGFkZHMgbG9naWMg
dG8gdGhlIFhIQ0kgZHJpdmVyIHRvIGRldGVjdCBhbmQgcHJldmVudCB0aGlzIGZyb20NCj4+Pj4g
aGFwcGVuaW5nLg0KPj4+Pg0KPj4+PiBGb3IgZXZlcnkgKFRSQl9DQUNIRV9TSVpFIC0gMikgVFJC
cywgd2UgY2hlY2sgdGhlIHRvdGFsIGJ1ZmZlciBzaXplIG9mDQo+Pj4+IHRoZSBUUkJzIGFuZCBp
ZiB0aGUgY2hhaW4gY29udGludWVzIGFuZCB3ZSBkb24ndCBtYWtlIHVwIGF0IGxlYXN0IDEgTVBT
LA0KPj4+PiB3ZSBjcmVhdGUgYSBib3VuY2UgYnVmZmVyIHRvIGNvbnNvbGlkYXRlIHVwIHRvIHRo
ZSBuZXh0ICg0ICogTVBTKSBUUkJzDQo+Pj4+IGludG8gdGhlIGxhc3QgVFJCLg0KPj4+Pg0KPj4+
PiBXZSBjaGVjayBhdCAoVFJCX0NBQ0hFX1NJWkUgLSAyKSBiZWNhdXNlIGl0IGlzIHBvc3NpYmxl
IHRoYXQgdGhlcmUgd291bGQNCj4+Pj4gYmUgYSBsaW5rIGFuZC9vciBldmVudCBkYXRhIFRSQiB0
aGF0IHRha2UgdXAgdG8gMiBvZiB0aGUgY2FjaGUgZW50cmllcy4NCj4+Pj4gQW5kIHdlIGNvbnNv
bGlkYXRlIHRoZSBuZXh0ICg0ICogTVBTKSB0byBpbXByb3ZlIHBlcmZvcm1hbmNlLg0KPj4+Pg0K
Pj4+PiBXZSBkaXNjb3ZlcmVkIHRoaXMgaXNzdWUgd2l0aCBkZXZpY2VzIG9uIG90aGVyIHBsYXRm
b3JtcyBidXQgaGF2ZSBub3QNCj4+Pj4geWV0IGNvbWUgYWNyb3NzIGFueSBkZXZpY2UgdGhhdCB0
cmlnZ2VycyB0aGlzIG9uIExpbnV4LiBCdXQgaXQgY291bGQgYmUNCj4+Pj4gYSByZWFsIHByb2Js
ZW0gbm93IG9yIGluIHRoZSBmdXR1cmUuIEFsbCBpdCB0YWtlcyBpcyBOIG51bWJlciBvZiBzbWFs
bA0KPj4+PiBjaGFpbmVkIFRSQnMuIEFuZCBvdGhlciBpbnN0YW5jZXMgb2YgdGhlIFN5bm9wc3lz
IElQIG1heSBoYXZlIHNtYWxsZXINCj4+Pj4gdmFsdWVzIGZvciB0aGUgVFJCX0NBQ0hFX1NJWkUg
d2hpY2ggd291bGQgZXhhY2VyYmF0ZSB0aGUgcHJvYmxlbS4NCj4+Pj4NCj4+Pj4gV2UgdmVyaWZp
ZWQgdGhpcyBwYXRjaCB1c2luZyBvdXIgaW50ZXJuYWwgZHJpdmVyIGFuZCB0ZXN0aW5nIGZyYW1l
d29yay4NCj4+Pg0KPj4+DQo+PiBJIHVuZGVyc3RhbmQgdGhhdCBpbiBhIGZpcnN0IGxvb2sgaXQg
bG9va3MgYSBjb21wbGV4IHNvbHV0aW9uLCBidXQgeW91IGNhbiBzdWdnZXN0DQo+PiB0aGUgbW9k
aWZpY2F0aW9ucy9jaGFuZ2VzIHdoaWNoIHdvdWxkIGJlIHJlcXVpcmVkIHRvIG1ha2UgdGhlIHBh
dGNoIG1vcmUgcmVhZGFibGUuDQo+PiBJIGhhdmUgdHJpZWQgdG8ga2VlcCB0aGUgaW1wbGVtZW50
YXRpb24gc2ltaWxhciB0byBib3VuY2UgYnVmZmVyIGltcGxlbWVudGF0aW9uIA0KPj4gb25seSB3
aXRoIGFkZGl0aW9uIG9mIGJvdW5jZSBidWZmZXIgbGlzdC4gRm9yIHRoZSBzcGlubG9jayBjYXNl
LCB5b3UgY2FuIHRha2UgYSANCj4+IGNhbGwgaWYgaXQgaXMgcmVxdWlyZWQgb3Igbm90Lg0KPiAN
Cj4gSW4geW91ciBjYXNlIHlvdSBrbm93IHRoZSBuZWVkIGZvciBhIGJvdW5jZSBidWZmZXIgbXVj
aCBlYXJsaWVyIHRoYW4gaW4gdGhlDQo+IGV4aXN0aW5nIFREIGZyYWdtZW50IGNhc2UuDQo+IA0K
PiBIYXZlIHlvdSBsb29rZWQgaW50byB0aGUgc3RydWN0IGhjX2RyaXZlciBtYXBfdXJiX2Zvcl9k
bWEoKSBhbmQNCj4gdW5tYXBfdXJiX2Zvcl9kbWEoKSBob29rcz8gSW4gdGhvc2UgeW91IGNvdWxk
IGRldGVjdCB0aGUgbmVlZCBmb3IgYSBib3VuY2UNCj4gYnVmZmVyLCBhbGxvY2F0ZSBpdCwgYW5k
IGJsdW50bHkgY29weSBlbnRpcmUgc2NhdHRlcmdhdGhlciBidWZmZXIgdG8gdGhlIA0KPiBib3Vu
Y2UgYnVmZmVyLiBJdCBzaG91bGQgYmUgZmFpcmx5IHNtYWxsIGFueXdheS4NCj4NCkkgd2lsbCBs
b29rIGludG8gaXQsIGFuZCBnZXQgYmFjayB0byB5b3UuIFRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rp
b24uDQogDQo+IC1NYXRoaWFzDQo+IA0KDQpSZWdhcmRzLA0KVGVqYXMgSm9nbGVrYXINCg==
