Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA6B430C44
	for <lists+linux-usb@lfdr.de>; Sun, 17 Oct 2021 23:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242798AbhJQVNz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 17 Oct 2021 17:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232561AbhJQVNy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 17 Oct 2021 17:13:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23173C06161C
        for <linux-usb@vger.kernel.org>; Sun, 17 Oct 2021 14:11:44 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mcDRW-0001oI-H6; Sun, 17 Oct 2021 23:11:42 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mcDRV-0005Gd-Ls; Sun, 17 Oct 2021 23:11:41 +0200
Date:   Sun, 17 Oct 2021 23:11:41 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com
Subject: Re: [PATCH 5/7] usb: gadget: uvc: only pump video data if necessary
Message-ID: <20211017211141.GL17524@pengutronix.de>
References: <20210930102717.15720-1-m.grzeschik@pengutronix.de>
 <20210930102717.15720-6-m.grzeschik@pengutronix.de>
 <YVuARarduyZhwio8@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lR6P3/j+HGelbRkf"
Content-Disposition: inline
In-Reply-To: <YVuARarduyZhwio8@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 23:10:28 up 242 days, 34 min, 107 users,  load average: 0.24, 0.20,
 0.18
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--lR6P3/j+HGelbRkf
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 01:29:25AM +0300, Laurent Pinchart wrote:
>Hi Michael,
>
>Thank you for the patch.
>
>On Thu, Sep 30, 2021 at 12:27:15PM +0200, Michael Grzeschik wrote:
>> If the streaming endpoint is not enabled, the worker has nothing to do.
>> In the case it still got enqueued, this patch ensueres that it will bail
>
>s/it still got enqueued/buffers are still queued/
>s/ensueres/ensures/

Thanks, will fix this and your other comments on the patches in v3.

>> out without handling any data.
>
>Does this happen when uvc_function_set_alt() calls usb_ep_disable() ?
>The current implementation will cause usb_ep_queue() (called from
>uvcg_video_ep_queue(), from uvcg_video_pump()) to return an error in
>that case, which will result in uvcg_queue_cancel() being called in
>uvcg_video_pump(). With this patch, I believe this will still work fine
>as userspace is notified of the stream off event and calls
>VIDIOC_STREAMOFF, which in turn calls uvcg_video_enable(0) from
>uvc_v4l2_streamoff() (or uvcg_video_enable(0) gets called from
>uvc_v4l2_release() in the worst case if the application closes the
>device). Could you confirm that your understanding matches this analysis
>? If so,

Yes! I can confirm your analysis correct.

>
>Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>>  drivers/usb/gadget/function/uvc_video.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadge=
t/function/uvc_video.c
>> index ccee35177411d..152647495fa61 100644
>> --- a/drivers/usb/gadget/function/uvc_video.c
>> +++ b/drivers/usb/gadget/function/uvc_video.c
>> @@ -335,12 +335,12 @@ static void uvcg_video_pump(struct work_struct *wo=
rk)
>>  {
>>  	struct uvc_video *video =3D container_of(work, struct uvc_video, pump);
>>  	struct uvc_video_queue *queue =3D &video->queue;
>> -	struct usb_request *req;
>> +	struct usb_request *req =3D NULL;
>>  	struct uvc_buffer *buf;
>>  	unsigned long flags;
>>  	int ret;
>>
>> -	while (1) {
>> +	while (video->ep->enabled) {
>>  		/* Retrieve the first available USB request, protected by the
>>  		 * request lock.
>>  		 */
>> @@ -390,6 +390,9 @@ static void uvcg_video_pump(struct work_struct *work)
>>  		video->req_int_count++;
>>  	}
>>
>> +	if (!req)
>> +		return;
>> +
>>  	spin_lock_irqsave(&video->req_lock, flags);
>>  	list_add_tail(&req->list, &video->req_free);
>>  	spin_unlock_irqrestore(&video->req_lock, flags);
>
>--=20
>Regards,
>
>Laurent Pinchart
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--lR6P3/j+HGelbRkf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmFskYgACgkQC+njFXoe
LGTHaw/+KEw0W5zXKfLitC9sxJ7emDlDaZeVkWvQZUdZ10Zmtw3OPcfFmJYRhnT0
ceecKfwtrZptxul4+aWU2toL1Z/yd2J2x+rmNlRvP2/cXkT/wGKLl5+plmgIkLNy
dpjj0pLXH/UpPJUMAALS7tWINKqhSXz5qglfYENDR/lXC6iFjkF1ODpTbKtrX3tp
OlzbOEvaLQW1ELclECPXKPAUFjwWJrPhY6IccBu35g5QDNZDSdicwMSQ5mhFz9OR
xzNIgdk3WI1ZAxrYjUUTSSDkSFnUepLE8Aj60QLL2NHK0yz6Oq7Q0HOK+At3vrBA
k098UFrwsPJVBEEMOUs3ebbsM+k5qkfqICp6qscIqqkFN9OaloNQcfSGsI+ILGAa
A73xSFo24KTtd2b2Oj4Uw8/UNgAg6/e44f7PoyiP6qHn4rMsLZ8nJqoHV1+Oa+tI
a5nnkTyINR5p3A2pGP8bBo46iIHHp9Lb3wvV5PlixmLK64YI6bNa5N9wesI+vzfn
ON8kr5QdvFwoWM4vwkW2YlBrjkqvBKiQIAt+dY4wMciwGedpaF5zA0V5ir0Zisz6
CCcE8rAvQdBYX+7id1HP2wWyivkAj7spNEXxhwq9qneO1MijJ3Z232FiIxZFGjRB
3A7mra+49zl4dPnK46Hy8H8v9KE/qYgc4tgdn6l9GwSEbRxSmq8=
=aPLj
-----END PGP SIGNATURE-----

--lR6P3/j+HGelbRkf--
