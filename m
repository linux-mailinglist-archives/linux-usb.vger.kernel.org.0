Return-Path: <linux-usb+bounces-2128-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DA37D4FD6
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 14:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41C2628185C
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 12:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2C6262B3;
	Tue, 24 Oct 2023 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4FA273C1
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 12:33:36 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C224186
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 05:33:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1qvGb8-0005TU-Pf; Tue, 24 Oct 2023 14:33:26 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1qvGb7-003wTs-Lk; Tue, 24 Oct 2023 14:33:25 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1qvGb7-007Tfp-CI; Tue, 24 Oct 2023 14:33:25 +0200
Date: Tue, 24 Oct 2023 14:33:25 +0200
From: Michael Grzeschik <mgr@pengutronix.de>
To: Jayant Chowdhary <jchowdhary@google.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"etalvala@google.com" <etalvala@google.com>,
	"arakesh@google.com" <arakesh@google.com>
Subject: Re: uvc gadget: Making upper bound of number of usb requests
 allocated configurable through configfs
Message-ID: <ZTe5leI7Hvk2/cl9@pengutronix.de>
References: <edad1597-48da-49d2-a089-da2487cac889@google.com>
 <2023100834-statistic-richly-49ef@gregkh>
 <7ed46b3c-bd42-468e-b28d-860dc8a6c7e6@google.com>
 <20231012184954.ech7kfpqjkunq6eu@synopsys.com>
 <c47e864b-4b9e-4a21-afea-af121a4d7771@google.com>
 <20231020233044.dh63nu3tkbmrtfl4@synopsys.com>
 <69609645-fa20-4987-981d-1ab264e80b9b@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="800O9bjXdhEWNslw"
Content-Disposition: inline
In-Reply-To: <69609645-fa20-4987-981d-1ab264e80b9b@google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org


--800O9bjXdhEWNslw
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 11:13:03AM -0700, Jayant Chowdhary wrote:
>Hi Thinh, Michael,
>
>On 10/20/23 16:30, Thinh Nguyen wrote:
>> Sorry for the delay response.
>>
>> On Sun, Oct 15, 2023, Jayant Chowdhary wrote:
>>> On 10/12/23 11:50, Thinh Nguyen wrote:
>>>> The frequency of the request submission should not depend on the
>>>> video_pump() work thread since it can vary. The frequency of request
>>>> submission should match with the request completion. We know that
>>>> request completion rate should be fixed (1 uframe/request + when you
>>>> don't set no_interrupt). Base on this you can do your calculation on h=
ow
>>>> often you should set no_interrupt and how many requests you must submi=
t.
>>>> You don't have to wait for the video_pump() to submit 0-length request=
s.
>>>>
>>>> The only variable here is the completion handler delay or system
>>>> latency, which should not be much and should be within your calculatio=
n.
>>>
>>> Thanks for the suggestion. It indeed makes sense that we do not complet=
ely depend on
>>> video_pump() for sending 0 length requests. I was concerned about
>>> synchronization needed when we send requests to the dwc3 controller from
>>> different threads. I see that the dwc3 controller code does internally =
serialize
>>> queueing requests, can we expect this from other controllers as well ?
>> While it's not explicitly documented, when the gadget driver uses
>> usb_ep_queue(), the order in which the gadget recieves the request
>> should be maintained and serialized. Because the order the transfer go
>> out for the same endpoint can be critical, breaking this will cause
>> issue.
>>
>Thanks for clarifying this. Keeping this in mind - I made a slight modific=
ation to
>your test patch - I removed the uvc_video_pump() function call from uvc_v4=
l2_qbuf(). We just
>call it in uvcg_video_enable(). That should just queue 0 length requests t=
ill the first qbuf
>is called. There-after only the complete handler running uvcg_video_comple=
te() calls video_pump(),
>which sends usb requests to the endpoint. While I do see that we hold the =
queue->irqlock while
>getting the uvc buffer to encode and sending it to the ep, I feel like its=
 just logically safer
>for future changes if we can restrict the pumping of requests to one threa=
d.
>
>Does that seem okay to you ? I can formalize it if it does.

I tested this, and it looks good so far.

Since your changes are minimal you could send this with me as the author
and add your Suggested-by Tag. You should also add your Tested-by Tag in
that case.

Regards,
Michael

>The patch would look something like (on top of: https://lore.kernel.org/li=
nux-usb/20230930184821.310143-1-arakesh@google.com/T/#t)
>
>---
> drivers/usb/gadget/function/f_uvc.c     |  4 ----
> drivers/usb/gadget/function/uvc.h       |  3 ---
> drivers/usb/gadget/function/uvc_v4l2.c  |  3 ---
> drivers/usb/gadget/function/uvc_video.c | 19 +++++++------------
> 4 files changed, 7 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/func=
tion/f_uvc.c
>index 44c36e40e943..7d78fc8c00c5 100644
>--- a/drivers/usb/gadget/function/f_uvc.c
>+++ b/drivers/usb/gadget/function/f_uvc.c
>@@ -907,14 +907,10 @@ static void uvc_function_unbind(struct usb_configura=
tion *c,
> {
> 	struct usb_composite_dev *cdev =3D c->cdev;
> 	struct uvc_device *uvc =3D to_uvc(f);
>-	struct uvc_video *video =3D &uvc->video;
> 	long wait_ret =3D 1;
>
> 	uvcg_info(f, "%s()\n", __func__);
>
>-	if (video->async_wq)
>-		destroy_workqueue(video->async_wq);
>-
> 	/*
> 	 * If we know we're connected via v4l2, then there should be a cleanup
> 	 * of the device from userspace either via UVC_EVENT_DISCONNECT or
>diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/functi=
on/uvc.h
>index e8d4c87f1e09..b33211c92c02 100644
>--- a/drivers/usb/gadget/function/uvc.h
>+++ b/drivers/usb/gadget/function/uvc.h
>@@ -88,9 +88,6 @@ struct uvc_video {
> 	struct uvc_device *uvc;
> 	struct usb_ep *ep;
>
>-	struct work_struct pump;
>-	struct workqueue_struct *async_wq;
>-
> 	/* Frame parameters */
> 	u8 bpp;
> 	u32 fcc;
>diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/f=
unction/uvc_v4l2.c
>index 68bb18bdef81..ef4305f79cfe 100644
>--- a/drivers/usb/gadget/function/uvc_v4l2.c
>+++ b/drivers/usb/gadget/function/uvc_v4l2.c
>@@ -421,9 +421,6 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4l2=
_buffer *b)
> 	if (ret < 0)
> 		return ret;
>
>-	if (uvc->state =3D=3D UVC_STATE_STREAMING)
>-		queue_work(video->async_wq, &video->pump);
>-
> 	return ret;
> }
>
>diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/=
function/uvc_video.c
>index 54a1c36e879e..35fb6a185b6e 100644
>--- a/drivers/usb/gadget/function/uvc_video.c
>+++ b/drivers/usb/gadget/function/uvc_video.c
>@@ -24,6 +24,8 @@
>  * Video codecs
>  */
>
>+static void uvcg_video_pump(struct uvc_video *video);
>+
> static int
> uvc_video_encode_header(struct uvc_video *video, struct uvc_buffer *buf,
> 		u8 *data, int len)
>@@ -329,7 +331,9 @@ uvc_video_complete(struct usb_ep *ep, struct usb_reque=
st *req)
> 	 */
> 	if (video->is_enabled) {
> 		list_add_tail(&req->list, &video->req_free);
>-		queue_work(video->async_wq, &video->pump);
>+		spin_unlock_irqrestore(&video->req_lock, flags);
>+		uvcg_video_pump(video);
>+		return;
> 	} else {
> 		uvc_video_free_request(ureq, ep);
> 	}
>@@ -415,9 +419,8 @@ uvc_video_alloc_requests(struct uvc_video *video)
>  * This function fills the available USB requests (listed in req_free) wi=
th
>  * video data from the queued buffers.
>  */
>-static void uvcg_video_pump(struct work_struct *work)
>+static void uvcg_video_pump(struct uvc_video *video)
> {
>-	struct uvc_video *video =3D container_of(work, struct uvc_video, pump);
> 	struct uvc_video_queue *queue =3D &video->queue;
> 	struct usb_request *req =3D NULL;
> 	struct uvc_buffer *buf;
>@@ -545,7 +548,6 @@ uvcg_video_disable(struct uvc_video *video)
> 	}
> 	spin_unlock_irqrestore(&video->req_lock, flags);
>
>-	cancel_work_sync(&video->pump);
> 	uvcg_queue_cancel(&video->queue, 0);
>
> 	spin_lock_irqsave(&video->req_lock, flags);
>@@ -621,8 +623,7 @@ int uvcg_video_enable(struct uvc_video *video, int ena=
ble)
>
> 	video->req_int_count =3D 0;
>
>-	queue_work(video->async_wq, &video->pump);
>-
>+	uvcg_video_pump(video);
> 	return ret;
> }
>
>@@ -635,12 +636,6 @@ int uvcg_video_init(struct uvc_video *video, struct u=
vc_device *uvc)
> 	INIT_LIST_HEAD(&video->ureqs);
> 	INIT_LIST_HEAD(&video->req_free);
> 	spin_lock_init(&video->req_lock);
>-	INIT_WORK(&video->pump, uvcg_video_pump);
>-
>-	/* Allocate a work queue for asynchronous video pump handler. */
>-	video->async_wq =3D alloc_workqueue("uvcgadget", WQ_UNBOUND | WQ_HIGHPRI=
, 0);
>-	if (!video->async_wq)
>-		return -EINVAL;
>
> 	video->uvc =3D uvc;
> 	video->fcc =3D V4L2_PIX_FMT_YUYV;
>--=20
>
>>> This brings me to another question for Michael - I see
>>> that we introduced a worker thread for pumping  usb requests to the usb=
 endpoint
>>> in https://urldefense.com/v3/__https://lore.kernel.org/all/202004271516=
14.10868-1-m.grzeschik@pengutronix.de/__;!!A4F2R9G_pg!aAnzCopbTbZtUxBK6a6r6=
_QzV-b2Z2J5o5esPaartZ2jogKijmhqj6OyiKDg-BPhxq8pJHR3HS1Hf8z6YnqfWTon$
>>> (I see multiple email addresses, so apologies if I used the incorrect o=
ne).
>>>
>>> Did we introduce the worker thread to solve some specific deadlock scen=
arios ?
>>> Or was it a general mitigation against racy usb request submission from=
 v4l2 buffer
>>> queuing, stream enable and the video complete handler firing ?
>>>
>>> I was chatting with Avi about this, what if we submit requests to the e=
ndpoint
>>> only at two points in the streaming lifecycle -
>>> 1) The whole 64 (or however many usb requests are allocated) when
>>>    uvcg_video_enable() is called - with 0 length usb_requests.
>>> 2) In the video complete handler - if a video buffer is available, we e=
ncode it
>>>    and submit it to the endpoint. If not, we send a 0 length request.
>>>
>>> This way we're really maintaining back pressure and sending requests as=
 soon
>>> as we can to the dwc3 controller. Encoding is mostly memcpys from what =
I see
>>> so hopefully not too heavy on the interrupt handler. I will work on pro=
totyping
>>> this meanwhile.
>>>
>> That sounds good to me. I believe Michael already provided some test
>> patches and you've already done some preliminary tests for that right?
>
>Yes that is correct. I tested out the patch above as well and it seems to
>work for my setup. I haven't seen flickers in over an hour of streaming.
>
>Thanks,
>Jayant
>
>
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--800O9bjXdhEWNslw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmU3uZIACgkQC+njFXoe
LGRcag/5ARWgAB2jrhi5NHwzq2+jykr30BdyKIdzmP5+OpRIxg3ATfd7YPMjCzhY
cSG+n6LjKJ3ctpLiYg2SPZJHAyMYkAVjEtf/1yMGhWz8r34J1fsh+dK1EWaqgBy7
ERLcRX8Kzo3OyY2PZvnolSn4ny5bInwxnUk/LRP3sh1R/5Qdh5VPGEvwPfpZoNaR
2x2oP0ALLlUZStpjPED02xq+kdKjokHTkBRUAAQanmqwSojZpy0G6mVGljrF6KTj
gKZ5XeoHkoD7PWgI5seh+Eok8cgdMVLeJSUtHpIS/aFFUIajpDqQv3lKqppfTOMD
m7l00/+rAumBfi+fRCyCSQgQLMNcIz9YY50OAKeK8nh6PiFia6mCNpspMfJpKnqC
d1yFP8tWPIwcIKWZNfiz1pWeVdKLcIT8VBB1KSNAFLBqIB2Ff14jfnSI/4POHOZh
kxbvrJhmOk9RQV8ZHq1PDY8Lr11tlZT0KHU4Q2uchxyoc8dm/BIELT23c3addD0J
5tT0UjupcEwt1cpUQzhWwr5qCx7HSATR9u2YVPjQe1wuaHTND1eZIQFcC0T7ATCU
DQLNzYpAp5ae91ot7POKGgnnMWjgn6foFSrz421Hx+xKfMoAiHr0fu/s2XsbyQxY
2LNnvh1BryPoQqDJvF1wl6I0VYPe+MWm3Hw9dSWvWwctPy4abo8=
=JKDq
-----END PGP SIGNATURE-----

--800O9bjXdhEWNslw--

