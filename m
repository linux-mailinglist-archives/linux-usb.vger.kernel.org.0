Return-Path: <linux-usb+bounces-22583-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFABAA7BBBB
	for <lists+linux-usb@lfdr.de>; Fri,  4 Apr 2025 13:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B5EC3A8F7C
	for <lists+linux-usb@lfdr.de>; Fri,  4 Apr 2025 11:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F9E14EC5B;
	Fri,  4 Apr 2025 11:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxA0JLvu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A48191F98
	for <linux-usb@vger.kernel.org>; Fri,  4 Apr 2025 11:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767256; cv=none; b=BC+tKLT5rCEhUaO0Ynvhg7RQ29mFG8mM6QLYLOYb6d0xa2fQP/VhEIL96OylmKcrbij4nogUEL3g38TRjzevF0Q7eVgOm4YXzAHYcWARhFQMlaxGJVHpuI//mml5nBO/vas85S9jAcT7bK+/7302mAgtuZvmIEKOCSdP4dZDsvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767256; c=relaxed/simple;
	bh=t55CcByAZBUvEexj5aZF2GS61lgtg4GFdySrHT6Th2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FfOKIs0qidNoO5eA3jH/dTYEcZXHgy+gGbnKvm+XpSJVDA2BendeB39H9xgGWdkMF2T06POh00OZ3M50bSHCKE+isvAayrGVrwwV6WZRmSsqLNTKkz0m9WjsL/ZfPvoPKI8owK1y8Cu83m6+vlhUv0oZPHRY/1TD97e2Z/rnOu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxA0JLvu; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-601b6146b9cso958362eaf.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Apr 2025 04:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743767254; x=1744372054; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t55CcByAZBUvEexj5aZF2GS61lgtg4GFdySrHT6Th2g=;
        b=HxA0JLvuNImn19gNT0oBbzcmJB9h9EkIRH5RrSvTzR1a0eMfoZHZD91Et1sWXJGje5
         9g9tjnClHA5OfedGmwo22uNQvflI/jQZYY0zmO9P7Ey/CU+ncN/jXFnRBzaYLeSyFHG3
         u5/qvFsA2PuM3B2ZLwt6B2a+7Vn672fiI0i0DgtFHjEM8x28OoXkGc7IHvpj6PdUS+Mr
         baghLUj8Lxr81lErv/XY9bFBcw4voDR5jbAfoWHXayhegompD1k/f0P+fNTwqOo7L8ap
         nckzpIfAyWHlq7XE+a87r16ONzTjJRpe6SHvWAm28mTJk/ZfqtCFq/oBPzF2c5uW8Ly/
         o9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767254; x=1744372054;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t55CcByAZBUvEexj5aZF2GS61lgtg4GFdySrHT6Th2g=;
        b=GxrvuwlwjYCiEiAq0Nrozg9yV0DIvJdGr8Ir4Xd9r+koutBpJqWbSDRvlHszMV5CXx
         bvoEzpR0dN796bGfj+UsH/ldLYthmeLzQpE43T64EN8JsDcNpXpRoQwzyYyLPV0UJ22V
         mPPXKjAgg3uuiiuuUYTlyU5tEEE9uoYsc6BA4ZM5h3zmZeWs/4TENRmMlGvhKbqGtYN+
         UcAd5ZJrccvEukEon6UzBOkBBmC943rBpa/9QyOBZ2MbQ3qG4DsjM4J/i/wEpa5cJukQ
         39PC7GR6FtauVH4CUjI8GEVfmYCYuKOO09a0Y2XbcA5X8qkolDA5GOagnXmBR4ye8I4l
         GsPA==
X-Gm-Message-State: AOJu0YwBGc6Fo1E0NX5ZjmxvsU1oZK7Rr4dGryBMM8r/K8OtmDadDzkC
	6Irw7WiLF7xSK+V/YDWRcbI/wNB8Dxh/CobibZjd2mbPxzrl+UMg/I5HsLPv
X-Gm-Gg: ASbGncsqAceKLBLzAZAm+Df+pRKpi0eZds8VXOZFtGtFZUKp5Dux6vlikWl+HyBO2Kd
	qGE2zdah6JkR5znQoqf+sopmkw3R8zlYDop7uuWCJOTp/OhS27iKuOYuiLmqn7ECKE7mnFMeSkY
	EPlIOOVw5ZKR7pejAVAOUdewF01ObUCIAbKB/wmo3W0FF6ttL9JB7saEdLUuHacnPczQUME5ydb
	BomJmCDYobRaqQRDm0SobQFoiANl3KqN785kf/GhgRett0PN2/HBCIGr0xKZ4PirAGGgUEoo6nJ
	JCEfomZh3nRQcJuEu+QFvdCZJyoiPOqTwes8mh9Svl5SmWqq2MhL2Muhp1m5/VGujxzAUHt7gLK
	7BtVHRJwm
X-Google-Smtp-Source: AGHT+IGI0HayLUGWO6FTxz3if3Jbw/vEkllz4OnLYRPwYYZ2s4Fho9t0kfHlw60Pre4ZuGqAulR2ng==
X-Received: by 2002:a05:6820:54d:b0:603:ffc3:60e3 with SMTP id 006d021491bc7-604155c2e7emr1173117eaf.1.1743767254135;
        Fri, 04 Apr 2025 04:47:34 -0700 (PDT)
Received: from [192.168.2.196] (syn-067-010-195-058.res.spectrum.com. [67.10.195.58])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6040c58f694sm658876eaf.30.2025.04.04.04.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 04:47:33 -0700 (PDT)
Message-ID: <3b283147-cd32-410e-a163-9e603fd40bc1@gmail.com>
Date: Fri, 4 Apr 2025 06:47:31 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Wake on connect / wake on disconnect
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
 "Gong, Richard" <Richard.Gong@amd.com>
References: <ce2048af-1044-4424-bca2-3799baefb9c2@amd.com>
 <20250404060203.GM3152277@black.fi.intel.com>
Content-Language: en-US
From: Mario Limonciello <superm1@gmail.com>
Autocrypt: addr=superm1@gmail.com; keydata=
 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
In-Reply-To: <20250404060203.GM3152277@black.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------l8yoA1Y0OsHQVSuRxnDlsbkt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------l8yoA1Y0OsHQVSuRxnDlsbkt
Content-Type: multipart/mixed; boundary="------------vzcMdUUiEhj2ngqjXZPuMSZL";
 protected-headers="v1"
From: Mario Limonciello <superm1@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
 "Gong, Richard" <Richard.Gong@amd.com>
Message-ID: <3b283147-cd32-410e-a163-9e603fd40bc1@gmail.com>
Subject: Re: Wake on connect / wake on disconnect
References: <ce2048af-1044-4424-bca2-3799baefb9c2@amd.com>
 <20250404060203.GM3152277@black.fi.intel.com>
In-Reply-To: <20250404060203.GM3152277@black.fi.intel.com>
Autocrypt-Gossip: addr=mario.limonciello@amd.com; keydata=
 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

--------------vzcMdUUiEhj2ngqjXZPuMSZL
Content-Type: multipart/mixed; boundary="------------flAsQGdaxdxOGgCVOqFKth5U"

--------------flAsQGdaxdxOGgCVOqFKth5U
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC80LzI1IDAxOjAyLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6DQo+IEhpIE1hcmlvLA0K
PiANCj4gT24gVGh1LCBBcHIgMDMsIDIwMjUgYXQgMDE6MTI6MDdQTSAtMDUwMCwgTWFyaW8g
TGltb25jaWVsbG8gd3JvdGU6DQo+PiBNaWthLA0KPj4NCj4+IFJlY2VudGx5IHRoZXJlIGFy
ZSBzb21lIGNvbnZlcnNhdGlvbnMgYWJvdXQgd2FrZS11cCBmcm9tIGNvbm5lY3QvZGlzY29u
bmVjdA0KPj4gaGFwcGVuaW5nIGFuZCBJIHdhbnRlZCB0byBnZXQgc29tZSBiYWNrZ3JvdW5k
IGZyb20geW91IGFib3V0IHRoZSBjdXJyZW50DQo+PiBwb2xpY3kgc2V0IGluIHRiX3N3aXRj
aF9zdXNwZW5kKCkuDQo+Pg0KPj4gV2FrZSBvbiBjb25uZWN0IGFuZCBkaXNjb25uZWN0IGFy
ZSBvbmx5IHVzZWQgZm9yIHJ1bnRpbWUsIG5vdCBmb3Igc3lzdGVtDQo+PiBzdXNwZW5kLiAg
V291bGQgeW91IGJlIG9wZW4gdG8gYWRkaW5nIHdha2Ugb24gY29ubmVjdCBhcyB3ZWxsIGZv
ciBzeXN0ZW0NCj4+IHN1c3BlbmQ/ICBUaGlzIHNob3VsZCBoZWxwIGVuYWJsZSB1c2UgY2Fz
ZXMgbGlrZSBwbHVnZ2luZyBpbiBhIGNsb3NlZCBsYXB0b3ANCj4+IHRvIGEgZG9jayAod2hp
Y2ggd29ya3Mgb24gV2luZG93cykuDQo+IA0KPiBEb24ndCB3ZSBhbHJlYWR5IGhhdmUgYSBz
aW1pbGFyIGZvciBhbGwgdXNiNF9wb3J0WCBkZXZpY2VzPyBUaGF0IGRvZXMgbm90DQo+IHdv
cmsgZm9yIHlvdT8NCj4gDQoNCkkgdGhpbmsgdGhhdCB3aWxsIGZ1bmN0aW9uYWxseSB3b3Jr
IC0gYnV0IEknbGwgZG91YmxlIGNoZWNrLg0KDQpIb3dldmVyIHVzYl9wb3J0WCBwb3dlci93
YWtldXAgZGVmYXVsdHMgYXJlICdkaXNhYmxlZCcgc28gdGhpcyB3b3VsZCANCm5lZWQgYSB1
ZGV2IHJ1bGUuICBDb3VsZCB3ZSBzZXQgdGhlIGtlcm5lbCBkZWZhdWx0IGZvciB0aG9zZSB0
byANCidlbmFibGVkJyBpbnN0ZWFkPw0K
--------------flAsQGdaxdxOGgCVOqFKth5U
Content-Type: application/pgp-keys; name="OpenPGP_0x2D192CA624770276.asc"
Content-Disposition: attachment; filename="OpenPGP_0x2D192CA624770276.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFfXIYYBEADlBpwn46Os2kqQK7xm12wq3dTQBBjV0/MNTYzuhcKMXXTSco0S
GJTaeNCd3YVNxkzcJpNvpRGfjpVSRJkgXB0kdUEf7M+XET9p9jJwVXJKB+IIRhcK
xnqujLdWIr6ZDPb4HkTp186cfSfqUZcwpCHQnmYLrdwPdEoTH6KOqubgjK/MaK7S
tmSG8zd8/1tJukzz/aF82OGDYOdQXUyoSpWEr525h6BIYJKwQkaWiVJ6/kL0HA1I
tTiiAh3rOoVRnC5u3vSg9acakesKeH+Zjw6zg55z/9JXNWdBdl7nkBl9QLz067bJ
3Q8H5/CYHxqMQhMNgnlTE/sdR1U/S6Om1Oyv+rkVznjZJrvEKzuUIgtvO7YJc65l
/SobIsZ/YW0+sZ/io86P/moADYvO6XspTxn5aYuGAcgCtQBjJR5d6GXbeeiJlBAm
CExyi3G92CCtgDHnFH+qnf2LsorzMbG0GmpjKOWxFX8uo4aRQ8mAh01OMBaSoeXo
Zgnoq70McKUon3OqorXcJwX01R/R1MBwevfEVssJFByLNR2GxjZWE52pGf0f5hqy
IA+nBf7lTJzFQhll8ncq4IsuuDT/wXnKWsXk4uYCs+SLT2Q8dTBUqDTsOnWdHL1P
xPiZTx5i4IoQCLQnV4WztrAZrUAR+IpkKjEBzXRBH7GkFV9wqSFqCqeD8QARAQAB
zSVNYXJpbyBMaW1vbmNpZWxsbyA8c3VwZXJtMUBnbWFpbC5jb20+wsGRBBMBCgA7
AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEECwtuSU6dXvs5GA2aLRkspiR3
AnYFAmZjPBoCGQEACgkQLRkspiR3AnZHbBAAqZt+efxiBsA12x6khw87cLLNwRRa
DV9Iw52jCbAcjyXVtRyJwrHuUqHzs4bkHfoKoFOBpwGqmTkOGVslu0KDHYCX0h9V
9LwRZFTSxom9b6U9VUVsIKldJT23lQAvogCIilRGgrftIQDXQ0HCHN8S7HlrsRWw
EdlrGxM9qMLzKFWLWi+COjPqtM+X8UmQIvhd60XjcmZS8OSkaLlAtKnp2diTqpmG
BsjcCAt9jeYLj4ejzfNiXn7l7xfUbNRPiBSm6YV8eT88+xNUXpH4DdkFOvajjgCm
26/PcgY6Qy6kDhRdfgqODloXVpsYvU+DRo8HH+jfaViMvJQSDubZyqlLUnTqODbi
JZ/W+GkFRdncw8xdZj3zUjI2L2Ksv+BmXY/BwKAHfBkPp21H8fN2/SXu6DO8MUVD
00s/i3HLuAkhGvECCXVYQc5SFJpYv4fIbLvRN5013ZaKP1V4Edkysrp0PJ/W8LyH
3rg6nNfoIxG9aQRWh+Vtw5uUJzEwvOYzYmWcYDheq/4Ceq+dW4nqTKtbBAi38ATM
jdjWIxK5ZiJu6U6AWZC2yYqBqJWTbFaNZXf4zLZ/VhnLvF64SdFV1pL6tLONSDNq
/2GW9kIvbJqXECQj3Y4wP/bDVyshMbu9MSGbBZSuA2X9MdTJXJlWHks8g98VORHs
wUzPMzI9msu+sgXCwY4EEwEKADgWIQQLC25JTp1e+zkYDZotGSymJHcCdgUCYGtu
ygIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRAtGSymJHcCdhsaD/4wj/9T
cVS1J5OfxvMWJ6dc7fk50sLsex4Ae5VVhFI44gf31BgMjmqJ/YiAmeXYqnu6mbzh
fdDkjH96a6YT7C3Aa6hyeLZXYKtQnzzd10OWSPLOgTIvJS4utwTldLziRX34bb83
ysSht3fEH9N5awhduM8agDRYqfopWrqWTKiEYI3N1hoBHkZJazcAP5P2Ir4BpWBR
qTPbu4AZLHW4u4/zfz39L9lIEJkNyMc4XMLw4nDhK5KfSY0f7d0N+RYiOqkz6Tbn
JW9cZxdgiKoglI5i76+t1LTZR/xwHBA0fehn0g2/9rNxn3F441f/j1uQwksIMpqO
GufIZertxJv+sYI5Q8YYU5UWIBK+zVygnQs0Ud8i9J2rWxBlE3+9cxx51ekLJwCR
rdQUSbH2q6dgJ9MhTFaU+laMP85fV8J4OzsPYIs/WrAOnSoa1l2xHZH5w1H4KxF5
Vg+6P4j1edMLOlcnoU4665Gpd6iqJln/YXJFFkz4kKeFJ5vKS9D7VtF/RSaVvyAv
WeyoXRLgh/09Vsb3dOC5o/zFUcP0VTiK4n0BXT+IPbIym25B6bTDhV6zPzUxQWL4
OrI+F9WlZ6ZnRcAqnAvEO8QgcmBJyFioDymnGs10wwfVDaHsueooOZX3XZWgCASt
Cu4EK/YraMw5g1YmzfpSUTh4xB/syb5ljDM++s0uTWFyaW8gTGltb25jaWVsbG8g
PG1hcmlvLmxpbW9uY2llbGxvQGRlbGwuY29tPsLBdwQTAQgAIQUCV9chhgIbAwUL
CQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtGSymJHcCdlNbEACPQgpnqBPsGLyD
NwwoWu2UqMiJSDhCqdlRvxCedAMOVj5oYplm75xltPqXYVryAsGbE+aYBOyX3Ozj
KDn9qNLL3jeM4n+1Hra14aNiUe1Mjlk5pSUPGX85a5H7BRE9WahNK6cJm2JfsHtn
CEI3xyW86F9Njn+VUBlA7f1x1HZPNgxHKuq2XoeHqJrgNCZNhcNH/wyGpRaI9+FO
aXOuQjEbTjqeLC4w53zHo7Wj+/oZfRRebFxIUtk5QFQY2EvrQnWaJB7635WV0JVD
N5XMrnnRBNAOPWvG48dDCEbGc0KVnFWtn//St1md8rXtFRC0uV5KQR92JQ7YSJ4S
5cbO69tkt5ukco5fihvnqkYTdfix9aMn1KkKwMwDuYeyG0jT2ik43r6yb9Jq13Mf
sE2EHRuH9RWqBhHR3wIDCuqno9fAOtGgrTK9wdsZfy9KOtc6W1ZG6aOi1vm4jxx6
7UqEkpXhoLb74/mi7pnn8aXXgHK8NDKr0YuVcsSZUltHDpdOt0CuAb1cHYI4AKsg
rWOtxY4CIR9ybu23nAFAq11W62dDnoaHnk4wFvrULnZNv81hRVSUwGibL0ss0O0K
R2Z4KE6jT7Y4pKCfyw6fNlx2nAaA/GWfARmGrDXqq4TKAQXBnY7MdcdIoorgJD9h
KCfBuirftN3UG8rLm5GS/TE3DsperM0mTWFyaW8gTGltb25jaWVsbG8gPHN1cGVy
bTFAa2VybmVsLm9yZz7CwZEEEwEKADsWIQQLC25JTp1e+zkYDZotGSymJHcCdgUC
ZmOIiAIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRAtGSymJHcCdr5B
D/40LoizVoQJ/9O5wMfwTlqIRm4+So0sqzsUi4XMURZEdE7atsQ/e6/SQMavuzQj
fg8cQSr7aDUp3cTWerIFQ+zAY+w/WvCAtSuK/5iupZkBmLfX5acpN3kqcIHCnZWM
pvXu6pI8dQAVgRqK4RUVyN+s8XliIcpb8NVK0P+EfefsefJEaN5kaZkysL1Mh3ia
MIEIJBPBx/ffDD5GA1S9B/3WkLs5Nt2DQhM56jlZLMsGhJror3MWb9rpRBvyrV+S
729EHKdaNFwfXzMbHf2Whn4jeuevLUf0BQMJbzxV3OSC84DXHANcbFXJZhtv0h3W
pdcdzKk2MU09ynPyGDIsmSVRCKP+9HJhES4FLhepABLb+y1STqu2jZAsUY23aU6O
Wcb6nKVxNgMZgAppB8NtJESOXFIVufbOpTRr9i4wywa5147/j9I8GNqgbRTH9S6w
+0QQZtpm+sdYtRDt53DWYa+e3I4gpVfXK1/pAbYCe7LoJfdxacbG43STyPzU1qTi
C1G/UA421GT09jYu9p7PvvDf30x5jmQn8bGGfMTi3G1aooT8cZpUvyLbpwQzy69T
J+pjyilZUIvtpPPSDDJcd6OeY0XKJWQnIXKXSpDjQG1qbZpUI6bqC9ylYnvm0FpZ
vK51NcN0LlJxnvsz/FrEKSV38bothWdLK++kha637jocus0tTWFyaW8gTGltb25j
aWVsbG8gPG1hcmlvLmxpbW9uY2llbGxvQGFtZC5jb20+wsGRBBMBCgA7FiEECwtu
SU6dXvs5GA2aLRkspiR3AnYFAmZjiK8CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwEC
HgcCF4AACgkQLRkspiR3Ana9SRAAre7eAGMreCuiSXhyI2ijD9w9xieyy73bPYas
2PNF/k7tQQdlzPMxIJ9lZ4BdI8+DqylcX7UvRuvems0L6J5vCJRBFm7+VmLuX/uU
0iUdzobzeUlp5kyvZUql23NweEI6WLdgzLUT+hIIQE0A9EKsuIuvVCajA2WhBBTm
Ui6BErT7P1G1fIcEro+KnncbHlNPJLpaXKCcJAtl8IGfTy0lBlOlK1MCaR7ulTdN
9cfhm7Kd/Y21TZM8MFgHJY2bP96rlb+5sQ0x1B+mNrtTGBVMbpKC9P3Y+iQlPIpp
rwzogn1Iz8zw3xbJC6Cq2vGjj/yORpX+fOXJX+EdgVESoy8rXiLmmS5xeUqbSX1c
qbJHrH4Z1gVsXhgp81zsWOjeY0s3wP0bD7qpoCvkNEOtKgJ5LKdrL6IeN3oTpptR
3vOtpj8mx+UAXgWvIlTM20RESlwBVXlT/ASHrMgtFfnIOVq1ZmheWMIMRvCUiZCM
zKz/WRYK97R79EbMZEDP4kHy6VwKLkWpaOhOTquuKkCYZvmCqceR5ir7a0TzxTsk
rUK45/WkMCPWONpv7en3WSxR5JMv0sn4cubYQo4l3rdNwMD4qsfFrIdfXPIt4cm7
eGH/rotSXGFeEpUBqPKE2d8LVEW6PIzvMfyljVzlLOzPLXpR/ePMiUl4ypdYHn9b
zW9C2u3OwU0EV9chhgEQAL+mOenrfPyR6irpVJo97pkFPdDWKrqyID0cbVHEqIv2
2uYbwQruZp4bMWbOmKg2ztySapj63RNM09sAe0bHG3eRyaKNM5G5JRCB+wkyiUph
AGbvN87Pkbj9uoSdxo/tAwMuWtH8sSgbUzHDD7LC3nk/zP8Nd6ApnXfHHrsHjrTa
GDCnS3GwKuvCeR8LsSsUbvEAD9lo/+sRzTzZWtywk8EpiUODTZhEJb3V7lwv1bIy
I7RjJ2A8uCeUp/VwoeX8IjWwerUPccY+KGbjlkSvkyvK9uDFmYhj6yEi96RaXsL9
Zk9R6CpM1dILcvmbIKwJ4VxXHos5ewWu6lIvUPMkeE5bbOdS6HZdBP9GF/mv/p3b
wiolFfMmjwJ0+WzQ+aFD5iOUpWAdhFQAO3nJAuHi+V831s8SYwCbFfF/usctIau4
hbp67pX7HJQ02OPiS9tdnOjhM1v7cELAPrlYhZeS3xvZE74xad6gkBBVmlxplTWu
62DMKa4uFS8ogjqPkPILSmPGidH9IaUiirYEmtccwa/8bl8Fv1/bwjpLnUoTvMSy
1ALXA2OCITPwJaSbCCD5vAxTEUQA5iVW44ree2ZLOVr9Zb9hCZXXpDfAKqVSRkar
pFIdVUIKVfQe/FoMKAhQcvKhhsLqZW9X5+Ki0Y7rOx8Krsnwuvim6xPC42cTJeD/
ABEBAAHCwXYEGAEIAAkFAlfXIYYCGwwAIQkQLRkspiR3AnYWIQQLC25JTp1e+zkY
DZotGSymJHcCdq5JD/0dX7zNy15ypllaglQwzQ26y9HqS1PVAcnSaY+T+UJvW6rf
ORy234R3C3fwNySfnNPIu6JzaFhRKukZHMH00xnf+BmEM/I+b+vf/ylbC9P1jXpL
T07z24jcyDVqFf+kMXujLUW9OWmdOC4o3z2bNHK/CV8Xkyjy1ZTBb9fuDKv/XqCc
i82oaFtQX87bbW9s/DEUl/QM8yDkB6AKgldaVUyKZTkDdrzh7O6+tFDCyLqoOT2a
V4z9nSqRs2ICScq1EtqsVthQfELqAFu8a7lKerErqxs5mFhMY6C1Nto3G8mJ2z6O
aH3L8PiUmV4+kmmKgdpAmsJwgByyFeKYW/gq4L21cEQhYatUAL3H4HtYRork65mZ
fozhInDTFrd7fD2urr0wMqVooM4YuUSkRJAFzt8QgYiizU7DfJCHGzARQc7X6yhz
w9aZY/JAU0m+eruF1pEJic2A5GYbNo4WHsB6b8B1p8vVEMvX3XwsNt2vh2ITDGJh
meU/zEbjPTUPIK8dxOskFouBMNjN/Ja67/c9nfBTEr4a/8hzFcjxhfD0Vvvs8b8q
JjVxel7u3Ro2VKr+LOKcqnQdPsSGORvw/Drv9eNtVhSlkibKvlZERJ5LG6Y7vtMj
REqplPe2LceRhA/5bvevhGJ3UxsrU4i/gOecHUf1vaXSfrVdK50Nvx/aJvZtmQ=3D=3D
=3DacRP
-----END PGP PUBLIC KEY BLOCK-----

--------------flAsQGdaxdxOGgCVOqFKth5U--

--------------vzcMdUUiEhj2ngqjXZPuMSZL--

--------------l8yoA1Y0OsHQVSuRxnDlsbkt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEECwtuSU6dXvs5GA2aLRkspiR3AnYFAmfvxtMFAwAAAAAACgkQLRkspiR3AnYh
mBAA4JwfxuT8q9jNiyXsT0PNdrBcp4J/RKuYx3y50+Woba1YHFmBhGBeQeOXcO32QQgxffkb7COh
WCfc57jp5bfnnvMStJvAvaDSY4UDpJSYHZNWD+OqEj4Fi52k5zDSjGU69uqBng0j2Cv3auvgZPRL
PtZi2MRb03tJ8f6MmY+2AMDx/9wrZqrPmDZAN08EKj58LXf+jsIQ5TC9gJN8W2vHWS9uBssfJQqW
FBxJHWpmuvhYX8CbMTHgrIsYDatt5ikhnZVvI4Q8R7LqIVzeNYr3msA9loBbPZmwHIUrQa6xfbFH
AcgV824ICGC4uDeoQC66LzViADP/y6UYRnFgTY86gtjryxOaelKFBGRQVZo7TCK+dkQ1XzDgNK/b
G0QACiFJTF3Vg/C9mQiko7uxoWAB+QzNK9c7LwJUdH5E19qpiUPA8b80SAIxoO6G00xSht/oDvB1
AetmmdYaSVbA+oVgn/rd0ALYK9nensJqWh2S0KLeKEknNn7h26s7rqxrTdbpXCF6U1hJBohAn+KT
/elbofTViNtcpdvc9yn+1fUQULioYWnZ2cyjmR4lujEmcW3FvoQl6xg/WT6DPfetRntON7ac/1GK
ROXLU9LE1rSIxkM+Brhg0W6H9halbxDmEoqWrfPQY2dnxu6sMuje6lETRmkyB9Kk4TmVh/gYRhBJ
wAc=
=62I6
-----END PGP SIGNATURE-----

--------------l8yoA1Y0OsHQVSuRxnDlsbkt--

