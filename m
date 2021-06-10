Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3F03A27D9
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 11:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbhFJJMO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 05:12:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:46104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230161AbhFJJMK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Jun 2021 05:12:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA2A061249;
        Thu, 10 Jun 2021 09:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623316214;
        bh=tqns342DjsFzzzVflidIJPF5i22KOjRjc+AfSjr/Id0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=QVoalWA5YM7vwNg186dVdNFi3MP80IJ5RCMak7Fq9z31+Hd77I9JsKrKQsPwsyqYN
         B5hcYfcrawcnebhXJwjt0JkDbpNnRvHi0bhEZNmjQkIIhsrXdLFvQBXGS40sK9pIbO
         Bfr0Ux/UC/WHUw4W4vakOOWQAnBKjtZao/nHb0Z4K0EwmtuPyu/awH05If8RZ8kbTW
         9Nwgn3pW3NfySIvPEkzI0lJE4LhW0gGVdFh8eSnbOXX+jokb3g6QSBkhq6YJBU/ejl
         2Q4cBoUoo78+nKJU+AVaKjq1Ddz5M9QLhGSgA0pRP0JvhTUnPpoYPr+zJ+MN5A+QTj
         6kmnp43W8Mglg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Maciej =?utf-8?Q?=C5=BBenczykowski?= <zenczykowski@gmail.com>,
        Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] usb: fix various gadget panics on 10gbps cabling
In-Reply-To: <20210609024459.1126080-1-zenczykowski@gmail.com>
References: <YL8wSsGso94F6lEH@kroah.com>
 <20210609024459.1126080-1-zenczykowski@gmail.com>
Date:   Thu, 10 Jun 2021 12:10:07 +0300
Message-ID: <878s3i2ihc.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Maciej =C5=BBenczykowski <zenczykowski@gmail.com> writes:

> From: Maciej =C5=BBenczykowski <maze@google.com>
>
> usb_assign_descriptors() is called with 5 parameters,
> the last 4 of which are the usb_descriptor_header for:
>   full-speed (USB1.1 - 12Mbps [including USB1.0 low-speed @ 1.5Mbps),
>   high-speed (USB2.0 - 480Mbps),
>   super-speed (USB3.0 - 5Gbps),
>   super-speed-plus (USB3.1 - 10Gbps).
>
> The differences between full/high/super-speed descriptors are usually
> substantial (due to changes in the maximum usb block size from 64 to 512
> to 1024 bytes and other differences in the specs), while the difference
> between 5 and 10Gbps descriptors may be as little as nothing
> (in many cases the same tuning is simply good enough).
>
> However if a gadget driver calls usb_assign_descriptors() with
> a NULL descriptor for super-speed-plus and is then used on a max 10gbps
> configuration, the kernel will crash with a null pointer dereference,
> when a 10gbps capable device port + cable + host port combination shows u=
p.
> (This wouldn't happen if the gadget max-speed was set to 5gbps, but
> it of course defaults to the maximum, and there's no real reason to
> artificially limit it)
>
> The fix is to simply use the 5gbps descriptor as the 10gbps descriptor,
> if a 10gbps descriptor wasn't provided.
>
> Obviously this won't fix the problem if the 5gbps descriptor is also
> NULL, but such cases can't be so trivially solved (and any such gadgets
> are unlikely to be used with USB3 ports any way).
>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Maciej =C5=BBenczykowski <maze@google.com>

nice catch!!

I think this is already in Greg's tree, but in any  case:

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmDB1u8RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUhkQQgAjuwmNuH1gYrvpizVo7lF2di1444xq81b
0uybIL3M67Vl5MiheqaDmZ9RogYCF53XFZ+6eW0P+wIlVjBdx0H24aeOR5NJXm7t
NoIk29cQcn5qEgeQJOxK+06MSy3hYYTV1y+QofyTxKFokUnUDvsNEJXuhhpcT8fa
ehO0wgtUdm5sRMMTwNWeEwc3Up4HdOhuJaEC4fYupia0ALECCwmynj+etAXcCZye
QqRNlIO7DF9I4rI+XuQjt+1KsGKM1PIdzxeXN37vIGV/IV3ntsp+8FMQg8OKJG1v
MdAtf84Ue28wEy2XGFHlHuEHDPD629bdPImpSTn/xz7z7h3OzsQ40A==
=mK2X
-----END PGP SIGNATURE-----
--=-=-=--
