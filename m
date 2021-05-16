Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6280381DB2
	for <lists+linux-usb@lfdr.de>; Sun, 16 May 2021 11:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhEPJpe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 May 2021 05:45:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:58822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229441AbhEPJpd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 16 May 2021 05:45:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C19E261075;
        Sun, 16 May 2021 09:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621158258;
        bh=a8ZeyieNh2Jge1L18DCiFqG8tzr/O5980T+O5Sx7JHI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=GcCkilc6+/GHhumx8Ls5GJJwU3DyUSKxohznBzhk7YVLjgj4UuYbjmaUKYQ1Iyzi5
         S0/6t8VEerG/pC7WXxiJ1o+hNLs7sMIvARy8OtY26Z50xgk5CGy1UXEA27FJuafJsy
         8wbj9phzUVY9+LIOQuuAGkmAEk3KnYfcfX93HXdjxRlhIM7paL5KnhmpXFZdWPK+kj
         5hpQ/eqWh3u6XYX3TYT4/B1RJhIsAEEWVeERPKtUkhScKICHUXDpkci1+Q+PSMnSuk
         XHJehI7o+6TAOzHY8NaJhwOMof2jJmrdlrJ+KT1uzWqpXoZLlcu3OJhXXrkVJZj4jc
         85YGyFilEMDdQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Disconnect race in Gadget core
In-Reply-To: <20210515153113.GB1036273@rowland.harvard.edu>
References: <20210510152426.GE863718@rowland.harvard.edu>
 <87zgx2fskr.fsf@kernel.org> <20210510193849.GB873147@rowland.harvard.edu>
 <87r1idfzms.fsf@kernel.org> <20210511212651.GA914027@rowland.harvard.edu>
 <87lf8kfnc6.fsf@kernel.org> <20210512153358.GC934575@rowland.harvard.edu>
 <87bl9d7oo0.fsf@kernel.org> <20210514165830.GA1010288@rowland.harvard.edu>
 <875yzk7b2y.fsf@kernel.org> <20210515153113.GB1036273@rowland.harvard.edu>
Date:   Sun, 16 May 2021 12:43:58 +0300
Message-ID: <8735un6mjl.fsf@kernel.org>
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
>> Alan Stern <stern@rowland.harvard.edu> writes:
>> > On Fri, May 14, 2021 at 10:35:59AM +0300, Felipe Balbi wrote:
>> >> Alan Stern <stern@rowland.harvard.edu> writes:
>> >> > On Wed, May 12, 2021 at 10:00:41AM +0300, Felipe Balbi wrote:
>> >> >> Hmm, IIRC only the storage gadget defers work to another thread.
>> >> >
>> >> > Well, the composite core is built into almost every gadget, and doe=
sn't=20
>> >> > it handle Set-Configuration and Set-Interface requests in a separat=
e=20
>> >> > thread?  Or doesn't it expect function drivers to do so?
>> >>=20
>> >> composite.c doesn't defer anything to a separate thread by itself. The
>> >> gadget driver, if it finds it necessary, should handle it
>> >> internally. Most gadget drivers handle all of this in interrupt conte=
xt.
>> >>=20
>> >> > After all, the gadget first learns about config or altsetting chang=
es=20
>> >> > when it receives a Set-Configuration or Set-Interface request, whic=
h=20
>> >> > happens in interrupt context.  But changing configs or altsettings=
=20
>> >> > requires disabling/enabling endpoints, which needs a process contex=
t=20
>> >> > (see the kerneldoc for usb_ep_enable and usb_ep_disable).
>> >>=20
>> >> Ouch, I don't think any driver is guaranteeing that other than the
>> >> storage gadget.
>> >
>> > A quick search shows that USB_GADGET_DELAYED_STATUS is used in f_fs.c,=
=20
>> > f_tcm.c, and f_uvc.c in addition to f_mass_storage.c.  So the situatio=
n=20
>> > isn't as bad as you thought, although it should be better.
>>=20
>> right, that's not what the documentation means, though. We're still
>> enabling/disabling endpoints in interrupt context, just delaying the
>> status stage until a later time.
>>=20
>> It looks like delaying status like this is enough for the current UDC
>> drivers so, perhaps, we should make delayed_status mandatory and update
>> the documentation accordingly.
>
> If it's okay to call those functions in interrupt context then the=20
> kerneldoc definitely should be updated.  However, I don't see why you=20
> would want to make DELAYED_STATUS mandatory.  If all the necessary work=20
> can be done in the set_alt handler, why not return the status=20
> immediately?

because we avoid a special case. Instead of having magic return value to
mean "Don't do anything until I enqueue a request" we can just make that
an assumption, i.e. gadget driver *must* enqueue requests for data and
status stages.

> BTW, does it seem odd to you that these function drivers defer some of=20
> the set_alt activities into a work thread but do the ep_enable/disable=20
> parts right away, in interrupt context?  I should think the drivers=20
> would want to minimize the amount of processing that happens=20
> in_interrupt.

it is a bit odd, yes. I'm pretty sure this is forcing odd things to
happen in at least camera gadget, which must communicate with v4l2.

IIRC, camera gadget processes frames in the same context as the
=2D>complete callback, as well, which also runs in_interrupt.

>> > Anyway, getting back to the main point...
>> >
>> > To minimize disruption, suppose we add a new callback to usb_gadget_op=
s:
>> >
>> > 	void	(*udc_async_callbacks)(struct usb_gadget *, int enable);
>> >
>> > The UDC core can call this at the appropriate times, if it is not NULL=
.=20=20
>> > It allows the core to tell a UDC driver whether or not to issue=20
>> > callbacks for setup, disconnect, reset, suspend, and resume.  It doesn=
't=20
>> > affect request completion callbacks.
>> >
>> > So for removing a driver, the proper sequence will be:
>> >
>> > 	usb_gadget_disconnect()
>> > 	if (gadget->ops->udc_async_callbacks)
>> > 		gadget->ops->udc_async_callbacks(gadget, 0);
>> > 	synchronize_irq()
>> > 	udc->driver->unbind()
>> > 	usb_gadget_udc_stop()
>> >
>> > Or maybe the last two steps should be reversed.  In udc_bind_to_driver=
,=20
>
> After some more thought, I decided the last two steps are in the right=20
> order now.  When udc_stop runs, it causes the UDC driver to forget about=
=20
> the gadget driver, so there wouldn't be any way to issue the completion=20
> callbacks when the unbind handler cancels the outstanding requests and=20
> disables the endpoints.
>
>> > the opposite sequence is:
>> >
>> > 	bind
>> > 	udc_start
>
> Then by analogy, these two steps should be reversed.  But it doesn't=20
> really matter, because the gadget driver won't try to enable endpoints=20
> or do anything else until the host has enumerated the gadget.  (And if=20
> there are any gadget devices which don't allow software to control the=20
> pull-up separately, then they clearly will want bind to precede=20
> udc_start.)

makes sense

>> > 	enable async callbacks
>> > 	connect (turn on pull-up)
>> >
>> > How does this sound?
>>=20
>> Sounds reasonable and, probably, minimizes the amount of code that needs
>> to be changed. This will also enable us to fix each UDC in isolation.
>
> Right.  Okay, I'll work on a patch series.

Thank you, Alan.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCg6V4RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUg4IwgApF9WYhH3xiTZepQqyMkRwN5GLTPi7vgc
yjqqcMETvYYDcYVVLk6HbUrWDz5EiyCKeacv2DciVkEMxjh+Bc37DfPgW70dKA72
N5uiCFk/KnBQQD7CSnQlGDVYt0JX6UHJGy3B2Q7eGGXywkl4JMTkoP9kP7h3SBGf
uYw5X4wSzN3GGp9VRCwUff0lX872VYpUbo3FYMzUXPGL3Pb9Js38e7uVMsMiv6OK
3Q+MuxIu0/Boimfv87hZ62H5SQff2RoDPusrZ0o9j02W3Q10GamwjO14lmtQYFiW
jA1wX/GGAuBhFjELryDA7cKL5s0RvC1QlJAYh93TS2JJzCQZtlfKiw==
=XVJK
-----END PGP SIGNATURE-----
--=-=-=--
