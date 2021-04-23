Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE373692E0
	for <lists+linux-usb@lfdr.de>; Fri, 23 Apr 2021 15:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242681AbhDWNSx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Apr 2021 09:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242672AbhDWNSs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Apr 2021 09:18:48 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1340C061574
        for <linux-usb@vger.kernel.org>; Fri, 23 Apr 2021 06:18:10 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lZvhB-0008Ch-47; Fri, 23 Apr 2021 15:18:09 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lZvh9-0002p7-Of; Fri, 23 Apr 2021 15:18:07 +0200
Date:   Fri, 23 Apr 2021 15:18:07 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
Message-ID: <20210423131807.GE6975@pengutronix.de>
References: <20210421204837.4185-1-m.grzeschik@pengutronix.de>
 <20210421204837.4185-3-m.grzeschik@pengutronix.de>
 <87o8e6mvue.fsf@kernel.org>
 <20210422201812.GC6975@pengutronix.de>
 <871rb1msmx.fsf@kernel.org>
 <20210423102738.GD6975@pengutronix.de>
 <87y2d9l0a2.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Content-Disposition: inline
In-Reply-To: <87y2d9l0a2.fsf@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:05:47 up 64 days, 15:29, 90 users,  load average: 0.14, 0.26,
 0.18
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Fri, Apr 23, 2021 at 02:15:33PM +0300, Felipe Balbi wrote:
>
>Hi,
>
>Michael Grzeschik <mgr@pengutronix.de> writes:
>>>>Michael Grzeschik <m.grzeschik@pengutronix.de> writes:
>>>>>> The variable pending_sgs was used to keep track of handled
>>>>>> sgs in one request. But instead queued_sgs is being decremented
>>>>>
>>>>>no, it wasn't. If the total number of entries in the scatter list is '=
x'
>>>>>and we have transferred (completed) 'y' entries, then pending_sgs shou=
ld
>>>>>be (x - y).
>>>>>
>>>>>> on every handled sg. This patch fixes the usage of the variable
>>>>>> to use queued_sgs instead as intended.
>>>>>>
>>>>>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>>>> ---
>>>>>>  drivers/usb/dwc3/gadget.c | 8 ++++----
>>>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>>>>> index 118b5bcc565d6..2d7d861b13b31 100644
>>>>>> --- a/drivers/usb/dwc3/gadget.c
>>>>>> +++ b/drivers/usb/dwc3/gadget.c
>>>>>> @@ -2856,7 +2856,7 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struc=
t dwc3_ep *dep,
>>>>>>  	struct dwc3_trb *trb =3D &dep->trb_pool[dep->trb_dequeue];
>>>>>>  	struct scatterlist *sg =3D req->sg;
>>>>>>  	struct scatterlist *s;
>>>>>> -	unsigned int pending =3D req->num_pending_sgs;
>>>>>> +	unsigned int pending =3D req->num_queued_sgs;
>>>>>>  	unsigned int i;
>>>>>>  	int ret =3D 0;
>>>>>>
>>>>>> @@ -2864,7 +2864,7 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struc=
t dwc3_ep *dep,
>>>>>>  		trb =3D &dep->trb_pool[dep->trb_dequeue];
>>>>>>
>>>>>>  		req->sg =3D sg_next(s);
>>>>>> -		req->num_pending_sgs--;
>>>>>> +		req->num_queued_sgs--;
>>>>>
>>>>>no, this is wrong. queued shouldn't be modified as it comes straight
>>>>>from the gadget driver. This is the number of entries in the request
>>>>>that the gadget driver gave us. We don't want to modify it.
>>>>
>>>> Right, but pending_sgs than has two use cases. One to track the mapped
>>>> sgs that got not queued. And one here to to track the "queued sgs" that
>>>> got dequeued.
>>>
>>>no, we have num_mapped_sgs for the number of mapped sgs. It's just that
>>>right before kicking the transfer the number of pending sgs and the
>>>number of mapped sgs is the same.
>>>
>>>>>>
>>>>>>  		ret =3D dwc3_gadget_ep_reclaim_completed_trb(dep, req,
>>>>>>  				trb, event, status, true);
>>>>>> @@ -2887,7 +2887,7 @@ static int dwc3_gadget_ep_reclaim_trb_linear(s=
truct dwc3_ep *dep,
>>>>>>
>>>>>>  static bool dwc3_gadget_ep_request_completed(struct dwc3_request *r=
eq)
>>>>>>  {
>>>>>> -	return req->num_pending_sgs =3D=3D 0;
>>>>>> +	return req->num_queued_sgs =3D=3D 0;
>>>>>
>>>>>nope, request is, indeed, completed when there no more pending entries
>>>>>to be consumed.
>>>>>
>>>>>What sort of problem are you dealing with? Got any way of reproducing
>>>>>it? Got some trace output showing the issue?
>>>>
>>>> I digged a little bit deeper to fully understand the issue here. What
>>>> I found is that in dwc3_prepare_trbs will make two assumptions on
>>>> num_pending_sgs.
>>>>
>>>> When the real purpose of the variable is to track the dequeued trbs.
>>>
>>>its purpose is *not* to track the dequeued trbs.
>>>
>>>> Than we have to fix the started list handling in the dwc3_prepare_trbs.
>>>>
>>>> The comment in the function says:
>>>>
>>>>          /*
>>>>           * We can get in a situation where there's a request in the s=
tarted list
>>>>           * but there weren't enough TRBs to fully kick it in the firs=
t time
>>>>           * around, so it has been waiting for more TRBs to be freed u=
p.
>>>>           *
>>>>           * In that case, we should check if we have a request with pe=
nding_sgs
>>>>           * in the started list and prepare TRBs for that request firs=
t,
>>>>           * otherwise we will prepare TRBs completely out of order and=
 that will
>>>>           * break things.
>>>>           */
>>>>          list_for_each_entry(req, &dep->started_list, list) {
>>>> 		if (req->num_pending_sgs > 0) {
>>>> 		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>>
>>>> This condition seems to be made on a wrong assumption, thinking the
>>>> num_pending_sgs was decremented after dwc3_prepare_one_trb was called =
on parts
>>>> of that requests sgs but not all.
>>>
>>>say num_mapped_sgs =3D 500. The driver has 255 TRBs for use (+1 link
>>>trb). Clearly not all SGs will fit in one go. Driver will set
>>>num_pending_sgs to 500, because that's the number of sgs that need to be
>>>transferred.
>>>
>>>For each completion we will decrement num_pending_sgs. Assuming all 255
>>>were free and used up, num_pending_sgs will be 245 at this point. Driver
>>>*must* try to kick these 245 TRBs.
>>
>> Lets assume we have a request with length 1024 to 3072 like a multiple
>> of maxpacket * mul it is used on in uvc_video.
>>
>> So with a scatterlist creating only a 2 byte header and 1022 to 3070
>> bytes payload we get only two scatter entries in this request. On
>> special cases like page boundaries we will add one extra sg, but this
>> does not change much. So this is nothing big as your 500 example. Now
>> lets assume we queue 64 of these up we end up with maximum fo 192 trbs
>> being added to the pending list.
>>
>> Lets say every one of these will be queued with ep_queue comming from
>> uvc_video_pump. The kick_transfer from these ep_queues will result in an
>> dwc3_prepare_trbs. *But* after the first one being preprared from the
>> pending list to the started list, it will have an req->num_preprared_sgs=
 !=3D 0.
>
>there's no such thing as req->num_prepared_sgs, do you mean
>num_pending_sgs here?

Sure, I got this mixed up. Just keep in mind num_prepared_sgs was
ment to be num_pending_sgs.

>If you do, that's per-request. Gadget driver can
>allocate and queue as many requests as it
>likes. req_{n}->num_pending_sgs has nothing to do with
>req_{n+1}->num_pending_sgs.

That is also how I understand this.

>> Therefor after the first one got queued into the starting list and it
>> did not complete yet, every next ep_queue->kick_transfer will always bai=
l out
>> in dwc3_prepare_sgs, checking the one started request with num_preprared
>> !=3D 0, without moving other requests from pending to the starting list.
>
>no it won't. They're testing a different req pointer altogether. Or they
>should. If you're queueing the same exact req pointer before it has been
>completed, shame on you :-p

Yes, they will. Even if I will queue a different request. The function
dwc3_prepare_sgs will check the list of started request and will bail
out with ret =3D 0.

As I already mentioned dwc3_prepare_sgs will bail out early after
the first started request will have an num_prepared_sgs !=3D 0.

Look into that code in dwc3_prepare_sgs:

---
1289         list_for_each_entry(req, &dep->started_list, list) {
1290                 if (req->num_pending_sgs > 0) {
1291                         ret =3D dwc3_prepare_trbs_sg(dep, req);
1292                         if (!ret || req->num_pending_sgs)
1293                                 return ret;
1294                 }
---

Since every new request being queued will trigger dwc3_prepare_sgs
to check the started list for request with num_pending_sgs, it will
absolutely run dwc3_prepare_sgs_sg for the request that did not finish yet.

The call will set ret to 0 since nothing changed. Then as num_pending_sgs f=
or
that started request is still equal to num_queued_sgs it will bail out from
that function and will not prepare this actual new request in the pending l=
ist.

After dwc3_prepare_sgs will come back to kick_transfer, it will even not re=
sult
into an update transfer command since the following condition prevents that.

---
1354         /*
1355          * Note that it's normal to have no new TRBs prepared (i.e. re=
t =3D=3D 0).
1356          * This happens when we need to stop and restart a transfer su=
ch as in
1357          * the case of reinitiating a stream or retrying an isoc trans=
fer.
1358          */
1359         ret =3D dwc3_prepare_trbs(dep);
1360         if (ret < 0)
1361                 return ret;
1362
1363         starting =3D !(dep->flags & DWC3_EP_TRANSFER_STARTED);
1364
1365         /*
1366          * If there's no new TRB prepared and we don't need to restart=
 a
1367          * transfer, there's no need to update the transfer.
1368          */
1369         if (!ret && !starting)
1370                 return ret;
---

with ret =3D 0 and starting =3D 0:

if (!0 && !0)
	return 0;



>> This will result in an stalled driver, that will never prepare any
>> pending requests into the started list.
>
>it shouldn't. Please collect tracepoint output, this is probably the 5th
>time I've asked for tracepoint output of the problem.

I send you the traceback. I used trace_event=3Ddwc3:* in kernel commandline.

>
>>>> But the completion path can not also depend on that variable to be dec=
remented
>>>> after parts of that sgs get handled. Therefor I came up with this seco=
nd patch.
>>>>
>>>> What do you think, would be the right way to solve this?
>>>
>>>unless you can show that a problem really exists, I don't think we
>>>should do anything. Got a minimal reproduction method somewhere?
>>>Tracepoint of the problem?
>>
>> Look into the attached 20210423_uvc_video_dwc3_gadget_trace. You will
>> see my scenario I want to fix.
>
>where exactly in the file is the problem? I took a snippet to look at:

That is the place you should look. Correct.

>>  irq/51-dwc3-239     [000] d..1    56.766818: dwc3_event: event (d08510c=
a): ep2in: Transfer Not Ready [0000d085] (Not Active)
>> kworker/u5:1-74      [000] d..2    56.807742: dwc3_ep_queue: ep2in: req =
00000000823b0b62 length 0/3072 zsI =3D=3D> -115
>> kworker/u5:1-74      [000] d..2    56.807759: dwc3_prepare_trb: ep2in: t=
rb 000000007ebd2707 (E1:D0) buf 000000000c623058 size 1x 2 ctrl 00000465:00=
000000 (HlCs:Sc:isoc-first)
>> kworker/u5:1-74      [000] d..2    56.807764: dwc3_prepare_trb: ep2in: t=
rb 0000000093bb2bc4 (E2:D0) buf 000000000e200000 size 1x 3070 ctrl 00000c71=
:00000000 (Hlcs:SC:isoc)
>> kworker/u5:1-74      [000] d..2    56.807777: dwc3_gadget_ep_cmd: ep2in:=
 cmd 'Start Transfer' [d1d00406] params 00000000 0a6ab000 00000000 --> stat=
us: Successful
>
>So, Isoc endpoints are a bit "special". We always wait for XferNotReady
>before starting them. This is what you see here.

Yes, they are special.

>> kworker/u5:1-74      [000] d..2    56.807805: dwc3_ep_queue: ep2in: req =
000000006d3f8d0a length 0/3072 zsi =3D=3D> -115
>
>When the following request is queued, TRANSFER_STARTED is set, but
>PENDING_REQUEST shouldn't be set which would mean
>__dwc3_gadget_kick_transfer() be called which should result in a call to
>Update Transfer, unless I'm missing something here. It has been quite a
>while since I looked at this driver deeply.

Yes this is the case. Update transfer will be called but only
if dwc3_prepare_trbs did come back with ret !=3D 0.

>
>> kworker/u5:1-74      [000] d..2    56.807831: dwc3_ep_queue: ep2in: req =
00000000f5394c5d length 0/3072 zsi =3D=3D> -115
>> kworker/u5:1-74      [000] d..2    56.807857: dwc3_ep_queue: ep2in: req =
00000000ef95b55c length 0/3072 zsi =3D=3D> -115
>> kworker/u5:1-74      [000] d..2    56.807883: dwc3_ep_queue: ep2in: req =
00000000d36cf0cc length 0/3072 zsi =3D=3D> -115
>> kworker/u5:1-74      [000] d..2    56.807908: dwc3_ep_queue: ep2in: req =
00000000c5f1bd4b length 0/3072 zsi =3D=3D> -115
>> kworker/u5:1-74      [000] d..2    56.807934: dwc3_ep_queue: ep2in: req =
00000000b7180b2d length 0/3072 zsi =3D=3D> -115
>> kworker/u5:1-74      [000] d..2    56.807960: dwc3_ep_queue: ep2in: req =
000000005d629ded length 0/3072 zsi =3D=3D> -115
>> kworker/u5:1-74      [000] d..2    56.807985: dwc3_ep_queue: ep2in: req =
0000000062e02cc0 length 0/3072 zsi =3D=3D> -115
>> kworker/u5:1-74      [000] d..2    56.808011: dwc3_ep_queue: ep2in: req =
000000001d2ec1c0 length 0/3072 zsi =3D=3D> -115
>> kworker/u5:1-74      [000] d..2    56.808038: dwc3_ep_queue: ep2in: req =
0000000018ba3d29 length 0/3072 zsi =3D=3D> -115
>> kworker/u5:1-74      [000] d..2    56.808063: dwc3_ep_queue: ep2in: req =
000000000be47fc7 length 0/3072 zsi =3D=3D> -115
>> kworker/u5:1-74      [000] d..2    56.808089: dwc3_ep_queue: ep2in: req =
00000000caba09e2 length 0/3072 zsi =3D=3D> -115
>> kworker/u5:1-74      [000] d..2    56.808115: dwc3_ep_queue: ep2in: req =
00000000cb0191c4 length 0/3072 zsi =3D=3D> -115
>> kworker/u5:1-74      [000] d..2    56.808140: dwc3_ep_queue: ep2in: req =
000000005255f606 length 0/3072 zsi =3D=3D> -115
>>  irq/51-dwc3-239     [000] d..1    56.808240: dwc3_event: event (d1d0408=
a): ep2in: Transfer In Progress [0000d1d0] (sIm)
>
>eventually we get Transfer In Progress for the first TRB...
>
>>  irq/51-dwc3-239     [000] d..1    56.808246: dwc3_complete_trb: ep2in: =
trb 000000007ebd2707 (E2:D1) buf 000000000c623058 size 1x 0 ctrl 34740464:0=
000d1d0 (hlCs:Sc:isoc-first)
>>  irq/51-dwc3-239     [000] d..1    56.808250: dwc3_complete_trb: ep2in: =
trb 0000000093bb2bc4 (E2:D2) buf 000000000e200000 size 1x 0 ctrl 34740c70:0=
000d1d0 (hlcs:SC:isoc)
>>  irq/51-dwc3-239     [000] d..1    56.808256: dwc3_gadget_giveback: ep2i=
n: req 00000000823b0b62 length 3072/3072 zsI =3D=3D> 0
>
>complete and give it back.
>
>>  irq/51-dwc3-239     [000] d..1    56.808305: dwc3_prepare_trb: ep2in: t=
rb 000000004af35733 (E3:D2) buf 000000000c623088 size 1x 2 ctrl 00000465:00=
000000 (HlCs:Sc:isoc-first)
>>  irq/51-dwc3-239     [000] d..1    56.808309: dwc3_prepare_trb: ep2in: t=
rb 00000000a11671a8 (E4:D2) buf 000000000e200bfe size 1x 3070 ctrl 00000471=
:00000000 (Hlcs:Sc:isoc)
>
>prepare the next
>
>>  irq/51-dwc3-239     [000] d..1    56.808320: dwc3_gadget_ep_cmd: ep2in:=
 cmd 'Update Transfer' [50407] params 00000000 00000000 00000000 --> status=
: Successful
>
>kick it by telling the HW about it. I don't see any failures here,
>although there may be situations where we could add more data to the
>controller's cache early on.

I back that Idea of adding more data to the controllers cache early.
The second one you see is already way to late for an update. It comes
back as an Missed Interrupt as the Update was to late for the transfer.

"irq/51-dwc3-239     [000] d..1    56.808460: dwc3_event: event (d1d1808a):=
 ep2in: Transfer In Progress [0000d1d1] (siM)"

After the missed transfer the last transfer will be ended and another trans=
fer is prepared.

"irq/51-dwc3-239     [000] d..1    56.815974: dwc3_event: event (d20e10ca):=
 ep2in: Transfer Not Ready [0000d20e] (Not Active)"

But after that and an successfull next start transfer no further completion=
 interrupts will
show up. That seems broken.

"irq/51-dwc3-239     [000] d..1    56.815996: dwc3_gadget_ep_cmd: ep2in: cm=
d 'Start Transfer' [d2120406] params 00000000 0a6ab040 00000000 --> status:=
 Successful"

It looks like the underlying issue I could avoid with my patches. However n=
ot
updating the transfer and running into missed interrupts is another issue
that needs to be solved.

>I remember dealing with a bunch of Bus Expiry errors in the past and the
>problem was because we couldn't maintain proper alignment with the
>microframe number because HW only gives us 14 out of the 16 bits of the
>microframe number, the only workaround was to waiting for
>XferInProgress/XferNotReady to get that number.

I think the bus expiry or microframe handling is not a problem here.

>PS: if you collect more traces in the future, please don't enable
>ftrace. Keep current_tracer set to nop, ftrace is just adding garbage to
>the output in this case :-)

Yes, I will keep them non verbose.

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmCCyQYACgkQC+njFXoe
LGQeWA/+IcriOTcbfV2IxkT6ZrmXBS7AMKZhekkkqnMSSFAq/0XIC6VBdCSjr9jm
HZl0bX7JnfA+gMGVikHqKLuatuujIApEY484STWxCLegv/usG3EJJGCenV1D5IHT
ulazbKzzpRVS88ZGEZDuiGeq1D85f0NcSOCPLsh6jpSZTqBVvMUp89OeFsVVEnOj
tEDRBYzM2yTFvc7cvsTIUz2Y7xhjj+2DymvB1De3qxE8O7DvlZHjAFLZigAsxGRD
nnIV+SJsfYXb2Dz7Fmymb1VdNMXlLGXcB6qDSIvEaZz0o2PR9TCrYv08FdCIAcG8
tbXYe1xZu7JbtU1QXSYkY+84SWQdFdoJ0i5CwfZHQnFhwo9JEHo9WLbotqKV8HKq
QaCOt8XTWa/VqiJKqNnp9joAfyTAC4mpmOG/XMitYagI16hUJkLESdDxvdyQrkMu
RWjYJwzTmzPvJ34GEz6hKVWsHrjz/4VPBp+M4I23E4+02ubIKW2EOzFGLfXk9nzs
8lIAsafeBzU9BSHuOgRPMEYdC3Lz/VPapze8SQkmeeecGDk93gzms0EY8WN/eeOk
isd1/i6Ld2EJ4DnCQ5kbwyh+JkrUuBkRGw+fuPow1C/zr4eet7eMC6fYBndXnz5P
DMji4xLppQp+2J5hbVJWcsjI+i/k4V55xxSgWYoPOnhpo5jUgyI=
=DqzD
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--
