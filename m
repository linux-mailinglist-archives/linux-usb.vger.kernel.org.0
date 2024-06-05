Return-Path: <linux-usb+bounces-10853-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1BF8FC1E8
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 04:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F83BB20E93
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 02:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F179261FCF;
	Wed,  5 Jun 2024 02:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="Dg+4uPXB"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31792184E
	for <linux-usb@vger.kernel.org>; Wed,  5 Jun 2024 02:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717555012; cv=none; b=u6NRtpiLzHEM0QLsXAAiC9DQMnlgG+Hj1xpxxXjxgrma+Z10mpouNXmiIzGlcfl/xh5/UZ7I8/CgCgC/0bstR/ciYPQxBagLeonsJc3QDG9kRV8QhVb/kYh9tCD1EoH1XxrOjjjMrhT1De0Eqmrlr55p3LOSyShQCFPWhf14B5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717555012; c=relaxed/simple;
	bh=dlrW8xU+KUYIOzg2TTc2oYe8xLQE6g8+Jl52AFi3Mw0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=c0z0EccOBAxhDp5XubK7PKtB2koSqgfTo9AJubeqHu1q1dMcqcBGyCF7xspVVbYf1RR0c8p+z7tOo6RPYmRgpSi65Pt8IYU3yyQXZcUcMpCkKlXD+BMcSew4wfOXZ2lYaZ1NQI2W7ApEBIumgubVsHn9TfFBauonTJetSAoVVmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=Dg+4uPXB reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=UhrSWUqlQlytUrhBbG2nlJEYIXZMCHqS/UY5Kb0wsGQ=; b=D
	g+4uPXBLCY+wQTvYposTaDJq1NDwTTioBAHwpICuVkTl0KebCI+sNN12NtZCV5jL
	h7rOKBe1NDi3sPTW6IErsxSfQnKddZQftVmUT8cPTIr46d7DA8d08eUdvTMT7fVo
	ze6ayY8IThHYMZ4WpKxs1puSUfqQ/MGUgG8jT6fmfY=
Received: from congei42$163.com ( [159.226.94.118] ) by
 ajax-webmail-wmsvr-40-114 (Coremail) ; Wed, 5 Jun 2024 10:36:30 +0800 (CST)
Date: Wed, 5 Jun 2024 10:36:30 +0800 (CST)
From: sicong  <congei42@163.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: peter.chen@kernel.org, pawell@cadence.com, rogerq@kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re:Re: [PATCH v1] usb: cdns3: cdns3-gadget: fix use-after-free bug
 in cdns3_gadget_exit due to race
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <2024060444-delay-surgical-c8ff@gregkh>
References: <20240513021948.133039-1-congei42@163.com>
 <2024060444-delay-surgical-c8ff@gregkh>
X-NTES-SC: AL_Qu2aBfmeu0Ei5iOfZukfm0YUj+44Wsa4uvgk2YJeOpt4jDvp3gsie2dTEUPJ2eSKLB2InwiHYQNu8tpBXZZBZp8VRwvWVBCt0f5/2XijxbIu4A==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <6d94822a.2eaf.18fe6414d2a.Coremail.congei42@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3Hyguz19mYBpVAA--.14539W
X-CM-SenderInfo: 5frqwvrlusqiywtou0bp/xtbBFQHz8mXAlvOL6QAGsx
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI0LTA2LTA0IDIxOjExOjU3LCAiR3JlZyBLSCIgPGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnPiB3cm90ZToKPk9uIE1vbiwgTWF5IDEzLCAyMDI0IGF0IDEwOjE5OjQ4QU0gKzA4MDAs
IFNpY29uZyBIdWFuZyB3cm90ZToKPj4gVGhpcyBidWcgZXhpc3RzIGluIGRyaXZlcnMvdXNiL2Nk
bnMzL2NkbnMzLWdhZGdldC5jLiBGdW5jdGlvbgo+PiBfX2NkbnMzX2dhZGdldF9pbml0IHdpbGwg
Y2FsbCBjZG5zM19nYWRnZXRfc3RhcnQgdG8gZG8gZnV0aGVyIGpvYnMKPj4gZHVyaW5nIHRoZSBp
bml0aWFsaXphdGlvbiBwcm9jY2VzcyBvZiBjZG5zMyBnYWRnZXQuIEluIGNkbnMzX2dhZGdldF9z
dGFydCwKPj4gJnByaXZfZGV2LT5wZW5kaW5nX3N0YXR1c193cSBpcyBib3VuZCB3aXRoIGNkbnMz
X3BlbmRpbmdfc2V0dXBfc3RhdHVzX2hhbmRsZXIuCj4+IFRoZW4gdGhpcyB3b3JrIHdpbGwgYmUg
YWRkZWQgdG8gc3lzdGVtX2ZyZWV6YWJsZV93cSBpbiBjZG5zM19nYWRnZXRfZXAwX3F1ZXVlLgo+
PiBIZXJlIGlzIHRoZSBjb2RlLgo+PiBxdWV1ZV93b3JrKHN5c3RlbV9mcmVlemFibGVfd3EsICZw
cml2X2Rldi0+cGVuZGluZ19zdGF0dXNfd3EpOwo+PiAKPj4gSWYgd2UgY2FsbCBjZG5zM19nYWRn
ZXRfZXhpdCB0byByZW1vdmUgdGhlIGRldmljZSBhbmQgbWFrZSBjbGVhbnVwLAo+PiB0aGVyZSBh
cmUgc29tZSB1bmZpbmlzaGVkIHdvcmtzLiBUaGlzIGZ1bmN0aW9uIHdpbGwgY2FsbCBjZG5zM19m
cmVlX2FsbF9lcHMgdG8KPj4gZnJlZSBhbGwgdGhlIGVuZHBvaW50cy4gSG93ZXZlciwgaWYgY2Ru
czNfcGVuZGluZ19zZXR1cF9zdGF0dXNfaGFuZGxlciBpcwo+PiBzY2hlZHVsZWQgdG8gcnVuIGFm
dGVyIHRoZSBmcmVlIGpvYiwgaXQgd2lsbCBjYXVzZSB1c2UtYWZ0ZXItZnJlZSBlcnJvciBhcwo+
PiBjZG5zM19wZW5kaW5nX3NldHVwX3N0YXR1c19oYW5kbGVyIHdpbGwgdXNlIHRoZSBlbmRwb2lu
dCBpbiB0aGUgZm9sbG93aW5nIGNvZGUuCj4+IHJlcXVlc3QtPmNvbXBsZXRlKCZwcml2X2Rldi0+
ZXBzWzBdLT5lbmRwb2ludCwgcmVxdWVzdCk7Cj4+IAo+PiBUaGUgcG9zc2libGUgZXhlY3V0aW9u
IGZsb3cgdGhhdCBtYXkgbGVhZCB0byB0aGlzIGlzc3VlIGlzIGFzIGZvbGxvd3M6Cj4+IENQVTAg
ICAgICAgICAgICAgICAgICAgIENQVTEKPj4gICAgICAgICAgICAgICAgICAgICAgIHwgX19jZG5z
M19nYWRnZXRfaW5pdAo+PiAgICAgICAgICAgICAgICAgICAgICAgfCBjZG5zM19nYWRnZXRfc3Rh
cnQKPj4gY2RuczNfZ2FkZ2V0X2V4aXQgICAgIHwKPj4gY2RuczNfZnJlZV9hbGxfZXBzICAgIHwK
Pj4gZGV2bV9rZnJlZSAoZnJlZSkgICAgIHwKPj4gICAgICAgICAgICAgICAgICAgICAgIHwgY2Ru
czNfcGVuZGluZ19zZXR1cF9zdGF0dXNfaGFuZGxlcgo+PiAgICAgICAgICAgICAgICAgICAgICAg
fCAmcHJpdl9kZXYtPmVwc1swXS0+ZW5kcG9pbnQgKHVzZSkKPj4gCj4+IEZpeCBpdCBieSBjbGVh
bmluZyB0aGUgd29yayBpbiBjZG5zM19nYWRnZXRfZXhpdC4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6
IFNpY29uZyBIdWFuZyA8Y29uZ2VpNDJAMTYzLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL3VzYi9j
ZG5zMy9jZG5zMy1nYWRnZXQuYyB8IDMgKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY2RuczMvY2RuczMtZ2FkZ2V0
LmMgYi9kcml2ZXJzL3VzYi9jZG5zMy9jZG5zMy1nYWRnZXQuYwo+PiBpbmRleCBmZDFiZWIxMGJi
YTcuLjBmMmUxNDNiZDE3YSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy91c2IvY2RuczMvY2RuczMt
Z2FkZ2V0LmMKPj4gKysrIGIvZHJpdmVycy91c2IvY2RuczMvY2RuczMtZ2FkZ2V0LmMKPj4gQEAg
LTMyNTIsNiArMzI1Miw5IEBAIHN0YXRpYyB2b2lkIGNkbnMzX2dhZGdldF9leGl0KHN0cnVjdCBj
ZG5zICpjZG5zKQo+PiAgCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koY2Rucy0+ZGV2KTsKPj4g
IAlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChjZG5zLT5kZXYpOwo+PiAgCj4+ICsJY2FuY2Vs
X3dvcmtfc3luYygmcHJpdl9kZXYtPnBlbmRpbmdfc3RhdHVzX3dxKTsKPj4gKwljYW5jZWxfd29y
a19zeW5jKCZwcml2X2Rldi0+YWxpZ25lZF9idWZfd3EpOwo+PiArCj4+ICAJdXNiX2RlbF9nYWRn
ZXQoJnByaXZfZGV2LT5nYWRnZXQpOwo+PiAgCWRldm1fZnJlZV9pcnEoY2Rucy0+ZGV2LCBjZG5z
LT5kZXZfaXJxLCBwcml2X2Rldik7Cj4+ICAKPj4gLS0gCj4+IDIuMzQuMQo+Cj5XaGF0IGNvbW1p
dCBpZCBkb2VzIHRoaXMgZml4Pwo+Cj50aGFua3MsCj4KCj5ncmVnIGstaAoKCkkgbWFkZSB0aGUg
Y2hhbmdlcyBiYXNlZCBvbiB0aGUgZm9sbG93aW5nIGNvbW1pdCBpbmZvcm1hdGlvbi4KY29tbWl0
IDUxNDc0YWI0NGFiZjkwNzAyM2E4YTg3NWU3OTliMDdkZTQ2MWU0NjYgKG9yaWdpbi91c2ItdGVz
dGluZywgb3JpZ2luL3VzYi1uZXh0KQoKcmVnYXJkcywKClNpY29uZyBIdWFuZwoK

