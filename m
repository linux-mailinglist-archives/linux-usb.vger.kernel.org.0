Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D47379452
	for <lists+linux-usb@lfdr.de>; Mon, 10 May 2021 18:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbhEJQoR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 May 2021 12:44:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:45194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231873AbhEJQoM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 May 2021 12:44:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00B0F610FA;
        Mon, 10 May 2021 16:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620664987;
        bh=JYMvyOgsEnj9NjThzg4gr3NS8sBEzVNQ3Nqb4shRHys=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ZH8UlgyyeKkDqHvSYastONsdA/SEDR68NdPnlLk9CzM7+qK/rCoJTHPxq+8lXDey4
         KtM9t50PDMQY327UmW+Cqi1LLnhiVu3NB+IylBAuYNIg7hhQT2hTaSGJKTbK5VFmzl
         V0m5yzKBmi9Wpbbp8X3U0WlIPwhCT1fCZWE496Wr0uG0has5fe4QtiZuM0gFdczvmw
         YPu50CtBIsMMWS2QngzWS3Hx9g2dxMfeS8EWVCekw/Kqutm7VxRcFJNazgr1yYyuDU
         iPmETItLXGTWmxr4N2rqtcBWtXxJpZSl7qzIA9XoJWvxXRWLRVTGd5pSXXhp3yCdx5
         RyyCZeA0+NiRg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Disconnect race in Gadget core
In-Reply-To: <20210510152426.GE863718@rowland.harvard.edu>
References: <20210510152426.GE863718@rowland.harvard.edu>
Date:   Mon, 10 May 2021 19:43:00 +0300
Message-ID: <87zgx2fskr.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi Alan,

Alan Stern <stern@rowland.harvard.edu> writes:
> I just noticed this potential race in the Gadget core, specifically, in=20
> usb_gadget_remove_driver.  Here's the relevant code:
>
> 	usb_gadget_disconnect(udc->gadget);
> 	if (udc->gadget->irq)
> 		synchronize_irq(udc->gadget->irq);
> 	udc->driver->unbind(udc->gadget);
> 	usb_gadget_udc_stop(udc);
>
> usb_gadget_disconnect will turn off the D+ pull-up, telling the host (or=
=20
> upstream hub) that the gadget is no longer connected to the bus.  The=20
> udc->driver->unbind call then tells the gadget driver that it will no=20
> longer receive any callbacks from the UDC driver or the gadget core.
>
> Now suppose that at just this moment, the user unplugs the USB cable.=20=
=20
> The UDC driver will notice that the Vbus voltage has gone away and will=20
> invoke the gadget driver's ->disconnect callback.  After all, it doesn't=
=20
> realize it should avoid making these callbacks until usb_gadget_udc_stop=
=20
> has run.
>
> As a result, the gadget driver's disconnect callback may be invoked=20
> _after_ the driver has been unbound from the gadget.

argh, nice catch!

> How should we fix this potential problem?

I think we can just move usb_gadget_udc_stop(). Looking at a few udcs,
they're just either freeing or masking UDC's interrupts which should
prevent the race you describe while also making sure that no further
interrupts will trigger.

Perhaps we could move udc_stop() before synchronize_irq(). Do you
foresee any issues with that for net2272 or dummy?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCZYpQRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjiWgf+OhywWHaA8KkfQ1jTewfy2D33+LacdcuX
RO0huYMX8s1v7AeHNndId0CVIITUJWYE4IU7t+WODYanNFUCtzMAgDds7dKD9vSV
hGvdicPZN8a0NWY9VfpNKc7+5XylAHsU7agYozwYEAE9ih9MBxicC94HhFwwP8Ov
A0qGx5YOcedFmn9bXR2W4sKJA0y0wZlE/nQ8AdbvjEHGBlCde6M+gZkPI0qsoYXk
QsJU0GUMLn9LzhjMHmZ/k50yVz/007oWM+jxxZ4PiNUYp2Y9xrLIrTRTlkc6RDB0
1sOLuh/HldhWR4YmVhQyWIS8iN3TTz1/JYGodL3GnRc71gXCFMf/wQ==
=j1ER
-----END PGP SIGNATURE-----
--=-=-=--
