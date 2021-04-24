Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B508F36A168
	for <lists+linux-usb@lfdr.de>; Sat, 24 Apr 2021 15:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237325AbhDXNop (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Apr 2021 09:44:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:46636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237231AbhDXNom (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 24 Apr 2021 09:44:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3753361490;
        Sat, 24 Apr 2021 13:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619271844;
        bh=QSpW0855yACJaGDjVEsu5sQtePLViISFOpWHwoqi5ts=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=NpUHx4DBYWnUUQUzni4iMNKi4W1lIyT/xXoXwHp2mlTKkSsIBZ1YEpUVUfAcEE0aE
         HbRBg+HajDl8QgvmCsOmmSg4FIkKTVOfNkCyMaERs8mdDEALDU+h9Hdw+GrvCYVRer
         VHB6j4m7pdgJYjKxCJvK44NDo7G3rNiMXVQEU9fKZpY9aq/4Ph34BvEXxGxt11M4Xy
         EEOYT9xBhFoiqKyIopIkTyBCqqPzz/RXYOCbuQ0lAsDQdxOuN+Rp2WKSDJJaomZPqH
         gPUHwscf4l5VHhQSoMSUENSYSWUri0rEuTMmR5P+NFk9nS7aLGORZs1xVAIqRkuwYz
         JQwopp6JBC9GQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
In-Reply-To: <20210424091206.GF6975@pengutronix.de>
References: <20210421204837.4185-1-m.grzeschik@pengutronix.de>
 <20210421204837.4185-3-m.grzeschik@pengutronix.de>
 <87o8e6mvue.fsf@kernel.org> <20210422201812.GC6975@pengutronix.de>
 <871rb1msmx.fsf@kernel.org> <20210423102738.GD6975@pengutronix.de>
 <87y2d9l0a2.fsf@kernel.org> <20210423131807.GE6975@pengutronix.de>
 <87k0osksgo.fsf@kernel.org> <20210424091206.GF6975@pengutronix.de>
Date:   Sat, 24 Apr 2021 16:43:57 +0300
Message-ID: <87eeezlrvm.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


HI,

Michael Grzeschik <mgr@pengutronix.de> writes:

<big snip>

>>>>> kworker/u5:1-74      [000] d..2    56.807831: dwc3_ep_queue: ep2in: r=
eq 00000000f5394c5d length 0/3072 zsi =3D=3D> -115
>>>>> kworker/u5:1-74      [000] d..2    56.807857: dwc3_ep_queue: ep2in: r=
eq 00000000ef95b55c length 0/3072 zsi =3D=3D> -115
>>>>> kworker/u5:1-74      [000] d..2    56.807883: dwc3_ep_queue: ep2in: r=
eq 00000000d36cf0cc length 0/3072 zsi =3D=3D> -115
>>>>> kworker/u5:1-74      [000] d..2    56.807908: dwc3_ep_queue: ep2in: r=
eq 00000000c5f1bd4b length 0/3072 zsi =3D=3D> -115
>>>>> kworker/u5:1-74      [000] d..2    56.807934: dwc3_ep_queue: ep2in: r=
eq 00000000b7180b2d length 0/3072 zsi =3D=3D> -115
>>>>> kworker/u5:1-74      [000] d..2    56.807960: dwc3_ep_queue: ep2in: r=
eq 000000005d629ded length 0/3072 zsi =3D=3D> -115
>>>>> kworker/u5:1-74      [000] d..2    56.807985: dwc3_ep_queue: ep2in: r=
eq 0000000062e02cc0 length 0/3072 zsi =3D=3D> -115
>>>>> kworker/u5:1-74      [000] d..2    56.808011: dwc3_ep_queue: ep2in: r=
eq 000000001d2ec1c0 length 0/3072 zsi =3D=3D> -115
>>>>> kworker/u5:1-74      [000] d..2    56.808038: dwc3_ep_queue: ep2in: r=
eq 0000000018ba3d29 length 0/3072 zsi =3D=3D> -115
>>>>> kworker/u5:1-74      [000] d..2    56.808063: dwc3_ep_queue: ep2in: r=
eq 000000000be47fc7 length 0/3072 zsi =3D=3D> -115
>>>>> kworker/u5:1-74      [000] d..2    56.808089: dwc3_ep_queue: ep2in: r=
eq 00000000caba09e2 length 0/3072 zsi =3D=3D> -115
>>>>> kworker/u5:1-74      [000] d..2    56.808115: dwc3_ep_queue: ep2in: r=
eq 00000000cb0191c4 length 0/3072 zsi =3D=3D> -115
>>>>> kworker/u5:1-74      [000] d..2    56.808140: dwc3_ep_queue: ep2in: r=
eq 000000005255f606 length 0/3072 zsi =3D=3D> -115
>>>>>  irq/51-dwc3-239     [000] d..1    56.808240: dwc3_event: event (d1d0=
408a): ep2in: Transfer In Progress [0000d1d0] (sIm)
>>>>
>>>>eventually we get Transfer In Progress for the first TRB...
>>>>
>>>>>  irq/51-dwc3-239     [000] d..1    56.808246: dwc3_complete_trb: ep2i=
n: trb 000000007ebd2707 (E2:D1) buf 000000000c623058 size 1x 0 ctrl 3474046=
4:0000d1d0 (hlCs:Sc:isoc-first)
>>>>>  irq/51-dwc3-239     [000] d..1    56.808250: dwc3_complete_trb: ep2i=
n: trb 0000000093bb2bc4 (E2:D2) buf 000000000e200000 size 1x 0 ctrl 34740c7=
0:0000d1d0 (hlcs:SC:isoc)
>>>>>  irq/51-dwc3-239     [000] d..1    56.808256: dwc3_gadget_giveback: e=
p2in: req 00000000823b0b62 length 3072/3072 zsI =3D=3D> 0
>>>>
>>>>complete and give it back.
>>>>
>>>>>  irq/51-dwc3-239     [000] d..1    56.808305: dwc3_prepare_trb: ep2in=
: trb 000000004af35733 (E3:D2) buf 000000000c623088 size 1x 2 ctrl 00000465=
:00000000 (HlCs:Sc:isoc-first)
>>>>>  irq/51-dwc3-239     [000] d..1    56.808309: dwc3_prepare_trb: ep2in=
: trb 00000000a11671a8 (E4:D2) buf 000000000e200bfe size 1x 3070 ctrl 00000=
471:00000000 (Hlcs:Sc:isoc)
>>>>
>>>>prepare the next
>>>>
>>>>>  irq/51-dwc3-239     [000] d..1    56.808320: dwc3_gadget_ep_cmd: ep2=
in: cmd 'Update Transfer' [50407] params 00000000 00000000 00000000 --> sta=
tus: Successful
>>>>
>>>>kick it by telling the HW about it. I don't see any failures here,
>>>>although there may be situations where we could add more data to the
>>>>controller's cache early on.
>>>
>>> I back that Idea of adding more data to the controllers cache early.
>>
>>right, and that's where things get complicated because we don't have
>>enough information from ISOC endpoints to schedule transfers to correct
>>microframes. We're missing two bits which are only shared with us by the
>>HW during XferInProgress and XferNotReady (IIRC).
>
> No! For Isoc we never miss these bits. I understand that driver part
> already good enough.
>
> Because once the transfer is started every ep_queue (respectively every
> update transfer) will only add trbs to the running transfer. These
> updates have no timestamp information. Just look into the update
> transfer command.

right, the details of that are fuzzy for me since I haven't directly
touched this part of the driver in quite a while but IIRC, Update
Transfer should be used only to add transfer to the current *service
interval*; meaning that if you continuously Update Transfer, you will
run into bus expiry.

Thinh, any chance you can shed some light here?

> When the update transfer is called not later than the last trb from the
> current transfer was handled in hardware, then everything will run
> smooth. In the other case, when the update transfer was called after the

Sure, but this poses another requirement on the Gadget API that
transfers must be ready in a timely fashion. Currently, there's no way
for gadget driver to guarantee this requirement, specially since for
video frames processing is off-loaded to a userspace component. The
latency involved here may be quite large.

I have memories that what you say is exactly what we used to do but it
turned out that it was far too easy to get out of sync between dwc3,
g_webcam and the userspace component.

> trbs from the current transfer did run out we will receive a missed
> interrupt for that new udpated trb and the driver needs to call end
> transfer so a new one is started.

True, that's not handled as of yet, IIRC. We return -EXDEV to the gadget
driver but don't really issue End Transfer

(/me checks gadget.c)

Nope, scratch that, we _do_ issue End Transfer, so something like this
*could* work. I'm still worried about the PENDING_REQUEST flag never
being cleared, though.

>>> The second one you see is already way to late for an update. It comes
>>> back as an Missed Interrupt as the Update was to late for the transfer.
>>>
>>> "irq/51-dwc3-239     [000] d..1    56.808460: dwc3_event: event (d1d180=
8a): ep2in: Transfer In Progress [0000d1d1] (siM)"
>>>
>>> After the missed transfer the last transfer will be ended and another t=
ransfer is prepared.
>>>
>>> "irq/51-dwc3-239     [000] d..1    56.815974: dwc3_event: event (d20e10=
ca): ep2in: Transfer Not Ready [0000d20e] (Not Active)"
>>>
>>> But after that and an successfull next start transfer no further comple=
tion interrupts will
>>> show up. That seems broken.
>>
>>oh, that's messed up. We should get XferInProgress.
>
> Should we? Look into the comment in transfer_not_ready call. So this in
> our case is the caller of __dwc3_gadget_start_isoc -> dwc3_prepare_trbs -=
> kick_transfer
> for the one next trb in the pending list.
>
> 3047 static void dwc3_gadget_endpoint_transfer_not_ready(struct dwc3_ep *=
dep,
> 3048                 const struct dwc3_event_depevt *event)
> 3049 {
> 3050         dwc3_gadget_endpoint_frame_from_event(dep, event);
> 3051
> 3052         /*
> 3053          * The XferNotReady event is generated only once before the =
endpoint
> 3054          * starts. It will be generated again when END_TRANSFER comm=
and is
> 3055          * issued. For some controller versions, the XferNotReady ev=
ent may be
> 3056          * generated while the END_TRANSFER command is still in proc=
ess. Ignore
> 3057          * it and wait for the next XferNotReady event after the com=
mand is
> 3058          * completed.
> 3059          */
> 3060         if (dep->flags & DWC3_EP_END_TRANSFER_PENDING)
> 3061                 return;
> 3062
> 3063         (void) __dwc3_gadget_start_isoc(dep);
> 3064 }

that came from commit 36f05d36b03523da906cf2ae70ec31af6f57e94c. I don't
think the intention was for that to apply in this particular case. Thinh?

>>> "irq/51-dwc3-239     [000] d..1    56.815996: dwc3_gadget_ep_cmd: ep2in=
: cmd 'Start Transfer' [d2120406] params 00000000 0a6ab040 00000000 --> sta=
tus: Successful"
>>>
>>> It looks like the underlying issue I could avoid with my patches. Howev=
er not
>>> updating the transfer and running into missed interrupts is another iss=
ue
>>> that needs to be solved.
>>
>>my concern is that you may be regressing other parts of the driver :-)
>
> We should obviously check for that. But for isoc I did not see any proble=
m.

Did you test both audio and video gadgets? HS and SS?

>>How about we look into the fact that PENDING_REQUEST is never cleared
>>first?
>
> We can do that as well. But my head is issueing the pre-starting task now=
! :)

heh :-) As I mentioned, I fear we may end up opening a can of worms if
we change this part without guaranteeing that all the driver flags are
in the correct state first.

>>>>I remember dealing with a bunch of Bus Expiry errors in the past and the
>>>>problem was because we couldn't maintain proper alignment with the
>>>>microframe number because HW only gives us 14 out of the 16 bits of the
>>>>microframe number, the only workaround was to waiting for
>>>>XferInProgress/XferNotReady to get that number.
>>>
>>> I think the bus expiry or microframe handling is not a problem here.
>>
>>Not in this case because we're never pre-starting transfers. What you
>>suggest will pre-start transfers and we will have regressions.
>
> I did that, and did never see any regressions, as I explained above. Othe=
rwise
> I would have checked for another solution, than my initial two patches.

So you tested on your usecase, with one platform. We would need more
people testing this if we want any chance of avoiding regressions, and I
still think fixing the bad flags is more important first because that
flag is used exactly to make decisions regarding Isochronous transfers.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCEIJ0RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYgKQ//dMG2tUDZd6e9ExWQ+URVWtcf9S6sBNhk
BfIFnJaCxmpNMqksCclug6YpPtOHRNc7447pmgGxTNkV33p/Lbhh39GLLtQscUTD
OsmFH8zZo6Idb72n8yggLUbRz0IoY3vSUqBRBfzgku2fHA/RLGGZZ+3EFs9OEINf
ke5QSIYgVONilzcIbhoDXh9DF4oEdvrjwixziHaUJKhpjZcDaGv7b5agsxXFJOH4
rtgLYhOZGRldD5l7M1I5EmsLpANfLGqMOc056vi/HKZTgLn+OBxMNEvBuNw9sIUx
Se07hBCm1vZNCHDHLE4KZ0NDUGmeX7ay9+b3+Go65aVguy4bGc4yFqJZAADTYM4M
boqX/Z6FAIAFbU4gZx1KwFCzf7/hwY3pShjz8JiziG+iQlYUqKTA7RUpKuqMts4U
B+Hvzu1uBVScrUOKlM4dUM6VLfIGDzGT7ywGZ5N9YWu7ONH6bd+T3XvDCJtPNp0K
EI2slzBJLvdbw9gwmPDN/bbXNLG4VlGtWB+4KM9s4+5F1LfvDl5RR6OwrYOhyH15
oXmnSaK8OCw5oiRnichK5B0uq9Gjw4Kcw5o0I36dO8JPbY5X88FEMrfP98fp6Fdu
dUterY816thjTpBWmx3Ot66JGebjsQ3lNvtDEGN4jgbref7nCmh0BK98FHAYJBY5
tC8IVVMhy/o=
=JNn6
-----END PGP SIGNATURE-----
--=-=-=--
