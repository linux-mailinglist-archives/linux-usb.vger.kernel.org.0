Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D097636D34B
	for <lists+linux-usb@lfdr.de>; Wed, 28 Apr 2021 09:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236448AbhD1His (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Apr 2021 03:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbhD1Hiq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Apr 2021 03:38:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD20EC061574
        for <linux-usb@vger.kernel.org>; Wed, 28 Apr 2021 00:38:01 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lbeli-0003ms-3Q; Wed, 28 Apr 2021 09:37:58 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lbelg-0007ze-TM; Wed, 28 Apr 2021 09:37:56 +0200
Date:   Wed, 28 Apr 2021 09:37:56 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
Message-ID: <20210428073756.GH6975@pengutronix.de>
References: <20210423102738.GD6975@pengutronix.de>
 <87y2d9l0a2.fsf@kernel.org>
 <20210423131807.GE6975@pengutronix.de>
 <87k0osksgo.fsf@kernel.org>
 <20210424091206.GF6975@pengutronix.de>
 <87eeezlrvm.fsf@kernel.org>
 <68ae9066-b349-ba70-59c6-c2388b386b66@synopsys.com>
 <50e13b71-bdc1-6279-a224-bfc99cf10dc8@synopsys.com>
 <20210427201232.GG6975@pengutronix.de>
 <144ed647-86f3-3aee-8ea5-2c8e4d02e2f9@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/i8j2F0k9BYX4qLc"
Content-Disposition: inline
In-Reply-To: <144ed647-86f3-3aee-8ea5-2c8e4d02e2f9@synopsys.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:24:14 up 69 days, 10:48, 75 users,  load average: 0.00, 0.03,
 0.07
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--/i8j2F0k9BYX4qLc
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thinh,

On Wed, Apr 28, 2021 at 01:45:11AM +0000, Thinh Nguyen wrote:
>Michael Grzeschik wrote:
>> On Tue, Apr 27, 2021 at 03:18:57AM +0000, Thinh Nguyen wrote:
>>> Hi Michael,
>>>
>>> Thinh Nguyen wrote:
>>>> Felipe Balbi wrote:
>>>>>
>>>>> HI,
>>>>>
>>>>> Michael Grzeschik <mgr@pengutronix.de> writes:
>>>>>
>>>>> <big snip>
>>>>>
>>>
>>>
>>> <bigger snip>
>>>
>>>
>>>> I think I see the issue that Michael reported.
>>>>
>>>> The problem is that we're using num_pending_sgs to track both pending =
SG
>>>> entries and queued SG entries. num_pending_sgs doesn't get updated unt=
il
>>>> TRB completion interrupt (ie XferInProgress). Before the driver queues
>>>> more SG requests, it will check if there's any pending SG in the start=
ed
>>>> request list before it prepares more. Since the num_pending_sgs doesn't
>>>> get updated until the request is completed, the driver doesn't process
>>>> more until the request is completed.
>>>>
>>>> I need to review more on Michael's patches next week, but I think what
>>>> he suggested makes sense (in term of properly usage of queued sgs vs
>>>> pending sgs). BTW, please correct me if I'm wrong, but we do modify
>>>> num_queued_sgs.
>>>>
>>>
>>> There's still some issue with your patch. I think this should cover it.
>>> Let me know if it works for you.
>>
>> This works for me! Will you spin a proper patch from that?
>
>Sure. I can do that after 5.13-rc1 is released

Great!

>>
>>> Note: this however probably needs more "Tested-by" and reviews
>>> to make sure I'm not missing anything. I only ran some basic tests,
>>> and will need to run more.
>>
>> You may already have mine:
>>
>> Tested-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>>> Let me know if this makes sense.
>>
>> From what I understand about the issue and the purpose of all
>> variables this makes total sense to me. So thanks for taking over
>> and make a proper solution.
>>
>> Thanks,
>> Michael
>>
>
>Thanks for the Tested-by.
>
>Btw, any reason for using SG with transfer less than PAGE_SIZE? I assume
>your platform is 4KB, but you're splitting your 3KB transfer to smaller.
>Was it like this before? Note that DWC3 has a limited number of internal
>TRB cache. But what you're doing now is fine and doesn't impact performanc=
e.

It all comes from the limitation of the uvc_video gadget. Look into the
patches I send to support sg in uvc_video driver. It just maps entries
=66rom an sg list comming from videobuf2 to an req->sg list. In
uvc_video_alloc_requests the req->length will be set to req_size which
is calculated with:

  ep->maxpacket(1024) * maxburst(1-15) * mult(1-3)

With maxburst =3D 1 and mult =3D 3 it currently reults in an req->length of:

  1024 * 1 * 3 =3D 3072

This request will use one extra sg created from the uvc driver adding
a header of 2 bytes per request and then has 3070 bytes left for the
payload which will look into the vb2 sg list and increment every sg
entrie with the the used offset until it reaches sg page boundaries
and in that case will have to add one extra sg.

So this results in the funny patterns you see.

We can increase the req->length to 46080 with a maxburst of 15 for usb3
but I did not try that out yet.


Thanks,
Michael

>>>
>>>
>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>> index dd80e5ca8c78..040cc67b3361 100644
>>> --- a/drivers/usb/dwc3/gadget.c
>>> +++ b/drivers/usb/dwc3/gadget.c
>>> @@ -1244,6 +1244,7 @@ static int dwc3_prepare_trbs_sg(struct dwc3_ep
>>> *dep,
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 req-=
>start_sg =3D sg_next(s);
>>>
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 req->num_queued_sgs++;
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 req->num_pending_sgs--;
>>>
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /*
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * The number of pending S=
G entries may not correspond
>>> to the
>>> @@ -1251,7 +1252,7 @@ static int dwc3_prepare_trbs_sg(struct dwc3_ep
>>> *dep,
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * don't include unused SG=
 entries.
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (length =3D=3D 0) {
>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 req=
->num_pending_sgs -=3D
>>> req->request.num_mapped_sgs - req->num_queued_sgs;
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 req=
->num_pending_sgs =3D 0;
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 brea=
k;
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
>>>
>>> @@ -2867,15 +2868,15 @@ static int
>>> dwc3_gadget_ep_reclaim_trb_sg(struct dwc3_ep *dep,
>>> =A0=A0=A0=A0=A0=A0 struct dwc3_trb *trb =3D &dep->trb_pool[dep->trb_deq=
ueue];
>>> =A0=A0=A0=A0=A0=A0 struct scatterlist *sg =3D req->sg;
>>> =A0=A0=A0=A0=A0=A0 struct scatterlist *s;
>>> -=A0=A0=A0=A0=A0=A0 unsigned int pending =3D req->num_pending_sgs;
>>> +=A0=A0=A0=A0=A0=A0 unsigned int num_queued =3D req->num_queued_sgs;
>>> =A0=A0=A0=A0=A0=A0 unsigned int i;
>>> =A0=A0=A0=A0=A0=A0 int ret =3D 0;
>>>
>>> -=A0=A0=A0=A0=A0=A0 for_each_sg(sg, s, pending, i) {
>>> +=A0=A0=A0=A0=A0=A0 for_each_sg(sg, s, num_queued, i) {
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 trb =3D &dep->trb_pool[dep->=
trb_dequeue];
>>>
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 req->sg =3D sg_next(s);
>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 req->num_pending_sgs--;
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 req->num_queued_sgs--;
>>>
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D dwc3_gadget_ep_recla=
im_completed_trb(dep, req,
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 trb, event, status, true);
>>> @@ -2898,7 +2899,7 @@ static int
>>> dwc3_gadget_ep_reclaim_trb_linear(struct dwc3_ep *dep,
>>>
>>> static bool dwc3_gadget_ep_request_completed(struct dwc3_request *req)
>>> {
>>> -=A0=A0=A0=A0=A0=A0 return req->num_pending_sgs =3D=3D 0;
>>> +=A0=A0=A0=A0=A0=A0 return req->num_pending_sgs =3D=3D 0 && req->num_qu=
eued_sgs =3D=3D 0;
>>> }
>>>
>>> static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
>>> @@ -2907,7 +2908,7 @@ static int
>>> dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
>>> {
>>> =A0=A0=A0=A0=A0=A0 int ret;
>>>
>>> -=A0=A0=A0=A0=A0=A0 if (req->num_pending_sgs)
>>> +=A0=A0=A0=A0=A0=A0 if (req->request.num_mapped_sgs)
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D dwc3_gadget_ep_recla=
im_trb_sg(dep, req, event,
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 status);
>>> =A0=A0=A0=A0=A0=A0 else
>>
>
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--/i8j2F0k9BYX4qLc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmCJEM4ACgkQC+njFXoe
LGSrVRAAmU++JURhbMgm9Mk/upzy/q0RwRHizZeoyk9iuYHBYAOi/E2oPzIHo4n7
jGCcnIg1SP7m4uAbbwcZ0mnSe8M/EAocQQCMp19hA28Vd0EAz9zTsqOT1EiB4z9Y
6pTlpuUu2aamgW6NBgn8DJ3VI7GgqZE6bYT7bWOuJeCqSeclet8AlddQDTnEI2Zv
o8lFBjtGZO6XXq3MJF1UhVALZ+LGl3geOT/pDVoWyZCyCA37dhYWdWrP0a8ka5bc
zDD6Gsna3EsHyfFr70FuEuHWFEv2kgyjM95jltHnZlwhJuyv1IKytZfF7twrE5DC
D2BCZxgD9o/G5YIWI69EaTLyTdlFgiWHh9EAki3eJKUV3bQG9LdIHaujdylOCWnt
iQqC2BQNo7Cre8C4J+k89eN/BokbFw6UcQ7w9q4FwlMgirAqLIFd4a4pgPhOQE1z
Wy233tyTI2/9lq/qN7z7HctS2ujqgS7furdJgGuhL8VFlQ3Ut4t1LYpOgHud6V7e
env4QutgPEnKaDhc02/L4YNYL663ij2kMWEqtWWXXGLxdfa+JMYkUnKGQBuaILJQ
4zdBSuObzfZvKBhsI91YpmfMaPtzZj6UCluINxv7XWBK1RxMPbElh6ANI14gtid4
7r5tqb++bU0g1MS4NwGFnnJySCiwKw7WgxV5Oyf9Wd3AajxIY/Y=
=guxR
-----END PGP SIGNATURE-----

--/i8j2F0k9BYX4qLc--
