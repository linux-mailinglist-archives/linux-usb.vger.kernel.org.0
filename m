Return-Path: <linux-usb+bounces-5330-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA6B83597B
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 03:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BD621F22065
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 02:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DF61370;
	Mon, 22 Jan 2024 02:54:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mta21.hihonor.com (mta21.hihonor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55268EBB
	for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 02:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705892069; cv=none; b=tLVcwyTf9j/41RU2jJVVP+83UYq7IdYezZrD5Jf8TI3uPhBCn6PozwWFIXTu+TglVO6OOqXu1ziN4FRV+ZsvhHkLzVj/1yZ2q3jLoOOE+Gwe0GRUj7Y4/BiOMPZrWDQZGDEVXzCkBdBYRsRab36nJgtgiJQFkzEHo3LuvLVeEBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705892069; c=relaxed/simple;
	bh=iALLuK89JWmwYA1aSopSgNO+kwZw24sE0RPtYxajrmk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LjB1D0i5YdNQyzxTWYztSKXTrsX7ynsqKnJ9UBddXSGReKuOyHbaCN5wgIm2JipQ/znY8ALwypHF8+EXqfkwY33PeB9ZH6q1AdbK6mbQpO6p06bLXJo/aVTIdPaMV9o6X2ykoY2kmAIsVIZrv+kjRQfV3Y2RfdlrzQzwfGX6NCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hihonor.com; spf=pass smtp.mailfrom=hihonor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hihonor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hihonor.com
Received: from w011.hihonor.com (unknown [10.68.20.122])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4TJFCP2g0QzYl0sx;
	Mon, 22 Jan 2024 10:53:21 +0800 (CST)
Received: from a007.hihonor.com (10.68.22.31) by w011.hihonor.com
 (10.68.20.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.25; Mon, 22 Jan
 2024 10:54:24 +0800
Received: from w025.hihonor.com (10.68.28.69) by a007.hihonor.com
 (10.68.22.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.25; Mon, 22 Jan
 2024 10:54:24 +0800
Received: from w025.hihonor.com ([fe80::91d6:1999:eb63:3772]) by
 w025.hihonor.com ([fe80::91d6:1999:eb63:3772%14]) with mapi id
 15.02.1258.025; Mon, 22 Jan 2024 10:54:24 +0800
From: yuanlinyu 00030184 <yuanlinyu@hihonor.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
Subject: RE: [RFC PATCH] usb: udc: run disconnect callback before pull up zero
Thread-Topic: [RFC PATCH] usb: udc: run disconnect callback before pull up
 zero
Thread-Index: AQHaSpss62X8RrDVzkesDebUFIcvcrDgsjeAgACt0QCAAOdoAIACxq2Q//+MjICAAIuSoA==
Date: Mon, 22 Jan 2024 02:54:24 +0000
Message-ID: <5f4c9d8b6e0e4e73a5b3b1540a500b6a@hihonor.com>
References: <20240119054813.2851201-1-yuanlinyu@hihonor.com>
 <9a483f40-83ef-4476-b94c-21506d94653a@rowland.harvard.edu>
 <20240120011149.fbrbunf4l7deckek@synopsys.com>
 <41dc2889-c087-4179-88a5-9af80064aa2b@rowland.harvard.edu>
 <1ac27ccf217d4a76bb5bb89a49c2ae4c@hihonor.com>
 <af8a0f33-4f07-44f3-8ac2-bdc94a61799e@rowland.harvard.edu>
In-Reply-To: <af8a0f33-4f07-44f3-8ac2-bdc94a61799e@rowland.harvard.edu>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

PiBGcm9tOiBBbGFuIFN0ZXJuIDxzdGVybkByb3dsYW5kLmhhcnZhcmQuZWR1Pg0KPiBTZW50OiBN
b25kYXksIEphbnVhcnkgMjIsIDIwMjQgMTA6MzEgQU0NCj4gVG86IHl1YW4gbGlueXUgPHl1YW5s
aW55dUBoaWhvbm9yLmNvbT4NCj4gQ2M6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9w
c3lzLmNvbT47IEdyZWcgS3JvYWgtSGFydG1hbg0KPiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+OyBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENI
XSB1c2I6IHVkYzogcnVuIGRpc2Nvbm5lY3QgY2FsbGJhY2sgYmVmb3JlIHB1bGwgdXAgemVybw0K
PiANCj4gPg0KPiA+IFdoYXQgaXMgaG9zdCBlcnJvciA/DQo+IA0KPiBJZiB0aGUgaG9zdCBpcyB0
cnlpbmcgdG8gY29tbXVuaWNhdGUgd2l0aCB0aGUgZ2FkZ2V0IGF0IHRoZSB0aW1lIG9mIHRoZQ0K
PiBtb2RlIHN3aXRjaCwgaXQgd2lsbCBzZWUgdGhhdCBzb21ldGhpbmcgaXMgd3JvbmcgYmVjYXVz
ZSB0aGUgZ2FkZ2V0IHdpbGwNCj4gc3RpbGwgYmUgY29ubmVjdGVkICh0aGUgcHVsbHVwIHdpbGwg
c3RpbGwgYmUgb24pIGJ1dCBpdCB3b24ndCByZXBseSB0bw0KPiBhbnkgVVNCIHBhY2tldHMuDQo+
IA0KDQoNCkhvc3Qgd2lsbCBsb3N0IGRldmljZSBzb29uLg0KDQo+ID4NCj4gPiBJdCBpcyBhbHJl
YWR5IGNoYW5nZSB0byBkZXZfZGJnKCkgYnkgV2VzbGV5IENoZW5nIGZvciBkd2MzLg0KPiA+IEJ1
dCBpdCBhbHNvIGNhbiBlbmFibGUgYnkgY2hhbmdlIGxvZyBsZXZlbC4gT25seSBkZWxldGUgaXQg
d2lsbCBub3Qgc2hvdyBhZ2Fpbi4NCj4gDQo+IEkgdGhpbmsgaXQncyBnb29kIHRvIGhhdmUgdGhv
c2UgbWVzc2FnZXMgc2hvdyB1cCB3aGVuIHRoZSBsb2cgbGV2ZWwgaXMNCj4gc2V0IHRvIGRlYnVn
LiAgVGhleSBsZXQgZGV2ZWxvcGVycyBrbm93IHdoYXQncyBoYXBwZW5pbmcgd2hlbiB0aGV5IHRl
c3QNCj4gY2hhbmdlcyB0byB0aGUgZ2FkZ2V0IGRyaXZlcnMuICBJZiB0aGUgbWVzc2FnZXMgcmVh
bGx5IGJvdGhlciBzb21lYm9keSwNCj4gYWxsIHRoZXkgaGF2ZSB0byBkbyBpcyByZWR1Y2UgdGhl
IGxvZyBsZXZlbCB0byBpbmZvLg0KPiANCj4gSWYgeW91J3JlIHN0aWxsIGNvbmNlcm5lZCBhYm91
dCB0aGUgYmVoYXZpb3Igb2YgdGhlIG1hc3Mtc3RvcmFnZQ0KPiBmdW5jdGlvbiwgeW91IGNvdWxk
IGNoYW5nZSBpdC4gIE1ha2UgaXQgZGlzYWJsZSBpdHNlbGYgd2hlbmV2ZXIgaXQgZ2V0cw0KPiBh
IC1FU0hVVERPV04gZXJyb3IsIGVpdGhlciB3aGlsZSBzdWJtaXR0aW5nIGEgcmVxdWVzdCBvciBh
cyBhIGNvbXBsZXRpb24NCj4gc3RhdHVzLiAgVGhpcyBzaG91bGQgcmVkdWNlIHRoZSBudW1iZXIg
b2YgZXJyb3IgbWVzc2FnZXMsIGFsdGhvdWdoIGl0DQo+IHdvbid0IGVsaW1pbmF0ZSB0aGVtLg0K
DQpUaGFua3MsIHdpbGwgc2VuZCBhIHBhdGNoIGZvciBtYXNzIHN0b3JhZ2Ugb25seS4NCg0KPiAN
Cj4gKE9mIGNvdXJzZSwgdGhpcyBzdGlsbCBsZWF2ZXMgdGhlIHBvc3NpYmlsaXR5IG9mIGZsb29k
cyBvZiBkZWJ1Z2dpbmcNCj4gbWVzc2FnZXMgZnJvbSBhbGwgdGhlIG90aGVyIGZ1bmN0aW9uIGRy
aXZlcnMuLi4pDQo+IA0KPiA+IHRoaXMgdGhyZWFkIGp1c3Qgd2FudCB0byBkaXNjdXNzIGlmIGRp
c2FibGUgZXBzIGZpcnN0IHRoZW4gcHVsbCB1cCB6ZXJvIGFjY2VwdGFibGUNCj4gb3INCj4gPiBn
b29kIChyZWR1Y2UgbW9kZSBzd2l0Y2ggdGltZSA/Pz8pIGZvciBhbGwgVURDcyA/DQo+IA0KPiBJ
IHRoaW5rIGl0J3Mgbm90IGEgZ29vZCB0aGluZyB0byBkby4gIEFuZCBJIGRvbid0IHRoaW5rIGl0
IHdpbGwgcmVkdWNlDQo+IHRoZSBtb2RlIHN3aXRjaCB0aW1lLCBiZWNhdXNlIGJvdGggb3BlcmF0
aW9ucyBzdGlsbCBoYXZlIHRvIG9jY3VyIHNvDQo+IHRoZXkgd2lsbCByZXF1aXJlIHRoZSBzYW1l
IHRvdGFsIGFtb3VudCBvZiB0aW1lLg0KPiANCj4gQWxhbiBTdGVybg0K

