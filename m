Return-Path: <linux-usb+bounces-5390-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5AA8385EF
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 04:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 949D3B227AC
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 03:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7393AA47;
	Tue, 23 Jan 2024 03:10:47 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mta21.hihonor.com (mta21.hihonor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D1F810
	for <linux-usb@vger.kernel.org>; Tue, 23 Jan 2024 03:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705979447; cv=none; b=uO8z92E73aOz1ijDG5SfBv2OSajVkMmlg9qSxt9mQBM8mqamLVyLSeHXvvpVkDhWsuOF0HDG2/CGJlNoXKmX6VOIqzmH/TCKA4YqJ/aHvwpRYew/qyQE4P+Dviu929Mmj1Nc7GglzVAvlTMoUyXue8FIQmIDv9ZupTtT2dR8Wcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705979447; c=relaxed/simple;
	bh=Bea0PbtAXI3/oKnvHO6uTGWIIgCzkjKeDtcxhusDv+I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qvq03mr6SQ5/QfVEQeR618eqvOrV7TkZ1U708fikYGecbNku2u4RmjhWDhiLTBh3cSht0hTfOjV4E1YXCnPrjKh3hjoh9CJsdUCdvtJbHYDxhyZxBzI9PQ498PmaY+Q+CyvCsAlCtXzYx06SgMdArMT8CnZBbETa5ciEJuB7HNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hihonor.com; spf=pass smtp.mailfrom=hihonor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hihonor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hihonor.com
Received: from w002.hihonor.com (unknown [10.68.28.120])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4TJsXq3G36zYkyMG;
	Tue, 23 Jan 2024 11:10:35 +0800 (CST)
Received: from a005.hihonor.com (10.68.18.24) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.25; Tue, 23 Jan
 2024 11:10:36 +0800
Received: from w025.hihonor.com (10.68.28.69) by a005.hihonor.com
 (10.68.18.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.25; Tue, 23 Jan
 2024 11:10:36 +0800
Received: from w025.hihonor.com ([fe80::91d6:1999:eb63:3772]) by
 w025.hihonor.com ([fe80::91d6:1999:eb63:3772%14]) with mapi id
 15.02.1258.025; Tue, 23 Jan 2024 11:10:36 +0800
From: yuanlinyu <yuanlinyu@hihonor.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v1] usb: f_mass_storage: forbid async queue when shutdown
 happen
Thread-Topic: [PATCH v1] usb: f_mass_storage: forbid async queue when shutdown
 happen
Thread-Index: AQHaTSEELdtD4vmH30SnDi4ZJj0K57DlaUMAgAFO1hA=
Date: Tue, 23 Jan 2024 03:10:36 +0000
Message-ID: <367a2393807a4c37b3173f05c4a48622@hihonor.com>
References: <20240122105138.3759477-1-yuanlinyu@hihonor.com>
 <1f890a94-0cec-4776-9af3-754f913ee8c4@rowland.harvard.edu>
In-Reply-To: <1f890a94-0cec-4776-9af3-754f913ee8c4@rowland.harvard.edu>
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
b25kYXksIEphbnVhcnkgMjIsIDIwMjQgMTE6MDggUE0NCj4gVG86IHl1YW5saW55dSA8eXVhbmxp
bnl1QGhpaG9ub3IuY29tPg0KPiBDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZz47DQo+IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MV0gdXNiOiBmX21hc3Nfc3RvcmFnZTogZm9yYmlkIGFzeW5jIHF1ZXVlIHdo
ZW4NCj4gc2h1dGRvd24gaGFwcGVuDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC9m
dW5jdGlvbi9mX21hc3Nfc3RvcmFnZS5jDQo+ID4gKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1
bmN0aW9uL2ZfbWFzc19zdG9yYWdlLmMNCj4gPiBAQCAtNTQ1LDIxICs1NDUsNDEgQEAgc3RhdGlj
IGludCBzdGFydF90cmFuc2ZlcihzdHJ1Y3QgZnNnX2RldiAqZnNnLCBzdHJ1Y3QNCj4gdXNiX2Vw
ICplcCwNCj4gPg0KPiANCj4gVGhpcyBjb3VsZCBiZSB3cml0dGVuIG1vcmUgY2xlYW5seSBhczoN
Cj4gDQo+IAlyYyA9IHN0YXJ0X3RyYW5zZmVyKGNvbW1vbi0+ZnNnLCBjb21tb24tPmZzZy0+YnVs
a19pbiwgYmgtPmlucmVxKTsNCj4gCWlmIChyYykgew0KPiAJCWJoLT5zdGF0ZSA9IEJVRl9TVEFU
RV9FTVBUWTsNCj4gCQlpZiAocmMgPT0gLUVTSFVURE9XTikgew0KPiAJCQljb21tb24tPnJ1bm5p
bmcgPSAwOw0KPiAJCQlyZXR1cm4gZmFsc2U7DQo+IAkJfQ0KPiAJfQ0KPiAJcmV0dXJuIHRydWU7
DQoNClN1cmUsIHdpbGwgc2VuZCB2Mi4NCg0KPiANCj4gQW5kIHRoZSBzYW1lIGdvZXMgZm9yIHN0
YXJ0X291dF90cmFuc2ZlcigpLg0KPiANCj4gSGF2ZSB5b3UgdGVzdGVkIHRoaXM/ICBEb2VzIGl0
IGRvIHdoYXQgeW91IHdhbnQ/DQoNClllcywgdGVzdCB0aGUgY2hhbmdlLCBiZWZvcmUgdGhlIGNo
YW5nZSwgdGhlcmUgYXJlIG1hbnkgbG9ncywgbm93IG9ubHkgb25lIHRpbWUuDQoNCj4gDQo+IEFs
YW4gU3Rlcm4NCg==

