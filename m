Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F09213BB8A
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 09:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbgAOIzj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 03:55:39 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42724 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgAOIzj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 03:55:39 -0500
Received: by mail-lj1-f194.google.com with SMTP id y4so17612134ljj.9
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 00:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=t5m3OamKZRHEgjM8QxJfJSEwe0n7/ih3eD4sd0D5ZAw=;
        b=WhHEhJ+b3G/qfyDQTnXMWLw8eUuqXHM1SWQ4S3pSWW0NH9InticeCDtxjdapafEqO5
         ylNHM+1FO9RseZOWBdwVUJvh+QuWF8/7yZlVby1gGbBw/idqhScoeEtfrtqLlTQeZeeq
         AUG98VpRkk4X64AUa+MIIN2+0KL0E8825lLxIGT1sBJQ5UB8W9DPTe3xUhjrvetyH0MY
         y3RY6Cb4+8bqlNnmqh5rjdinLnSVKrE88qQt7n/7NP0Fr7BxQ1cjTeTsoSYvcJp1RWAP
         YITnrfURScU9Pzt9qdThQBd1nqEWn85jLzkq0/lTPZZJaUV4QmsMd1AIiW04IldlNm9a
         8rvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=t5m3OamKZRHEgjM8QxJfJSEwe0n7/ih3eD4sd0D5ZAw=;
        b=hBaOQCMC0JTLRiMu9BPmFw2nlCWqZ3mFceZEtqwfrcUBko6/bMlCdfeUq+6w32Rl7i
         y60PFrlBNsQi5D76eGMzBPQvt4vMI/4OEYTM6pgawdGdoaeCoM+pM/v+qg2Vk78BSwxG
         JnvOLh3V1bLD0wyI4Tt33FoMjcuY0tmSB65pa07u6EMKyd8fxrMAUEEPJdgyYPxz9Xqc
         qlyvjyrrRWQ3EF/u/v2cIf0CrAVPTlchrZphBhC7nnLA8TpG0sQzZwQwmDZhO3s4/MlC
         Og/vfZDvZOMZa0FcBywiizSXAZiH445BcydCIcU25PsEk+HV5cnTKoQRKcBovg1Mvhc8
         iNdw==
X-Gm-Message-State: APjAAAXiMnLkaRmnrwOfMi3uecj3ZlqUOAplOHAX2HUmMZ5KREKtp8xa
        yErxcRcxY9pRvLvK9uo7HGEfCvmAM6sCZg==
X-Google-Smtp-Source: APXvYqzjkBW+WRJiujabNqzDLqoKnp7uFkdtxotIHg/6/pq46pX+rPd3ZI5JAHWu0weA/x1pNYtacw==
X-Received: by 2002:a2e:571d:: with SMTP id l29mr1113408ljb.193.1579078536217;
        Wed, 15 Jan 2020 00:55:36 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id n11sm8715252ljg.15.2020.01.15.00.55.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 00:55:35 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Jonathan Thibault <jonathan@navigue.com>, linux-usb@vger.kernel.org
Subject: Re: USB_DWC3_OF_SIMPLE
In-Reply-To: <f07f375c-9096-c94b-f457-42d4e83093c3@navigue.com>
References: <c3a1c48c-1ac7-e5c2-e09a-3b55100735ab@navigue.com> <871rs9t336.fsf@kernel.org> <f07f375c-9096-c94b-f457-42d4e83093c3@navigue.com>
Date:   Wed, 15 Jan 2020 10:56:37 +0200
Message-ID: <87k15t6qt6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

Jonathan Thibault <jonathan@navigue.com> writes:
>>> I am currently trying to port OpenWRT to Ubiquiti's EdgeRouter 4 which
>>> is a Cavium Octeon 7130.=C2=A0 While investigating to support XHCI (the
>>> device has a single USB3 port), I ran into the dwc3 driver which
>>> apparently supports that very chipset via the dwc3-of-simple glue.
>>>
>>> Looking at Ubiquiti's own firmware, it seems they are using a modified
>>> version of the standard xhci-platform driver.
>>>
>>> So now I am faced with two different approaches:
>>>
>>> 1- Attempt to replicate Ubiquiti's modifications to xhci-plat.
>>>
>>> 2- Switch to dwc3-of-simple.
>>>
>>> With option 1, so far, I can get xhci to load by merely adding a
>>> '.compatible =3D' member to usb_xhci_of_match[], but the driver complai=
ns
>>> about LPM algorithms and disables LPM (which may be fine, I don't know
>>> if it is even supported on this device).
>>>
>>> Option 2 (where you might hopefully help), potentially involves more
>>> modification to the OpenWRT since their Octeon kernel config does not
>>> appear to enable CONFIG_COMMON_CLK, which the driver depends on.=C2=A0 =
And I
>>> do not know if I should also disable standard ohci and ehci drivers once
>>> I manage to enable the USB_DWC3_OF_SIMPLE.
>>>
>>> I'm looking for recommendations on the best approach.=C2=A0 Keep in min=
d that
>>> while I can cobble together some ugly but functional hacks, I am not an
>>> experienced kernel dev.
>> Just switch to dwc3-of-simple, it already supports the SoC you're
>> dealing with. Try removing the dependency on CONFIG_COMMON_CLK. I think
>> we already get empty stubs when common clk is disabled.
>>
>> If that works for you, that's an easy patch.
>>
>
> Sadly, while it does build without the COMMON_CLK dependency, probing fai=
ls:
>
> [=C2=A0=C2=A0=C2=A0 4.881646] dwc3 1680000000000.xhci: Configuration mism=
atch. dr_mode=20
> forced to host
> [=C2=A0=C2=A0=C2=A0 4.889574] dwc3 1690000000000.xhci: Configuration mism=
atch. dr_mode=20
> forced to host
> [=C2=A0=C2=A0=C2=A0 4.897546] dwc3-of-simple: probe of 1180068000000.uctl=
 failed with=20
> error -12
> [=C2=A0=C2=A0=C2=A0 4.904715] dwc3-of-simple: probe of 1180069000000.uctl=
 failed with=20
> error -12
>
> The return value suggests that it's from the if(!simple->clks) check in=20
> dwc3_of_simple_clk_init().

Add a check for your platform and ignore clocks altogether.

if (of_platform_is_compatible(....)) {
	ignore_clocks =3D true;

> The configuration mismatch warning is a bit of a mystery to me as well=20
> since the only mode available in kernel config is USB_DWC3_HOST and what=
=20
> I selected.=C2=A0 Would this be because the controller itself is reportin=
g=20
> another configuration?

What do you have in your Device Tree?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4e08UACgkQzL64meEa
mQY+9A/+Mhu0HN0FYdyq6LJv1oce8yanEEzEYXI5Oz8EvKc6iJlyXg/2sa98JBE4
kZ6pxwGCC5ONeS2P1m309SX3dyrCTIftTkAmIL/zQFxlRHcRoATMfEvr5Ykh3qCT
+MGsiuJQbNZtsHeASADvSV7wpdWYNaGbQkfBpK8284xYWANp60J+zHP6TOboojfe
EXU8r5gDAU9jbIVIz07rlRjdkPHpdDrgs5AO8KFcxn/MwlQAY7l1FRMuAIZrh/7N
ejgnXbQtW6UiFerjgItS2nsqYrPc2S75NePGKVaczLGyTXzSN/9ag7VlNMVJRbs+
Z7IzMh4sDhnnso8NpqohVvKddHCYMx6k4+LdODI4qpbIWb0PL2r8zLesMQ7Iyr39
v64+KBTZcp7JHGecSQ6Mxo/Clceoj7CAhBRBfLQf8X8W/Hqn611O+ZBmcsrUyn3F
54/oSFyQJ0HzYVtT3y/wn2zqp/fd/+iz6cmXqEjpxJ+hJy03DkmjPKPCRI80Y/uJ
aorayNc7uW7wSu63++pqnuiQg8vOMLIrsaK+85b7jFRsPdda8IZkSZJqQR/Eb8Pf
Dcxq6nQfvY1Jqv0J2DzCDZ+gz76luVDulaVNd7vBAStEzwdHHHFCnf9A7JzYltxj
9j4Ix1rxt/2B+i2xPgGWEpRpZDM3SURql5hBD9OCUMNABuDpP4s=
=lnjO
-----END PGP SIGNATURE-----
--=-=-=--
