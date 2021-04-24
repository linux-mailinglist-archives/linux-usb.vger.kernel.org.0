Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B49236A07C
	for <lists+linux-usb@lfdr.de>; Sat, 24 Apr 2021 11:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbhDXJMy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Apr 2021 05:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbhDXJMs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Apr 2021 05:12:48 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C57DCC061574
        for <linux-usb@vger.kernel.org>; Sat, 24 Apr 2021 02:12:10 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1laEKd-0007WH-Kh; Sat, 24 Apr 2021 11:12:07 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1laEKc-0004n0-79; Sat, 24 Apr 2021 11:12:06 +0200
Date:   Sat, 24 Apr 2021 11:12:06 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
Message-ID: <20210424091206.GF6975@pengutronix.de>
References: <20210421204837.4185-1-m.grzeschik@pengutronix.de>
 <20210421204837.4185-3-m.grzeschik@pengutronix.de>
 <87o8e6mvue.fsf@kernel.org>
 <20210422201812.GC6975@pengutronix.de>
 <871rb1msmx.fsf@kernel.org>
 <20210423102738.GD6975@pengutronix.de>
 <87y2d9l0a2.fsf@kernel.org>
 <20210423131807.GE6975@pengutronix.de>
 <87k0osksgo.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7CZp05NP8/gJM8Cl"
Content-Disposition: inline
In-Reply-To: <87k0osksgo.fsf@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:49:52 up 65 days, 12:13, 63 users,  load average: 0.06, 0.06,
 0.05
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--7CZp05NP8/gJM8Cl
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Sat, Apr 24, 2021 at 11:16:39AM +0300, Felipe Balbi wrote:
>
>Hi,
>
>Michael Grzeschik <mgr@pengutronix.de> writes:
>>>>>>>> @@ -2887,7 +2887,7 @@ static int dwc3_gadget_ep_reclaim_trb_linear=
(struct dwc3_ep *dep,
>>>>>>>>
>>>>>>>>  static bool dwc3_gadget_ep_request_completed(struct dwc3_request =
*req)
>>>>>>>>  {
>>>>>>>> -	return req->num_pending_sgs =3D=3D 0;
>>>>>>>> +	return req->num_queued_sgs =3D=3D 0;
>>>>>>>
>>>>>>>nope, request is, indeed, completed when there no more pending entri=
es
>>>>>>>to be consumed.
>>>>>>>
>>>>>>>What sort of problem are you dealing with? Got any way of reproducing
>>>>>>>it? Got some trace output showing the issue?
>>>>>>
>>>>>> I digged a little bit deeper to fully understand the issue here. What
>>>>>> I found is that in dwc3_prepare_trbs will make two assumptions on
>>>>>> num_pending_sgs.
>>>>>>
>>>>>> When the real purpose of the variable is to track the dequeued trbs.
>>>>>
>>>>>its purpose is *not* to track the dequeued trbs.
>>>>>
>>>>>> Than we have to fix the started list handling in the dwc3_prepare_tr=
bs.
>>>>>>
>>>>>> The comment in the function says:
>>>>>>
>>>>>>          /*
>>>>>>           * We can get in a situation where there's a request in the=
 started list
>>>>>>           * but there weren't enough TRBs to fully kick it in the fi=
rst time
>>>>>>           * around, so it has been waiting for more TRBs to be freed=
 up.
>>>>>>           *
>>>>>>           * In that case, we should check if we have a request with =
pending_sgs
>>>>>>           * in the started list and prepare TRBs for that request fi=
rst,
>>>>>>           * otherwise we will prepare TRBs completely out of order a=
nd that will
>>>>>>           * break things.
>>>>>>           */
>>>>>>          list_for_each_entry(req, &dep->started_list, list) {
>>>>>> 		if (req->num_pending_sgs > 0) {
>>>>>> 		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>>>>
>>>>>> This condition seems to be made on a wrong assumption, thinking the
>>>>>> num_pending_sgs was decremented after dwc3_prepare_one_trb was calle=
d on parts
>>>>>> of that requests sgs but not all.
>>>>>
>>>>>say num_mapped_sgs =3D 500. The driver has 255 TRBs for use (+1 link
>>>>>trb). Clearly not all SGs will fit in one go. Driver will set
>>>>>num_pending_sgs to 500, because that's the number of sgs that need to =
be
>>>>>transferred.
>>>>>
>>>>>For each completion we will decrement num_pending_sgs. Assuming all 255
>>>>>were free and used up, num_pending_sgs will be 245 at this point. Driv=
er
>>>>>*must* try to kick these 245 TRBs.
>>>>
>>>> Lets assume we have a request with length 1024 to 3072 like a multiple
>>>> of maxpacket * mul it is used on in uvc_video.
>>>>
>>>> So with a scatterlist creating only a 2 byte header and 1022 to 3070
>>>> bytes payload we get only two scatter entries in this request. On
>>>> special cases like page boundaries we will add one extra sg, but this
>>>> does not change much. So this is nothing big as your 500 example. Now
>>>> lets assume we queue 64 of these up we end up with maximum fo 192 trbs
>>>> being added to the pending list.
>>>>
>>>> Lets say every one of these will be queued with ep_queue comming from
>>>> uvc_video_pump. The kick_transfer from these ep_queues will result in =
an
>>>> dwc3_prepare_trbs. *But* after the first one being preprared from the
>>>> pending list to the started list, it will have an req->num_preprared_s=
gs !=3D 0.
>>>
>>>there's no such thing as req->num_prepared_sgs, do you mean
>>>num_pending_sgs here?
>>
>> Sure, I got this mixed up. Just keep in mind num_prepared_sgs was
>> ment to be num_pending_sgs.
>
>no worries :-)
>
>>>> Therefor after the first one got queued into the starting list and it
>>>> did not complete yet, every next ep_queue->kick_transfer will always b=
ail out
>>>> in dwc3_prepare_sgs, checking the one started request with num_preprar=
ed
>>>> !=3D 0, without moving other requests from pending to the starting lis=
t.
>>>
>>>no it won't. They're testing a different req pointer altogether. Or they
>>>should. If you're queueing the same exact req pointer before it has been
>>>completed, shame on you :-p
>>
>> Yes, they will. Even if I will queue a different request. The function
>> dwc3_prepare_sgs will check the list of started request and will bail
>> out with ret =3D 0.
>>
>> As I already mentioned dwc3_prepare_sgs will bail out early after
>> the first started request will have an num_prepared_sgs !=3D 0.
>>
>> Look into that code in dwc3_prepare_sgs:
>>
>> ---
>> 1289         list_for_each_entry(req, &dep->started_list, list) {
>> 1290                 if (req->num_pending_sgs > 0) {
>> 1291                         ret =3D dwc3_prepare_trbs_sg(dep, req);
>> 1292                         if (!ret || req->num_pending_sgs)
>> 1293                                 return ret;
>> 1294                 }
>> ---
>>
>> Since every new request being queued will trigger dwc3_prepare_sgs
>> to check the started list for request with num_pending_sgs, it will
>> absolutely run dwc3_prepare_sgs_sg for the request that did not finish y=
et.
>>
>> The call will set ret to 0 since nothing changed. Then as num_pending_sg=
s for
>> that started request is still equal to num_queued_sgs it will bail out f=
rom
>> that function and will not prepare this actual new request in the pendin=
g list.
>>
>> After dwc3_prepare_sgs will come back to kick_transfer, it will even not=
 result
>> into an update transfer command since the following condition prevents t=
hat.
>>
>> ---
>> 1354         /*
>> 1355          * Note that it's normal to have no new TRBs prepared (i.e.=
 ret =3D=3D 0).
>> 1356          * This happens when we need to stop and restart a transfer=
 such as in
>> 1357          * the case of reinitiating a stream or retrying an isoc tr=
ansfer.
>> 1358          */
>> 1359         ret =3D dwc3_prepare_trbs(dep);
>> 1360         if (ret < 0)
>> 1361                 return ret;
>> 1362
>> 1363         starting =3D !(dep->flags & DWC3_EP_TRANSFER_STARTED);
>> 1364
>> 1365         /*
>> 1366          * If there's no new TRB prepared and we don't need to rest=
art a
>> 1367          * transfer, there's no need to update the transfer.
>> 1368          */
>> 1369         if (!ret && !starting)
>> 1370                 return ret;
>> ---
>>
>> with ret =3D 0 and starting =3D 0:
>>
>> if (!0 && !0)
>> 	return 0;
>
>yeah, I suggest looking at the history of gadget.c WRT isochronous
>transfers.

I will check that.

>Also, it seems to me that we have a minor bug where once
>PENDING_REQUEST is set, it's never cleared. Perhaps that's the only
>thing that needs solving here?

That should be addressed as well. But look into my next comments for some
further details.

>>>> This will result in an stalled driver, that will never prepare any
>>>> pending requests into the started list.
>>>
>>>it shouldn't. Please collect tracepoint output, this is probably the 5th
>>>time I've asked for tracepoint output of the problem.
>>
>> I send you the traceback. I used trace_event=3Ddwc3:* in kernel commandl=
ine.
>
>sorry about this, I wrote the comment before seeing the trace and forgot
>to remove before sending :-)

no worries ;-)

>>>When the following request is queued, TRANSFER_STARTED is set, but
>>>PENDING_REQUEST shouldn't be set which would mean
>>>__dwc3_gadget_kick_transfer() be called which should result in a call to
>>>Update Transfer, unless I'm missing something here. It has been quite a
>>>while since I looked at this driver deeply.
>>
>> Yes this is the case. Update transfer will be called but only
>> if dwc3_prepare_trbs did come back with ret !=3D 0.
>>
>>>
>>>> kworker/u5:1-74      [000] d..2    56.807831: dwc3_ep_queue: ep2in: re=
q 00000000f5394c5d length 0/3072 zsi =3D=3D> -115
>>>> kworker/u5:1-74      [000] d..2    56.807857: dwc3_ep_queue: ep2in: re=
q 00000000ef95b55c length 0/3072 zsi =3D=3D> -115
>>>> kworker/u5:1-74      [000] d..2    56.807883: dwc3_ep_queue: ep2in: re=
q 00000000d36cf0cc length 0/3072 zsi =3D=3D> -115
>>>> kworker/u5:1-74      [000] d..2    56.807908: dwc3_ep_queue: ep2in: re=
q 00000000c5f1bd4b length 0/3072 zsi =3D=3D> -115
>>>> kworker/u5:1-74      [000] d..2    56.807934: dwc3_ep_queue: ep2in: re=
q 00000000b7180b2d length 0/3072 zsi =3D=3D> -115
>>>> kworker/u5:1-74      [000] d..2    56.807960: dwc3_ep_queue: ep2in: re=
q 000000005d629ded length 0/3072 zsi =3D=3D> -115
>>>> kworker/u5:1-74      [000] d..2    56.807985: dwc3_ep_queue: ep2in: re=
q 0000000062e02cc0 length 0/3072 zsi =3D=3D> -115
>>>> kworker/u5:1-74      [000] d..2    56.808011: dwc3_ep_queue: ep2in: re=
q 000000001d2ec1c0 length 0/3072 zsi =3D=3D> -115
>>>> kworker/u5:1-74      [000] d..2    56.808038: dwc3_ep_queue: ep2in: re=
q 0000000018ba3d29 length 0/3072 zsi =3D=3D> -115
>>>> kworker/u5:1-74      [000] d..2    56.808063: dwc3_ep_queue: ep2in: re=
q 000000000be47fc7 length 0/3072 zsi =3D=3D> -115
>>>> kworker/u5:1-74      [000] d..2    56.808089: dwc3_ep_queue: ep2in: re=
q 00000000caba09e2 length 0/3072 zsi =3D=3D> -115
>>>> kworker/u5:1-74      [000] d..2    56.808115: dwc3_ep_queue: ep2in: re=
q 00000000cb0191c4 length 0/3072 zsi =3D=3D> -115
>>>> kworker/u5:1-74      [000] d..2    56.808140: dwc3_ep_queue: ep2in: re=
q 000000005255f606 length 0/3072 zsi =3D=3D> -115
>>>>  irq/51-dwc3-239     [000] d..1    56.808240: dwc3_event: event (d1d04=
08a): ep2in: Transfer In Progress [0000d1d0] (sIm)
>>>
>>>eventually we get Transfer In Progress for the first TRB...
>>>
>>>>  irq/51-dwc3-239     [000] d..1    56.808246: dwc3_complete_trb: ep2in=
: trb 000000007ebd2707 (E2:D1) buf 000000000c623058 size 1x 0 ctrl 34740464=
:0000d1d0 (hlCs:Sc:isoc-first)
>>>>  irq/51-dwc3-239     [000] d..1    56.808250: dwc3_complete_trb: ep2in=
: trb 0000000093bb2bc4 (E2:D2) buf 000000000e200000 size 1x 0 ctrl 34740c70=
:0000d1d0 (hlcs:SC:isoc)
>>>>  irq/51-dwc3-239     [000] d..1    56.808256: dwc3_gadget_giveback: ep=
2in: req 00000000823b0b62 length 3072/3072 zsI =3D=3D> 0
>>>
>>>complete and give it back.
>>>
>>>>  irq/51-dwc3-239     [000] d..1    56.808305: dwc3_prepare_trb: ep2in:=
 trb 000000004af35733 (E3:D2) buf 000000000c623088 size 1x 2 ctrl 00000465:=
00000000 (HlCs:Sc:isoc-first)
>>>>  irq/51-dwc3-239     [000] d..1    56.808309: dwc3_prepare_trb: ep2in:=
 trb 00000000a11671a8 (E4:D2) buf 000000000e200bfe size 1x 3070 ctrl 000004=
71:00000000 (Hlcs:Sc:isoc)
>>>
>>>prepare the next
>>>
>>>>  irq/51-dwc3-239     [000] d..1    56.808320: dwc3_gadget_ep_cmd: ep2i=
n: cmd 'Update Transfer' [50407] params 00000000 00000000 00000000 --> stat=
us: Successful
>>>
>>>kick it by telling the HW about it. I don't see any failures here,
>>>although there may be situations where we could add more data to the
>>>controller's cache early on.
>>
>> I back that Idea of adding more data to the controllers cache early.
>
>right, and that's where things get complicated because we don't have
>enough information from ISOC endpoints to schedule transfers to correct
>microframes. We're missing two bits which are only shared with us by the
>HW during XferInProgress and XferNotReady (IIRC).

No! For Isoc we never miss these bits. I understand that driver part
already good enough.

Because once the transfer is started every ep_queue (respectively every
update transfer) will only add trbs to the running transfer. These
updates have no timestamp information. Just look into the update
transfer command.

When the update transfer is called not later than the last trb from the
current transfer was handled in hardware, then everything will run
smooth. In the other case, when the update transfer was called after the
trbs from the current transfer did run out we will receive a missed
interrupt for that new udpated trb and the driver needs to call end
transfer so a new one is started.

>> The second one you see is already way to late for an update. It comes
>> back as an Missed Interrupt as the Update was to late for the transfer.
>>
>> "irq/51-dwc3-239     [000] d..1    56.808460: dwc3_event: event (d1d1808=
a): ep2in: Transfer In Progress [0000d1d1] (siM)"
>>
>> After the missed transfer the last transfer will be ended and another tr=
ansfer is prepared.
>>
>> "irq/51-dwc3-239     [000] d..1    56.815974: dwc3_event: event (d20e10c=
a): ep2in: Transfer Not Ready [0000d20e] (Not Active)"
>>
>> But after that and an successfull next start transfer no further complet=
ion interrupts will
>> show up. That seems broken.
>
>oh, that's messed up. We should get XferInProgress.

Should we? Look into the comment in transfer_not_ready call. So this in
our case is the caller of __dwc3_gadget_start_isoc -> dwc3_prepare_trbs -> =
kick_transfer
for the one next trb in the pending list.

3047 static void dwc3_gadget_endpoint_transfer_not_ready(struct dwc3_ep *de=
p,
3048                 const struct dwc3_event_depevt *event)
3049 {
3050         dwc3_gadget_endpoint_frame_from_event(dep, event);
3051
3052         /*
3053          * The XferNotReady event is generated only once before the en=
dpoint
3054          * starts. It will be generated again when END_TRANSFER comman=
d is
3055          * issued. For some controller versions, the XferNotReady even=
t may be
3056          * generated while the END_TRANSFER command is still in proces=
s. Ignore
3057          * it and wait for the next XferNotReady event after the comma=
nd is
3058          * completed.
3059          */
3060         if (dep->flags & DWC3_EP_END_TRANSFER_PENDING)
3061                 return;
3062
3063         (void) __dwc3_gadget_start_isoc(dep);
3064 }

>> "irq/51-dwc3-239     [000] d..1    56.815996: dwc3_gadget_ep_cmd: ep2in:=
 cmd 'Start Transfer' [d2120406] params 00000000 0a6ab040 00000000 --> stat=
us: Successful"
>>
>> It looks like the underlying issue I could avoid with my patches. Howeve=
r not
>> updating the transfer and running into missed interrupts is another issue
>> that needs to be solved.
>
>my concern is that you may be regressing other parts of the driver :-)

We should obviously check for that. But for isoc I did not see any problem.

>How about we look into the fact that PENDING_REQUEST is never cleared
>first?

We can do that as well. But my head is issueing the pre-starting task now! =
:)

>>>I remember dealing with a bunch of Bus Expiry errors in the past and the
>>>problem was because we couldn't maintain proper alignment with the
>>>microframe number because HW only gives us 14 out of the 16 bits of the
>>>microframe number, the only workaround was to waiting for
>>>XferInProgress/XferNotReady to get that number.
>>
>> I think the bus expiry or microframe handling is not a problem here.
>
>Not in this case because we're never pre-starting transfers. What you
>suggest will pre-start transfers and we will have regressions.

I did that, and did never see any regressions, as I explained above. Otherw=
ise
I would have checked for another solution, than my initial two patches.

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--7CZp05NP8/gJM8Cl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmCD4N8ACgkQC+njFXoe
LGQcCxAAn7n1tWnc/T4dL6zDnIc6FLqOjlMYD0P3f2cUclWpriZoqwOVQt/3N1Nd
qE1U9cRLEGf6XO/7azdPZKei5dJwfitB4YvrnvCOHwCvLqYe51F7eWrR0Fz8MFzM
ndzRiDKp9phPdQ2tw3r5n8vbQWlhfg1WIdxNqfLwRjshhJca9i/gWnX9Ep8z5doa
zCLjqa+bqQr/4jRpnBkcYI3NRp7SnaJk3j/3ANG201zrm24OwDzRr5z3zYpVG474
dn2kKRGmSOVl7byFCEyb3ITQz5BL9xKC3ZYuH77k7/a60575uzGB7791RmX1V78A
4N1cI5HN1KI1pW6ZsPwUPEDSRgRZ9qtIgnPaxkO3jq1mTd1nVvZezjxXRV4ayyY5
0zFsCQoMD9c2enlvMhJME8Kq/ePcmMh/sqvXI8OzidIy7swuC0pYwHmlIte9ot8q
NqiXD6QQaOd83vBvlJr37WE8behHYhusXxnBBqAajcMZajqgZDoLL6gZ6nX/OnUY
lQWref9SRTkBXsw4xMRjOI7Hg4w393wkYgDpCMqqBAakIrMDHhIn8QiDHSfOHL0v
7n7mrXBacoV58VHR1ckb2hJDR35Ra3XUBVjG+bK+iYBZnlnT0YqYTCAI8nz9zM5g
/5dHamCkQghbxlTI0WcuMPGUVZwX4VZ4u5FU1pWh+N6nxSlsmNM=
=NtCr
-----END PGP SIGNATURE-----

--7CZp05NP8/gJM8Cl--
