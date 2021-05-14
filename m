Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A947F380467
	for <lists+linux-usb@lfdr.de>; Fri, 14 May 2021 09:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbhENHhS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 May 2021 03:37:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:60934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230427AbhENHhS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 May 2021 03:37:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B21C61263;
        Fri, 14 May 2021 07:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620977767;
        bh=1SAEk0XeUJolB3AdWXEDo/ipeQYdGamR57+1nC8OIwA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=oCioIN8VZ+Ng/EH6cvNuD9NACuT4jlVctcw8OVpVnuXky4duLaBLPW1w9mFEzd+O7
         pucQAhg3z8/4eCAJgl/avXIT1kEHG3J4ovlcP/ELpOyLdhg7BfJ5Op2c+s1p7s6jDz
         UPjbmp2sMC1ZNRs3rX2C3YFlin8adLnC65KU+rOrdN76FM1C1QPmxl0wPyvJfCpNq8
         E1ThtuLPYNQcAz0j9RloAD8BT8cw0o02T0b+vsGT66kWTSihGTiXUXAdeTR0jdzR46
         Y5v4g5GpVm18IQyDyHwnGGhyN7PcsuGiTB29jDdeogNxL4WOwAPHdWyqqi0dlVEA2g
         dcEGDX4Rt1ubg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Disconnect race in Gadget core
In-Reply-To: <20210512153358.GC934575@rowland.harvard.edu>
References: <20210510152426.GE863718@rowland.harvard.edu>
 <87zgx2fskr.fsf@kernel.org> <20210510193849.GB873147@rowland.harvard.edu>
 <87r1idfzms.fsf@kernel.org> <20210511212651.GA914027@rowland.harvard.edu>
 <87lf8kfnc6.fsf@kernel.org> <20210512153358.GC934575@rowland.harvard.edu>
Date:   Fri, 14 May 2021 10:35:59 +0300
Message-ID: <87bl9d7oo0.fsf@kernel.org>
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
> On Wed, May 12, 2021 at 10:00:41AM +0300, Felipe Balbi wrote:
>>=20
>> > So in dwc3, for example: At what point do you abort all outstanding=20
>> > requests with -ESHUTDOWN status?  We don't want to do this before=20
>>=20
>> we do this as part of dwc3_remove_requests(). So, it's done either when
>> the relevant endpoint is disabled or as part of
>> dwc3_stop_active_transfers() which in turn is called from a (bus) reset
>> interrupt or when disconnecting pullups.
>
> I wish these sorts of questions had been answered in the original design=
=20
> of the gadget subsystem.  For example, does it even make sense for the=20
> UDC driver to disable endpoints on its own initiative?  Oh well, too=20
> late now...

heh, right. IMHO the UDC shouldn't do anything unless it's explicitly
requested. I would go as far as not even automatically starting SETUP
stage of ctrl transfer, but that's me.

>> >> I'm not against adding new udc methods to gadget ops, but it seems
>> >> fitting that udc_start/udc_stop would fit your description while some
>> >> new members could be given the task of priming the default control pi=
pe
>> >> to receive the first SETUP packet.
>> >>=20
>> >> What do you think?
>> >
>> > Starting things up when a new gadget driver binds doesn't seem to be s=
o=20
>> > much of a problem.  After all, the new driver isn't going to do anythi=
ng=20
>> > before the first SETUP packet arrives, since the gadget will be=20
>>=20
>> it could be an impact in power consumption, albeit minimal
>
> All right.  But at least it isn't an issue of correctness.

nope, it's not.

>> > unconfigured.  Unbinding and shutting down are the hard parts.
>> >
>> > I guess the ideal approach would be:
>> >
>> > 	First, the UDC driver basically turns off the UDC hardware.
>> > 	This means no more IRQs will be generated.  But pending requests
>> > 	remain pending until they are explicitly cancelled.
>>=20
>> right, that, I argue, is the responsibility of ->udc_stop()
>>=20
>> > 	Second, the gadget driver's unbind callback runs.  It should
>> > 	cancel any outstanding requests and generally release resources.
>>=20
>> correct. But that means we would require the gadget driver to initiate
>> cancelling of outstanding requests
>
> Or even better, disabling all endpoints.  That's a reasonable=20
> requirement.  Function drivers are expected to do that anyway whenever=20
> the composite core switches to a different configuration, aren't they?
>
> In some ways, unbinding is similar to switching to configuration 0 (not=20
> configured).

I agree. We have too many special cases in the gadget framework anyway.

>> > 	Third, the UDC driver WARNs about any requests that still exist
>> > 	and automatically releases them without doing any completion
>> > 	callbacks.  It also forgets about the gadget driver (this can't
>> > 	happen until after the gadget driver has cancelled its=20
>> > 	requests).
>> >
>> > Right now we are doing the first two steps in the opposite order.  Tha=
t=20
>> > would be okay, provided we could guarantee there are no more=20
>> > asynchronous callbacks once unbind is called (sort of like what Peter=
=20
>> > has done for configfs).  But it would be better to do the steps in the=
=20
>> > order shown above.  This does correspond to calling udc_stop first, as=
=20
>> > you suggest.
>>=20
>> right
>>=20
>> > But it also would mean splitting out the third step as something=20
>> > separate from udc_stop.  Not to mention some potentially serious=20
>> > updating of some UDC drivers.
>>=20
>> yeah, it would take quite a bit of effort.
>>=20
>> > On the other hand, there is something to be said for leaving the UDC=20
>> > operational until after the unbind callback.  If the gadget driver=20
>> > happened to be installing a new alternate setting at that time, say in=
 a=20
>> > workqueue thread, calls to activate new endpoints wouldn't suddenly ge=
t=20
>> > unexpected errors.
>>=20
>> Hmm, IIRC only the storage gadget defers work to another thread.
>
> Well, the composite core is built into almost every gadget, and doesn't=20
> it handle Set-Configuration and Set-Interface requests in a separate=20
> thread?  Or doesn't it expect function drivers to do so?

composite.c doesn't defer anything to a separate thread by itself. The
gadget driver, if it finds it necessary, should handle it
internally. Most gadget drivers handle all of this in interrupt context.

> After all, the gadget first learns about config or altsetting changes=20
> when it receives a Set-Configuration or Set-Interface request, which=20
> happens in interrupt context.  But changing configs or altsettings=20
> requires disabling/enabling endpoints, which needs a process context=20
> (see the kerneldoc for usb_ep_enable and usb_ep_disable).

Ouch, I don't think any driver is guaranteeing that other than the
storage gadget.

>> What
>> you describe can also happen today depending on how far into the future
>> the kthread is scheduled, no? So, how does storage gadget behave with
>> that today?
>
> I'm not clear on the details any more, but in essence the unbind routine=
=20
> takes great care to wait until any queued worker threads have completed=20
> or been successfully cancelled before it returns.

okay :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCeKF8RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUiJ4gf+JXcDV2LlNaLVE7sUttu4mBr1EiPlrDAA
gAcKbJau77BHIMxoBd1b4jeNUUbWfAcSll1Jfmx+QqAQCJk6PjoukceCLAJ7uE8x
VRfhPD6P3pJrmhVOe7i+/DYl7Y/7KCEG0xKvcdKzjLAXRPNS0fxbPlNCYdvL15xi
1JbiSFdf9qU7EXYKPrLQdDWvs91nekM26dPvj9TkrT+0FdNFbMyNtbMlzKtZq52x
V+iZrE1/e3nvlwGQHqUp5lw1ZsmrKYtiRp6v7shTetWqqTjDXqU3Ew/Mhrn57Iak
cVdWTAtkUDx27kLVQ09dVjs/ljmxroJnq3Aj59i4+2u8Ca9niBmdpA==
=p16X
-----END PGP SIGNATURE-----
--=-=-=--
