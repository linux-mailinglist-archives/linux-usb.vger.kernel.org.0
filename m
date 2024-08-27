Return-Path: <linux-usb+bounces-14202-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9809E9618C1
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 22:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CBF5B2291B
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 20:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED7D1D2795;
	Tue, 27 Aug 2024 20:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b="Ljz9/qmk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D55C2E62B
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 20:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724791790; cv=none; b=qPCo9R2GcEuLkGrSiqJEHU1WkOdf1ekynam1qqYATdV1PtozGiln6/JBF3sbidOwzE8eLZDc2fuflp7XJFfQtzAJn7CgYVDd/7EdOg3DT5KnHEcn+NBQWkH77jhBVollT+E+64dKPrlmX9/3QK2Uf/02nYLBtLTnL/4ln/ZKUcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724791790; c=relaxed/simple;
	bh=Nqialgy5xjFvr89qWmGlhYnct5xs7vUIc6QquMGMfHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GkVvUTnntJJOdTix3BX3AJ3Ggy8cMVvM+kU4LRlYvvaS0+qDzrmfMRDbtDQ7bxlr7K4+tlmmYioMl4+Sjq5BX3tjCc+QsBrIAXGgBC9nv48f6KtHiuUi82+oajRWLnpb+mdGATnkIdVxVXGfM/m5lwWsl3U0+dVSb6Ki6JTAmcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b=Ljz9/qmk; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1724791781; x=1725396581; i=mista.tapas@gmx.net;
	bh=Nqialgy5xjFvr89qWmGlhYnct5xs7vUIc6QquMGMfHs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Ljz9/qmkLYlZMJS9FgKiu9rGA5BoEX26kvRjTadMZ3/fwSq+AFj/ECwzL2w54HRc
	 4cFoxILLLR0imWNJpCaY6TG240Ek3pCkpXIChFl+KuigCx81QmlJOsJpZD/Z+oAHo
	 hkWfmAEaf5/Xe8WhjhwhxwYjLIeD/Qokekq3BCE2V7wlKWXh48IWp9i63vVh1zEbx
	 FSpl7BHmXH1rNZ7FxmLtG3DUTeXb5Qj+zlokfSolc1pKL0EGgX66RxYryuXPxmIuV
	 s97wUfhxErQrNxZuQ4rDO9F0XZLr2ip12TYWKmsI/RUH1a//orBobO/scq6a31e3x
	 65Mwz/bLKUSwELl6xw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.77] ([94.229.156.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxDkm-1rudHJ12Bk-00vhmO; Tue, 27
 Aug 2024 22:49:41 +0200
Message-ID: <de961730-d782-4551-b3d4-3db0580b581c@gmx.net>
Date: Tue, 27 Aug 2024 22:49:46 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
References: <20240820130158.339b4d87@foxbook>
 <bb565e29-10e9-4211-a854-fdd9771149b4@gmx.net>
 <20240821150233.4f8f66ef@foxbook>
 <e6879e07-3548-41c1-b18a-55c40d041b86@linux.intel.com>
 <2b81ac60-32f5-4b71-98de-d336b7282cfb@gmx.net>
 <ca65e086-b5eb-424b-9757-7df581cd8fb4@linux.intel.com>
From: FPS <mista.tapas@gmx.net>
Content-Language: en-US
In-Reply-To: <ca65e086-b5eb-424b-9757-7df581cd8fb4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:poFyYoPVcTtlyxBblMOIS3d/6naLJyLmUp00VgpPNUlxhvIldGo
 RxMTWq0eBHJbrsSi235aKj+p6EYPL2IoWTkavDomtJV6XfG+mosXXqr/0iZTzpJNvwTKiaS
 gKv9lGtMjyFKtGHKC57Du6mRYUvXglNKr/CMHWnV8qUr5H7WIkg8NPsGx+vibqHhO/bsehP
 6fOvccbjV4rq5IP6Mg9hA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WCrjRYEn6To=;0eEKwkCUK+ZRkJM+FHHXxYJdJey
 uX8VGP81GbncG+owCtHWyUza0PreXQeOzd0qoqDhmtp3lMU6M0iHqS2TfSsqzr9bPwUsnlZGN
 UZ4QbyIb3XNrNB/Ypq3Xs7VGDbmjK1/b9urUKZClQ7J1ZLS01puqBA9llAFG2ooxbuccCD04C
 VphyIbkuQir0UgK2ODLFihCMfM96GZ2DyODZt00wakiQVrA11t02s/wGJdQCSrANpRqlPGghf
 GJUvKELuEP5Hn9qhw+HEfbo3Sddh4D2jnvTq5y6vMtgts3U8mc9uLakXj4/VTrCiT7l9aIdbN
 nOKLN7+E68O/znqtBRrrmiofF+OgS75zg91uKxW4l1Yufk073+JeNluuKO5qHzS+jVI7HODVj
 OSEK1FWBLRxJ/EhcpQPDae1YvOWWO1cl0xD9DZukbqqFDbVPttGMCcI0BeGDOlPI00pc4OJya
 UTX92wU/Bm00epWTWq4XhSS6jIVeDTxiObY5vAzo6hgDbhVJN021z3nRzDG//nvDjEjXwB/vo
 cVw0XKlFNU/ATM9Y8Bj+kqHZ0CziYThDygpOqMFE4cxd5w+jm+0UumMLHmDIBcPt1nmcei4k4
 pcwU9ivRCm68df4xVPGdLiTtqwAwDhcuDy/ZPKQitEGXaR+oFQh/8ZhrXiXooVTHh33ovc8SN
 +pmnr5eqFzOZ/4UNklqobY0ET7aNLhsAw0TSpwdPKh16BXFmM8M9UwVpf15EisTqdgc16exFE
 +yOPOuu2bv9Dv37Ia6tTo6GfGDdiqgsrJBPKFyl14D/CidlZW0ETdt9KvGvW9Ngo7hTeEqAEP
 RM0lE7moSS0Tjqz5QhAfWFlQ==

T24gOC8yNy8yNCAyOjM4IFBNLCBNYXRoaWFzIE55bWFuIHdyb3RlOg0KPiBUbyBtYWtlIHN1cmUg
ZXZlcnkgZXZlbnQgdHJpZ2dlcnMgYW4gaW50ZXJydXB0IGp1c3QgY29tbWVudCBvdXQ6DQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLXJpbmcuYyBiL2RyaXZlcnMvdXNi
L2hvc3QveGhjaS1yaW5nLmMNCj4gaW5kZXggNGVhMmMzZTA3MmE5Li5kZTYxYTEwMTgxNTUgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1yaW5nLmMNCj4gKysrIGIvZHJpdmVy
cy91c2IvaG9zdC94aGNpLXJpbmcuYw0KPiBAQCAtNDEwOCw4ICs0MTA4LDggQEAgc3RhdGljIGlu
dCB4aGNpX3F1ZXVlX2lzb2NfdHgoc3RydWN0IHhoY2lfaGNkIA0KPiAqeGhjaSwgZ2ZwX3QgbWVt
X2ZsYWdzLA0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdGQtPmxhc3RfdHJiID0gZXBfcmluZy0+ZW5xdWV1ZTsNCj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHRkLT5sYXN0X3RyYl9zZWcgPSBlcF9yaW5nLT5lbnFfc2VnOw0KPiAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmllbGQg
fD0gVFJCX0lPQzsNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAodHJiX2Jsb2NrX2V2ZW50X2ludHIoeGhjaSwgbnVtX3Rk
cywgDQo+IGksIGlyKSkNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmllbGQgfD0gVFJCX0JFSTsN
Cj4gKy8vwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKHRyYl9ibG9ja19ldmVudF9pbnRyKHhoY2ksIG51bV90ZHMsIA0KPiBpLCBpcikp
DQo+ICsvL8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWVsZCB8PSBUUkJfQkVJOw0KPiANCj4gQnV0IEkgZG9u
J3QgdGhpbmsgdGhpcyBpcyB0aGUgaXNzdWUgYWZ0ZXIgbG9va2luZyBhdCB0aGUgdHJhY2VzLg0K
DQpZZXAsIGNvbmZpcm1lZC4gTWFrZXMgbm8gZGlmZmVyZW5jZSBhdCBhbGwgaXQgc2VlbXMgOikg
TXVjaCBhcHByZWNpYXRlZCANCnRob3VnaCAtIHNvIHRoYW5rcyBhZ2FpbiENCg0KS2luZCByZWdh
cmRzLA0KRlBTDQo=

