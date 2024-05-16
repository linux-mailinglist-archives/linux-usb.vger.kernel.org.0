Return-Path: <linux-usb+bounces-10293-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A44B8C7180
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2024 07:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61EC528114B
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2024 05:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067631D559;
	Thu, 16 May 2024 05:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="KF/sG2Vh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67629208A8
	for <linux-usb@vger.kernel.org>; Thu, 16 May 2024 05:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715838977; cv=none; b=VQVnEGX9Uk8A4cIMPDEHxLNLlmXE4ukXu0RIV8zl7t6NiIgQJFboWDF+DoKGOvTUvggeANekrS8oQMxuoqH2aAhjxyiHYmPoRn90XFXL1ESWccxRLrthdN769QGs01Sb89sqiRP9/k3+0YwIQbxFuMTrrVZbjzR6XNnaSHBT/nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715838977; c=relaxed/simple;
	bh=XK//6BQDTDMsgZzpyHJu95spn62renwRu9cFwhH4QkA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ohEC5QzaReaHm6Eagkdo7zx9yKjgWFqZcvQjka9WnIGAG80kgU8EYdvkfD9yabWJhqhf98hbdrj4FalXcsim0dx5tqvSmQvXWfDCuRyAAdXYURGyyidikw8Em5KbEU9ey0te5/zKxV+7PKFkIFuj5bT3PA9E20VIC9/BkZnB/3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=KF/sG2Vh; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1715838967; x=1716098167;
	bh=XK//6BQDTDMsgZzpyHJu95spn62renwRu9cFwhH4QkA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KF/sG2Vh6oxCeJZ3HUs0gUflk7VDQ7R/b5+1H3p90zOoM9gSMvs/B5yV7isQ7VKzH
	 Q8ZxzOFyzRpxFLksAOrFzsq0Sje+u3M2m5t33QhpPmWekDpEdlPGmUl8N5ZxpD3oEM
	 EOo12TdedkNj8E8GBFg1vx1ZoMUyqa4i0dlvSyt4HqxcmRkdKlYMC5vsJjV4xEZFhW
	 hokd9qLVfxAxcoxHT0v0QsGbBy6X5ejYvRCWlPhgFPLY1DtYGTiasSm6Iarc5TZrPw
	 JKuuAvaqZjC3YyaehhaYpumIRezAg0KaYhU/Qq9Vl9ezbjdPV95J1MNjA5JH8R93Xh
	 s1TZWfx6ZNYgQ==
Date: Thu, 16 May 2024 05:56:03 +0000
To: Lars Melin <larsm17@gmail.com>
From: Ethin Probst <ethindp@pm.me>
Cc: Alan Stern <stern@rowland.harvard.edu>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Assistance getting the Universal Audio Apollo Solo USB to work with Linux
Message-ID: <5jZCAcuLt5YeqkzP4xk28ICJ2WQUxY1eht4CjJNdnGymv3q6AIk3WugtglGVjqvu6BPVO7zHNx7LJeMnS71JUcoNpVZAMmz4o7G4vVyu0GU=@pm.me>
In-Reply-To: <8d415ea6-fe5a-4ec0-8e95-45c03968e666@gmail.com>
References: <DJiA8anOC3V1gHoj0H-8pmsXujLNu7IlZvNmvUEoDfnjC5VIzZ3YsoTgnUD-zVTsnhgln5BzEsy1n4YkoqkEd_pvTF9oZaukzUoyL-pDfRs=@pm.me> <ab4d0394-0d71-45a7-a79b-02e3c90f8ac8@rowland.harvard.edu> <N-wnVREkI4qROqLV1rCTIoLRiRzMGvywHt9QIdRD-e5AHby9wfaXcTn2V-Gd_UnmW-JomnWn6xGNhDhIeHIG3VHfHRFmnmPdZEPL8Qi5Gf4=@pm.me> <8d415ea6-fe5a-4ec0-8e95-45c03968e666@gmail.com>
Feedback-ID: 24240837:user:proton
X-Pm-Message-ID: 16abbbc3caab9b85988cd5f948de276cb46272e9
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------82da9dad08dcf6786fc89ad3b9bc4e219f096ad41d310cdf62f466951a1dc248"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------82da9dad08dcf6786fc89ad3b9bc4e219f096ad41d310cdf62f466951a1dc248
Content-Type: multipart/mixed;boundary=---------------------545c1dca7c732f505c591716b223963e

-----------------------545c1dca7c732f505c591716b223963e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

On Thursday, May 16th, 2024 at 00:19, Lars Melin <larsm17@gmail.com> wrote=
:

> On 2024-05-16 05:12, Ethin Probst wrote:
> =


> > On Sunday, May 12th, 2024 at 09:13, Alan Stern stern@rowland.harvard.e=
du wrote:
> > =


> > > ...
> > =


> > > Most likely, Windows sends some firmware to the device (which it nee=
ds
> > > in order to run properly) and then restarts the device.
> > =


> > I don't believe this is happening after trying to dig into the
> > captures a bit more. The firmware blobs that are in the archive are
> > over 100000 bytes, and though there are some significantly large
> > transfers, there isn't a single transfer that is the size of the
> > firmware blob. I can't tell for certain though; VirtualBox truncated
> > those large frames, so I'm uncertain what data is in them.
> =


> =


> The .inf files in your drivers directory clearly tells the difference
> between the two USB Id's.
> The description of 2b5a:000c is "UAD2 Arrow Firmware Loader" while the
> description for 2b5a:000d is "Universal Audio Apollo Solo USB" so there
> is no doubt what the initial pid 000c is intended for.

Ah, I didn't look too deeply into those, I should've! :)

> There is nothing in your packet captures indicating a firmware transfer
> but that does not necessarily have to happen, there might just be a
> check of what firmware version is currently loaded in your audio
> hardware and if their isn't a more recent one in the firmware directory
> then everything is ok.

The trick then is to figure out what makes it make the transition. I
don't know if it's vendor-specific or not and I'm uncertain how to
"replay" the packets, particularly given that they're truncated.

> What puzzles me is your ua-init-windows.pcap, it starts with the device
> already having the pid 000d (packet #2). You said that the capture
> starts when the device is plugged in but I think you have missed
> something, it should have started as pid 000c and later transitioned to
> pid 000d.
> =


> I can also not find such a transition in your other two captures, all
> descriptor readouts that includes USB Id are 2b5a:000c.

This is what puzzles me as well. If I'm missing something it's at a
level that USB Pcap can't capture. When I begin the capture, plug in
the device and power it on, the second packet is always the right
descriptor (pid 000d). There is no indicator in the capture that
commands are sent before that pid is received. As for the other
problem, yeah, that confused me too; I would've thought that another
get descriptor request would've been sent, but apparently not, because
when I remove the device from the VM and reattach it to the host, the
pid is correct.

If you want I can try another capture, though I'm not sure how useful
that would be. I can also try another VM-based USB capture as well. If
I'm the only person on this list with this device I don't mind doing
all the debugging; the device isn't super expensive but it's also not
really cheap, either. It also needs some extra setup to get it
working, but perhaps that setup process could give us an idea as to
more things we're missing.

> =


> rgds
> Lars
> =


-----------------------545c1dca7c732f505c591716b223963e
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
-----------------------545c1dca7c732f505c591716b223963e--

--------82da9dad08dcf6786fc89ad3b9bc4e219f096ad41d310cdf62f466951a1dc248
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKACcFgmZFn+YJkH386pemU5OOFiEE484Oy7fXGkv3k1joffzql6ZT
k44AAPfrAQCj7uoNMzwFnc2UpFWXugTeGhWhNP3o9RW3cn0j/b1kOAD/fd6D
yEoDqSt3hAeOfWUWOuAoUo/QV7zEDp11SLW7mQE=
=3M63
-----END PGP SIGNATURE-----


--------82da9dad08dcf6786fc89ad3b9bc4e219f096ad41d310cdf62f466951a1dc248--


