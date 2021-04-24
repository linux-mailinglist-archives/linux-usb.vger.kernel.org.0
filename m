Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 504F336A02A
	for <lists+linux-usb@lfdr.de>; Sat, 24 Apr 2021 10:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236878AbhDXI16 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Apr 2021 04:27:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:57156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234456AbhDXI1J (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 24 Apr 2021 04:27:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 182C0613D5;
        Sat, 24 Apr 2021 08:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619252205;
        bh=Cl4FDFUFAfp1Cr0Ajs/AMSqAW0Zb9EWkyqGAbr7OoMY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=QLrh85JAPLZPcWqAhbbTongTHhYIWp38gDbOiUi4IT5Fda7qWWT/vmBeat6iCE5Ml
         nx17LdBT0NqDB2qpoySctbrpuDZrpkw41kgrgy4yI/w8Sq3JuuTJifVLTGNZl8JpIZ
         8M1KvbyIgbF1iiqbQb424gHlKe8WQktC2TgDss3PAMfn6vdvuqX4ZsndnLYwdVSK5n
         jBpP3pKRAXn9XUAk7no2BEPbJ+FyXqsdTU1zh+MxBkAMhDOsmGwMJU2ZTl+srvADVK
         YR4ZXKmgvh5SXjj/RvYxuIZ2s2IshZl68KieaOFaPM8H+TI0ZiM//P4fRUv2uLfMcp
         fJ3FZOSy+aDkg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
In-Reply-To: <20210423131807.GE6975@pengutronix.de>
References: <20210421204837.4185-1-m.grzeschik@pengutronix.de>
 <20210421204837.4185-3-m.grzeschik@pengutronix.de>
 <87o8e6mvue.fsf@kernel.org> <20210422201812.GC6975@pengutronix.de>
 <871rb1msmx.fsf@kernel.org> <20210423102738.GD6975@pengutronix.de>
 <87y2d9l0a2.fsf@kernel.org> <20210423131807.GE6975@pengutronix.de>
Date:   Sat, 24 Apr 2021 11:16:39 +0300
Message-ID: <87k0osksgo.fsf@kernel.org>
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

Michael Grzeschik <mgr@pengutronix.de> writes:
>>>>>>> @@ -2887,7 +2887,7 @@ static int dwc3_gadget_ep_reclaim_trb_linear(=
struct dwc3_ep *dep,
>>>>>>>
>>>>>>>  static bool dwc3_gadget_ep_request_completed(struct dwc3_request *=
req)
>>>>>>>  {
>>>>>>> -	return req->num_pending_sgs =3D=3D 0;
>>>>>>> +	return req->num_queued_sgs =3D=3D 0;
>>>>>>
>>>>>>nope, request is, indeed, completed when there no more pending entries
>>>>>>to be consumed.
>>>>>>
>>>>>>What sort of problem are you dealing with? Got any way of reproducing
>>>>>>it? Got some trace output showing the issue?
>>>>>
>>>>> I digged a little bit deeper to fully understand the issue here. What
>>>>> I found is that in dwc3_prepare_trbs will make two assumptions on
>>>>> num_pending_sgs.
>>>>>
>>>>> When the real purpose of the variable is to track the dequeued trbs.
>>>>
>>>>its purpose is *not* to track the dequeued trbs.
>>>>
>>>>> Than we have to fix the started list handling in the dwc3_prepare_trb=
s.
>>>>>
>>>>> The comment in the function says:
>>>>>
>>>>>          /*
>>>>>           * We can get in a situation where there's a request in the =
started list
>>>>>           * but there weren't enough TRBs to fully kick it in the fir=
st time
>>>>>           * around, so it has been waiting for more TRBs to be freed =
up.
>>>>>           *
>>>>>           * In that case, we should check if we have a request with p=
ending_sgs
>>>>>           * in the started list and prepare TRBs for that request fir=
st,
>>>>>           * otherwise we will prepare TRBs completely out of order an=
d that will
>>>>>           * break things.
>>>>>           */
>>>>>          list_for_each_entry(req, &dep->started_list, list) {
>>>>> 		if (req->num_pending_sgs > 0) {
>>>>> 		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>>>
>>>>> This condition seems to be made on a wrong assumption, thinking the
>>>>> num_pending_sgs was decremented after dwc3_prepare_one_trb was called=
 on parts
>>>>> of that requests sgs but not all.
>>>>
>>>>say num_mapped_sgs =3D 500. The driver has 255 TRBs for use (+1 link
>>>>trb). Clearly not all SGs will fit in one go. Driver will set
>>>>num_pending_sgs to 500, because that's the number of sgs that need to be
>>>>transferred.
>>>>
>>>>For each completion we will decrement num_pending_sgs. Assuming all 255
>>>>were free and used up, num_pending_sgs will be 245 at this point. Driver
>>>>*must* try to kick these 245 TRBs.
>>>
>>> Lets assume we have a request with length 1024 to 3072 like a multiple
>>> of maxpacket * mul it is used on in uvc_video.
>>>
>>> So with a scatterlist creating only a 2 byte header and 1022 to 3070
>>> bytes payload we get only two scatter entries in this request. On
>>> special cases like page boundaries we will add one extra sg, but this
>>> does not change much. So this is nothing big as your 500 example. Now
>>> lets assume we queue 64 of these up we end up with maximum fo 192 trbs
>>> being added to the pending list.
>>>
>>> Lets say every one of these will be queued with ep_queue comming from
>>> uvc_video_pump. The kick_transfer from these ep_queues will result in an
>>> dwc3_prepare_trbs. *But* after the first one being preprared from the
>>> pending list to the started list, it will have an req->num_preprared_sg=
s !=3D 0.
>>
>>there's no such thing as req->num_prepared_sgs, do you mean
>>num_pending_sgs here?
>
> Sure, I got this mixed up. Just keep in mind num_prepared_sgs was
> ment to be num_pending_sgs.

no worries :-)

>>> Therefor after the first one got queued into the starting list and it
>>> did not complete yet, every next ep_queue->kick_transfer will always ba=
il out
>>> in dwc3_prepare_sgs, checking the one started request with num_preprared
>>> !=3D 0, without moving other requests from pending to the starting list.
>>
>>no it won't. They're testing a different req pointer altogether. Or they
>>should. If you're queueing the same exact req pointer before it has been
>>completed, shame on you :-p
>
> Yes, they will. Even if I will queue a different request. The function
> dwc3_prepare_sgs will check the list of started request and will bail
> out with ret =3D 0.
>
> As I already mentioned dwc3_prepare_sgs will bail out early after
> the first started request will have an num_prepared_sgs !=3D 0.
>
> Look into that code in dwc3_prepare_sgs:
>
> ---
> 1289         list_for_each_entry(req, &dep->started_list, list) {
> 1290                 if (req->num_pending_sgs > 0) {
> 1291                         ret =3D dwc3_prepare_trbs_sg(dep, req);
> 1292                         if (!ret || req->num_pending_sgs)
> 1293                                 return ret;
> 1294                 }
> ---
>
> Since every new request being queued will trigger dwc3_prepare_sgs
> to check the started list for request with num_pending_sgs, it will
> absolutely run dwc3_prepare_sgs_sg for the request that did not finish ye=
t.
>
> The call will set ret to 0 since nothing changed. Then as num_pending_sgs=
 for
> that started request is still equal to num_queued_sgs it will bail out fr=
om
> that function and will not prepare this actual new request in the pending=
 list.
>
> After dwc3_prepare_sgs will come back to kick_transfer, it will even not =
result
> into an update transfer command since the following condition prevents th=
at.
>
> ---
> 1354         /*
> 1355          * Note that it's normal to have no new TRBs prepared (i.e. =
ret =3D=3D 0).
> 1356          * This happens when we need to stop and restart a transfer =
such as in
> 1357          * the case of reinitiating a stream or retrying an isoc tra=
nsfer.
> 1358          */
> 1359         ret =3D dwc3_prepare_trbs(dep);
> 1360         if (ret < 0)
> 1361                 return ret;
> 1362
> 1363         starting =3D !(dep->flags & DWC3_EP_TRANSFER_STARTED);
> 1364
> 1365         /*
> 1366          * If there's no new TRB prepared and we don't need to resta=
rt a
> 1367          * transfer, there's no need to update the transfer.
> 1368          */
> 1369         if (!ret && !starting)
> 1370                 return ret;
> ---
>
> with ret =3D 0 and starting =3D 0:
>
> if (!0 && !0)
> 	return 0;

yeah, I suggest looking at the history of gadget.c WRT isochronous
transfers. Also, it seems to me that we have a minor bug where once
PENDING_REQUEST is set, it's never cleared. Perhaps that's the only
thing that needs solving here?

>>> This will result in an stalled driver, that will never prepare any
>>> pending requests into the started list.
>>
>>it shouldn't. Please collect tracepoint output, this is probably the 5th
>>time I've asked for tracepoint output of the problem.
>
> I send you the traceback. I used trace_event=3Ddwc3:* in kernel commandli=
ne.

sorry about this, I wrote the comment before seeing the trace and forgot
to remove before sending :-)

>>When the following request is queued, TRANSFER_STARTED is set, but
>>PENDING_REQUEST shouldn't be set which would mean
>>__dwc3_gadget_kick_transfer() be called which should result in a call to
>>Update Transfer, unless I'm missing something here. It has been quite a
>>while since I looked at this driver deeply.
>
> Yes this is the case. Update transfer will be called but only
> if dwc3_prepare_trbs did come back with ret !=3D 0.
>
>>
>>> kworker/u5:1-74      [000] d..2    56.807831: dwc3_ep_queue: ep2in: req=
 00000000f5394c5d length 0/3072 zsi =3D=3D> -115
>>> kworker/u5:1-74      [000] d..2    56.807857: dwc3_ep_queue: ep2in: req=
 00000000ef95b55c length 0/3072 zsi =3D=3D> -115
>>> kworker/u5:1-74      [000] d..2    56.807883: dwc3_ep_queue: ep2in: req=
 00000000d36cf0cc length 0/3072 zsi =3D=3D> -115
>>> kworker/u5:1-74      [000] d..2    56.807908: dwc3_ep_queue: ep2in: req=
 00000000c5f1bd4b length 0/3072 zsi =3D=3D> -115
>>> kworker/u5:1-74      [000] d..2    56.807934: dwc3_ep_queue: ep2in: req=
 00000000b7180b2d length 0/3072 zsi =3D=3D> -115
>>> kworker/u5:1-74      [000] d..2    56.807960: dwc3_ep_queue: ep2in: req=
 000000005d629ded length 0/3072 zsi =3D=3D> -115
>>> kworker/u5:1-74      [000] d..2    56.807985: dwc3_ep_queue: ep2in: req=
 0000000062e02cc0 length 0/3072 zsi =3D=3D> -115
>>> kworker/u5:1-74      [000] d..2    56.808011: dwc3_ep_queue: ep2in: req=
 000000001d2ec1c0 length 0/3072 zsi =3D=3D> -115
>>> kworker/u5:1-74      [000] d..2    56.808038: dwc3_ep_queue: ep2in: req=
 0000000018ba3d29 length 0/3072 zsi =3D=3D> -115
>>> kworker/u5:1-74      [000] d..2    56.808063: dwc3_ep_queue: ep2in: req=
 000000000be47fc7 length 0/3072 zsi =3D=3D> -115
>>> kworker/u5:1-74      [000] d..2    56.808089: dwc3_ep_queue: ep2in: req=
 00000000caba09e2 length 0/3072 zsi =3D=3D> -115
>>> kworker/u5:1-74      [000] d..2    56.808115: dwc3_ep_queue: ep2in: req=
 00000000cb0191c4 length 0/3072 zsi =3D=3D> -115
>>> kworker/u5:1-74      [000] d..2    56.808140: dwc3_ep_queue: ep2in: req=
 000000005255f606 length 0/3072 zsi =3D=3D> -115
>>>  irq/51-dwc3-239     [000] d..1    56.808240: dwc3_event: event (d1d040=
8a): ep2in: Transfer In Progress [0000d1d0] (sIm)
>>
>>eventually we get Transfer In Progress for the first TRB...
>>
>>>  irq/51-dwc3-239     [000] d..1    56.808246: dwc3_complete_trb: ep2in:=
 trb 000000007ebd2707 (E2:D1) buf 000000000c623058 size 1x 0 ctrl 34740464:=
0000d1d0 (hlCs:Sc:isoc-first)
>>>  irq/51-dwc3-239     [000] d..1    56.808250: dwc3_complete_trb: ep2in:=
 trb 0000000093bb2bc4 (E2:D2) buf 000000000e200000 size 1x 0 ctrl 34740c70:=
0000d1d0 (hlcs:SC:isoc)
>>>  irq/51-dwc3-239     [000] d..1    56.808256: dwc3_gadget_giveback: ep2=
in: req 00000000823b0b62 length 3072/3072 zsI =3D=3D> 0
>>
>>complete and give it back.
>>
>>>  irq/51-dwc3-239     [000] d..1    56.808305: dwc3_prepare_trb: ep2in: =
trb 000000004af35733 (E3:D2) buf 000000000c623088 size 1x 2 ctrl 00000465:0=
0000000 (HlCs:Sc:isoc-first)
>>>  irq/51-dwc3-239     [000] d..1    56.808309: dwc3_prepare_trb: ep2in: =
trb 00000000a11671a8 (E4:D2) buf 000000000e200bfe size 1x 3070 ctrl 0000047=
1:00000000 (Hlcs:Sc:isoc)
>>
>>prepare the next
>>
>>>  irq/51-dwc3-239     [000] d..1    56.808320: dwc3_gadget_ep_cmd: ep2in=
: cmd 'Update Transfer' [50407] params 00000000 00000000 00000000 --> statu=
s: Successful
>>
>>kick it by telling the HW about it. I don't see any failures here,
>>although there may be situations where we could add more data to the
>>controller's cache early on.
>
> I back that Idea of adding more data to the controllers cache early.

right, and that's where things get complicated because we don't have
enough information from ISOC endpoints to schedule transfers to correct
microframes. We're missing two bits which are only shared with us by the
HW during XferInProgress and XferNotReady (IIRC).

> The second one you see is already way to late for an update. It comes
> back as an Missed Interrupt as the Update was to late for the transfer.
>
> "irq/51-dwc3-239     [000] d..1    56.808460: dwc3_event: event (d1d1808a=
): ep2in: Transfer In Progress [0000d1d1] (siM)"
>
> After the missed transfer the last transfer will be ended and another tra=
nsfer is prepared.
>
> "irq/51-dwc3-239     [000] d..1    56.815974: dwc3_event: event (d20e10ca=
): ep2in: Transfer Not Ready [0000d20e] (Not Active)"
>
> But after that and an successfull next start transfer no further completi=
on interrupts will
> show up. That seems broken.

oh, that's messed up. We should get XferInProgress.

> "irq/51-dwc3-239     [000] d..1    56.815996: dwc3_gadget_ep_cmd: ep2in: =
cmd 'Start Transfer' [d2120406] params 00000000 0a6ab040 00000000 --> statu=
s: Successful"
>
> It looks like the underlying issue I could avoid with my patches. However=
 not
> updating the transfer and running into missed interrupts is another issue
> that needs to be solved.

my concern is that you may be regressing other parts of the driver :-)

How about we look into the fact that PENDING_REQUEST is never cleared
first?

>>I remember dealing with a bunch of Bus Expiry errors in the past and the
>>problem was because we couldn't maintain proper alignment with the
>>microframe number because HW only gives us 14 out of the 16 bits of the
>>microframe number, the only workaround was to waiting for
>>XferInProgress/XferNotReady to get that number.
>
> I think the bus expiry or microframe handling is not a problem here.

Not in this case because we're never pre-starting transfers. What you
suggest will pre-start transfers and we will have regressions.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCD0+cRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZsaxAA1XYYljFCS/RzwnFTnNJVK9v8tAXfQ+Pf
bPzPn4WALpjvUOkJFcgNv4Dp0z4tMNpBqqtVPNm9qeHJs+f5KrKzAkHtDTALRLMg
2j5YtYexDN+IufeWgJLCaa79Ph4IdEm3W1Cx6YDPViV+5FHb/lNMIHFa2mSDxeUD
/PQYBYQ189L6LQ+B5BxwLdH6B9GbGZalqhL51BDoIvzvpnIUbvpFEtnVNpDgOPK0
L2Li4o6CrmXjd/t5T2UjJ+rf5HgwyeNyAjTTsbu0T9+rSFysKX4JqtQ7MaDbQ+gL
aCV57jwdRjnyz7cWlR3Mh0rcjj+U8j8U5qkExszWNWWbG0xUT3kHAtvavGttMwWJ
5jEnkQ8VBH4LvSQoYgnwitGadbkUgPG3gJxCrkNPGBuJg/83ZWtBqTaWGa/NHP+S
ffco9giDlaz6z1tNUg7Gy1sP0IEmugmSl+RnSbPiKAckYPcJ6e+jYmy0O0Fc6hb1
y/Jn+si4qqz4zXBYb8GTblZM/mHDN9FDZXK4bVJXLOfN4Vh0U5trblixWwrrZW0U
W1L48o4twJ0C/KnRjHqLkhwpLfxix4+hpfKmkzjN70rkD8gwf+HJFghAVMqWdVht
kkgUupc92sQnqjN7TC0c6kryB/zLHSiGImYjX2gDE84yBa5dt2d2VOs4PuV3hNG7
GCpUnB2kXZM=
=6pQf
-----END PGP SIGNATURE-----
--=-=-=--
