Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32C433690EE
	for <lists+linux-usb@lfdr.de>; Fri, 23 Apr 2021 13:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242185AbhDWLQR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Apr 2021 07:16:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:38132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242050AbhDWLQQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Apr 2021 07:16:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D95361027;
        Fri, 23 Apr 2021 11:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619176540;
        bh=uCwpgptywxfS5Bl3D+2VGKlNpoqSt8iCSPyuDQCR/Co=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=WXbT2WtpuaChdyDEqFbBsxPbXF87kCKyR0ecBWHdI5EerUTlWgRVx4zsAPHOXPlSu
         PTO9jWalSMd1ITKKPOXcIxrR4CeCU1i4zXALD3/BR8+Kuo7g9f5/rleoPHM+O3niWR
         eB9CAMr1/0/OaslF4t9hQ0E8HVONrChRdfhhC/AM2k0miliDXqXDK+/60hLlUTjlbT
         EIKYA2EJ0DUzB5HHX6mLnx76GTkA3/qBA0Hk+gge81LD+o+Jn7hbp47CnB/yu3KVGO
         VYOKir2UEttAevKeFtXaILJXSTjulL8vb1AKm558C3zEdS1NI3Y3PSLj/s9IPtbfsJ
         r1C8EL9D3m/RA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
In-Reply-To: <20210423102738.GD6975@pengutronix.de>
References: <20210421204837.4185-1-m.grzeschik@pengutronix.de>
 <20210421204837.4185-3-m.grzeschik@pengutronix.de>
 <87o8e6mvue.fsf@kernel.org> <20210422201812.GC6975@pengutronix.de>
 <871rb1msmx.fsf@kernel.org> <20210423102738.GD6975@pengutronix.de>
Date:   Fri, 23 Apr 2021 14:15:33 +0300
Message-ID: <87y2d9l0a2.fsf@kernel.org>
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
>>>Michael Grzeschik <m.grzeschik@pengutronix.de> writes:
>>>>> The variable pending_sgs was used to keep track of handled
>>>>> sgs in one request. But instead queued_sgs is being decremented
>>>>
>>>>no, it wasn't. If the total number of entries in the scatter list is 'x'
>>>>and we have transferred (completed) 'y' entries, then pending_sgs should
>>>>be (x - y).
>>>>
>>>>> on every handled sg. This patch fixes the usage of the variable
>>>>> to use queued_sgs instead as intended.
>>>>>
>>>>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>>> ---
>>>>>  drivers/usb/dwc3/gadget.c | 8 ++++----
>>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>>>> index 118b5bcc565d6..2d7d861b13b31 100644
>>>>> --- a/drivers/usb/dwc3/gadget.c
>>>>> +++ b/drivers/usb/dwc3/gadget.c
>>>>> @@ -2856,7 +2856,7 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct=
 dwc3_ep *dep,
>>>>>  	struct dwc3_trb *trb =3D &dep->trb_pool[dep->trb_dequeue];
>>>>>  	struct scatterlist *sg =3D req->sg;
>>>>>  	struct scatterlist *s;
>>>>> -	unsigned int pending =3D req->num_pending_sgs;
>>>>> +	unsigned int pending =3D req->num_queued_sgs;
>>>>>  	unsigned int i;
>>>>>  	int ret =3D 0;
>>>>>
>>>>> @@ -2864,7 +2864,7 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct=
 dwc3_ep *dep,
>>>>>  		trb =3D &dep->trb_pool[dep->trb_dequeue];
>>>>>
>>>>>  		req->sg =3D sg_next(s);
>>>>> -		req->num_pending_sgs--;
>>>>> +		req->num_queued_sgs--;
>>>>
>>>>no, this is wrong. queued shouldn't be modified as it comes straight
>>>>from the gadget driver. This is the number of entries in the request
>>>>that the gadget driver gave us. We don't want to modify it.
>>>
>>> Right, but pending_sgs than has two use cases. One to track the mapped
>>> sgs that got not queued. And one here to to track the "queued sgs" that
>>> got dequeued.
>>
>>no, we have num_mapped_sgs for the number of mapped sgs. It's just that
>>right before kicking the transfer the number of pending sgs and the
>>number of mapped sgs is the same.
>>
>>>>>
>>>>>  		ret =3D dwc3_gadget_ep_reclaim_completed_trb(dep, req,
>>>>>  				trb, event, status, true);
>>>>> @@ -2887,7 +2887,7 @@ static int dwc3_gadget_ep_reclaim_trb_linear(st=
ruct dwc3_ep *dep,
>>>>>
>>>>>  static bool dwc3_gadget_ep_request_completed(struct dwc3_request *re=
q)
>>>>>  {
>>>>> -	return req->num_pending_sgs =3D=3D 0;
>>>>> +	return req->num_queued_sgs =3D=3D 0;
>>>>
>>>>nope, request is, indeed, completed when there no more pending entries
>>>>to be consumed.
>>>>
>>>>What sort of problem are you dealing with? Got any way of reproducing
>>>>it? Got some trace output showing the issue?
>>>
>>> I digged a little bit deeper to fully understand the issue here. What
>>> I found is that in dwc3_prepare_trbs will make two assumptions on
>>> num_pending_sgs.
>>>
>>> When the real purpose of the variable is to track the dequeued trbs.
>>
>>its purpose is *not* to track the dequeued trbs.
>>
>>> Than we have to fix the started list handling in the dwc3_prepare_trbs.
>>>
>>> The comment in the function says:
>>>
>>>          /*
>>>           * We can get in a situation where there's a request in the st=
arted list
>>>           * but there weren't enough TRBs to fully kick it in the first=
 time
>>>           * around, so it has been waiting for more TRBs to be freed up.
>>>           *
>>>           * In that case, we should check if we have a request with pen=
ding_sgs
>>>           * in the started list and prepare TRBs for that request first,
>>>           * otherwise we will prepare TRBs completely out of order and =
that will
>>>           * break things.
>>>           */
>>>          list_for_each_entry(req, &dep->started_list, list) {
>>> 		if (req->num_pending_sgs > 0) {
>>> 		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>
>>> This condition seems to be made on a wrong assumption, thinking the
>>> num_pending_sgs was decremented after dwc3_prepare_one_trb was called o=
n parts
>>> of that requests sgs but not all.
>>
>>say num_mapped_sgs =3D 500. The driver has 255 TRBs for use (+1 link
>>trb). Clearly not all SGs will fit in one go. Driver will set
>>num_pending_sgs to 500, because that's the number of sgs that need to be
>>transferred.
>>
>>For each completion we will decrement num_pending_sgs. Assuming all 255
>>were free and used up, num_pending_sgs will be 245 at this point. Driver
>>*must* try to kick these 245 TRBs.
>
> Lets assume we have a request with length 1024 to 3072 like a multiple
> of maxpacket * mul it is used on in uvc_video.
>
> So with a scatterlist creating only a 2 byte header and 1022 to 3070
> bytes payload we get only two scatter entries in this request. On
> special cases like page boundaries we will add one extra sg, but this
> does not change much. So this is nothing big as your 500 example. Now
> lets assume we queue 64 of these up we end up with maximum fo 192 trbs
> being added to the pending list.
>
> Lets say every one of these will be queued with ep_queue comming from
> uvc_video_pump. The kick_transfer from these ep_queues will result in an
> dwc3_prepare_trbs. *But* after the first one being preprared from the
> pending list to the started list, it will have an req->num_preprared_sgs =
!=3D 0.

there's no such thing as req->num_prepared_sgs, do you mean
num_pending_sgs here? If you do, that's per-request. Gadget driver can
allocate and queue as many requests as it
likes. req_{n}->num_pending_sgs has nothing to do with
req_{n+1}->num_pending_sgs.

> Therefor after the first one got queued into the starting list and it
> did not complete yet, every next ep_queue->kick_transfer will always bail=
 out
> in dwc3_prepare_sgs, checking the one started request with num_preprared
> !=3D 0, without moving other requests from pending to the starting list.

no it won't. They're testing a different req pointer altogether. Or they
should. If you're queueing the same exact req pointer before it has been
completed, shame on you :-p

> This will result in an stalled driver, that will never prepare any
> pending requests into the started list.

it shouldn't. Please collect tracepoint output, this is probably the 5th
time I've asked for tracepoint output of the problem.

>>> But the completion path can not also depend on that variable to be decr=
emented
>>> after parts of that sgs get handled. Therefor I came up with this secon=
d patch.
>>>
>>> What do you think, would be the right way to solve this?
>>
>>unless you can show that a problem really exists, I don't think we
>>should do anything. Got a minimal reproduction method somewhere?
>>Tracepoint of the problem?
>
> Look into the attached 20210423_uvc_video_dwc3_gadget_trace. You will
> see my scenario I want to fix.

where exactly in the file is the problem? I took a snippet to look at:

>  irq/51-dwc3-239     [000] d..1    56.766818: dwc3_event: event (d08510ca=
): ep2in: Transfer Not Ready [0000d085] (Not Active)
> kworker/u5:1-74      [000] d..2    56.807742: dwc3_ep_queue: ep2in: req 0=
0000000823b0b62 length 0/3072 zsI =3D=3D> -115
> kworker/u5:1-74      [000] d..2    56.807759: dwc3_prepare_trb: ep2in: tr=
b 000000007ebd2707 (E1:D0) buf 000000000c623058 size 1x 2 ctrl 00000465:000=
00000 (HlCs:Sc:isoc-first)
> kworker/u5:1-74      [000] d..2    56.807764: dwc3_prepare_trb: ep2in: tr=
b 0000000093bb2bc4 (E2:D0) buf 000000000e200000 size 1x 3070 ctrl 00000c71:=
00000000 (Hlcs:SC:isoc)
> kworker/u5:1-74      [000] d..2    56.807777: dwc3_gadget_ep_cmd: ep2in: =
cmd 'Start Transfer' [d1d00406] params 00000000 0a6ab000 00000000 --> statu=
s: Successful

So, Isoc endpoints are a bit "special". We always wait for XferNotReady
before starting them. This is what you see here.

> kworker/u5:1-74      [000] d..2    56.807805: dwc3_ep_queue: ep2in: req 0=
00000006d3f8d0a length 0/3072 zsi =3D=3D> -115

When the following request is queued, TRANSFER_STARTED is set, but
PENDING_REQUEST shouldn't be set which would mean
__dwc3_gadget_kick_transfer() be called which should result in a call to
Update Transfer, unless I'm missing something here. It has been quite a
while since I looked at this driver deeply.

> kworker/u5:1-74      [000] d..2    56.807831: dwc3_ep_queue: ep2in: req 0=
0000000f5394c5d length 0/3072 zsi =3D=3D> -115
> kworker/u5:1-74      [000] d..2    56.807857: dwc3_ep_queue: ep2in: req 0=
0000000ef95b55c length 0/3072 zsi =3D=3D> -115
> kworker/u5:1-74      [000] d..2    56.807883: dwc3_ep_queue: ep2in: req 0=
0000000d36cf0cc length 0/3072 zsi =3D=3D> -115
> kworker/u5:1-74      [000] d..2    56.807908: dwc3_ep_queue: ep2in: req 0=
0000000c5f1bd4b length 0/3072 zsi =3D=3D> -115
> kworker/u5:1-74      [000] d..2    56.807934: dwc3_ep_queue: ep2in: req 0=
0000000b7180b2d length 0/3072 zsi =3D=3D> -115
> kworker/u5:1-74      [000] d..2    56.807960: dwc3_ep_queue: ep2in: req 0=
00000005d629ded length 0/3072 zsi =3D=3D> -115
> kworker/u5:1-74      [000] d..2    56.807985: dwc3_ep_queue: ep2in: req 0=
000000062e02cc0 length 0/3072 zsi =3D=3D> -115
> kworker/u5:1-74      [000] d..2    56.808011: dwc3_ep_queue: ep2in: req 0=
00000001d2ec1c0 length 0/3072 zsi =3D=3D> -115
> kworker/u5:1-74      [000] d..2    56.808038: dwc3_ep_queue: ep2in: req 0=
000000018ba3d29 length 0/3072 zsi =3D=3D> -115
> kworker/u5:1-74      [000] d..2    56.808063: dwc3_ep_queue: ep2in: req 0=
00000000be47fc7 length 0/3072 zsi =3D=3D> -115
> kworker/u5:1-74      [000] d..2    56.808089: dwc3_ep_queue: ep2in: req 0=
0000000caba09e2 length 0/3072 zsi =3D=3D> -115
> kworker/u5:1-74      [000] d..2    56.808115: dwc3_ep_queue: ep2in: req 0=
0000000cb0191c4 length 0/3072 zsi =3D=3D> -115
> kworker/u5:1-74      [000] d..2    56.808140: dwc3_ep_queue: ep2in: req 0=
00000005255f606 length 0/3072 zsi =3D=3D> -115
>  irq/51-dwc3-239     [000] d..1    56.808240: dwc3_event: event (d1d0408a=
): ep2in: Transfer In Progress [0000d1d0] (sIm)

eventually we get Transfer In Progress for the first TRB...

>  irq/51-dwc3-239     [000] d..1    56.808246: dwc3_complete_trb: ep2in: t=
rb 000000007ebd2707 (E2:D1) buf 000000000c623058 size 1x 0 ctrl 34740464:00=
00d1d0 (hlCs:Sc:isoc-first)
>  irq/51-dwc3-239     [000] d..1    56.808250: dwc3_complete_trb: ep2in: t=
rb 0000000093bb2bc4 (E2:D2) buf 000000000e200000 size 1x 0 ctrl 34740c70:00=
00d1d0 (hlcs:SC:isoc)
>  irq/51-dwc3-239     [000] d..1    56.808256: dwc3_gadget_giveback: ep2in=
: req 00000000823b0b62 length 3072/3072 zsI =3D=3D> 0

complete and give it back.

>  irq/51-dwc3-239     [000] d..1    56.808305: dwc3_prepare_trb: ep2in: tr=
b 000000004af35733 (E3:D2) buf 000000000c623088 size 1x 2 ctrl 00000465:000=
00000 (HlCs:Sc:isoc-first)
>  irq/51-dwc3-239     [000] d..1    56.808309: dwc3_prepare_trb: ep2in: tr=
b 00000000a11671a8 (E4:D2) buf 000000000e200bfe size 1x 3070 ctrl 00000471:=
00000000 (Hlcs:Sc:isoc)

prepare the next

>  irq/51-dwc3-239     [000] d..1    56.808320: dwc3_gadget_ep_cmd: ep2in: =
cmd 'Update Transfer' [50407] params 00000000 00000000 00000000 --> status:=
 Successful

kick it by telling the HW about it. I don't see any failures here,
although there may be situations where we could add more data to the
controller's cache early on.

I remember dealing with a bunch of Bus Expiry errors in the past and the
problem was because we couldn't maintain proper alignment with the
microframe number because HW only gives us 14 out of the 16 bits of the
microframe number, the only workaround was to waiting for
XferInProgress/XferNotReady to get that number.

PS: if you collect more traces in the future, please don't enable
ftrace. Keep current_tracer set to nop, ftrace is just adding garbage to
the output in this case :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCCrFURHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZBEQ//ahEQdNpgr4DEJtZzoonyqyxd+aR9P+Y/
2FkMU6H24lPcsVWIBW6xY6Czly4PkoQx5JJIKo5iMtZZpir/RVbwqpPmKOWc56fW
Lxnjp6IIOOj69kZM/q+QY9jQmhqwDdLYSeJcp4Z+G0tno0bJWMODz1xp1cqbnsS5
IsP5wPdaDt4UxOJRbzfw9LTPuA6novcmizxUYJV5Ax44qgrFNpsGRwpO/3+Zc37y
eqAudodXAJqsisFakFjmSQ0D1bfQpA2+8FY7kyLbzFTUMTIX1t96l5d1nHXk4ax1
QrbkAC7JOecYoHrj5DWGgQuQpY2xXgqTXZGVc+9x57V0rdtbWcFkOlRLf84TTxIH
mT3d7bqcpiE4WpSj413G+In+1b94JEL64Gg0D9AS//p+bF+u5sNdpYA8x4W8eqVo
U1mUOKJovWfEHJS3H7XFrib8dbwEE4gv04dIKiPQL0LdtJW3uSZDH+3wvU1UTHQu
fx2DdlRSXjqIOX8eaBADJoW4S1IepopWLoYq1ha7WcgTWsboOsg8HGLb+oKs04im
zjRlk5BA0l4B6X79PhIe37PDtwQcwgiWnXnuEm9n18psnXMScnG7F+RsnFXjF71B
swP8Xf+BJDnXguW0nhuxgoKgsH7Kr89mvvqnsNK7I2qIcd+WMoAXyR630SJHOFGr
zFvg67j3z9E=
=Bech
-----END PGP SIGNATURE-----
--=-=-=--
