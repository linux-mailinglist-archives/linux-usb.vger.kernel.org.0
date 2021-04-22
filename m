Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4517F3687CB
	for <lists+linux-usb@lfdr.de>; Thu, 22 Apr 2021 22:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236993AbhDVUSu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Apr 2021 16:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236915AbhDVUSu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Apr 2021 16:18:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8D07C06174A
        for <linux-usb@vger.kernel.org>; Thu, 22 Apr 2021 13:18:14 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lZfm9-00033z-BO; Thu, 22 Apr 2021 22:18:13 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lZfm8-0000Id-1p; Thu, 22 Apr 2021 22:18:12 +0200
Date:   Thu, 22 Apr 2021 22:18:12 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
Message-ID: <20210422201812.GC6975@pengutronix.de>
References: <20210421204837.4185-1-m.grzeschik@pengutronix.de>
 <20210421204837.4185-3-m.grzeschik@pengutronix.de>
 <87o8e6mvue.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
In-Reply-To: <87o8e6mvue.fsf@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 21:43:10 up 63 days, 23:07, 87 users,  load average: 0.05, 0.05,
 0.06
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22, 2021 at 01:56:09PM +0300, Felipe Balbi wrote:
>
>Hi,
>
>(subject format as well)
>
>Michael Grzeschik <m.grzeschik@pengutronix.de> writes:
>> The variable pending_sgs was used to keep track of handled
>> sgs in one request. But instead queued_sgs is being decremented
>
>no, it wasn't. If the total number of entries in the scatter list is 'x'
>and we have transferred (completed) 'y' entries, then pending_sgs should
>be (x - y).
>
>> on every handled sg. This patch fixes the usage of the variable
>> to use queued_sgs instead as intended.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>>  drivers/usb/dwc3/gadget.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 118b5bcc565d6..2d7d861b13b31 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -2856,7 +2856,7 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct dw=
c3_ep *dep,
>>  	struct dwc3_trb *trb =3D &dep->trb_pool[dep->trb_dequeue];
>>  	struct scatterlist *sg =3D req->sg;
>>  	struct scatterlist *s;
>> -	unsigned int pending =3D req->num_pending_sgs;
>> +	unsigned int pending =3D req->num_queued_sgs;
>>  	unsigned int i;
>>  	int ret =3D 0;
>>
>> @@ -2864,7 +2864,7 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct dw=
c3_ep *dep,
>>  		trb =3D &dep->trb_pool[dep->trb_dequeue];
>>
>>  		req->sg =3D sg_next(s);
>> -		req->num_pending_sgs--;
>> +		req->num_queued_sgs--;
>
>no, this is wrong. queued shouldn't be modified as it comes straight
>from the gadget driver. This is the number of entries in the request
>that the gadget driver gave us. We don't want to modify it.

Right, but pending_sgs than has two use cases. One to track the mapped
sgs that got not queued. And one here to to track the "queued sgs" that
got dequeued.

>>
>>  		ret =3D dwc3_gadget_ep_reclaim_completed_trb(dep, req,
>>  				trb, event, status, true);
>> @@ -2887,7 +2887,7 @@ static int dwc3_gadget_ep_reclaim_trb_linear(struc=
t dwc3_ep *dep,
>>
>>  static bool dwc3_gadget_ep_request_completed(struct dwc3_request *req)
>>  {
>> -	return req->num_pending_sgs =3D=3D 0;
>> +	return req->num_queued_sgs =3D=3D 0;
>
>nope, request is, indeed, completed when there no more pending entries
>to be consumed.
>
>What sort of problem are you dealing with? Got any way of reproducing
>it? Got some trace output showing the issue?

I digged a little bit deeper to fully understand the issue here. What
I found is that in dwc3_prepare_trbs will make two assumptions on
num_pending_sgs.

When the real purpose of the variable is to track the dequeued trbs.
Than we have to fix the started list handling in the dwc3_prepare_trbs.

The comment in the function says:

         /*
          * We can get in a situation where there's a request in the starte=
d list
          * but there weren't enough TRBs to fully kick it in the first time
          * around, so it has been waiting for more TRBs to be freed up.
          *
          * In that case, we should check if we have a request with pending=
_sgs
          * in the started list and prepare TRBs for that request first,
          * otherwise we will prepare TRBs completely out of order and that=
 will
          * break things.
          */
         list_for_each_entry(req, &dep->started_list, list) {
		if (req->num_pending_sgs > 0) {
		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This condition seems to be made on a wrong assumption, thinking the
num_pending_sgs was decremented after dwc3_prepare_one_trb was called on pa=
rts
of that requests sgs but not all.

But the completion path can not also depend on that variable to be decremen=
ted
after parts of that sgs get handled. Therefor I came up with this second pa=
tch.

What do you think, would be the right way to solve this?


The second issue I see in dwc3_prepare_trbs is the bail out of iterations o=
ver
the pending and starting lists. Whenever one case of (req->num_pending_sgs =
> 0)
will be true after calling dwc3_prepare_trbs_sg, the function returns immed=
iately.

In my case, where my uvc_video now enqueues up to 64 requests, every single
kick_transfer called from one ep_queue will ensure only one call of
dwc3_prepare_trbs_sg on one entry of the pending list. This bottleneck makes
the hardware refill to slow and the hardware will drain fast even though en=
ough
pending buffers are there.

I suggest to remove those returns.

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmCB2f8ACgkQC+njFXoe
LGTz7w//Q/gEE5J7Afd197O09eqwNFUu2nSUmC2g7fBlyoTKa0aDJhTRNaN+O0I4
tvbqAgjRJ5Xw6zxY/6nNOvAHaFaYHzAISZK3oTcUpnEOXjlF2gGL6Igo4wqlQc3S
zFCxLP7ZX017itbZ+KapGNIjejkfDrg8FRcNXF7+75FjCjhdxg/wrZYwB8J2sYdR
VG8qbgCp4SG2Lgi2Lgoil/ZPUJkM1Px6GERdjEKGtoNjaz849QDt+eDB82qNbbl6
Rzw3jouMZUL/sEeCKkbGG7c7XXRzgcMT5nYLacNPyWrslDcZhJiw0gDYOu8+3nwG
Vv7kgmSP0Ny395aY/OJQyDKkYoZgieNbp36ayJ9b+UNwgzBtnBXf9P6yiwSeb+hF
5VBTiRnGDxpVAAGXYX1SA7p3QQbTb4SdFlofHJ1DHBLzHRvD42gtjEAGiWDJDk01
GIFRJLIErxJ27xbLdgTlq3vQIEe8NVlZ9I/U2Y8WLYLttYR8MkDb2Pi3UK5kKJwC
JTgN4UVCp4kbEi0DDwpew97KS3hqEHM739FzGvKJDJFRsV1YU/5t3PUff6Qo7odg
SUoFp84ZFtypxxpAIzCokxgJ80C6/GpUXcpTGP45QdhEBi2/P4tcBPLbI/Kca3LA
eRFXIpqwAbKoU3gOT0Y4uCwuy9cGjAiaAdpCccVHwqM+rp+aeOA=
=6WwP
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
