Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB4F37A20F
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 10:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhEKIcj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 04:32:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:42538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230452AbhEKIci (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 May 2021 04:32:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8945B61933;
        Tue, 11 May 2021 08:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620721383;
        bh=wSCejgAZuiQK2Ky1pWRhARmxa/cc/6qspi64GjSmEqY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=o9Pw+hnm53fbSi2JIsM9NURVSZtmoOsIFa4olvMjqdG2iZ3jN3CLYXWY/Hj9bijgB
         eikBsA9YPT2ypgW+BeNEWlLMorc6IVCuLyHBCgCUT4R7SSdygOARoLLwQfDWYvNYQz
         sliZVooIxZOgeLobltw5xF9smVnk8a6iv9yMAaikZLDT/uvT4uGQ06dDpklb6cFBlJ
         hYV6Q7fZmYq1sizrT3eiBYinRgRy3Km0Eo2noC5Rh8i0flkXkJ7oNw1AJrvAPkPg3H
         5iI5UmJIBrlDChgqm5YG2KXWVCpMASweKfr1kcykwUtmORUemVXINpVEwbS5Ai+TIU
         ey35E5WIIlspQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Disconnect race in Gadget core
In-Reply-To: <20210510193849.GB873147@rowland.harvard.edu>
References: <20210510152426.GE863718@rowland.harvard.edu>
 <87zgx2fskr.fsf@kernel.org> <20210510193849.GB873147@rowland.harvard.edu>
Date:   Tue, 11 May 2021 11:22:51 +0300
Message-ID: <87r1idfzms.fsf@kernel.org>
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
>> > I just noticed this potential race in the Gadget core, specifically, i=
n=20
>> > usb_gadget_remove_driver.  Here's the relevant code:
>> >
>> > 	usb_gadget_disconnect(udc->gadget);
>> > 	if (udc->gadget->irq)
>> > 		synchronize_irq(udc->gadget->irq);
>> > 	udc->driver->unbind(udc->gadget);
>> > 	usb_gadget_udc_stop(udc);
>> >
>> > usb_gadget_disconnect will turn off the D+ pull-up, telling the host (=
or=20
>> > upstream hub) that the gadget is no longer connected to the bus.  The=
=20
>> > udc->driver->unbind call then tells the gadget driver that it will no=
=20
>> > longer receive any callbacks from the UDC driver or the gadget core.
>> >
>> > Now suppose that at just this moment, the user unplugs the USB cable.=
=20=20
>> > The UDC driver will notice that the Vbus voltage has gone away and wil=
l=20
>> > invoke the gadget driver's ->disconnect callback.  After all, it doesn=
't=20
>> > realize it should avoid making these callbacks until usb_gadget_udc_st=
op=20
>> > has run.
>> >
>> > As a result, the gadget driver's disconnect callback may be invoked=20
>> > _after_ the driver has been unbound from the gadget.
>>=20
>> argh, nice catch!
>>=20
>> > How should we fix this potential problem?
>>=20
>> I think we can just move usb_gadget_udc_stop(). Looking at a few udcs,
>> they're just either freeing or masking UDC's interrupts which should
>> prevent the race you describe while also making sure that no further
>> interrupts will trigger.
>>=20
>> Perhaps we could move udc_stop() before synchronize_irq(). Do you
>> foresee any issues with that for net2272 or dummy?
>
> I don't think it will be that easy.  As you may remember, there have=20
> been a number of commits over the years fiddling with the order of=20
> operations during gadget driver unbinding (although I don't think any of=
=20
> them moved udc_stop from its position at the end).  Still, it's a=20
> delicate matter.
>
> The purpose of synchronize_irq is to wait until any currently running=20
> IRQ handlers have finished.  Obviously this doesn't do any good unless=20
> the software has arranged beforehand that no new interrupt requests will=
=20
> be generated.  In this case, turning off the pull-up is currently not=20
> sufficient.  But waiting until after udc_stop has returned isn't the=20
> answer; it wouldn't prevent callbacks from being issued between the=20
> unbind and the udc_stop.
>
> And I'm quite sure that calling udc_stop before unbind would be wrong.=20=
=20
> The gadget driver would then get various errors (like requests=20
> completing with -ESHUTDOWN status) it's not prepared to handle.
>
> So what we need is a way to tell the UDC driver to stop issuing=20
> callbacks.  The ones defined in struct usb_gadget_driver are:
>
> 	bind and unbind,
> 	bus suspend and bus resume,
> 	setup,
> 	bus reset,
> 	disconnect.
>
> Bind and unbind aren't relevant for this discussion because they are=20
> synchronous, not invoked in response to interrupts.
>
> In theory there shouldn't be any bus-resume, setup, or bus-reset=20
> interrupts once the pull-up is turned off, but it would be good to=20
> protect against bad hardware which may produce them.
>
> Bus suspend is a real possibility.  It occurs when the UDC hasn't=20
> received any packets for a few milliseconds, which certainly will be the=
=20
> case when the pull-up is off.  UDC hardware and drivers may or may not=20
> be smart enough to realize that under this circumstance, lack of packets=
=20
> shouldn't be reported as a bus suspend.
>
> And of course, a cable disconnect can occur at any time -- nothing we=20
> can do about that.
>
> Putting it all together, we need to tell the UDC driver, somewhere=20
> between turning the pull-up off and doing the synchronize_irq, to stop=20
> issuing disconnect (and possibly also setup and suspend) callbacks.  I=20
> don't think we can use the pull-up call for this purpose; a gadget=20
> driver may want for some reason to disconnect logically from the bus=20
> while still knowing whether Vbus is present.  (You may disagree about=20
> that, but otherwise what's the point of having a disconnect callback in=20
> the first place?)
>
> Which means in the end that struct usb_gadget_ops needs either to have a=
=20
> new callback for this purpose or to have an existing callback augmented=20
> (for example, the ->pullup callback could get an additional argument=20
> saying whether to continue issuing callbacks).  Or another possibility=20
> is to make UDC drivers call a core routine to do disconnect callbacks=20
> instead of issuing those callbacks themselves, and have the core filter=20
> out callbacks that come at the wrong time.  Either way, every UDC driver=
=20
> would need to be modified.
>
> What do you think?  Is this reasoning accurate, or have I missed=20
> something?

Right, I'm arguing that, perhaps, ->udc_stop() is the one that should
have said semantics. For starters, 'stop' has a very clear meaning and,
considering my quick review of 3 or 4 UDC drivers, they are just masking
or releasing interrupts which would prevent ->suspend() and
=2D>disconnect() from being called. It could be, however, that if we
change the semantics of udc_stop to fit your description above,
=2D>udc_start() may have to change accordingly. Using dwc3 as an example,
here are the relevant implementations:

> static int dwc3_gadget_start(struct usb_gadget *g,
> 		struct usb_gadget_driver *driver)
> {
> 	struct dwc3		*dwc =3D gadget_to_dwc(g);
> 	unsigned long		flags;
> 	int			ret;
> 	int			irq;
>
> 	irq =3D dwc->irq_gadget;
> 	ret =3D request_threaded_irq(irq, dwc3_interrupt, dwc3_thread_interrupt,
> 			IRQF_SHARED, "dwc3", dwc->ev_buf);

request interrupt line and enable it. Prepare the udc to call gadget ops.

> 	if (ret) {
> 		dev_err(dwc->dev, "failed to request irq #%d --> %d\n",
> 				irq, ret);
> 		return ret;
> 	}
>
> 	spin_lock_irqsave(&dwc->lock, flags);
> 	dwc->gadget_driver	=3D driver;

internal pointer cached for convenience

> 	spin_unlock_irqrestore(&dwc->lock, flags);
>
> 	return 0;
> }
>
> static int dwc3_gadget_stop(struct usb_gadget *g)
> {
> 	struct dwc3		*dwc =3D gadget_to_dwc(g);
> 	unsigned long		flags;
>
> 	spin_lock_irqsave(&dwc->lock, flags);
> 	dwc->gadget_driver	=3D NULL;
> 	spin_unlock_irqrestore(&dwc->lock, flags);
>
> 	free_irq(dwc->irq_gadget, dwc->ev_buf);

drop the interrupt line. This makes the synchronize_irq() call
irrelevant in usb_gadget_remove_driver().

I'm not against adding new udc methods to gadget ops, but it seems
fitting that udc_start/udc_stop would fit your description while some
new members could be given the task of priming the default control pipe
to receive the first SETUP packet.

What do you think?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCaPtsRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjY3gf6AilceJGcgJyzBJklMilVmC7d8QH6uWh/
gxcQUohF1YebDxyNg3Hb+ZUK0o807Qy5OlvsZjZ4If00O2S/2BeDegp2pGEco86y
j6zwLPW5/YRXcB4TTnbEeajakV98WyqureXiMxXEO2Agrh3P+np18OGXTIEY22zA
Um1Ig4UGmtB6FE03NV58dP1LKW0CJ54OpDRpiMi4P+9A6l63PwYLBtV5mOFSc6sg
Pv3o5W7vZQFjEaweUritsuz2fA90ECs+SCN/QvJTkBtWn87nrN4uB0jDU6AxnuPm
ba93aPmDbsckLjzQ9KaySFAs/TwqyWFkNDHusihf53gHmBX/L5PaEw==
=odxJ
-----END PGP SIGNATURE-----
--=-=-=--
