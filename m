Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EBE3135513
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 10:01:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729106AbgAIJBb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 04:01:31 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38366 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728919AbgAIJBb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jan 2020 04:01:31 -0500
Received: by mail-lf1-f66.google.com with SMTP id r14so4606761lfm.5
        for <linux-usb@vger.kernel.org>; Thu, 09 Jan 2020 01:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=ou1k8PiZPzhGhubPZdM0cztRAzO70l425JYoCytzVqM=;
        b=QF+f7oBZzWIEgl3t4ck7XLALpGE4TBIr7lqllPQrOAR9qHwp0HauDip8wjfG6EiJfp
         iQtm/0vqsiQ/Y2/JVpwtZNTj1GYJ6tCX2pOlVBxxH9r/szySbfLTEW6w8wAWOvrxUT6x
         V4yw7lf9VdU5YJ2b+EwP+8D7DKWdtDZA+S25+MpTX9sGQircHmtoSD0iAgMdVRQEyW5M
         Cv7dTNpLWd6ewYTj8BztNClnP6N5DNgdRcgMr7jCQP6WpCRz5+G17j2kAalBBitI6Twl
         brwvLq0ey9otFx3+YQWnTDm3PvwtipKWgnaevrXgIow4DNaU9SY1l36SlfMaukHfKugv
         BFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=ou1k8PiZPzhGhubPZdM0cztRAzO70l425JYoCytzVqM=;
        b=WQmRRQs46p7G1FebKhsyhHck9udr3NHojruc+zFrcg5SIomcpdZROA0n3PFpP1ilGb
         eCG3DaNOWtu/meJenjl1zZXQ4JMKb4qXmdZnTfhZLXhSc/vGgyR65H8DMHHZCs5t54Fb
         VoB5BEHuYyxFdVZWbGsIaf7VnhkT5JoTm+v4qaSrB7kfVEwvQJISzpoUxCM4INUY+w+F
         D3lwOyXlv2hzmoJTdR0Kocu1FB+GBA7RjESk3NuVM2iRsftLoXXNdAN0Znx8NvX0bTSz
         JaKRbXZqH0HCGcjPhnAqzYtQEcjC9wW3J8GbSY/ujnADSDjMdfOH+nfkU3003PxSdnfb
         dVmQ==
X-Gm-Message-State: APjAAAXfLbHwZiDbCpAGt1lprpp1q46yh3fYp6sbjnVtyc59K3xEq4Ur
        +TFtwvWElLah2JyT/3oHgfzsH135
X-Google-Smtp-Source: APXvYqyVrWp3Em/pdEVtNsqdYfzp5he/gx2/8omJOAiW+dYwTnLw21jYzDOqYpx3uFFmUghH2AJGNA==
X-Received: by 2002:ac2:4316:: with SMTP id l22mr5648898lfh.115.1578560489600;
        Thu, 09 Jan 2020 01:01:29 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id q13sm2905796ljj.63.2020.01.09.01.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 01:01:28 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Jonathan Thibault <jonathan@navigue.com>, linux-usb@vger.kernel.org
Subject: Re: USB_DWC3_OF_SIMPLE
In-Reply-To: <c3a1c48c-1ac7-e5c2-e09a-3b55100735ab@navigue.com>
References: <c3a1c48c-1ac7-e5c2-e09a-3b55100735ab@navigue.com>
Date:   Thu, 09 Jan 2020 11:02:21 +0200
Message-ID: <871rs9t336.fsf@kernel.org>
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

> Greetings,
>
> I am currently trying to port OpenWRT to Ubiquiti's EdgeRouter 4 which=20
> is a Cavium Octeon 7130.=C2=A0 While investigating to support XHCI (the=20
> device has a single USB3 port), I ran into the dwc3 driver which=20
> apparently supports that very chipset via the dwc3-of-simple glue.
>
> Looking at Ubiquiti's own firmware, it seems they are using a modified=20
> version of the standard xhci-platform driver.
>
> So now I am faced with two different approaches:
>
> 1- Attempt to replicate Ubiquiti's modifications to xhci-plat.
>
> 2- Switch to dwc3-of-simple.
>
> With option 1, so far, I can get xhci to load by merely adding a=20
> '.compatible =3D' member to usb_xhci_of_match[], but the driver complains=
=20
> about LPM algorithms and disables LPM (which may be fine, I don't know=20
> if it is even supported on this device).
>
> Option 2 (where you might hopefully help), potentially involves more=20
> modification to the OpenWRT since their Octeon kernel config does not=20
> appear to enable CONFIG_COMMON_CLK, which the driver depends on.=C2=A0 An=
d I=20
> do not know if I should also disable standard ohci and ehci drivers once=
=20
> I manage to enable the USB_DWC3_OF_SIMPLE.
>
> I'm looking for recommendations on the best approach.=C2=A0 Keep in mind =
that=20
> while I can cobble together some ugly but functional hacks, I am not an=20
> experienced kernel dev.

Just switch to dwc3-of-simple, it already supports the SoC you're
dealing with. Try removing the dependency on CONFIG_COMMON_CLK. I think
we already get empty stubs when common clk is disabled.

If that works for you, that's an easy patch.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4W7B0ACgkQzL64meEa
mQYTpxAAhOO1atmbZ0HhAYngD/Fras0HsT8iT6vn5kuVNFeHppvAlp9hqoBa6hD9
GFRQYqSejYBcSwc9xFQtpYOidPuEaVOY6pXOvz9SCdp/qOQe05DaHOhJ0j+gGTew
6YIWOFzmfvGAP39bqSOSD+n88PA68niqlM+++kcZVPAh6HoDjNYNCy8Mn/669lzf
g1nCj+YCO+APuQia8KtH2f3iRexQQw/EUmEqc7SPc9m0p0wDn86MOoWqc9hGRfBx
xxJpJnQWjHRp87TbWDIwQ0hTN4bPNlzw9gtJF2ekH9bXpLbHsV4TjVPowWrAmzqi
OOZOxOkjSWaEMYQxyEJ6fBYeQlDDyC20r7gEQEoUm57sdWDJTCDwYZZfAJficQ7e
muvhhLt073rkJ4ZXkcVCX0awfcW6uF6WZamHnKzalWHU5adYEJDVdy7mULxCW8QT
Oj9IzbmELFPloc8qBFdDuOLBaPAgzWRnuMmrVjcyAGwHHfiOasofgUKL4W9OMYTS
0igkoYI8eVMNrAvftnOn1ikwsTqnznCPC0Zfn8CzL1rfzkSjPPG5epRMxhLZWSKc
F6x5F0vyIQmi6w3Jd81t9Xz7j/FpV2bVl57So6hmjUrosBXjzCdaNu3qnyhY/2pp
qQtoBtsha+lu8/LfyNKOIDOuALBPm8aBmjZGkFcphgMPa2N8R5w=
=kPeZ
-----END PGP SIGNATURE-----
--=-=-=--
