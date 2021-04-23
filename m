Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31AE3368D03
	for <lists+linux-usb@lfdr.de>; Fri, 23 Apr 2021 08:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhDWGSY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Apr 2021 02:18:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:56120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229456AbhDWGSY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Apr 2021 02:18:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D1DE613D7;
        Fri, 23 Apr 2021 06:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619158668;
        bh=JmNSlzzLATWNA3atFpfVVEMva4n/hiSYm6BMFs6tqCY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=fXM96Ht1uPyFmTfX35jARAQRADwGQZgV1bB2grJtJGTjHmOmZkYzMGIbgzkSsWV6d
         v/DvItVShMhNnwTVybrT5YsxWWc/iLxgmJ6FCQ1+oWBayn4GYoW4gkLpDPa+KH5vx0
         ABWWV4DyKe9qRy3S4qToXb5ssELYWNChwybV5sbg9A4TwCKVnM/KNZoVMr3LcUnBVT
         GtTd9C85sP+DgBxZ6Idxq7pwXhInjzYI6FMkJkiaW13CTjeYdAMl06AoWaLV1uqbK7
         w12ukfHsyUjuZBSYlwweWXdFz3hvFWZz3hOsUU56RHDSgkJ7gemgLP7aTg2kh0vE+j
         /MyCXVxIBt/qA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
In-Reply-To: <20210422201812.GC6975@pengutronix.de>
References: <20210421204837.4185-1-m.grzeschik@pengutronix.de>
 <20210421204837.4185-3-m.grzeschik@pengutronix.de>
 <87o8e6mvue.fsf@kernel.org> <20210422201812.GC6975@pengutronix.de>
Date:   Fri, 23 Apr 2021 09:17:42 +0300
Message-ID: <871rb1msmx.fsf@kernel.org>
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
> On Thu, Apr 22, 2021 at 01:56:09PM +0300, Felipe Balbi wrote:
>>
>>Hi,
>>
>>(subject format as well)
>>
>>Michael Grzeschik <m.grzeschik@pengutronix.de> writes:
>>> The variable pending_sgs was used to keep track of handled
>>> sgs in one request. But instead queued_sgs is being decremented
>>
>>no, it wasn't. If the total number of entries in the scatter list is 'x'
>>and we have transferred (completed) 'y' entries, then pending_sgs should
>>be (x - y).
>>
>>> on every handled sg. This patch fixes the usage of the variable
>>> to use queued_sgs instead as intended.
>>>
>>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>> ---
>>>  drivers/usb/dwc3/gadget.c | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>> index 118b5bcc565d6..2d7d861b13b31 100644
>>> --- a/drivers/usb/dwc3/gadget.c
>>> +++ b/drivers/usb/dwc3/gadget.c
>>> @@ -2856,7 +2856,7 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct d=
wc3_ep *dep,
>>>  	struct dwc3_trb *trb =3D &dep->trb_pool[dep->trb_dequeue];
>>>  	struct scatterlist *sg =3D req->sg;
>>>  	struct scatterlist *s;
>>> -	unsigned int pending =3D req->num_pending_sgs;
>>> +	unsigned int pending =3D req->num_queued_sgs;
>>>  	unsigned int i;
>>>  	int ret =3D 0;
>>>
>>> @@ -2864,7 +2864,7 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct d=
wc3_ep *dep,
>>>  		trb =3D &dep->trb_pool[dep->trb_dequeue];
>>>
>>>  		req->sg =3D sg_next(s);
>>> -		req->num_pending_sgs--;
>>> +		req->num_queued_sgs--;
>>
>>no, this is wrong. queued shouldn't be modified as it comes straight
>>from the gadget driver. This is the number of entries in the request
>>that the gadget driver gave us. We don't want to modify it.
>
> Right, but pending_sgs than has two use cases. One to track the mapped
> sgs that got not queued. And one here to to track the "queued sgs" that
> got dequeued.

no, we have num_mapped_sgs for the number of mapped sgs. It's just that
right before kicking the transfer the number of pending sgs and the
number of mapped sgs is the same.

>>>
>>>  		ret =3D dwc3_gadget_ep_reclaim_completed_trb(dep, req,
>>>  				trb, event, status, true);
>>> @@ -2887,7 +2887,7 @@ static int dwc3_gadget_ep_reclaim_trb_linear(stru=
ct dwc3_ep *dep,
>>>
>>>  static bool dwc3_gadget_ep_request_completed(struct dwc3_request *req)
>>>  {
>>> -	return req->num_pending_sgs =3D=3D 0;
>>> +	return req->num_queued_sgs =3D=3D 0;
>>
>>nope, request is, indeed, completed when there no more pending entries
>>to be consumed.
>>
>>What sort of problem are you dealing with? Got any way of reproducing
>>it? Got some trace output showing the issue?
>
> I digged a little bit deeper to fully understand the issue here. What
> I found is that in dwc3_prepare_trbs will make two assumptions on
> num_pending_sgs.
>
> When the real purpose of the variable is to track the dequeued trbs.

its purpose is *not* to track the dequeued trbs.

> Than we have to fix the started list handling in the dwc3_prepare_trbs.
>
> The comment in the function says:
>
>          /*
>           * We can get in a situation where there's a request in the star=
ted list
>           * but there weren't enough TRBs to fully kick it in the first t=
ime
>           * around, so it has been waiting for more TRBs to be freed up.
>           *
>           * In that case, we should check if we have a request with pendi=
ng_sgs
>           * in the started list and prepare TRBs for that request first,
>           * otherwise we will prepare TRBs completely out of order and th=
at will
>           * break things.
>           */
>          list_for_each_entry(req, &dep->started_list, list) {
> 		if (req->num_pending_sgs > 0) {
> 		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> This condition seems to be made on a wrong assumption, thinking the
> num_pending_sgs was decremented after dwc3_prepare_one_trb was called on =
parts
> of that requests sgs but not all.

say num_mapped_sgs =3D 500. The driver has 255 TRBs for use (+1 link
trb). Clearly not all SGs will fit in one go. Driver will set
num_pending_sgs to 500, because that's the number of sgs that need to be
transferred.

For each completion we will decrement num_pending_sgs. Assuming all 255
were free and used up, num_pending_sgs will be 245 at this point. Driver
*must* try to kick these 245 TRBs.

> But the completion path can not also depend on that variable to be decrem=
ented
> after parts of that sgs get handled. Therefor I came up with this second =
patch.
>
> What do you think, would be the right way to solve this?

unless you can show that a problem really exists, I don't think we
should do anything. Got a minimal reproduction method somewhere?
Tracepoint of the problem?

> The second issue I see in dwc3_prepare_trbs is the bail out of iterations=
 over
> the pending and starting lists. Whenever one case of (req->num_pending_sg=
s > 0)
> will be true after calling dwc3_prepare_trbs_sg, the function returns imm=
ediately.
>
> In my case, where my uvc_video now enqueues up to 64 requests, every sing=
le

64 requests is not (necessarily) the same as 64 TRBs or 64 SG
entries. You need to explain this a little better.

> kick_transfer called from one ep_queue will ensure only one call of
> dwc3_prepare_trbs_sg on one entry of the pending list. This bottleneck ma=
kes
> the hardware refill to slow and the hardware will drain fast even though =
enough
> pending buffers are there.

what's the size of the buffers? are they contiguous or held in scatter
lists? Got tracepoints of the problem in question?

> I suggest to remove those returns.

we may get there when you successfully show the existence of a problem
:-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCCZoYRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQaEkxAAjtI8IIaJ2GXR22L+WAkBprHznIg7vIEO
6JqUOyGvxAttJqd0nlJ3sRdxMvC0c4P2wSTfUYJmHkRtDYiDOLhnm8g+NLfwdbIb
EYoTEM2d04uFCht9P3ec/ULtk09PfVW5PsSIsc/yRWtTjJa6yZXywzT1kVJAfVT4
i1+LtEsZWYUvlM/2oGqrADmkVJJwod8TGxPeEHSWWcwDe47DAA78KKwLbObd6JEE
wUzmNMV4DQ+Zown+atHFFACIlbGhxDWq22HoJZBSoMcspG6T+f/kagfrRW3naMen
WX5xJsbpRsIoSFfTqTolxI8hlXuZv0xW7jh/HCLAH+RVAgpfPeA58lywTWsq1wxJ
s493duAj+bOFn9TgnAJUX1vR54aNRvTjEoBK91t+OaqZ9TSvUjn14RqVG/8fmF1h
xJaFSqEueQDXbGNgJDoaGSg4vemIIF+fB29JqJxRQ8vqupziWb+4hCnt6YufCeNt
TkYCca6HPSdqwdVIy5VvBu3XVOmIOWEeDMCVAKpMIFZAv+gVizMqWMes29Eg4oJr
qXLhzWaFVvr42KwGn6fS8OAxWRF+huQYLnOguX7x98ADDC/A8wQi6NMu/2IFMI5D
ulSUjhWAZx8OmcS9RUJ+PQyejV4xuhjWQAjYRAlcFkrWCm7uDs1NbPwvS8HiSGlY
c29bNNQmY50=
=sc67
-----END PGP SIGNATURE-----
--=-=-=--
