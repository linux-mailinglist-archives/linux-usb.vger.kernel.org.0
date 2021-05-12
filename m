Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A192C37B66D
	for <lists+linux-usb@lfdr.de>; Wed, 12 May 2021 09:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbhELHB6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 May 2021 03:01:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:39080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229626AbhELHB5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 May 2021 03:01:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65CAC61927;
        Wed, 12 May 2021 07:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620802850;
        bh=Cpv+ixivVqvTKWPxx8HydgV9Pmgp7Kl9V6aRYjq7vgI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=KAIyhxJf1l8QJU3KFO7ZR37tZMW34XYMFwyC0Q7brj7wAyBGBYtyF3h18GPJNF0GV
         Z8WdM+RfPOafpDXX/U8mjKm2cQGtcpUGZ5sCFvslVxEqdnNPpH9Spr/DoZI3zwYR+C
         UsesMHyNWUsYeOAoTz255OL5N54zUoV1n9+POfURqf5tgcXgcRpiYhbdpsY2pCyam7
         KwEVRnt87XLToZzMKIYlN90JdR1AjrqX5z9TtOxgfcT/Ga1Hc3SvkG4nPe7GxksXwc
         h1w4P7XcNkLgj7iYufxYyhHz6f+S/UIxHWiL8SjCeIdd0B7UnIYPpZlai9GW1xdMhe
         Tcrjo76xe7UTg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Disconnect race in Gadget core
In-Reply-To: <20210511212651.GA914027@rowland.harvard.edu>
References: <20210510152426.GE863718@rowland.harvard.edu>
 <87zgx2fskr.fsf@kernel.org> <20210510193849.GB873147@rowland.harvard.edu>
 <87r1idfzms.fsf@kernel.org> <20210511212651.GA914027@rowland.harvard.edu>
Date:   Wed, 12 May 2021 10:00:41 +0300
Message-ID: <87lf8kfnc6.fsf@kernel.org>
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
> On Tue, May 11, 2021 at 11:22:51AM +0300, Felipe Balbi wrote:
>> Right, I'm arguing that, perhaps, ->udc_stop() is the one that should
>> have said semantics. For starters, 'stop' has a very clear meaning and,
>> considering my quick review of 3 or 4 UDC drivers, they are just masking
>> or releasing interrupts which would prevent ->suspend() and
>> ->disconnect() from being called. It could be, however, that if we
>> change the semantics of udc_stop to fit your description above,
>> ->udc_start() may have to change accordingly. Using dwc3 as an example,
>> here are the relevant implementations:
>>=20
>> > static int dwc3_gadget_start(struct usb_gadget *g,
>> > 		struct usb_gadget_driver *driver)
>> > {
>> > 	struct dwc3		*dwc =3D gadget_to_dwc(g);
>> > 	unsigned long		flags;
>> > 	int			ret;
>> > 	int			irq;
>> >
>> > 	irq =3D dwc->irq_gadget;
>> > 	ret =3D request_threaded_irq(irq, dwc3_interrupt, dwc3_thread_interru=
pt,
>> > 			IRQF_SHARED, "dwc3", dwc->ev_buf);
>>=20
>> request interrupt line and enable it. Prepare the udc to call gadget ops.
>>=20
>> > 	if (ret) {
>> > 		dev_err(dwc->dev, "failed to request irq #%d --> %d\n",
>> > 				irq, ret);
>> > 		return ret;
>> > 	}
>> >
>> > 	spin_lock_irqsave(&dwc->lock, flags);
>> > 	dwc->gadget_driver	=3D driver;
>>=20
>> internal pointer cached for convenience
>>=20
>> > 	spin_unlock_irqrestore(&dwc->lock, flags);
>> >
>> > 	return 0;
>> > }
>> >
>> > static int dwc3_gadget_stop(struct usb_gadget *g)
>> > {
>> > 	struct dwc3		*dwc =3D gadget_to_dwc(g);
>> > 	unsigned long		flags;
>> >
>> > 	spin_lock_irqsave(&dwc->lock, flags);
>> > 	dwc->gadget_driver	=3D NULL;
>> > 	spin_unlock_irqrestore(&dwc->lock, flags);
>> >
>> > 	free_irq(dwc->irq_gadget, dwc->ev_buf);
>>=20
>> drop the interrupt line. This makes the synchronize_irq() call
>> irrelevant in usb_gadget_remove_driver().
>
> I'm not so sure about this.  It seems like this whole thing arose when=20
> the UDC core was created.  Before that, gadget drivers would register=20

yes, that's correct.

> and unregister themselves by calling routines in the UDC driver (because=
=20
> there was no core to manage things overall).  Thus the UDC driver knew=20

right, before that we also didn't have platforms with more than one
UDC. To be frank, though, that was never really true, considering we
could order two net2272 PCI cards and stick them in the same PC.

> everything that was going on and could arrange to do things in the right=
=20
> order.

right

> But now the UDC driver doesn't know about unregistrations/unbinding=20
> until too late.

Some of this was changed recently, though. That was to cope with
USB-IF's mandate that pull-ups shouldn't be connected until VBUS is
above VBUS_VALID_THRESHOLD (v4.4). Some controllers, such as dwc3,
manage that internally (as far as I remember, but I see similar
constructs in dwc3 now) while others had to modify udc_start to cope
with this situation.

> So in dwc3, for example: At what point do you abort all outstanding=20
> requests with -ESHUTDOWN status?  We don't want to do this before=20

we do this as part of dwc3_remove_requests(). So, it's done either when
the relevant endpoint is disabled or as part of
dwc3_stop_active_transfers() which in turn is called from a (bus) reset
interrupt or when disconnecting pullups.

> invoking the gadget driver's ->unbind callback.  Or do you rely on the=20
> gadget driver to cancel the oustanding requests by itself?
>
> (In dummy-hcd, the udc_stop routine first calls stop_activity, which=20
> nukes all outstanding requests, and afterward sets dum->driver to NULL.)

I see.

> The host-side API, which I admit may not be the greatest, does cancel=20
> all outstanding URBs before calling the class driver's disconnect=20
> routine -- unless the class driver sets the "soft_unbind" flag, in which=
=20
> case we assume the driver will kill its own URBs properly.
>
> Suppose dwc3_gadget_stop was moved before the ->unbind callback.  Then=20
> when the gadget driver cancelled its outstanding requests during unbind,=
=20
> how could dwc3 do the completion callbacks with dwc->gadget_driver=20
> already set to NULL?

That's fair :-)

>> I'm not against adding new udc methods to gadget ops, but it seems
>> fitting that udc_start/udc_stop would fit your description while some
>> new members could be given the task of priming the default control pipe
>> to receive the first SETUP packet.
>>=20
>> What do you think?
>
> Starting things up when a new gadget driver binds doesn't seem to be so=20
> much of a problem.  After all, the new driver isn't going to do anything=
=20
> before the first SETUP packet arrives, since the gadget will be=20

it could be an impact in power consumption, albeit minimal

> unconfigured.  Unbinding and shutting down are the hard parts.
>
> I guess the ideal approach would be:
>
> 	First, the UDC driver basically turns off the UDC hardware.
> 	This means no more IRQs will be generated.  But pending requests
> 	remain pending until they are explicitly cancelled.

right, that, I argue, is the responsibility of ->udc_stop()

> 	Second, the gadget driver's unbind callback runs.  It should
> 	cancel any outstanding requests and generally release resources.

correct. But that means we would require the gadget driver to initiate
cancelling of outstanding requests

> 	Third, the UDC driver WARNs about any requests that still exist
> 	and automatically releases them without doing any completion
> 	callbacks.  It also forgets about the gadget driver (this can't
> 	happen until after the gadget driver has cancelled its=20
> 	requests).
>
> Right now we are doing the first two steps in the opposite order.  That=20
> would be okay, provided we could guarantee there are no more=20
> asynchronous callbacks once unbind is called (sort of like what Peter=20
> has done for configfs).  But it would be better to do the steps in the=20
> order shown above.  This does correspond to calling udc_stop first, as=20
> you suggest.

right

> But it also would mean splitting out the third step as something=20
> separate from udc_stop.  Not to mention some potentially serious=20
> updating of some UDC drivers.

yeah, it would take quite a bit of effort.

> On the other hand, there is something to be said for leaving the UDC=20
> operational until after the unbind callback.  If the gadget driver=20
> happened to be installing a new alternate setting at that time, say in a=
=20
> workqueue thread, calls to activate new endpoints wouldn't suddenly get=20
> unexpected errors.

Hmm, IIRC only the storage gadget defers work to another thread. What
you describe can also happen today depending on how far into the future
the kthread is scheduled, no? So, how does storage gadget behave with
that today?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCbfRkRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUgQvAgAlYZ3TDJ+/Adu7ZN3DllV+l7VHquOjM+j
a3CB29Ydku8uM90CQEtHfIvO7fJQZMfUkb2JusP/KVPTWCoAVTpOD/bGHxoKpYQy
akZeR4e+qMsHEupjZ/UdyWSn58jzdi+BeyL6D8mUBh/BTe8+382ssSpEqkAje/ol
26RfqSqTCL51GZPoGYrNL5nAstZUl7adxZHDqIO2C6tQ8m1jz0+Ssx6FbB9hO4MB
dmJFOidI11SugAAt4ijrTpSzJ2/SdpU9PNAp6y7lmtpMSNJMs0dz0kXhUVv4Wzbq
pf2GBjA84h7ZS/cktox/iTpSY+YFN64y0KtvoKlpbgLCPJiH/bnoxQ==
=YSKJ
-----END PGP SIGNATURE-----
--=-=-=--
