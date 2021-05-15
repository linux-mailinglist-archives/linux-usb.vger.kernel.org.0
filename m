Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0CCF381661
	for <lists+linux-usb@lfdr.de>; Sat, 15 May 2021 08:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232227AbhEOGnS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 May 2021 02:43:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:42316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231481AbhEOGnR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 15 May 2021 02:43:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE4B761404;
        Sat, 15 May 2021 06:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621060924;
        bh=rhFX5p5c2kAAor/ze0c6mQc3KeWbux38C8YdjVnfuQs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=gI3F9izeVA5nDnezVHdkgBUzOxJBOqI5RpQCZVM+CLzv6BMwMYWnxK+/KTdwkxpmc
         KyWxLj/4A4pRdOxBumz8imFs3EzIXKynm9cDO1xUtxnJoKRdJZVKSm16Lsnjz08k0k
         6eCIq/d8fWFiPmDXdzSYxDse5gIgb8aSiiTtZ4cPkbmRztCVex/DhkS2oh58doVI6A
         rnU4FhBUwR+X4wXf3a05T5J54w1eB+26VnqoxHU/m7qwiG7CVg4NZgymUgTQdJwLB5
         GQsOWu26yZoZ4yZ14gVkwp5a6GkmG8Q0oXwddU51jHYpe2cmUb+6YhsbVEyJwOanr1
         2NCrSFWvm1iEA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Disconnect race in Gadget core
In-Reply-To: <20210514165830.GA1010288@rowland.harvard.edu>
References: <20210510152426.GE863718@rowland.harvard.edu>
 <87zgx2fskr.fsf@kernel.org> <20210510193849.GB873147@rowland.harvard.edu>
 <87r1idfzms.fsf@kernel.org> <20210511212651.GA914027@rowland.harvard.edu>
 <87lf8kfnc6.fsf@kernel.org> <20210512153358.GC934575@rowland.harvard.edu>
 <87bl9d7oo0.fsf@kernel.org> <20210514165830.GA1010288@rowland.harvard.edu>
Date:   Sat, 15 May 2021 09:41:41 +0300
Message-ID: <875yzk7b2y.fsf@kernel.org>
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

Alan Stern <stern@rowland.harvard.edu> writes:
> On Fri, May 14, 2021 at 10:35:59AM +0300, Felipe Balbi wrote:
>> Alan Stern <stern@rowland.harvard.edu> writes:
>> > On Wed, May 12, 2021 at 10:00:41AM +0300, Felipe Balbi wrote:
>> >> Hmm, IIRC only the storage gadget defers work to another thread.
>> >
>> > Well, the composite core is built into almost every gadget, and doesn'=
t=20
>> > it handle Set-Configuration and Set-Interface requests in a separate=20
>> > thread?  Or doesn't it expect function drivers to do so?
>>=20
>> composite.c doesn't defer anything to a separate thread by itself. The
>> gadget driver, if it finds it necessary, should handle it
>> internally. Most gadget drivers handle all of this in interrupt context.
>>=20
>> > After all, the gadget first learns about config or altsetting changes=
=20
>> > when it receives a Set-Configuration or Set-Interface request, which=20
>> > happens in interrupt context.  But changing configs or altsettings=20
>> > requires disabling/enabling endpoints, which needs a process context=20
>> > (see the kerneldoc for usb_ep_enable and usb_ep_disable).
>>=20
>> Ouch, I don't think any driver is guaranteeing that other than the
>> storage gadget.
>
> A quick search shows that USB_GADGET_DELAYED_STATUS is used in f_fs.c,=20
> f_tcm.c, and f_uvc.c in addition to f_mass_storage.c.  So the situation=20
> isn't as bad as you thought, although it should be better.

right, that's not what the documentation means, though. We're still
enabling/disabling endpoints in interrupt context, just delaying the
status stage until a later time.

It looks like delaying status like this is enough for the current UDC
drivers so, perhaps, we should make delayed_status mandatory and update
the documentation accordingly.

> Anyway, getting back to the main point...
>
> To minimize disruption, suppose we add a new callback to usb_gadget_ops:
>
> 	void	(*udc_async_callbacks)(struct usb_gadget *, int enable);
>
> The UDC core can call this at the appropriate times, if it is not NULL.=
=20=20
> It allows the core to tell a UDC driver whether or not to issue=20
> callbacks for setup, disconnect, reset, suspend, and resume.  It doesn't=
=20
> affect request completion callbacks.
>
> So for removing a driver, the proper sequence will be:
>
> 	usb_gadget_disconnect()
> 	if (gadget->ops->udc_async_callbacks)
> 		gadget->ops->udc_async_callbacks(gadget, 0);
> 	synchronize_irq()
> 	udc->driver->unbind()
> 	usb_gadget_udc_stop()
>
> Or maybe the last two steps should be reversed.  In udc_bind_to_driver,=20
> the opposite sequence is:
>
> 	bind
> 	udc_start
> 	enable async callbacks
> 	connect (turn on pull-up)
>
> How does this sound?

Sounds reasonable and, probably, minimizes the amount of code that needs
to be changed. This will also enable us to fix each UDC in isolation.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCfbSURHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUgUHwf/cnJj7zrV+MXZNOfc/+v77AZaUA9YEQJj
DmWzud/9R94dGM3gkQq3tK1JCi5v7Kd20Q95ExffZIof4bB+IVZqTXzM2INsGcwq
1DsfjyxWMbEki3RrLu99RQVDSj4rVLLrAIwKE3uZcn9Lb7bmhf950oS3n16gXMQl
Mg/SDOQ0T5sOi/fnAfkny7ZRzUIgoVVgtMO+odCrQ1Z/Wqhu9wdVSQSAKRg3Q5oy
b8+XORQbLGouZEBzmDlJvrkmNZ/SvRE1LA6dohrlswlAszMdsGhjXJMjOkqjH1xe
IBO9bDE8G2O7Uczztd0OAe3PPYji/6Jw60+C3YTukGBFnK9L+WHX0Q==
=vgD/
-----END PGP SIGNATURE-----
--=-=-=--
