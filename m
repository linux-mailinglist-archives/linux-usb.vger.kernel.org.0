Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D08B84CCF30
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 08:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237846AbiCDHmm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 02:42:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231557AbiCDHmm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 02:42:42 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38F7192E05
        for <linux-usb@vger.kernel.org>; Thu,  3 Mar 2022 23:41:54 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nQ2ZS-00063w-CT; Fri, 04 Mar 2022 08:41:50 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nQ2ZQ-0008KE-Jl; Fri, 04 Mar 2022 08:41:48 +0100
Date:   Fri, 4 Mar 2022 08:41:48 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: DWC3 Isoc Gadget Missed Interrupts on Start Transfer
Message-ID: <20220304074148.GL11577@pengutronix.de>
References: <20220302143539.GI11577@pengutronix.de>
 <73c5e6b4-8f68-9a6e-33e4-0c49c291ad94@synopsys.com>
 <20220303111526.GJ11577@pengutronix.de>
 <53d6666e-0a1e-08e9-9fe7-d73decf70fd6@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ms5iOKSBOB9YS8zC"
Content-Disposition: inline
In-Reply-To: <53d6666e-0a1e-08e9-9fe7-d73decf70fd6@synopsys.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:22:06 up 83 days, 16:07, 62 users,  load average: 0.05, 0.12,
 0.13
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--Ms5iOKSBOB9YS8zC
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2022 at 01:43:00AM +0000, Thinh Nguyen wrote:
>Michael Grzeschik wrote:
>> On Wed, Mar 02, 2022 at 10:22:55PM +0000, Thinh Nguyen wrote:
>>> Michael Grzeschik wrote:
>>>> I am currently debugging a strange error with transferring isoc reques=
ts
>>>> with
>>>> the current mainline driver.
>>>>
>>>> When the pending and started list is empty the complete interrupt
>>>> handler is
>>>> sending an End Transfer to the controller. This End Transfer will
>>>> then get
>>>> successfully completed.
>>>>
>>>> =A0=A0=A0 irq/50-dwc3-305=A0=A0=A0=A0 [000] d..1.=A0=A0 166.661845: dw=
c3_gadget_ep_cmd:
>>>> ep5in: cmd 'End Transfer' [b0d08] params 00000000 00000000 00000000 -->
>>>> status: Successful
>>>> =A0=A0=A0 irq/50-dwc3-305=A0=A0=A0=A0 [000] d..1.=A0=A0 166.661877: dw=
c3_event: event
>>>> (080b01d6): ep5in: Endpoint Command Complete
>>>> =A0=A0=A0 irq/50-dwc3-305=A0=A0=A0=A0 [000] d..1.=A0=A0 166.661979: dw=
c3_event: event
>>>> (482a10d6): ep5in: Transfer Not Ready [0000482a] (Not Active)
>>>>
>>>>
>>>> After this the Transfer needs to start again. But unfortunately this
>>>> sometimes
>>>> does not succeed. You see in the following trace that the Start of
>>>> the just
>>>> prepared trbs did complete with an -18.
>>>>
>>>> =A0=A0 kworker/u5:2-347=A0=A0=A0=A0 [001] d..2.=A0=A0 166.691288: dwc3=
_prepare_trb:
>>>> ep5in: trb 000000007ff95a12 (E233:D232) buf 0000ffffffb1c2a8 size 1x 12
>>>> ctrl 00000465:00000000 (HlCs:Sc:isoc-first)
>>>> =A0=A0 kworker/u5:2-347=A0=A0=A0=A0 [001] d..2.=A0=A0 166.691293: dwc3=
_prepare_trb:
>>>> ep5in: trb 00000000f9cd175e (E234:D232) buf 0000ffffffb1d000 size 1x
>>>> 7156 ctrl 00000471:00000000 (Hlcs:Sc:isoc)
>>
>> [snip]
>>
>>>>
>>>> The intermediate Bus Expiry is not always present in that case, but al=
so
>>>> completely acceptable as we loop
>>>> over the Start Transfer until this succeeds.
>>>>
>>>> Do you have any Idea why this succeeded Start Streaming does come back
>>>> with an
>>>> Missed Transfer on the first trb?
>>>>
>>>
>>> Hi Michael,
>>>
>>> When sending the trace, please leave it unfiltered. It's missing some
>>> trace events that I want to check.
>>
>> Right, it was a mix of trace_event:dwc3:* and ftrace_filter=3Ddwc*. So I
>> kind of felt filtering out the interesting part would help.
>>
>> Anyway. Here is the same situation in another trace, with all
>> trace_events from dwc3:
>>
>
><snip>
>
>>
>>> Please check if the host is actually polling for data at that uframe.
>>> Each TRB is scheduled for a particular interval. If the host doesn't
>>> request for data at that particular interval, then it's a missed isoc
>>> also (err -18). So, if you have a usb traffic analyzer, please verify
>>> this. Also, maybe try with a different host vendor to see if the
>>> behavior is the same.
>>
>> The behavior seems to differ if I attach different hosts. I have no
>> traffic analyzer. Would usbmon under linux host work for that? How would
>
>usbmon doesn't see usb packet level. So no, usbmon doesn't work.
>
>> I synchronize the gadget request and host urbs to know which frame
>> interval would have been the one that was missed in my logs?
>
>It will be difficult. You'd have to check the expected interval the urb
>was scheduled for from xhci driver, and you may have to check the
>MFINDEX. You'd also need to determine a point of reference that the data
>received from device is for a particular interval. Even if you have all
>this info, you'd have to assume everything the host controller reported
>is accurate and not missing anything.

Right. But as I have no analyzer, this option is out of scope for now.
And as you further describe the likelihood for the host being the cause
is also very low.

I also was looking into another direction and was suspecting the
frame_length not being properly configured.

In my system the ref_clk is 100MHz so the period is 10ns. That is
also what is configured in dts with snps,ref-clock-period-ns =3D <10>;

The default for xilinx is <50> so 25MHz. It seemed that changing this
had completely no effect on the transfers. I had expected that this
would change at least the stability.

The fladj is also 0 in all cases. Do I miss something here?

>> Is there any way the gadget driver could see if for that interval the
>> host did not poll for data? OR are there bits to get this behaviour
>> predictable and the driver to react on?
>>
>
>You can check if there any "missed service error" from host, it may give
>some clues, but not the whole picture.

Alright, I will check for that option.

>> Otherwise, why should on an ongoing stream the host not poll
>> for data in any interval. What would be the constraints to
>> ignore one interval.
>
>The host driver may not intentionally does it. There are many reasons
>where the host controller not poll for data, and I've seen it often. It
>can be because of the driver handling interrupt latency/delay that
>prevents the driver from feeding isoc TD/TRBs to the controller in time,
>causing underflow and starve the controller. Some other time it's the
>controller that decided the bandwidth is not sufficient for isoc
>transfer or phy signal instability and cause a missed service error etc.

I also think latency is the point here. I had a patch laying around that
was counting the queued requests but only kicked the start transfer
after one defined threshold was reached. This seemed to help with the
missed interrupts. But unfortunately this approach introduced other
issues. For being absolute save I had to put this threshold very high.
But when in rare cases the Frame that was ment to be enqueued was very
small the full amount of data could reach under that threshold and
stall the whole pipeline, since this frame was then never kicked. I
could sprinkle some timeout handling around it. To ensure that after a
minimum time the last queue will definitely start. But this seemed to be
a very hacky approach.

>Anyway, in this particular case, from my experience, I don't think it's
>the host that's missing a poll. It's probably because the device
>scheduling it too aggressively early. Can you try to schedule on the 2nd
>interval instead and see if it helps in your case.
>
>diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>index 3e75eaa13abc..b9ec7626b080 100644
>--- a/drivers/usb/dwc3/gadget.c
>+++ b/drivers/usb/dwc3/gadget.c
>@@ -2104,7 +2104,7 @@ static int __dwc3_gadget_start_isoc(struct dwc3_ep
>*dep)
>        }
>
>        for (i =3D 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
>-               dep->frame_number =3D DWC3_ALIGN_FRAME(dep, i + 1);
>+               dep->frame_number =3D DWC3_ALIGN_FRAME(dep, i + 2);
>
>                ret =3D __dwc3_gadget_kick_transfer(dep);
>                if (ret !=3D -EAGAIN)

I also had this patch applied. I just tested it jet with + 3 instead
and it did stop showing the missed interrupts. Is this a valid patch
for mainline? I had my doubts, so missed to send it yet.

>Also, there's another issue in the dwc3 driver. Currently it checks the
>event status and reported it to all the requests. I notice that you (or
>the device UVC) don't set interrupt for every request but about every
>10th request? Not all of the completed requests failed with missed isoc,
>but the interrupt event status incorrectly set -18 for all of them. The
>dwc3 driver should check the TRB status for each individual TRB and
>return the proper status to the associated request.

Oh! This is where the multiple -18 are coming from. I did not have time
to look for that. But it totally makes sense.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--Ms5iOKSBOB9YS8zC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmIhwrkACgkQC+njFXoe
LGSbVBAAx90AZx7w6EeKqcnouEvCyQWOi3JAOLERIcbWF4FXDV7hgTPRB64i/aQA
07TmeNiQwg8gZ6l+YLhXo5EoTnFu48M+YoJX3dsZ/pRRfdMGOXwOvdi9bC9L65x0
lfujZN9oL00zUynCDOdX1p+zincwMK44lUbuzVgucuiTssxxYCO009gyGjgG2Kbt
B/kgXiltDEApXKSOi67QKn2Sz0AlW5tJHe7Kp3qYUTOFRctkHwkl5L9GTCL/qe61
bTqm4Tf8GsE+n5o7wjGBvppsViKS4vWAE6VO3ZEjAXMjluqqIdE13fUq+l9wRbwl
f7YgljxdSLRAscYyKjfiwFu/kKj7nRt0RRgt4Kn94Ls5M7eUjTfYYL2n5h9yirdf
3kryiWwjWnF3O36WbvOqouZl3Zmbb3GnSnfllqf5LxBnRKO3+2deQV00gnFqzJC3
/wUeG0Xffm4cm/QCGgFHv6SX/6HaWRHyW7Irqn3piKH0x9t1GaNnxrlh4S2rbIOz
+s0IrQnrqlCjfvLGDAIvrB8havveeUItUfa6IMzMs8mPy7DeNtzMKTMohAAsD2ZK
AkhSAsCTFR9/hfHDrpwYg3UuXls6rPQI9GQBRxc6OJ44hOLN0CSCYJ4Mgbn+HjkC
sYuILDRPaB6lSCULVVuZTbGWW/Z8FhX7SNLxTCyTwdF790oOvaY=
=mjWu
-----END PGP SIGNATURE-----

--Ms5iOKSBOB9YS8zC--
