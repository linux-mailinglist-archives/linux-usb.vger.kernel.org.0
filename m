Return-Path: <linux-usb+bounces-19070-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EE1A040B1
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 14:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8D5B162AAB
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 13:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C881E1023;
	Tue,  7 Jan 2025 13:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="cfGCeR2q"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D7A154BE2;
	Tue,  7 Jan 2025 13:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736255954; cv=none; b=G147fPEOiVG62QMbpaaLNbQQHyYfB4IiG6Zl+UgrO9grIJZIQ1xHEHfrE4ii/bCrK4G6PFuzIKkFl9YmMnj6/+dE1fA+qiO9BE+zQZesQrJr+5AL3UbI3PZz9/AMHoI0U8Wo2bTocl4RkV1Gk+CT57oBXIc5/wi68S+/qhRaZOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736255954; c=relaxed/simple;
	bh=VvjttN+uPkkaCBzkl+JMFKvWE3btI/Y+exqEYiCVP+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FWEXXMj8oGcpg3sG17WFvIKF6yI1jycgKlPf2wyd02+o76l5g14Koj1goBzSxO3xBTyLwYGqjERmDbDXQY/zLgsdZ3OC6G17n9K6j/mmSQn3gXvyDzuvl1LkcwikI0shrCYXzxd6qM6B25TForEzzH3c3Db/6hO2rQPvIpUndFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=cfGCeR2q; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1736255940;
	bh=2IV4Si2XU16Vu1XyRUqSVjxDhzSs9ppJoEGs4vnWTio=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=cfGCeR2qHlX+GqqUNLmACvn8YikhocEwZFJaXXWEshk+qBi3o7rtcqOYedgusl56P
	 SIMT7MWqgNRQtE1B68X5KsY8UX3nux4RaRftn34nBs1Fuh2o94VKdoXnHzzUAl/1Ft
	 oexyCReoBn46w5AZ3awa6Ck7OC7KSnlTr0Em3lZw=
X-QQ-mid: bizesmtpip3t1736255906tuj3s6p
X-QQ-Originating-IP: 5GkzA44go2Y0yns5Lh5Uo3Fk0MbVqRNEzie+zhy+pEw=
Received: from [IPV6:240e:668:120a::253:10f] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Jan 2025 21:18:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12878274302829736638
Message-ID: <7892C96AE88F09DE+4c76f75f-6a6c-4144-98db-4a212114d506@uniontech.com>
Date: Tue, 7 Jan 2025 21:18:22 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: host: xhci-plat: Assign shared_hcd->rsrc_start
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, niklas.neronin@linux.intel.com,
 quic_wcheng@quicinc.com, andriy.shevchenko@linux.intel.com,
 michal.pecio@gmail.com, guanwentao@uniontech.com, zhanjun@uniontech.com,
 bigeasy@linutronix.de, balbi@ti.com, sarah.a.sharp@linux.intel.com,
 hkallweit1@gmail.com, Xu Rao <raoxu@uniontech.com>
References: <7ECE325975663D2D+20250104155111.100597-1-wangyuli@uniontech.com>
 <2025010711-blush-glamorous-9498@gregkh>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <2025010711-blush-glamorous-9498@gregkh>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1zlTR9pA91E0Ki0fBpWKLazV"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M3VXLdcTyjkzKTq13kaT1wQTpJSSX0j7UUSFKVqKJuIwqnnbvbpi2iHV
	Ozgj2caEi21Mk6zyRp0rO655C0dzhwP8iNnjA24G+ki8C2rneMvSwxGksGcKkDMEdGfIqjE
	m5VKnAfXic6NBjocuVL3P/EP0Z+t88u5iX2YX0kwCkp6Lhf1MmIFOXnVE+vDJDf3zuDXfNf
	l4ZZBt5/LfiSWKJ4H/apT02DhD1FXhnROOWYblz2Jx1yV+3KtVTBMzcqrLpAe4kEXy5b9wW
	j6qpU6CV50kymxU4QBRybwhmQN1UedGwpWOd2jT+HpRmbsYJVb5heLjnYgchY+wPo3qbo3I
	NB53kT+yHXgWFrs33vPD7mVz436XtvwfBYIADaWnua9f0Zkuz+xXEgmlctzYA8BSiqkbLU5
	egoXXXgI3cDgOsETMmDIsTv1r0GjcJHBg+9yOBfASV89JDMs87CjFJe/sfAKE510YWcJcHn
	9GfjgEGpdCSNEEQpBs0GzENhPdJfuIKKkuReEM/jM8mzQRhcq5oSYbuTXHMGqInNAYPMYQX
	CAkN2Sp3zTO6gMuGJTiPMrTwjUTjKVjYPEksE++prqcqMR4u/KqpN8s1Pm6WaFMx6d39dAc
	KIHgX9l2uC1iBv1Ga4VWk3fAzUE47owMf0A8uaul6L8RjAdQLpt4+vtDgB8UuVhlB3tg1F4
	Ry7VGAVULxi9J3jJlLbUIO+4Y6+NWp4qLJG4beZNhTZrJJc37a6l9nG3ZgxeojdzZizLNe0
	cQ9m8kK42qMXO+0l2J405IkykVCUbuc5nkJx3nwOwrcHlpzoHGstl/W99YgDUWmddLRvYPU
	Vy0hzHojKj0edwD4lUluDwbOWD3NaUtAFtYYmkRY9WsFMCBVBE2vbSZy2z+QrNwT9p3Gjzm
	QtJGacsNzXy4TAyRsbLKhpNFurMyUSLw1nDPZ/pe5HhyPP5c4RpMmktjG0KV1OPrlW+xcvm
	Nlj1bfK7b2ltoCtOrFQu09GeNS8ANSN9D5X3XM2VX6iq+ziOF+UgzZTzPv6Jyx0VCAJg1H/
	BUO5+rzwxfmR8NzVBTS/e3OBpQd+m7yQesXE9afvN3Do76B/fT7g8MZCzWS/r7OnQc++Noz
	g==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1zlTR9pA91E0Ki0fBpWKLazV
Content-Type: multipart/mixed; boundary="------------SWFzn0qj00Gp7LUWGQoNNk00";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, niklas.neronin@linux.intel.com,
 quic_wcheng@quicinc.com, andriy.shevchenko@linux.intel.com,
 michal.pecio@gmail.com, guanwentao@uniontech.com, zhanjun@uniontech.com,
 bigeasy@linutronix.de, balbi@ti.com, sarah.a.sharp@linux.intel.com,
 hkallweit1@gmail.com, Xu Rao <raoxu@uniontech.com>
Message-ID: <4c76f75f-6a6c-4144-98db-4a212114d506@uniontech.com>
Subject: Re: [PATCH v2] usb: host: xhci-plat: Assign shared_hcd->rsrc_start
References: <7ECE325975663D2D+20250104155111.100597-1-wangyuli@uniontech.com>
 <2025010711-blush-glamorous-9498@gregkh>
In-Reply-To: <2025010711-blush-glamorous-9498@gregkh>

--------------SWFzn0qj00Gp7LUWGQoNNk00
Content-Type: multipart/mixed; boundary="------------bC0SMj0qBqNdbTA8I0Mnj0KT"

--------------bC0SMj0qBqNdbTA8I0Mnj0KT
Content-Type: multipart/alternative;
 boundary="------------18m8ROhoINlxZ71cqVYXAj1J"

--------------18m8ROhoINlxZ71cqVYXAj1J
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAyMDI1LzEvNyAxODozNiwgR3JlZyBLSCB3cm90ZToNCj4gV2hhdCBjb21taXQgaWQg
ZG9lcyB0aGlzIGZpeD8NCg0KSGkgR3JlZywNCg0KSSdtIG5vdCBzdXJlIGlmIHRoaXMgY2Fu
IGJlIGNvbnNpZGVyZWQgYSBidWdmaXggZm9yIGEgc3BlY2lmaWMgY29tbWl0Lg0KDQpQbGVh
c2Ugc2VlIHRoZSBjb21taXQgbWVzc2FnZSBmb3IgbW9yZSBkZXRhaWxzLg0KDQpJZiBpdCBp
cywgdGhlbiBpdCBkb2VzIGZpeCAzNDI5ZTkxYTY2MWUxICgidXNiOiBob3N0OiB4aGNpOiBh
ZGQgcGxhdGZvcm0gDQpkcml2ZXIgc3VwcG9ydCIpLg0KDQo+IHRoYW5rcywNCj4NCj4gZ3Jl
ZyBrLWgNCj4NCi0tIA0KV2FuZ1l1bGkNCg==
--------------18m8ROhoINlxZ71cqVYXAj1J
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2025/1/7 18:36, Greg KH wrote:<span=

      style=3D"white-space: pre-wrap">
</span></div>
    <blockquote type=3D"cite"
      cite=3D"mid:2025010711-blush-glamorous-9498@gregkh">
      <pre wrap=3D"" class=3D"moz-quote-pre">What commit id does this fix=
?
</pre>
    </blockquote>
    <p>Hi Greg,</p>
    <p>I'm not sure if this can be considered a bugfix for a specific
      commit.</p>
    <p>Please see the commit message for more details.</p>
    <p>If it is, then it does fix 3429e91a661e1 ("usb: host: xhci: add
      platform driver support").<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:2025010711-blush-glamorous-9498@gregkh">
      <pre wrap=3D"" class=3D"moz-quote-pre">
thanks,

greg k-h

</pre>
    </blockquote>
    <div class=3D"moz-signature">-- <br>
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      WangYuli</div>
  </body>
</html>

--------------18m8ROhoINlxZ71cqVYXAj1J--

--------------bC0SMj0qBqNdbTA8I0Mnj0KT
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------bC0SMj0qBqNdbTA8I0Mnj0KT--

--------------SWFzn0qj00Gp7LUWGQoNNk00--

--------------1zlTR9pA91E0Ki0fBpWKLazV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZ30pngUDAAAAAAAKCRDF2h8wRvQL7g0b
AQDHw0MqvEHntR2v47IoJ06LKcbQfzcsLYaJAgqyXtiOfgEAmNipnPip7zKZo0opHANvyPlX1M0F
Y75lcnmo1Pt5lQc=
=D0JX
-----END PGP SIGNATURE-----

--------------1zlTR9pA91E0Ki0fBpWKLazV--

