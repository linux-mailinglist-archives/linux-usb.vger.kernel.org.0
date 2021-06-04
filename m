Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A38739B1E3
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 07:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhFDFUq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 01:20:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:38126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229752AbhFDFUp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Jun 2021 01:20:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F88C6140C;
        Fri,  4 Jun 2021 05:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622783940;
        bh=ONqzTmF2TKNKpTt2q+hFIF9FuwLq2RcU7s8ak7La8Jo=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Ywe3k4GGhh+jrD6XrYE7TENci9+SCBcL53Ja9ynyLxj8odUWd0PjyFg/PDoVFEQJX
         Pu3vjk3XVnCiGBl/nvy2QtwYFaIEgWgHcV3TJUy8R8fazTvzK8i7ANJb8QYkLQLHDQ
         EHurzq67+4ejlKF2PHNZRBAy0upy+1UnNouWuSGdwlC6qplGVeT9P1VZAfqvyzAYzc
         S2xhwmBcQmncrGJ5KwzWZeajDhmloI292jvK7CkKTZACuhYVMmL194pqfujJessaL7
         LQzIu1EXYRBfh6BP5SLKhVE1I2HOTlEgOeShUoLYJmgrBr0hOLK2APMvoe5JUOyA9Y
         H/LfsBKdP1GgA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/4] USB: UDC core: Add udc_async_callbacks gadget op
In-Reply-To: <20210520202144.GC1216852@rowland.harvard.edu>
References: <20210520202144.GC1216852@rowland.harvard.edu>
Date:   Fri, 04 Jun 2021 08:18:53 +0300
Message-ID: <87y2bqb41u.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Alan Stern <stern@rowland.harvard.edu> writes:
> The Gadget API has a theoretical race when a gadget driver is unbound.
> Although the pull-up is turned off before the driver's ->unbind
> callback runs, if the USB cable were to be unplugged at just the wrong
> moment there would be nothing to prevent the UDC driver from invoking
> the ->disconnect callback after the unbind has finished.  In theory,
> other asynchronous callbacks could also happen during the time before
> the UDC driver's udc_stop routine is called, and the gadget driver
> would not be prepared to handle any of them.
>
> We need a way to tell UDC drivers to stop issuing asynchronous (that is,
> ->suspend, ->resume, ->disconnect, ->reset, or ->setup) callbacks at
> some point after the pull-up has been turned off and before the
> ->unbind callback runs.  This patch adds a new ->udc_async_callbacks
> callback to the usb_gadget_ops structure for precisely this purpose,
> and it adds the corresponding support to the UDC core.
>
> Later patches in this series add support for udc_async_callbacks to
> several UDC drivers.
>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

Thank you for working on this, Alan.

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmC5t70RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUj91Af/cisNEgAuKdLLaZah3VNIB3B//gFq2Euf
J6sGWPznwgS0Of/qxI9Fd/UW9EP5+qhbxzDabUnpe1JqtjhoIli67G7d5h2v21Pu
q0s01DAf6moeW3LBGEAo9cj89aZYZkLbYzbSZpYcGdbXqC7dGdCZroAVHrQgPjxu
Jyzu3kiULaAOEM0j1nPtlD5eesxYiYzZ3il3vqf4mPe5DMojs4Og9ADRkw5YhPAF
Y27s6i86d5bVGW/OoPJYReH0WN838lf26UkIckGGYqFJdXLw4uX/YM+lGQ4Fsv9H
ANOYlXnpg1qzmkeQJBAj89gPrbrE3Dov/u8pLunVjBbZoymtZcofxg==
=glgX
-----END PGP SIGNATURE-----
--=-=-=--
