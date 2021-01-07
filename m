Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEEB52ECC94
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jan 2021 10:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbhAGJUq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jan 2021 04:20:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:44870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726326AbhAGJUq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 7 Jan 2021 04:20:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25CC82312E;
        Thu,  7 Jan 2021 09:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610011205;
        bh=ioxgKioYqCLBrjKW2qCmoT68P/iNvSSqvWEwQwBdU8M=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=gTVSXYp3ocH5zQsIX8HxdbGWHkNagcZhZmcjR2++vfZ+Sl+oXKVb5MrIORiZWlgyq
         BLd5NaLV7N76t7D0xlyVxejov6E4RCxp2synz8AfmcZG42zGkBlCqzeTV1v8tkkMBE
         2+zZEq1hyLcJWHQunVpXhA/Gx7jv8JK0u1iqRKPY70Fh8DWj+MYtPjubmknaqB3ILy
         2LwrPPwZ7Ja4J+Roi5ohWuW6JYBXWUguTvDTJhYVrZlhqi8sVXGSwBvePB34FU5dZD
         IOdnvF+KPoiYLEwgnjPiXsaTeHYqvpA6/aCJ5z4lglGXecuRaxv03+9Qk7Cp5dDLtJ
         TvFKyBSMXi8tQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Lorenzo Colitti <lorenzo@google.com>, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org
Cc:     taehyun.cho@samsung.com, Lorenzo Colitti <lorenzo@google.com>
Subject: Re: [PATCH] usb: gadget: enable super speed plus
In-Reply-To: <20210106154625.2801030-1-lorenzo@google.com>
References: <20210106154625.2801030-1-lorenzo@google.com>
Date:   Thu, 07 Jan 2021 11:19:58 +0200
Message-ID: <871rexcddt.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Lorenzo Colitti <lorenzo@google.com> writes:
> From: "taehyun.cho" <taehyun.cho@samsung.com>
>
> Enable Super speed plus in configfs to support USB3.1 Gen2.
> This ensures that when a USB gadget is plugged in, it is
> enumerated as Gen 2 and connected at 10 Gbps if the host and
> cable are capable of it.
>
> Many in-tree gadget functions (fs, midi, acm, ncm, mass_storage,
> etc.) already have SuperSpeed Plus support.
>
> Tested: plugged gadget into Linux host and saw:
> [284907.385986] usb 8-2: new SuperSpeedPlus Gen 2 USB device number 3 usi=
ng xhci_hcd
>
> Signed-off-by: taehyun.cho <taehyun.cho@samsung.com>
> Tested-by: Lorenzo Colitti <lorenzo@google.com>
> Signed-off-by: Lorenzo Colitti <lorenzo@google.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl/20j4RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQb6PxAAjeC1rqozA+dS/HASj2Q+Ion1SCA567iq
5J2uljeWGM3hTcMma2ORMUFsatHyUCaQ1M0yWF6T8TRB/xT9WMKO/U0FGlGXxwSY
koibP+T2W6UeBPqdUXDQD4X/btVluJbr3i/Tk42kBfcl2yExFzLYwMt9Lsz/CYuE
M5u8i5sXjxu2sOAEfiBp52j+0nOvpcCn9TmaNw81enGOuUoZHi8qBK74QnaQrNcK
aoytgALPDXzAT0LIPfK6CJ4K9uhawv/s7ipbczjb4y1bLTwLhpNVwhL4LtS0zjda
/qyZI8k8vhw+lGc75DyiA/ZzPXgKyD6k+M3lbhgu/IMBLMsvy8JZwufH4sNyZZ8G
B527Ra5kjeAmfxD00HLNk4+hlmzBWKRChU/dN0mYuF0lv0gcoXGuKQezND+GYe7d
z8rqabtj9SA/Z17cNBD2jQBitvLL1KkWQ3WEPOsbJViKeHTLMqaLc1psSQX3obiS
3M/gYlgVIRrIfI7Sg4y6YqwT9/c8MMiGrpA/ofUizyTfMqd0jIAVfAi+wNmzU6s5
NeEq+AyfebrqciAK1lQTM2OPoVASvTuOtiMQdFR1/sw8iXxWmCR4nd9zBOikEsuc
S2xc3hPKtQgPAsdPrsKs1wDrtC7Jh8JQcktsVMBYN/6kDPa9O2s6PU/cSjUwtsY6
FebTY9dXKXY=
=G5D0
-----END PGP SIGNATURE-----
--=-=-=--
