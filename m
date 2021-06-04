Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2BE39BAD4
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 16:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhFDOWt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 10:22:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:41514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230124AbhFDOWt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Jun 2021 10:22:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E1BC611C1;
        Fri,  4 Jun 2021 14:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622816462;
        bh=R5IQCSuXa8rFVKv//hrdfLkEjREek/inWjzTnHwJu+k=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=uvNUsqQ4eGwKX3bc1ka8WQ76NXhXjtl9Xm4HBIhCHOZL5+pXvFGT9C8rDQdFSM+h1
         JuVeMUKIUdOK+OLgSm4H07EEAQsHiS6ydDcLM+NmxfDrXYQf/EAHCVsQIR5WkTww+Q
         HcafUP/fpDMK6BkGWtfPQ6BcvaluRi1im6we0RtJ7UmVc40S6h55ZHZsx7guHEkiuT
         Ol6IJ+zD99x5cWylsI36EbZ9KyQgWTI7c3tKRzo1KiQG9yfPh5pYpeNDa/9VYtUlff
         wdXIuDW7O2FVaYRfu6wIUHAu97JtUdlgb4i7y2XqI93oYFaKnwHFZlNaQVJCBkwadR
         7WjxUFjr0HaYw==
From:   Felipe Balbi <balbi@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/4] USB: UDC: Implement udc_async_callbacks in dummy-hcd
In-Reply-To: <20210604141531.GA1676809@rowland.harvard.edu>
References: <20210520202152.GD1216852@rowland.harvard.edu>
 <87v96ub3y0.fsf@kernel.org> <20210604141531.GA1676809@rowland.harvard.edu>
Date:   Fri, 04 Jun 2021 17:20:54 +0300
Message-ID: <87h7idbtix.fsf@kernel.org>
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

> On Fri, Jun 04, 2021 at 08:21:11AM +0300, Felipe Balbi wrote:
>>=20
>> Hi,
>>=20
>> Alan Stern <stern@rowland.harvard.edu> writes:
>> > @@ -990,7 +1000,6 @@ static int dummy_udc_start(struct usb_ga
>> >  	spin_lock_irq(&dum->lock);
>> >  	dum->devstatus =3D 0;
>> >  	dum->driver =3D driver;
>> > -	dum->ints_enabled =3D 1;
>>=20
>> should the matching write of 0 be removed from dummy_udc_stop()?
>
> No, it's okay to leave that one.  In practice it won't make any=20
> difference because now the core will always turn off async callbacks=20
> before doing udc_stop.  It's there for the sake of thoroughness, and it=20
> lets the reader know that emulated interrupts are supposed to be turned=20
> off whenever the UDC stops running (just like a driver for a real UDC).
>
> Whereas this line here in dummy_udc_start would be actively wrong if it=20
> were to remain.

fair enough :-) I see Greg took the series already ;-) Thanks for
working on this, again.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmC6NsYRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjb8wgAt7Gtkr5wVsWCgiwVLd5suysPFvMCp54A
0sghj1Odi0bavxmw5Fq3uDIowM0ODZ0Xn1uGttLgsk97+s1cVMaEkrQp4s7XjLh0
FbxUbgzB10oj35pbfVMP+Yw/4XxpL0n1ivbBz4CKIOlwBcV2xQJA1WY/d634/qYc
QPPhTrwpDwHI5a54K4uzPs3Y9vJ/jnVUOf7jqP0ANZ3jsDX3oTGnHuJvKinMIh2r
m0zLPjQEqEZTZB5l8hBk4LnbvGtudTrsGV773JPYQMVzbhvnl4lBGFV0xQKAODsi
ZpwNfQRRJ/Kn3qNhKfMzy4l2NEMRz6TVMsrFkov5Ul0lPPgfPwFizA==
=EpVv
-----END PGP SIGNATURE-----
--=-=-=--
