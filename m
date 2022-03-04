Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6A964CDE1B
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 21:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbiCDUGz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 15:06:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbiCDUGa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 15:06:30 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BEA9291CF0
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 12:01:40 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nQDjF-0002Ki-L8; Fri, 04 Mar 2022 20:36:41 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nQDjB-0000oj-QI; Fri, 04 Mar 2022 20:36:37 +0100
Date:   Fri, 4 Mar 2022 20:36:37 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: DWC3 Isoc Gadget Missed Interrupts on Start Transfer
Message-ID: <20220304193637.GM11577@pengutronix.de>
References: <20220302143539.GI11577@pengutronix.de>
 <73c5e6b4-8f68-9a6e-33e4-0c49c291ad94@synopsys.com>
 <20220303111526.GJ11577@pengutronix.de>
 <53d6666e-0a1e-08e9-9fe7-d73decf70fd6@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="75WsOQSofUOhcSOp"
Content-Disposition: inline
In-Reply-To: <53d6666e-0a1e-08e9-9fe7-d73decf70fd6@synopsys.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 20:26:31 up 84 days,  4:12, 76 users,  load average: 0.01, 0.07,
 0.12
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


--75WsOQSofUOhcSOp
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
>
>>
>> Is there any way the gadget driver could see if for that interval the
>> host did not poll for data? OR are there bits to get this behaviour
>> predictable and the driver to react on?
>>
>
>You can check if there any "missed service error" from host, it may give
>some clues, but not the whole picture.
>
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
>
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
>
>

I think I found the case:

=46rom my datasheet:

<quote>
  After a transfer has been started, the hardware will perform the followin=
g functions for
  IN endpoints:

  1. Fetch TX data as early as one interval prior to the beginning of the i=
nterval (call it A)
     if the HWO bit is set to one in the TRB.
  2. Decrement the buffer size of each TRB as packets are transmitted.
  3. Retire TRBs when their buffer size has reached 0, issuing an XferInPro=
gress event if
     the IOC bit is set.
  4. If the next interval (B) starts before all the packets have been trans=
mitted for interval A:
     a. Flush the TXFIFO.
     b. Retire the Buffer Descriptor of interval A with a "Missed Isochrono=
us" status.
     c. Retire the Buffer Descriptor of interval B with a "Missed Isochrono=
us" status.
     d. See Checking interval status for a description of how software can =
determine that
        an interval ended unexpectedly.
     e. Go to step 1 to prepare for interval C
  5. Otherwise, if all the TRBs of interval A are completed, the hardware w=
ill prepare for
     interval B.
</quote>

Could it be that in the observed case we just run directly into case 4
after issueing Stream Start. Since the frame interval we programm
is so close to the current running frame interval.

So actually applying the below patch would totally make sense. We could even
increase that to an higher number, just to make sure that we would not run =
into
an partially started frame interval when issueing the Start Transfer.


Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--75WsOQSofUOhcSOp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmIiakIACgkQC+njFXoe
LGT7+xAA1FTu4ofeAQbJHd0JSOyl+INWRgA9d+9X65X2PXWNULyc5ZGVA7aCRp1V
K42JmSALbjybB0M0XO2Ue+UZfeiTcocOP4tporZHLxWfwML7hse8XFinEetKEycR
kruSYjkMmGmMgO6sDyBy5xx0dxkaVrO/CHS7CJkkgn88i7+tegdvng29/t2o1Tpo
lUIbQiqi27t1ZjYPAMlILnLzZgn2LsXCSoq6yv87yjk8YMz2HYfBYm8JYBOsqLtb
eM3l/4i+91++97zotckhCAFEe5PbmtBl88wyBX5g8l0pEu0NSWMmfX+TfkdC+zGb
ijTB7T2NczaYbzkaqfUlt4DMFdgcArL8oMkPrsRZJ7Nd7OUThRwT3QXXflD6EVfK
DbS+e1D7a9pWhL8HnbmQZdUwCdvYmONTUqE8rz81sphFnhg3dOqW8ZiQEiHSM/TC
TN0KDKTN2J/0rrvM6mBiaUIeL0FmCRitXX9YcI2cDSMv06HNwCqnIhyZvxAsQ7Pu
PUYG2DDi7G6XC0Oz6u4drvABaEZbMHwgNVV4uFy0+qDY677fYE94R/0vfpNyalfk
D6RMDfITG6qa6n0xRA8TmzNuSN++mTHxqrJZbfVDaGnRLOWk29CHHyZ0Tx0QdTXs
0xLk7X0gcxHnHL7eo9XJFuQJmESk+GmlE7UEADfoeOQ9fam+c5g=
=BMJg
-----END PGP SIGNATURE-----

--75WsOQSofUOhcSOp--
