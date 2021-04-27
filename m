Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42F536CC34
	for <lists+linux-usb@lfdr.de>; Tue, 27 Apr 2021 22:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238040AbhD0UNX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Apr 2021 16:13:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235974AbhD0UNW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Apr 2021 16:13:22 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82EC4C061574
        for <linux-usb@vger.kernel.org>; Tue, 27 Apr 2021 13:12:37 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lbU4P-0004da-BS; Tue, 27 Apr 2021 22:12:33 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lbU4O-0000Zn-EO; Tue, 27 Apr 2021 22:12:32 +0200
Date:   Tue, 27 Apr 2021 22:12:32 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
Message-ID: <20210427201232.GG6975@pengutronix.de>
References: <20210422201812.GC6975@pengutronix.de>
 <871rb1msmx.fsf@kernel.org>
 <20210423102738.GD6975@pengutronix.de>
 <87y2d9l0a2.fsf@kernel.org>
 <20210423131807.GE6975@pengutronix.de>
 <87k0osksgo.fsf@kernel.org>
 <20210424091206.GF6975@pengutronix.de>
 <87eeezlrvm.fsf@kernel.org>
 <68ae9066-b349-ba70-59c6-c2388b386b66@synopsys.com>
 <50e13b71-bdc1-6279-a224-bfc99cf10dc8@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f61P+fpdnY2FZS1u"
Content-Disposition: inline
In-Reply-To: <50e13b71-bdc1-6279-a224-bfc99cf10dc8@synopsys.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 22:04:34 up 68 days, 23:28, 80 users,  load average: 0.23, 0.33,
 0.21
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--f61P+fpdnY2FZS1u
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2021 at 03:18:57AM +0000, Thinh Nguyen wrote:
>Hi Michael,
>
>Thinh Nguyen wrote:
>> Felipe Balbi wrote:
>>>
>>> HI,
>>>
>>> Michael Grzeschik <mgr@pengutronix.de> writes:
>>>
>>> <big snip>
>>>
>
>
><bigger snip>
>
>
>> I think I see the issue that Michael reported.
>>
>> The problem is that we're using num_pending_sgs to track both pending SG
>> entries and queued SG entries. num_pending_sgs doesn't get updated until
>> TRB completion interrupt (ie XferInProgress). Before the driver queues
>> more SG requests, it will check if there's any pending SG in the started
>> request list before it prepares more. Since the num_pending_sgs doesn't
>> get updated until the request is completed, the driver doesn't process
>> more until the request is completed.
>>
>> I need to review more on Michael's patches next week, but I think what
>> he suggested makes sense (in term of properly usage of queued sgs vs
>> pending sgs). BTW, please correct me if I'm wrong, but we do modify
>> num_queued_sgs.
>>
>
>There's still some issue with your patch. I think this should cover it.
>Let me know if it works for you.

This works for me! Will you spin a proper patch from that?

>Note: this however probably needs more "Tested-by" and reviews
>to make sure I'm not missing anything. I only ran some basic tests,
>and will need to run more.

You may already have mine:

Tested-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

>Let me know if this makes sense.

=46rom what I understand about the issue and the purpose of all
variables this makes total sense to me. So thanks for taking over
and make a proper solution.

Thanks,
Michael

>BR,
>Thinh
>
>
>diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>index dd80e5ca8c78..040cc67b3361 100644
>--- a/drivers/usb/dwc3/gadget.c
>+++ b/drivers/usb/dwc3/gadget.c
>@@ -1244,6 +1244,7 @@ static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
>                        req->start_sg =3D sg_next(s);
>
>                req->num_queued_sgs++;
>+               req->num_pending_sgs--;
>
>                /*
>                 * The number of pending SG entries may not correspond to =
the
>@@ -1251,7 +1252,7 @@ static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
>                 * don't include unused SG entries.
>                 */
>                if (length =3D=3D 0) {
>-                       req->num_pending_sgs -=3D req->request.num_mapped_=
sgs - req->num_queued_sgs;
>+                       req->num_pending_sgs =3D 0;
>                        break;
>                }
>
>@@ -2867,15 +2868,15 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct dw=
c3_ep *dep,
>        struct dwc3_trb *trb =3D &dep->trb_pool[dep->trb_dequeue];
>        struct scatterlist *sg =3D req->sg;
>        struct scatterlist *s;
>-       unsigned int pending =3D req->num_pending_sgs;
>+       unsigned int num_queued =3D req->num_queued_sgs;
>        unsigned int i;
>        int ret =3D 0;
>
>-       for_each_sg(sg, s, pending, i) {
>+       for_each_sg(sg, s, num_queued, i) {
>                trb =3D &dep->trb_pool[dep->trb_dequeue];
>
>                req->sg =3D sg_next(s);
>-               req->num_pending_sgs--;
>+               req->num_queued_sgs--;
>
>                ret =3D dwc3_gadget_ep_reclaim_completed_trb(dep, req,
>                                trb, event, status, true);
>@@ -2898,7 +2899,7 @@ static int dwc3_gadget_ep_reclaim_trb_linear(struct =
dwc3_ep *dep,
>
> static bool dwc3_gadget_ep_request_completed(struct dwc3_request *req)
> {
>-       return req->num_pending_sgs =3D=3D 0;
>+       return req->num_pending_sgs =3D=3D 0 && req->num_queued_sgs =3D=3D=
 0;
> }
>
> static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
>@@ -2907,7 +2908,7 @@ static int dwc3_gadget_ep_cleanup_completed_request(=
struct dwc3_ep *dep,
> {
>        int ret;
>
>-       if (req->num_pending_sgs)
>+       if (req->request.num_mapped_sgs)
>                ret =3D dwc3_gadget_ep_reclaim_trb_sg(dep, req, event,
>                                status);
>        else

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--f61P+fpdnY2FZS1u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmCIcCwACgkQC+njFXoe
LGRTkg//UVJweNjGCowKk4MzsQSfGCUUIj7yg+ccd6niFy+RPCDdHSHgWGOtmKVo
U2EH0//tIbLDTsNUtwgUbzMeWC0onO6YuLo7my1FYyCdOorS3/SGqcrLHrn7VRXm
S7wykUMY7ZEj6FMjL5+W4F+6YwmEv2fWvhWPMXI401u6pZKOYuEafUd5VRBbIvi5
Dozkxk32XGTyYHdJcjyuFZV5byDn8dCRdmeah5HnCXKsj0tGDxc4fGgLFkPfZvS5
fg4ByMvfupQu2A2KdVst78PGpjyx/zzlgnCpmyO555U96xq7tLULSfVpjsIZCxL4
9qGlEL0mVx82PgNoKq+ICo6KA+aqg03Hh5PQoYnMx/fkfhkx4Pc1d7f0k0E4B3HP
Zn95UbEmvDo6NJR8AtXUPvaD6cECeWFddSu/bbOetpWF+idkSYaz3HPe6+ju0dA9
ud8O9SxDt7S7PYxP9SFgxvHjMW2liF40KFYLY3ON8lpl2AjmRvWwHepcRIJlvnLG
nxYWkKk0C3NyF6dAWaoCHpAJwfkvPu64BYlqjdCpNQTr8d8zzrF0jCjeVJ4D7jdR
WdK8KypuYIqmqiDNJEH+e6THjV2fPAeb9hFEB2zLhUpcSm1gvRRExaPJRg76AQOE
64N37488Jxwe5wp5To3WRntnrFbRVAmF4Mr0DuZLiPOVpDbCm78=
=5DPE
-----END PGP SIGNATURE-----

--f61P+fpdnY2FZS1u--
