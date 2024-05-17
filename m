Return-Path: <linux-usb+bounces-10326-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7028C8DDB
	for <lists+linux-usb@lfdr.de>; Fri, 17 May 2024 23:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04838286198
	for <lists+linux-usb@lfdr.de>; Fri, 17 May 2024 21:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2131411E9;
	Fri, 17 May 2024 21:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="n/P1VP2O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE27139FFD
	for <linux-usb@vger.kernel.org>; Fri, 17 May 2024 21:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715982245; cv=none; b=l7Neu5oGHftvek49SwojltAyO9a0B7vCg+VR9yhHtnicJPZvEwriOFDmQi0+BjQBX9t+KishKq8BVyJVM/MXbb/FNCRBd1LyvSGgwp5f1dsnRcOXEvwHXN4NQ5MgjlwMgaa9YxuedVi4y9I4aUG9cNO0LG7S//e/gB+N38K8scw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715982245; c=relaxed/simple;
	bh=6bncCWGC7rlbZLhodAvHLgJU17bccZIGNr11pnLyDb8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K+yB6DBRf570Iv5rPiDVFs42glIKNiVcmJtnwU6i2ochrbhgChwR9y0KZrZf9gsEu7t/hOCHsPdaKsesayV1e8mqO7yH6W+Lv7aQTgHLMfIiiYswSHVs/zkZ7cnCtHKBos1kuTmWuuzvhtfDcJ52pLav9kd5gVoGwKUV6fgy6n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=n/P1VP2O; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1715982234; x=1716241434;
	bh=6bncCWGC7rlbZLhodAvHLgJU17bccZIGNr11pnLyDb8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=n/P1VP2Op6FdtdeX+IoXkw36LOw8BZaJYqdtZUbbSI85D7FRDn8vHN+h1BRrkuewA
	 VCIJZI9gMToaejpWXWwreykGCC9ix4l5F8Wa5l4Nq/lzg0FJ67cfyvPef2TyHGhSBB
	 sckU7zZAzHUJk9Ol/B43YIrdcKiNoutjAweHgbU3V+OIj7FeXcEUOU/RS7mc/mRr0K
	 /INYavGyKkPj1nNhI0GQkCvIJR+N9kMH4lMWMOePhPZjW/Z8XHuxP/q8y21nRu3L5L
	 hOZW11U/WnfJd0wfNKJKLf0nJdZC+f0EAf6NhUZ+pKwYorkOfU2zParZYWW2rDcHB1
	 Gy5ZhxU0VOR+Q==
Date: Fri, 17 May 2024 21:43:53 +0000
To: Lars Melin <larsm17@gmail.com>
From: Ethin Probst <ethindp@pm.me>
Cc: Alan Stern <stern@rowland.harvard.edu>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Assistance getting the Universal Audio Apollo Solo USB to work with Linux
Message-ID: <7ynN3O2foQYEtsrMUuj5TbjdaI9kqDa_skFopBuw8T0lUt-E_kLyBhXjlofYMYbzlKFeZlmj4NHKbKv3x_-j_QGiSSPwXHAFr2n0vbq77uw=@pm.me>
In-Reply-To: <j-duKdnO-pzAWi39GDG40cMHjpmxJHvPP9nQBWaxXOFcwurpN26w_xxNZ36YnByF297RvrIpeyKSy3_rahP2mvL6pxD4Ljh4sWZr9LzCe0Q=@pm.me>
References: <DJiA8anOC3V1gHoj0H-8pmsXujLNu7IlZvNmvUEoDfnjC5VIzZ3YsoTgnUD-zVTsnhgln5BzEsy1n4YkoqkEd_pvTF9oZaukzUoyL-pDfRs=@pm.me> <ab4d0394-0d71-45a7-a79b-02e3c90f8ac8@rowland.harvard.edu> <N-wnVREkI4qROqLV1rCTIoLRiRzMGvywHt9QIdRD-e5AHby9wfaXcTn2V-Gd_UnmW-JomnWn6xGNhDhIeHIG3VHfHRFmnmPdZEPL8Qi5Gf4=@pm.me> <8d415ea6-fe5a-4ec0-8e95-45c03968e666@gmail.com> <5jZCAcuLt5YeqkzP4xk28ICJ2WQUxY1eht4CjJNdnGymv3q6AIk3WugtglGVjqvu6BPVO7zHNx7LJeMnS71JUcoNpVZAMmz4o7G4vVyu0GU=@pm.me> <3c09b040-e76a-40b4-bf86-47469a6107cb@gmail.com> <j-duKdnO-pzAWi39GDG40cMHjpmxJHvPP9nQBWaxXOFcwurpN26w_xxNZ36YnByF297RvrIpeyKSy3_rahP2mvL6pxD4Ljh4sWZr9LzCe0Q=@pm.me>
Feedback-ID: 24240837:user:proton
X-Pm-Message-ID: 636a39fe5285ccd80c4420021fe9947e9a7f22db
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------56046b91e84a161a5119a1061b835c4be1c37f64d5038df53fc3f10765d282bc"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------56046b91e84a161a5119a1061b835c4be1c37f64d5038df53fc3f10765d282bc
Content-Type: multipart/mixed;boundary=---------------------8098d1b3d1169ffd7252a904dcc4156e

-----------------------8098d1b3d1169ffd7252a904dcc4156e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

On Friday, May 17th, 2024 at 14:10, Ethin Probst <ethindp@pm.me> wrote:

> On Thursday, May 16th, 2024 at 05:09, Lars Melin larsm17@gmail.com wrote=
:
> =


> > On 2024-05-16 12:56, Ethin Probst wrote:
> > =


> > > On Thursday, May 16th, 2024 at 00:19, Lars Melin larsm17@gmail.com w=
rote:
> > > =


> > > > On 2024-05-16 05:12, Ethin Probst wrote:
> > =


> > > > I can also not find such a transition in your other two captures, =
all
> > > > descriptor readouts that includes USB Id are 2b5a:000c.
> > > =


> > > This is what puzzles me as well. If I'm missing something it's at a
> > > level that USB Pcap can't capture. When I begin the capture, plug in
> > > the device and power it on, the second packet is always the right
> > > descriptor (pid 000d). There is no indicator in the capture that
> > > commands are sent before that pid is received. As for the other
> > > problem, yeah, that confused me too; I would've thought that another
> > > get descriptor request would've been sent, but apparently not, becau=
se
> > > when I remove the device from the VM and reattach it to the host, th=
e
> > > pid is correct.
> > =


> > You can set up a USBPCap filter on id.Vendor and id.Product (2b5a:000c=
)
> > so that the capture will not start until you connect your device.
> > It will stop capture (logging on screen will stop) when the device
> > transition into 2b5a:000d so you can then close the pcap file.
> > The cmd making the transition should be near the end of your capture. =
:-)
> =


> =


> You would think so, but I can't seem to capture it. Live capture doesn't=
 seem to be working for me, and I just tried again, starting usbpcapcmd on=
 the proper USBPcap device (\\.\USBPcap1) before plugging in the device an=
d turning it on. I waited for the drivers to do their thing, then disconne=
cted the device, and when I checked the capture file the first VID/PID was=
 the 2b5a:000D one and not 000C. I'm not sure what I'm doing wrong but for=
 whatever reason my USBPcap setup is unable to capture whatever is being t=
ransmitted.
> =


> > Your IDA-disassembly is probably on the wrong file, I'd guess that the
> > .sys file in the driver directory corresponding to the .inf file for
> > the firmware loading Id is what handles firmware loading/checking.
> =


> =


> I'm not positive if this one (dump attached) is the right one but maybe =
it is? It's the only one that reasonably makes sense in my mind for the fi=
rmware loader part of things. I'm uncertain what other ones would be the r=
ight driver to try. I'm sorry I don't have more readable code, I don't hav=
e IDA home or pro and the decompiler won't let me produce C code. If there=
's any other debugging you'd like me to do feel free to ask. :)

As an aside, apologies if the mailing list screwed up the attachment.
Looking at the archive it looks as though it just dumped it all into
the main message body which was not what I was going for. Sorry about
that! :-( I'll be sure to just use links in the future.
-----------------------8098d1b3d1169ffd7252a904dcc4156e
Content-Type: application/pgp-keys; filename="publickey - ethindp@pm.me - 0x846BFA7B.asc"; name="publickey - ethindp@pm.me - 0x846BFA7B.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - ethindp@pm.me - 0x846BFA7B.asc"; name="publickey - ethindp@pm.me - 0x846BFA7B.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgp4c0ZOQkY4aHpqc0JFQUM2RWJL
V2RLbFJLOGt0VE1VYUJPYVozQU5aUS9lWm0rMnZHYzFnN3JtdWwxV0cKM0dEc29YOTQ4ODZrLytZ
eHlOQlpjckhBdjh1VjNOU0dQZFZueUN4YTkyOUJBSElCNjFpZTRvMGpUL3V1ClhPVExQWUpwaFJm
am1JaHZDcHhNNE51alZkZDNtSlZnMDJVdU1EUGkzMVNkMmtJU1l6MWlnaGM1QjhPZwpHdlN3QzRT
NStySmFCdzJpYUxIa0dHNWVDSGpJVkN1LzlhbXRZOEhQV1gzWm5INFYvK3lVWmJZd2g2bVoKT3E5
SXo2Tmh6Q09aaWpPRGhPNWhKZkkrUFh4Tm85RWg1cVQ0c1RmVEt4T2F6eEp0SlVrMFVvNjJYeXVm
CklCamtLZWlLMkd3bUhlNnRYd1FWVXp4UXJ6VVc5NEQ0UzBCYlhsRS9NbFJ1MGU2TGRaVnVuWnNB
WXh2TQplWUlTNjg0V2V4Q2g2RmRBZWFNUU1IakRKTHdQbGliZVF4dUdJd3kzbGtqYTJ2Q1JlbFlm
MWw0N0dpR0IKZXZZSHBBbU9DVzVBRXh5TjQ5YkRZUHJxN1J3aktIaGNsTS9SYm9wN0Fmc1R3Mlpp
MU4ybURmUjRSdjBuCllZRUdQVFpFYXU5VnFMY2N3cHk5aDJjcXhtL3ExaWR2NmFpcUhSSVczMTlz
Q3hnbGN4NHlmODBhbVVoSQpUSVV2S1h3RE9BUUhpOXFJL0JSb3dQL0dFbUxxR3BMczBzWW1PdEF0
aXliZTAvbDh5U0tRK2JaR3g3WE8KUFptNytMdVZHK1ZmYnNIUFVqV1d1YXZ5czRXNmFGK0hDcng3
RUd5dmdUUHJmS0pHVkhKOVFIeXhRbmZJCk8yd0JuNWUrMWY3dXQxdUp2YUNuMHo4K2wrZC8weU1C
dTJMVzJ3QVJBUUFCelIxbGRHaHBibVJ3UUhCdApMbTFsSUR4bGRHaHBibVJ3UUhCdExtMWxQc0xC
alFRUUFRZ0FJQVVDWHlINE5nWUxDUWNJQXdJRUZRZ0sKQWdRV0FnRUFBaGtCQWhzREFoNEJBQ0VK
RUJDajZDMzhXN3NSRmlFRWhHdjZlOXgvZ3MrL2M5ODVFS1BvCkxmeGJ1eEdWOGhBQW1BaUIxWTVU
SE5EcnhSS0ZtV25lNVhsUlNwMTY2Y2M1MkZmL3dZVEY0dHdlVmNTZQp4MVR4a0RlaVl4YXM5dURV
amJlcnJxazhLWjJScG9VZW5YeHZSK1pwZm5ocytXVnljYThwNGJsdVVvSksKbVJnby9IOEo2RWl5
eWpjN0w3cG1Vc2VMcExxbjIwL2s5OWk0QUlSVndFZElPb0tuRjFaOUQ1emFsM2lHClMxWEVlMi9r
bzFtTHNsZG9lWTNITmFhYjAxdCt2UUdXVVJmYU55d0VlVFFDbUY0a3lFcFBvYjVKb2R4NQpTQ2Uw
RGJPRTV0M2NydStxQWFiMWgweG1JbjVadUpZMjFjdENqNjladXRIMWFVWmRGeFNCMFNwakc5WXYK
ZzdNQkhZSWxONEdiOTRHZHlzcldSc0NldGhuZ0ZYeG5sUkNObjA1bC9DNWlnelhvcHUvRXVVQmFt
V2ZvCmtGQThuRE9md1luTC9iWHArRHAzKzFRM2ZjaFRhc0VZU2FYL3VqVmZqdlJ1a3pDdUErMmdB
YllMdEk2agpDRTQrSzQ4QmR3Z09FYmtmOXRIZnJ1S2FDcEtEdTFzdzVXSjhZL0U2L2hvTStxSS9t
Y3F4Y0lobzczL0EKcFFNL2MrUU9hQjN0MzdMUWV1V2VpOXBFRFZvSHpPVFZ4R3FEYmdSd0RZMVFa
RDV0NmlUSElCcmRuZFF2CktjMVBiRXo4SGFmS0F0OWNpVlpUY09ueDZQdEFBdVliSmFSdnIrQ1d5
MHBETkdPRnNPeVI2NXNXZFJBLwpnOTB2SHZ2TEgrUDhlUXhwZXFnWTYyZG1Uak1OZUVSYnk4d1dm
QVgrRnVmU09XVEJDQjE2a0ZHQW96QmkKa0UxejZwUWNpM2ljNUhUVlpoREl3YUhkaGF5bVRXOXEz
cHJPTXdSZklmQWJGZ2tyQmdFRUFkcEhEd0VCCkIwQUg5a21nMktOSUFQZTF0RlQ1cDZIUFRvNThR
NjZPdjBKdFdYWTVkcndPRmNMQjdRUVlBUW9BQ1FVQwpYeUg0TmdJYkFnQ1lDUkFRbytndC9GdTdF
WFlnQkJrV0NnQUdCUUpmSWZnMkFDRUpFSDM4NnBlbVU1T08KRmlFRTQ4NE95N2ZYR2t2M2sxam9m
ZnpxbDZaVGs0N1g0d0VBKzgzS3lHdFk4OG91WWgzS2NtMXJQdmljCktVSHV1TWpZSnRvMGFDUXRO
YmdBL1JvR0Voc3NwOGRYWG5NRU4wZVlSSnBHeCt2ekhyV0ZPK0ZsZUVoNQo0UFFFRmlFRWhHdjZl
OXgvZ3MrL2M5ODVFS1BvTGZ4YnV4SGp1eEFBbWVYbW8wTGlWckpEVFRDZUxKdFQKTEFQRkZ6RjJ5
SzJQS0x2eHZaMENWaEFSV0xlWTUraENKblcrRzY5ZGxSRE9PMDh6M2dHZTJFWTZqdjFICkphc1hV
M1pnVCtuVGNaYmlPdFhrSjk5YjRzcVZ0OEEzM1pmWERNeWJNS3dyNUhCMXMzVG54RFZKNWZkeApz
N0wxMmxLZTFISDJnYUZqeXpyNzJZYjkzV2dOdng5MXRQL1Y1VE5CaUQyZXQyc1l3RTlnTFZOTWhs
Y1MKbS9UcGdXMWRUaGlwRHR6UmJmbDVsdjhOWWxaSDNBdFpyejNBeWpNRnhUbzNBWkJ5VjR1Z1lO
S0hVT1RCCm5JbEI3V2tLeW5TRlUrMHEzRFB0TXRMbSthV0NjMTNoQjEzcVA4Y01Ca1hnSjdnOUJU
QlNadWpZaWd0eAp5L3RSWW44cUpFbFdxOXZ4cUJGbjkrSlFzbElBY0dxRnRIYWVtQ0JMMEVsRXM2
THZEQWE5Y2ZFTEg3ajYKYkFOQVJXNTNBSWg5elIwdkFVSlp2d2F5UUhZeVdmb3orc253d3k4M21u
bUlsRGdXRnpiYnlxemtMYmNhCjBiemR1WGF5WHp3Ui9keDRSaElwQzNRbUQ5ZStNcGI2QUlLMGc5
MnFqVDJ6Sjk0eURmTGJxTU9NUW13egpmc0pBUzBFOUpIUHBXd0QwNndDRDEwTmpXRmlBVjluSm5R
bGVqMTNzV0xrZzUxRkJXU0kzK24waHgxVGMKeUowWWh0Y09TRUJCVi9NUWxacDFRdSs0Z0tkbmFP
VkpLN3RudlRGWnNBZTg1eHhLUDRjcjNBTDgzelJFCkRzSVB3RVEwNUl4RG9LWjhwQzFWRUZjRHQ5
OHBlem9NbVIwc2RERk13SE14WXJSK3FwL0dBZWkwWU90Twpxa2pPT0FSZklmQlFFZ29yQmdFRUFa
ZFZBUVVCQVFkQUM4Q21MUE9jSDJkSG9jWDBydFhNVlVRcVhncTkKVHlMTFZPVWl0RHlWWGhJREFR
Z0h3c0YyQkJnQkNBQUpCUUpmSWZnMkFoc01BQ0VKRUJDajZDMzhXN3NSCkZpRUVoR3Y2ZTl4L2dz
Ky9jOTg1RUtQb0xmeGJ1eEhzTlEvL1ZCWFpFUzBVdWJVUFpBYWhBTUVueVNvQQpnZm5oN2Z4TW04
UWFYOUE0bnhyeWFaVUh2U1MvSDZVbEZlQ1FaVHZ0dWhVbFhHdVVrbk9mRVhIU1g1WDQKQjRTSng3
Nktrb1hveFNQTjJrVWwwTW5qOW50K1JRcndJR0o0ZWl4Y1BFYWFDQXV3akhTc05IS0t5ZjRkCnNU
OFhXMUljYVFJSHl2cFp1UHFkRHBuem9tbUVtWnZHbGxwVk9SRkJOQm8vRTJselFCTGU5eGgyT0dT
dQpuOFFhZTdGcFphMzluN0NSQ3VZaXJOTHNoWGI5NTNORUpWZWQrYmNDUDlnbzRBSG9QZWpxcktq
MHhNVUIKaURjRldtT3N5Qy9uMWVHTmpjTkgzZUYxdVdMZXVJSFRKL3hDSGZ3SmR0OFU0Q1RCU2k1
QTNpbXkwclZlClJoMGh5UitGSk1kSFVmZ2lVVjJYVmdiZE41ditoeUNYRE1LTTQ1akNlWitKczFG
VXhnbFExU2xOclBVZwpqYlJ5enE1bzVKMFg4TGNoUU56QTErSW8xOUVqSnFydjNhY0E5a1hhK3Q0
VHBrNTNDQVBRSGFYbDVlakEKbzBBUFJERGwwQTQwQldjRXRHOVJia2IxZXk1RHB3SUZqcUQ2N0Ex
Y3JsamVVZXBDWDZBNTRocmE2U1JZClNjeVpqVnF0TUh0RmhLak9GRVFCT2dWN3hRa1N0QU1ac01v
MEtOUk5CNlJtQ1FDamJnV0UveDNGQllCMApkRlZubTlHcTl4MWg1cW96bnVDOHBYN2dvMmZGQVJR
czRRZXhBcGZSNytjaWxMdERibEhTc1BrVnVyT0cKanp5OWN0VU9tb1VBZjNIVEM1UTJpUTA4QkxX
UE13SGRoKzk5YVpzRTdrcDVNUFB4SUI3YW9KMlJ6ajdPCk13UmZJZkJwRmdrckJnRUVBZHBIRHdF
QkIwQkhWcFdGZ3JUbjlqM2Y4SVVWMDgvRG0wcy91Vi8xcWhyUQppOXo1MndKUzBzTEJkZ1FZQVFv
QUNRVUNYeUg0TmdJYkRBQWhDUkFRbytndC9GdTdFUlloQklScitudmMKZjRMUHYzUGZPUkNqNkMz
OFc3c1JXUzBQL0E3aFJFTE1WL2RSYnUvOUIwU2ZBOERUQ0hWQ3A2bE1qQ3lnClB6WjlZaExXT2xH
Q3RZN0J4akZHMFpwS0Nsc1RSU2ppdGNTbGZzTzZFdGtObWVOUGNyNVduZHdDSFJxdQovYVNWWFFr
QUJxODFtYWZKTERBT21tWmdHSWNnQnYvaE1YRFpKYjFFS3RLekszMEFqMFdHalpkb1dKSDMKN29J
ellObWJmVDdFMUpCcFNYUno0Mnh5SjBiOE1zMXZGN00zelcrL0Y3bktwM0JYdGZtTVIxeHZObDlQ
CjZuc3pNRzRacVFydzBNTlV5TkRMY1JLQ0NXRjJmNFVtbWQ0M2FYTVgwSnM4NFQwSjB2RGREZGht
cFNQYQo1bFhtUXdZdkVldmV6WWx2Z0lxZTNyRDlYM01kV2JCSnozQ2Q5MWJDSHJldG42ZzZTbXZr
elRBMTNockcKRWRoYk5heTFraCtjZGoxSGYxQjU5eUtXa0tWRDNnNmp6YS92bERmdGhQUlJxd0NZ
QW5LZnQ1TWpHUjlqCnpnN0FDQmhsTkpScXRsZTQxS0p3SnkwRWpjZS85cklBZWszTHRnR3E1Y3NM
N2VSR3JsQis3VFR3OXZYUwowaFJaSUIyOUZ0Z3FVQ3FCNVQyNlRhRC9hM0JvWTkzWW1sajNEcHlR
TDM1ZHZZR0phR3NjdU0yVC9vSVoKWUh3M09PWkVQUXVObmdaZmpYRDF1ZmdZOERHc1JtaVoxYkFC
cnVkM05UME52bU9GczRtTmJpU2w4Z2hZCnFGMXR4U1dxR0g0SkhEK3F1a3EvVzJ3a3dZOVF2OTFU
d29LbHZwQVFmS2xJaSt1dW1xUFF4NUlhN2hyRQpVRi9NN2wxcTBtdWlnY04vRmlWc255V2NXVDUx
OWhNZ0RISGFUd0VYbU1qc2s3TGMKPVlNb1IKLS0tLS1FTkQgUEdQIFBVQkxJQyBLRVkgQkxPQ0st
LS0tLQo=
-----------------------8098d1b3d1169ffd7252a904dcc4156e--

--------56046b91e84a161a5119a1061b835c4be1c37f64d5038df53fc3f10765d282bc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKACcFgmZHz4wJkH386pemU5OOFiEE484Oy7fXGkv3k1joffzql6ZT
k44AAHnWAP9P0B5ocxGWeGV79fEsMAtIwultVeD0gGoAVF4MloYaeAD7BFjV
Bni8WqeSF0FBRvJUD+yWqYQTXfwoUnYJNYHkBQs=
=T/EM
-----END PGP SIGNATURE-----


--------56046b91e84a161a5119a1061b835c4be1c37f64d5038df53fc3f10765d282bc--


