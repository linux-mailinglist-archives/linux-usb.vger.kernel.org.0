Return-Path: <linux-usb+bounces-30538-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7186DC61570
	for <lists+linux-usb@lfdr.de>; Sun, 16 Nov 2025 14:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17F4D3B57F4
	for <lists+linux-usb@lfdr.de>; Sun, 16 Nov 2025 13:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A4D2D73A2;
	Sun, 16 Nov 2025 13:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tencent.com header.i=@tencent.com header.b="naIwc4h/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5B323E35E
	for <linux-usb@vger.kernel.org>; Sun, 16 Nov 2025 13:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763298924; cv=none; b=D5qdqG7rq1upfs5s1oFiWsal2xlkoK6Zean8pTz4yIYzqiyDRgiFIaMZ4E1l5qM/e/788ow93Unewx5Xg//0eAevP7ZPFlOIXQCSXSdhr2X1T7+/WqAgp+HgRUEnaV7O77bsQovQ7ydzUYodf1G42plcGFZmSA6RmiLVPrwtVrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763298924; c=relaxed/simple;
	bh=jV4OUUxWWC5takbTj//NZbModdzpU85jB5tuNJ6/5YQ=;
	h=Date:From:To:Cc:Subject:References:Mime-Version:Message-ID:
	 Content-Type; b=PLtXTI1Oo1GcQnxuJxpViGHWIEkMS+uEE9Yq/dxD/MSu4zlsYMJOiwtWts/61vTcMVfvC/z7MXZn/Pah2QjsbnIwM4dGPZqcT4f3uX9ueqy0p1iW4/tD4jBh/l/h4bu/sEiHzwi5MOtNZBsPXWxApsm6PcvE1sqYBPB/CS3+/9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tencent.com; spf=pass smtp.mailfrom=tencent.com; dkim=pass (1024-bit key) header.d=tencent.com header.i=@tencent.com header.b=naIwc4h/; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tencent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tencent.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tencent.com;
	s=s201512; t=1763298907;
	bh=jV4OUUxWWC5takbTj//NZbModdzpU85jB5tuNJ6/5YQ=;
	h=Date:From:To:Subject:Mime-Version:Message-ID;
	b=naIwc4h/s75RTrod1C1JeYEhtpTM9Xcr5Yg/E+eqwViGgPBau6yeBQ7lue+MC7xEU
	 BXhlkt/frNP0lfpRxvdxMA65p8WtJzWSPAWrjQA0AzY5QhKHx/F5PS363PIwFI8F6j
	 aP+AXE+0ujWFbBO6aWBlS1SCYU+0j7nhRfz3PpkI=
X-QQ-mid: zesmtpsz9t1763298905t7e7a45ca
X-QQ-Originating-IP: wJMnQu6bRp/h0G+hNCoXWIR2yI2rEwoOAlTPN5Slte4=
Received: from FLYNNNCHEN-PC1 ( [11.176.19.11])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 16 Nov 2025 21:15:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18267915891469540549
Date: Sun, 16 Nov 2025 21:15:05 +0800
From: "=?gb18030?B?Zmx5bm5uY2hlbiizwszss/4p?=" <flynnnchen@tencent.com>
To: gregkh <gregkh@linuxfoundation.org>
Cc: linux-usb <linux-usb@vger.kernel.org>
Subject: Re: Re: [PATCH] usb: storage: sddr55: Reject out-of-bound new_pba
References: <B2DC73A3EE1E3A1D+202511161322001664687@tencent.com>, 
	<2025111605-stardust-unvocal-222f@gregkh>
X-Priority: 3
X-GUID: DA4C1EB1-D428-4B2C-9F99-565C7C0FBF42
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.492[en]
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <EBC31800E75832ED+202511162115037260372@tencent.com>
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:tencent.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: NzOHSugmTg7XSpTO73sP6bl+w3ndXfKcViA8j6aeR4aROw0Y5ltBr8AX
	qTkEGt8+EtE4MoGg1iChnxRhBOr0yDcsr5tvWT6bX72fq0jA5+jOZ11HxUgMv3+qaNZFbL/
	s3eS4nYsuoiwqv5ZtkJ8Iu/9b1z1wZFv2+kwKw00xwgW0Rreb5tE1F4YMs6yqNLioglgfCu
	G6QbdE5tKcKLTtcQkcPBLaQiwmwe69QyvdylI154oh0l2VftmXeFE9wyXgqNRnW27px8SzV
	FvsoDiwNuOHToHA0YHT7UfK/O9u3jmZk40b97ZpW7Q+Uz+6+3qDkOY1G6N7PnKzyKSzcgCC
	SzuJF4IlC6LtpJrVhYL+ymw+G+DH19wi+ORpVhMXg+1hotjKDBpelmgBnMFyz8PcBxktsGn
	CjQ8UjtVdsoylnx58+J4Ehs8nUMOaTajNUxVM/FcsPuG3MtJz3nO9kdc0a8cTEzj2l6mW4C
	2wo+USreImYD/97rgYUBk5gEy/x4C41Qwp9By3oKXS65Hyl+LxR9RfHdnBclTL0zLYMCSJN
	50FfXb0YK/e3tN9ufEUoa5O2MrTtzt9SVss+Qp0/WOpzGRXUbETKxLNbcNguhHoLMDgabFD
	s+l+/N4ydZU6ihVJmMEZIDA7o+zhViud1g+MNivwRLVWHsB9y3/cPA4Qa505JlfzYCMdmvL
	zfnqpNtd9F9FkPAswxFZX7rFQcOLIOZ8HtdWCoirGJP22+0SYh7ucKk3nbGfUYCRQG+u2YZ
	PuRVkXhILwPDHXL2V25cYfQ1mbgNWC5sXGPbjRFHI03yE3JArSbQccPto/3m41ahgg4I4kH
	uwgTKn2MJsFqkD8HPmGzr/EdWXA/7jDpX8+DzpBZWnszX7lsNPxuE6tJSuDxC+at+ae4u7p
	XlfPlAEz23vpowRU4CmnLT0gyFkguAwCXisBH7XK+qjBwicCBsW4Bbt2LN50QiXSDBBfVC3
	CGGs7Vm9eFzQt9CeZWi6rgdfF1t6yM8WqJAZScOO0H+U4rw==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

T24gU3VuLCBOb3YgMTYsIDIwMjUgYXQgMDc6MDc6NTdBTSAtMDUwMCwgZ3JlZ2toIHdyb3RlOgoK
Pk9uIFN1biwgTm92IDE2LCAyMDI1IGF0IDAxOjIyOjAxUE0gKzA4MDAsIGZseW5ubmNoZW4o6ZmI
5aSp5qWaKSB3cm90ZToKPj4gRGlzY292ZXJlZCBieSBBdHVpbiAtIEF1dG9tYXRlZCBWdWxuZXJh
YmlsaXR5IERpc2NvdmVyeSBFbmdpbmUuCj4+IAo+PiBuZXdfcGJhIGNvbWVzIGZyb20gdGhlIHN0
YXR1cyBwYWNrZXQgcmV0dXJuZWQgYWZ0ZXIgZWFjaCB3cml0ZS4KPj4gQSBib2d1cyBkZXZpY2Ug
Y291bGQgcmVwb3J0IHZhbHVlcyBiZXlvbmQgdGhlIGJsb2NrIGNvdW50IGRlcml2ZWQKPj4gZnJv
bSBpbmZvLT5jYXBhY2l0eSwgbGV0dGluZyB0aGUgZHJpdmVyIHdhbGsgb2ZmIHRoZSBlbmQgb2YK
Pj4gcGJhX3RvX2xiYVtdIGFuZCBjb3JydXB0IGhlYXAgbWVtb3J5Lgo+PiAKPj4gUmVqZWN0IFBC
QXMgdGhhdCBleGNlZWQgdGhlIGNvbXB1dGVkIGJsb2NrIGNvdW50IGFuZCBmYWlsIHRoZQo+PiB0
cmFuc2ZlciBzbyB3ZSBhdm9pZCB0b3VjaGluZyBvdXQtb2YtcmFuZ2UgbWFwcGluZyBlbnRyaWVz
Lgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogVGlhbmNodSBDaGVuIDxmbHlubm5jaGVuQHRlbmNlbnQu
Y29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvdXNiL3N0b3JhZ2Uvc2RkcjU1LmMgfCA2ICsrKysrKwo+
PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL3N0b3JhZ2Uvc2RkcjU1LmMgYi9kcml2ZXJzL3VzYi9zdG9yYWdlL3NkZHI1NS5j
Cj4+IGluZGV4IGIzMjNmMGEzNi4uOWQ4MTM3MjdlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3Vz
Yi9zdG9yYWdlL3NkZHI1NS5jCj4+ICsrKyBiL2RyaXZlcnMvdXNiL3N0b3JhZ2Uvc2RkcjU1LmMK
Pj4gQEAgLTQ2OSw2ICs0NjksMTIgQEAgc3RhdGljIGludCBzZGRyNTVfd3JpdGVfZGF0YShzdHJ1
Y3QgdXNfZGF0YSAqdXMsCj4+ICAJCW5ld19wYmEgPSAoc3RhdHVzWzNdICsgKHN0YXR1c1s0XSA8
PCA4KSArIChzdGF0dXNbNV0gPDwgMTYpKQo+PiAgCQkJCQkJICA+PiBpbmZvLT5ibG9ja3NoaWZ0
Owo+PiAgCj4+ICsJCS8qIGNoZWNrIGlmIGRldmljZS1yZXBvcnRlZCBuZXdfcGJhIGlzIG91dCBv
ZiByYW5nZSAqLwo+PiArCQlpZiAobmV3X3BiYSA+PSAoaW5mby0+Y2FwYWNpdHkgPj4gKGluZm8t
PmJsb2Nrc2hpZnQgKyBpbmZvLT5wYWdlc2hpZnQpKSkgewo+PiArCQkJcmVzdWx0ID0gVVNCX1NU
T1JfVFJBTlNQT1JUX0ZBSUxFRDsKPj4gKwkJCWdvdG8gbGVhdmU7Cj4+ICsJCX0KPgo+QW55IGNo
YW5jZSB5b3UgdGVzdGVkIHRoaXMgd2l0aCByZWFsIGhhcmR3YXJlPwo+Cj50aGFua3MsCj4KPmdy
ZWcgay1oCgoKVW5mb3J0dW5hdGVseSwgSSBkbyBub3Qgb3duIHRoZSByZWFsIGhhcmR3YXJlLCBh
bmQgaGF2ZSBub3QgdGVzdGVkIGl0IG9uIGEKYSByZWFsIGRldmljZS4KClNvbWUgb2YgbXkgdGhv
dWdodHMgb24gdGhpcyBwYXRjaCwgZnJvbSBzdGF0aWMgYW5hbHlzaXM6CgpROiBXaGF0IGlmIHRo
aXMgY29kZSBpcyBjYWxsZWQsIGJlZm9yZSBpbmZvLT5jYXBhY2l0eSBpcyBzZXQ/CkE6IElmIHNk
ZHI1NV93cml0ZV9kYXRhIGlzIGNhbGxlZCBiZWZvcmUgc2RkcjU1X2dldF9jYXBhY2l0eSwKaW5m
by0+Y2FwYWNpdHkgYW5kIHBiYV90b19sYmEgc2hvdWxkIGJvdGggYmUgMCwgaW4gdGhlIHBhdGNo
ZWQgY29kZSBpdCB3aWxsCmFsd2F5cyBmYWlsLCB3aGlsZSBpbiB0aGUgb3JpZ2luYWwgY29kZSBp
dCB3aWxsIGNhdXNlIE5VTEwtZGVyZWYuCgpROiBJcyBjaGVja2luZyBuZXdfcGJhIGhlcmUgZXNz
ZW50aWFsIGluIGFsbCBjYXNlcz8KQTogWWVzLCBpbiBhbGwgdGhlIGNvZGUgcGF0aCBiZW5lYXRo
IGl0LCBuZXdfcGJhIGlzIGFsd2F5cyB1c2VkIHRvIGluZGV4CnRoZSBhcnJheSwgd2l0aCBubyBl
eGNlcHRpb24uCgpROiBXaGF0IGlmIGRldmljZSByZXBvcnRzIHdyaXRlIHN1Y2Nlc3MsIGFuZCBn
aXZlcyBiYWNrIGFuIE9PQiBuZXdfcGJhPwpBOiBGb3IgdGhlIHBhdGNoZWQgY29kZSwgaXQgd2ls
bCBmYWlsIHRoZSB3cml0ZSB0cmFuc2Zlci4gSW4gdGhlIG9yaWdpbmFsCm9uZSwgaXQgaXMgdmVy
eSBsaWtlbHkgdG8gZmFpbCBhcyB3ZWxsLCBiZWNhdXNlOgoKCQkvKiBjaGVjayB0aGF0IG5ld19w
YmEgd2Fzbid0IGFscmVhZHkgYmVpbmcgdXNlZCAqLwoJCWlmIChpbmZvLT5wYmFfdG9fbGJhW25l
d19wYmFdICE9IFVOVVNFRF9CTE9DSykgeyAgPC0tLSBWZXJ5IGxpa2VseSB0byBmYWlsIGhlcmUK
CQkJcHJpbnRrKEtFUk5fRVJSICJzZGRyNTUgZXJyb3I6IG5ldyBQQkEgJTA0WCBhbHJlYWR5IGlu
IHVzZSBmb3IgTEJBICUwNFhcbiIsCgkJCQluZXdfcGJhLCBpbmZvLT5wYmFfdG9fbGJhW25ld19w
YmFdKTsKCQkJaW5mby0+ZmF0YWxfZXJyb3IgPSAxOwoJCQlzZXRfc2Vuc2VfaW5mbyAoMywgMHgz
MSwgMCk7CgkJCXJlc3VsdCA9IFVTQl9TVE9SX1RSQU5TUE9SVF9GQUlMRUQ7CgkJCWdvdG8gbGVh
dmU7CgkJfQoKVGhlIG9yaWdpbmFsIGNvZGUgT09CLXJlYWRzIGluZm8tPnBiYV90b19sYmFbbmV3
X3BiYV0sIHdoaWNoIGlzIHZlcnkKdW5saWtlbHkgdG8gZXF1YWwgdG8gVU5VU0VEX0JMT0NLIChp
MzIgMHgzZmYpIGJ5IGNoYW5jZSwgdGh1cyB0aGUgb3JpZ2luYWwKY29kZSB3aWxsIGFsc28gZmFp
bCB0aGUgdHJhbnNmZXIgaW4gbW9zdCBjYXNlcy4KCkZyb20gbXkgdW5kZXJzdGFuZGluZywgdGhl
IHBhdGNoZWQgY29kZSBzb2x2ZXMgdGhlIE9PQiBpc3N1ZSwgd2hpbGUgYmVpbmcKYWxpZ25lZCB3
aXRoIHRoZSBvcmlnaW5hbCBiZWhhdmlvciBpbiBtb3N0IGNhc2VzIEkgaGF2ZSBpbWFnaW5lZC4K


