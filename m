Return-Path: <linux-usb+bounces-34657-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKptM4B1sml/MwAAu9opvQ
	(envelope-from <linux-usb+bounces-34657-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 09:12:48 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5518326EB5E
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 09:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BE577301DEEB
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 08:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E596F32E6BB;
	Thu, 12 Mar 2026 08:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="plCqZQOg"
X-Original-To: linux-usb@vger.kernel.org
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC48314A7A;
	Thu, 12 Mar 2026 08:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773303162; cv=none; b=V9fYAhySXPv7Ob9qpfnAZCStbAwZL7eAHhZmyHPmDMA9rfrFJthzyOA+37WNONnl1QOOS2hirOPZ0+nSQplBHISTQbUXI4DhylobJA1BmKMa2a1aKrmMZUDrUs8To9jalC5gDTCatu8z4NpX6W5/hHFFedO3GjsJuQW+IF4lgpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773303162; c=relaxed/simple;
	bh=27S0/XYcWlbamnwlv5FH1/SA99z3PDGi+IGq+QjDm38=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=goqV7KkiDSG5n4a9N00NjTUtj9RQKQTUJrVTKEQczDbcU3RMnePhxEfkn4IBP6yZilY4MZEdfmVdXIDemJcil11vSl5uGwNCtRaLfooq8jy8UsFOIVlrjAnLeAGWsCNUXcASNGWBAal4dsnc9brd5d8SbiphcTZpvILfEPXKk2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=plCqZQOg; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773303153; bh=27S0/XYcWlbamnwlv5FH1/SA99z3PDGi+IGq+QjDm38=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=plCqZQOgNPPoLCxK4VJCgcdTeF11rqT75EAOhbgnFT2xVZKbAUUBHDp1PgK07UcW0
	 /q7XESXf5pkH+cJejWOjnW2LIdYwXcAtZ9MLPYTt+QGO0HgvtNJMX/J0yEEimSCbbk
	 U78oPAaiY4n3msIoXDI6i6vrDdKs6kxehJNexWUA=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-XMAILINFO: NB8AK7fcAs0KtUhMkzHJv1T7vB9mvagc25sJzreQ635HSif3pUTWNsB1ooz8Ck
	 Sap6hQSKtsBjhqL4YjXEmBjGk+6FYs475qu9cDV7vz2BK9g7wUr08gwA4NPbOd7ti3W6frY/RPGp7
	 mPMEcENcbugu/c1epR+lqYxYyNAv1OjsMQR11BFgpc3qt4HF45P/9eecXMlLH+FD8rqfe+DBFrS+O
	 mVP7qocJFLTFvLT1R1I0S1f+PAnhA8JednDibCrXfCDvESz1eixFpMAaNfred3rWE6yJiqNDtZ1Qo
	 zTwO+1BVy6GyEaZE6DbUgtNvcmf/oWPdn2AyoZQYhkoESe0d9Kq4CG0hd5yUWkscn6Jyzetli2VgE
	 wXsXMQkbsX/t+v7jadMLUsRbUkZC9dZ09xc00RF/HPrSakM4jFiViVah/obrC5H5EqCwzDvzpnJiL
	 Qqjtp12BByCs+oNGgmje/SWXAiJOr8GN3NdwRmhZP3jXq70qwCUEKU0WCgCAk8cQ+NnqO+hsld9uH
	 BibOOrfWt34pEmb/12vXzr3Ion81/JT2GxDed30wobqmaJTtWPgM+2pVAxtlyDmedljpXe0366c66
	 xxAe+mkE46si0MZAaCuw1A6EHzeKWs1XicgHv1UMmyfG+n0vH5Vs+WpvKOr4Z1vkDGjhfcAr75mKj
	 XG5TN4SUCLAYBkCvYHC1FiRF33AevSadagy4TAM/MhvZ1nG6/G2k58m2IHC9ppywnrsigiLAaKaEz
	 tX4d2XDvVjNyUPlQM3KYbTgBt9RjGsNNvsnTswFfjR9LeHqyWFFt5zxVtNWhMvpadJ3/wNHH1sZzR
	 s+SFtnbumIHZnpCyT/duf3+1OQZTf7WRLtooGipL3lR7PnJnPX4N9d42PfQO2CF32DmrOxic6H/5h
	 dXN9WMH1Dwp2215rNTMQ8dqGfWXQNnRD+znRRMA2QBPvvgyVNyWAi1zME2r6v5B18H5utbRrRiaYP
	 sicf11H4l3/YaQ/8HK4ZTJCX48qsg=
From: "=?utf-8?B?5L+e5pyd6Ziz?=" <2426767509@qq.com>
To: "=?utf-8?B?R3JlZyBLSA==?=" <gregkh@linuxfoundation.org>
Cc: "=?utf-8?B?c2VyZ2VpLnNodHlseW92?=" <sergei.shtylyov@gmail.com>, "=?utf-8?B?ZGFuaWVs?=" <daniel@zonque.org>, "=?utf-8?B?aGFvamlhbi56aHVhbmc=?=" <haojian.zhuang@gmail.com>, "=?utf-8?B?cm9iZXJ0LmphcnptaWs=?=" <robert.jarzmik@free.fr>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtdXNi?=" <linux-usb@vger.kernel.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] USB: pxa27x_udc: check return value of clk_enable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 12 Mar 2026 16:12:32 +0800
X-Priority: 3
Message-ID: <tencent_28D4DB4E0AD6774FAB12761B8AD05A5D3F06@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_648835A07EDBB7CA94B66FAF5662EC2F1407@qq.com>
	<2026031145-stencil-italics-89b3@gregkh>
In-Reply-To: <2026031145-stencil-italics-89b3@gregkh>
X-QQ-mid: xmsezc15-0t1773303152t7ieou44e
X-Spamd-Result: default: False [3.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	TO_EXCESS_BASE64(1.50)[];
	CC_EXCESS_BASE64(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34657-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	FREEMAIL_CC(0.00)[gmail.com,zonque.org,free.fr,lists.infradead.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[2426767509@qq.com,linux-usb@vger.kernel.org];
	HAS_X_PRIO_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[qq.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qq.com:dkim,qq.com:mid]
X-Rspamd-Queue-Id: 5518326EB5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR3JlZywNCg0KT24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgMDE6NTY6MTRQTSArMDAwMCwg
R3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiA+ICAJZHBsdXNfcHVsbHVwKHVkYywgaXNf
YWN0aXZlKTsNCj4gPiAgDQo+ID4gLQlpZiAoc2hvdWxkX2VuYWJsZV91ZGModWRjKSkNCj4g
PiAtCQl1ZGNfZW5hYmxlKHVkYyk7DQo+ID4gKwlpZiAoc2hvdWxkX2VuYWJsZV91ZGModWRj
KSkgew0KPiA+ICsJCXJldCA9IHVkY19lbmFibGUodWRjKTsNCj4gPiArCQlpZiAocmV0KQ0K
PiA+ICsJCQlyZXR1cm4gcmV0Ow0KPiA+ICsJfQ0KPiANCj4gRE9uJ3QgeW91IG5lZWQgdG8g
Y2hhbmdlIHRoZSBwdWxsdXA/DQoNClllcywgeW91IGFyZSBhYnNvbHV0ZWx5IHJpZ2h0LiBJ
ZiB1ZGNfZW5hYmxlKCkgZmFpbHMsIHRoZSBoYXJkd2FyZSBwdWxsdXAgc3RhdGUgc2hvdWxk
IGJlIHJldmVydGVkIHRvICFpc19hY3RpdmUuIEkgbWlzc2VkIHRoaXMgaW4gdjMuDQoNCj4g
PiAgCXVkYy0+dmJ1c19zZW5zZWQgPSBpc19hY3RpdmU7DQo+ID4gLQlpZiAoc2hvdWxkX2Vu
YWJsZV91ZGModWRjKSkNCj4gPiAtCQl1ZGNfZW5hYmxlKHVkYyk7DQo+ID4gKwlpZiAoc2hv
dWxkX2VuYWJsZV91ZGModWRjKSkgew0KPiA+ICsJCXJldCA9IHVkY19lbmFibGUodWRjKTsN
Cj4gPiArCQlpZiAocmV0KQ0KPiA+ICsJCQlyZXR1cm4gcmV0Ow0KPiA+ICsJfQ0KPiANCj4g
U2hvdWxkbid0IHlvdSBjaGFuZ2UgdmJ1c19zZW5zZWQ/DQoNCkluZGVlZCwgSSBzaG91bGQg
YWxzbyByb2xsIGJhY2sgdWRjLT52YnVzX3NlbnNlZCA9ICFpc19hY3RpdmUgaWYgdGhlIGVu
YWJsZSBmYWlscy4NCg0KPiA+ICtmYWlsX2VuYWJsZToNCj4gPiArCWlmICghSVNfRVJSX09S
X05VTEwodWRjLT50cmFuc2NlaXZlcikpDQo+ID4gKwkJb3RnX3NldF9wZXJpcGhlcmFsKHVk
Yy0+dHJhbnNjZWl2ZXItPm90ZywgTlVMTCk7DQo+ID4gIGZhaWw6DQo+ID4gIAl1ZGMtPmRy
aXZlciA9IE5VTEw7DQo+ID4gIAlyZXR1cm4gcmV0dmFsOw0KPiANCj4gTm8gb3RoZXIgdW53
aW5kaW5nIGlzIG5lZWRlZD8NCg0KSSBkb3VibGUtY2hlY2tlZCBgcHhhMjd4X3VkY19zdGFy
dGAuIFRoZSBvbmx5IHNldHVwIHN0ZXBzIGJlZm9yZSBgdWRjX2VuYWJsZSgpYCBhcmUgYXNz
aWduaW5nIGB1ZGMtPmRyaXZlcmAgYW5kIGNhbGxpbmcgYG90Z19zZXRfcGVyaXBoZXJhbCgp
YC4gVGhlIGVycm9yIHBhdGggdW5kb2VzIGJvdGgsIHNvIHRoZXJlIHNob3VsZG4ndCBiZSBh
bnkgb3RoZXIgdW53aW5kaW5nIG5lZWRlZCBoZXJlLg0KDQpIb3dldmVyLCB5b3VyIHF1ZXN0
aW9uIHByb21wdGVkIG1lIHRvIGNoZWNrIHRoZSBvdGhlciBmdW5jdGlvbnMsIGFuZCBJIHJl
YWxpemVkIHRoYXQgSSBhbHNvIG1pc3NlZCByb2xsaW5nIGJhY2sgYGRwbHVzX3B1bGx1cGAg
aW4gYHB4YV91ZGNfcmVzdW1lKClgIG9uIGZhaWx1cmUuIEkgd2lsbCBmaXggYWxsIG9mIHRo
ZXNlIG1pc3Npbmcgcm9sbGJhY2tzLg0KDQpUaGFuayB5b3UgZm9yIHRoZSByaWdvcm91cyBy
ZXZpZXchIEkgd2lsbCBzZW5kIG91dCB0aGUgdjQgcGF0Y2ggc2hvcnRseS4NCg0KQmVzdCBy
ZWdhcmRzLA0KWmhhb3lhbmcgWXU=


