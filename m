Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65B41DEE24
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2020 19:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730764AbgEVRXC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 May 2020 13:23:02 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:37448 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730695AbgEVRXB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 May 2020 13:23:01 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6A17DC051C;
        Fri, 22 May 2020 17:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1590168180; bh=oh5OHYOWJOJ9ctCW6uvojRX+42SD7At9c3gxAO1j4s0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=TWKgLK7XVqvMJVUOtze4YDmmydbfV+adLAFC2dE0cUmQQTcXkXweH5Hoeg3sLdK4J
         SMypM+LjEmMC7ZpLguFE0d10Oaru10wnc0xXysl1Szf71yzX0ZjbuV++dJFRbwXrX7
         MpMsFN1/63jQubR7owJYHFDUy34r9NWjFehfEhZAcEdlA6VgjkFi8RNrAphHbYq9B5
         gInb7o9YqAGF8sOlR/wcBaQF+Z2GeZXNN46Z4kmohruHsFWxzt3P3g4y0iy/GJD68r
         hMNrJR10we4Q0ftQOwrNc+jQPppr4j5mGov4NJLHrv4F8zODPJ4Jo2w3hOuW/TuEM3
         9DiPxf1UMTUbw==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 566C2A0071;
        Fri, 22 May 2020 17:22:58 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 22 May 2020 10:22:58 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Fri, 22 May 2020 10:22:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NW5yJ6fa+RjQ/kClTyRVNJXhn1c77I2yJmGtCeh+atdbnoJ//ajR5D4U/TUjvMOIJbdsZsHkBN8a17XwTBuuci4v3+zfJplv6HhFbslIjNG1gTXKwkH8e/EZeLyg/WkzqBbVdFlrEOoA/sQWUOnemJttc3yJa8WKs8ZhWPQgpM0nHQQRdM5gTajcM+erOKnnNp391aheHQyczD2FEMR0IEunW8yhz3FcPuCeZpk1e4+SnX6Nalv0sUiE+XDllQEq+9Jhs5FIbPVGSjjOoB2nIzIARUW3ztu0oK1XX1lsqxz+QAEK4lKt5KhUwJ8lvZq66q6pclvfWOHS0kVJS0Z+0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oh5OHYOWJOJ9ctCW6uvojRX+42SD7At9c3gxAO1j4s0=;
 b=HUM30JCkLOs+JF0S0tQv6SPmV3C57dlYWDbL2vWgjFvNzAtBw7oJTsa1q9282dpuE6HhtWQy1+9IQodkxrdVnKEZeGh19HBZUN6Q6sVd5whhIaOKJNyV/OZXINpCY4ct7tlgoWtfBCG/EhCE8UhHl7Wx6mkQG7rDWGZnbtgnETKwjjAcVVZqRGek0bynkAzvtYUE447YBWPqIwR+2KBb5Odkmemq9+qPYhqgINCEl1Q8EKFe8T8qO95lhCso2WfSfwhZBqdMpDv5xHjqm+GXJzDsuP1TkgVrWK7iOChKkYIgSncUrM9Kjoo3IkzlggKKX2XK8jUo6lU5BATvpUt54g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oh5OHYOWJOJ9ctCW6uvojRX+42SD7At9c3gxAO1j4s0=;
 b=pCHykVIkHlVBhjIQprrUToYqYQHoULSYq4Yv56PqSdyzQ6VdM7lAFxdKKLv/uuxYGbCc9c3XLVvBMsy73O3pAjK7kEQpY92rTYSEDLicW7dGzP+SnNHLOD7A1W8w/QjNHgL1/aaeYiTEEITBJF4AkCqJ1HJyw3j+H0kHb7JZ1XM=
Received: from CH2PR12MB4311.namprd12.prod.outlook.com (2603:10b6:610:a8::21)
 by CH2PR12MB3734.namprd12.prod.outlook.com (2603:10b6:610:2a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 17:22:55 +0000
Received: from CH2PR12MB4311.namprd12.prod.outlook.com
 ([fe80::cd38:4727:1239:f467]) by CH2PR12MB4311.namprd12.prod.outlook.com
 ([fe80::cd38:4727:1239:f467%4]) with mapi id 15.20.3021.024; Fri, 22 May 2020
 17:22:54 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "John Youn" <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH v2 4/4] usb: xhci: Use temporary buffer to consolidate
 SG
Thread-Topic: [RFC PATCH v2 4/4] usb: xhci: Use temporary buffer to
 consolidate SG
Thread-Index: AQHWF8I9mzJAua+iDUCYnE0KWVGzAqiuMWMAgAKCaYCAAKoXgIAAAwSAgAAMPYCAAhxigIAAz2qAgAAyy4A=
Date:   Fri, 22 May 2020 17:22:54 +0000
Message-ID: <e9646d69-05ca-a4c7-df3f-bd8414235880@synopsys.com>
References: <cover.1587461220.git.joglekar@synopsys.com>
 <969b5c9f31807635785ecc74b2ae2559ddc3bbeb.1587461220.git.joglekar@synopsys.com>
 <a1845154-2d8d-e63c-a3e7-7a3ed244bd57@linux.intel.com>
 <6551a485-5478-ccac-ca1f-d3e2ec4c9053@synopsys.com>
 <20200520165001.GD11084@rowland.harvard.edu>
 <a577925a-98ea-2e6d-da0c-b3e8dbe3dc7e@synopsys.com>
 <20200520174437.GA15590@rowland.harvard.edu>
 <3b0c3f61-2a32-3fe0-f63c-a479f6eb11ab@synopsys.com>
 <20200522142105.GA32434@rowland.harvard.edu>
In-Reply-To: <20200522142105.GA32434@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [49.205.221.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa185874-6d64-4971-52bb-08d7fe74c3a6
x-ms-traffictypediagnostic: CH2PR12MB3734:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB373479E081A16190DC9947B9A4B40@CH2PR12MB3734.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04111BAC64
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +7mt2Otc80PL4cQVlFTfpIImOZUtl7De6Fn/46QtOm64RpQL/snB70DEBwlNDu+xb0T49voAsu1ZxL0cvEDff6Yf/W1uK9g6gfPU0KyUNXzwCrOLAMstdnvizrrFKsAzj60kt8kLqqQ5Gsl+ZAEQkO7Gd44qjVpMLX1SwSxDwHo/r+LxA4TYOD7FTc817Qq6O4uI2wgkFGvhc5w2gdlaOZlLzupMORrRUdQe0GqsuY+hhHwkeA1Si7zWhIZVU1JnZJthDDSrsT/rzzcSkrhWfBhmhT8vFf9I7gNQmSnW8fa8Ty0mhfqETrN7dapHo83wzM/CmlhiODAx/1vTRu7klA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4311.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(39860400002)(346002)(136003)(396003)(366004)(110136005)(66476007)(6512007)(31686004)(76116006)(5660300002)(478600001)(8936002)(316002)(6506007)(107886003)(8676002)(66556008)(53546011)(91956017)(66946007)(71200400001)(64756008)(66446008)(26005)(2616005)(36756003)(186003)(31696002)(54906003)(4326008)(2906002)(86362001)(6486002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Di0IlcimAMvRAz7RJGOJPovJs3sdkOSa54XsEy8gHqruux3KXv7UQMfRDaWYGzBuJOC5l7enwdbOqAnQolPsED6qkHKHJw1JUGjIMOXIPSvdXMVOA68aUVeXMNZ/IVXkoE+0lrdAFM56RIwI06LP/FQ8bWlB0AjUwAUnqJ7FVFq+QPKy6dgAjGiDWDOkatskjcUgnGYksqR0vKbENnRrVLJOHsq072SzxJcEt0jFAGCO6qJPS2x4n+xfEVrz+fxLZXuXjSXywoHt340ZwXMqI4VPuIapobJu+7OrTVydm3qqSFiPiFd5E+gP8RqdQBqq/DerYIQf4fyVOQm/IHd+p603C44uj0LmIjV7WIk2L0jn62xEXkBOBT3bw+F+8gahOgT/FZ3EeNSeC7pnD3lzFDQ0Dx7O0KKExv6aAct9OHg+TF7r0GcUx2Ar0kjcJS30F2kO2SRxDhPtGxjA2OWXsG5WlxGHr79TcZyM5blkx+MvRag0sYVfJfdBkE+go++t
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC135754E105384086A5DDEFC7E21CE4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: aa185874-6d64-4971-52bb-08d7fe74c3a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2020 17:22:54.7437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pw0K7A/dY0i4nyaaLdNLYCGbGU9LkD2cgAxpJdyHpjwaRX7BPo4hXlDFTlNK39OR5NV/d6oHNMfgupNr2mplZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3734
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQpPbiA1LzIyLzIwMjAgNzo1MSBQTSwgQWxhbiBTdGVybiB3cm90ZToNCj4gT24gRnJpLCBN
YXkgMjIsIDIwMjAgYXQgMDE6NTg6NDNBTSArMDAwMCwgVGVqYXMgSm9nbGVrYXIgd3JvdGU6DQo+
PiBIaSwNCj4+IE9uIDUvMjAvMjAyMCAxMToxNCBQTSwgQWxhbiBTdGVybiB3cm90ZToNCj4+PiBP
biBXZWQsIE1heSAyMCwgMjAyMCBhdCAwNTowMDo1MFBNICswMDAwLCBUZWphcyBKb2dsZWthciB3
cm90ZToNCj4+Pj4gSGksDQo+Pj4+IE9uIDUvMjAvMjAyMCAxMDoyMCBQTSwgQWxhbiBTdGVybiB3
cm90ZToNCj4+Pj4+IE9uIFdlZCwgTWF5IDIwLCAyMDIwIGF0IDA2OjQxOjE2QU0gKzAwMDAsIFRl
amFzIEpvZ2xla2FyIHdyb3RlOg0KPj4+Pj4+Pj4gKwl1cmItPnRyYW5zZmVyX2J1ZmZlciA9IHRl
bXA7DQo+Pj4+Pj4+PiArCXVyYi0+dHJhbnNmZXJfZG1hID0gZG1hX21hcF9zaW5nbGUoaGNkLT5z
ZWxmLnN5c2RldiwNCj4+Pj4+Pj4+ICsJCQkJCSAgIHVyYi0+dHJhbnNmZXJfYnVmZmVyLA0KPj4+
Pj4+Pj4gKwkJCQkJICAgdXJiLT50cmFuc2Zlcl9idWZmZXJfbGVuZ3RoLA0KPj4+Pj4+Pj4gKwkJ
CQkJICAgZGlyKTsNCj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+ICsJaWYgKGRtYV9tYXBwaW5nX2Vycm9y
KGhjZC0+c2VsZi5zeXNkZXYsDQo+Pj4+Pj4+PiArCQkJICAgICAgdXJiLT50cmFuc2Zlcl9kbWEp
KSB7DQo+Pj4+Pj4+PiArCQlyZXQgPSAtRUFHQUlOOw0KPj4+Pj4+Pj4gKwkJa2ZyZWUodGVtcCk7
DQo+Pj4+Pj4+PiArCX0gZWxzZSB7DQo+Pj4+Pj4+PiArCQl1cmItPnRyYW5zZmVyX2ZsYWdzIHw9
IFVSQl9ETUFfTUFQX1NJTkdMRTsNCj4+Pj4+Pj4NCj4+Pj4+Pj4gTm90IHN1cmUgaWYgdXNpbmcg
VVJCX0RNQV9NQVBfU0lOR0xFIHRvIGZsYWcgdGhhdCB0aGlzIHVyYiBpcyBib3VjZWJ1ZmZlcmVk
IGlzDQo+Pj4+Pj4+IGFwcHJvcHJpYXRlLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBJZiBHcmVnIG9yIEFs
YW4gZG9uJ3Qgb2JqZWN0IHRoZW4gaXQncyBmaW5lIGZvciBtZSBhcyB3ZWxsLg0KPj4+Pj4+Pg0K
Pj4+Pj4+Pg0KPj4+Pj4+Pg0KPj4+Pj4+IEBHcmVnL0FsYW4gZG8geW91IHN1Z2dlc3QgYW55IGNo
YW5nZSBmb3IgdGhlIGZsYWcgaGVyZT8NCj4+Pj4+DQo+Pj4+PiBUaGlzIHJlcXVpcmVzIGNhcmUs
IGJlY2F1c2UgdGhlIGNvcmUgd2lsbCBhbHJlYWR5IGhhdmUgc2V0IG90aGVyIGZsYWdzIA0KPj4+
Pj4gZm9yIHRoaXMgVVJCLiAgSSBkb24ndCByZW1lbWJlciB0aGUgZGV0YWlscyBhbmQgSSBkb24n
dCBoYXZlIHRpbWUgdG8gDQo+Pj4+PiBjaGVjayB0aGVtIG5vdy4gIEJ1dCBpdCB3b3VsZG4ndCBi
ZSBhdCBhbGwgc3VycHJpc2luZyBpZiB0aGUgY29yZSANCj4+Pj4+IGRvZXNuJ3QgZXhwZWN0IGFu
IFVSQiBib3RoIHRvIHVzZSBTRyBhbmQgdG8gdXNlIERNQV9NQVBfU0lOR0xFLg0KPj4+Pj4NCj4+
Pj4gV2hlbiB0aGlzIHF1aXJrIGlzIGVuYWJsZWQgYW5kIGl0IGlzIHJlcXVpcmVkIHRvIGNvbnNv
bGlkYXRlIFNHIGxpc3QgdG8gDQo+Pj4+IHNpbmdsZSBidWZmZXIgbm8gb3RoZXIgZmxhZ3MgYXJl
IHNldCBmb3IgdGhlIFVSQi4NCj4+Pg0KPj4+IEkgZG9uJ3QgYmVsaWV2ZSB0aGF0LiAgV2hhdCBh
Ym91dCBVUkJfRE1BX01BUF9TRyBvciANCj4+PiBVUkJfRE1BX01BUF9QQUdFPyAgVGhlIFVTQiBj
b3JlIGNlcnRhaW5seSB3b3VsZCBoYXZlIHNldCBvbmUgb2YgdGhlbSANCj4+PiBhbHJlYWR5LiAg
Tm90IG9ubHkgd291bGQgeW91IG5lZWQgdG8gY2xlYXIgdGhhdCBmbGFnLCB5b3Ugd2FudCBhbHNv
IG5lZWQgDQo+Pj4gdG8gdW5kbyB0aGUgbWFwcGluZy4NCj4+Pg0KPj4gVVJCX0RNQV9NQVBfU0cg
b3IgVVJCX0RNQV9NQVBfUEFHRSBmbGFncyBhcmUgc2V0IGZvciBhbiBVUkIgaW4gY29yZSB3aXRo
aW4NCj4+IGZ1bmN0aW9uIHVzYl9oY2RfbWFwX3VyYl9mb3JfZG1hKCksIHdpdGggbXkgcGF0Y2gg
dGhlIHhoY2lfbWFwX3VyYl9mb3JfZG1hKCkNCj4+IGRvZXMgbm90IGNhbGwgdXNiX2hjZF9tYXBf
dXJiX2Zvcl9kbWEoKSB3aGVuIFNHIGxpc3QgY29uc29saWRhdGlvbiBpcyByZXF1aXJlZA0KPj4g
YnV0IGl0IGNhbGxzIHRoZSBuZXdseSBhZGRlZCBmdW5jdGlvbiB4aGNpX21hcF90ZW1wX2J1ZmZl
cigpIHdpdGhpbiB0aGF0IGZ1bmN0aW9uDQo+PiBvbmx5IGRtYV9tYXBfc2luZ2xlKCkgaXMgY2Fs
bGVkIHRvIG1hcCBjb25zb2xpZGF0ZWQgU0cgbGlzdC4NCj4gDQo+IEFoLCBpbiB5b3VyIHBhdGNo
IHhoY2ktaGNkJ3MgbWFwX3VyYl9mb3JfZG1hKCkgcm91dGluZSBieXBhc3NlcyANCj4gdXNiX2hj
ZF9tYXBfdXJiX2Zvcl9kbWEoKS4gIEkgaGFkbid0IG5vdGljZWQgdGhhdC4NCj4gDQo+IFRoZW4g
eWVzLCB5b3VyIHVzZSBvZiB0aGUgVVJCIGZsYWdzIGlzIG9rYXkuDQo+IA0KPiBBbGFuIFN0ZXJu
DQo+IA0KVGhhbmtzIGZvciB0aGUgcmV2aWV3IEFsYW4NCkBNYXRoaWFzOiBJIHdpbGwgc2VuZCB2
MyBhZnRlciB1cGRhdGluZyB0aGUgdW5tYXAgZnVuY3Rpb24uDQoNClRoYW5rcyAmIFJlZ2FyZHMs
DQpUZWphcyBKb2dsZWthcg0KDQoNCg0K
