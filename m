Return-Path: <linux-usb+bounces-10281-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D73C78C6E76
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2024 00:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88752283B75
	for <lists+linux-usb@lfdr.de>; Wed, 15 May 2024 22:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A070D15B574;
	Wed, 15 May 2024 22:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="EV1Q3aW+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228DC15B0E3
	for <linux-usb@vger.kernel.org>; Wed, 15 May 2024 22:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715811196; cv=none; b=ZX2A7dATN9K8T9wxuv9fYOF748ZzTuYljY2XHuZRZ0UF1j+57pTZO8OxLyv+ZtgToc3z7ydfeZyHIAm6ciKHj4Po8sAs0pZ0RrufT+sXYgfPZiDPSmtpeeWY2xyNhv9yUhF1J/YrrepFXMNxu/GIHnjoVPMhnEO2JUTRVSOwM7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715811196; c=relaxed/simple;
	bh=MR78N6V5nbqP4ftTUyMfemJ45vuP1Y9Zb289h91WKGU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aFdEWjiBToDFZc9flRu9DoF1dEtxStFzfmwuF3TzOJSvbI6VTa4aYkUwJBdGdiMXvpmRMZI//Z+hgVk5jjBVhFxGBb6srNf56gLD15TM2UpmfKRy5eA0MmUoKTiOMYOWUWH94vfWgjtCAeF66eLFQPoefVyj3vQI8xHNb3fXfOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=EV1Q3aW+; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1715811178; x=1716070378;
	bh=MR78N6V5nbqP4ftTUyMfemJ45vuP1Y9Zb289h91WKGU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=EV1Q3aW+CYtYPGTMkI1oEb4rC8u+KFnqOClHz0g+e2LIwvaG+/E+jUd18Vj1r8ltC
	 4T9Xg7aromqFPSbEyGaBHgxbATyF02Vsj5RBJSlsibQnqgXgNaB9oRA8Ll9VWTD3qi
	 pbRl8DdTTCJVYLdDb/PnnxrpUBa3r3qmNNbdATCQ3Xp83t9LkaoHuGMrmLPlpJ2Pw3
	 qs6U8gjdoWSEI1ebiq4dVWVRXxGhNXOStsdrmz7tQ8gjAuzGjlImI7cni23mx2Zxgv
	 9YPNs759Q15jW6n/dd1rmZQu+yMD6+OnZRnqNXmmHLdvaNPZJuE+7uUCfFw1fOVC2Z
	 GFk8X0u02lNjg==
Date: Wed, 15 May 2024 22:12:54 +0000
To: Alan Stern <stern@rowland.harvard.edu>
From: Ethin Probst <ethindp@pm.me>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Assistance getting the Universal Audio Apollo Solo USB to work with Linux
Message-ID: <N-wnVREkI4qROqLV1rCTIoLRiRzMGvywHt9QIdRD-e5AHby9wfaXcTn2V-Gd_UnmW-JomnWn6xGNhDhIeHIG3VHfHRFmnmPdZEPL8Qi5Gf4=@pm.me>
In-Reply-To: <ab4d0394-0d71-45a7-a79b-02e3c90f8ac8@rowland.harvard.edu>
References: <DJiA8anOC3V1gHoj0H-8pmsXujLNu7IlZvNmvUEoDfnjC5VIzZ3YsoTgnUD-zVTsnhgln5BzEsy1n4YkoqkEd_pvTF9oZaukzUoyL-pDfRs=@pm.me> <ab4d0394-0d71-45a7-a79b-02e3c90f8ac8@rowland.harvard.edu>
Feedback-ID: 24240837:user:proton
X-Pm-Message-ID: 86a0ba89a5f54cc0b63d4c8c28b224f4c7f645df
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------7c48e40e08a672f6049c7dfaa6f4ddee68115cfd574be250fde1c7a2b2ecd51a"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------7c48e40e08a672f6049c7dfaa6f4ddee68115cfd574be250fde1c7a2b2ecd51a
Content-Type: multipart/mixed;boundary=---------------------d11a3dfb27259b6854fdf0796597bf36

-----------------------d11a3dfb27259b6854fdf0796597bf36
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

On Sunday, May 12th, 2024 at 09:13, Alan Stern <stern@rowland.harvard.edu>=
 wrote:

> ...

> Most likely, Windows sends some firmware to the device (which it needs
> in order to run properly) and then restarts the device.

I don't believe this is happening after trying to dig into the
captures a bit more. The firmware blobs that are in the archive are
over 100000 bytes, and though there are some significantly large
transfers, there isn't a single transfer that is the size of the
firmware blob. I can't tell for certain though; VirtualBox truncated
those large frames, so I'm uncertain what data is in them.
-----------------------d11a3dfb27259b6854fdf0796597bf36
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
-----------------------d11a3dfb27259b6854fdf0796597bf36--

--------7c48e40e08a672f6049c7dfaa6f4ddee68115cfd574be250fde1c7a2b2ecd51a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKACcFgmZFM1YJkH386pemU5OOFiEE484Oy7fXGkv3k1joffzql6ZT
k44AADrIAP4jmZZ/h/v32vQ7g6O2uhZriAVfPV7gaua7YHPZlQVIRwD/bXa7
NspWfSVEVdPtTGqxLpo9L67ucyfoAxuewv6MKQU=
=0ZZA
-----END PGP SIGNATURE-----


--------7c48e40e08a672f6049c7dfaa6f4ddee68115cfd574be250fde1c7a2b2ecd51a--


