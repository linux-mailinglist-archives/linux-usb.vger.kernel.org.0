Return-Path: <linux-usb+bounces-1946-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE467D0550
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 01:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC544282386
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 23:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB10C450CD;
	Thu, 19 Oct 2023 23:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDCC19440
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 23:15:48 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F4D115
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 16:15:44 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1qtcEq-0003JU-TW; Fri, 20 Oct 2023 01:15:36 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1qtcEp-002tlN-HE; Fri, 20 Oct 2023 01:15:35 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1qtcEp-000OaL-7W; Fri, 20 Oct 2023 01:15:35 +0200
Date: Fri, 20 Oct 2023 01:15:35 +0200
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
Message-ID: <ZTG4l49nrA5NeYr5@pengutronix.de>
References: <edad1597-48da-49d2-a089-da2487cac889@google.com>
 <2023100834-statistic-richly-49ef@gregkh>
 <7ed46b3c-bd42-468e-b28d-860dc8a6c7e6@google.com>
 <20231012184954.ech7kfpqjkunq6eu@synopsys.com>
 <c47e864b-4b9e-4a21-afea-af121a4d7771@google.com>
 <ZS/dmTjdCCdnelVP@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/mT6pBcTMuGn/oWy"
Content-Disposition: inline
In-Reply-To: <ZS/dmTjdCCdnelVP@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org


--/mT6pBcTMuGn/oWy
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 03:28:57PM +0200, Michael Grzeschik wrote:
>On Sun, Oct 15, 2023 at 09:33:43PM -0700, Jayant Chowdhary wrote:
>>On 10/12/23 11:50, Thinh Nguyen wrote:
>>>On Mon, Oct 09, 2023, Jayant Chowdhary wrote:
>>>>>On Fri, Oct 06, 2023 at 03:03:56PM -0700, Jayant Chowdhary wrote:
>>>>>>We had been seeing the UVC gadget driver receive isoc errors while
>>>>>>sending packets to the usb endpoint - resulting in glitches being sho=
wn
>>>>>>on linux hosts. My colleague Avichal Rakesh and others had a very
>>>>>>enlightening discussion at
>>>>>>https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/8741b7c=
b-54ec-410b-caf5-697f81e8ad64@google.com/T/__;!!A4F2R9G_pg!e3zVZGt-6Td6HJXq=
h8GaZAsUeKyvKBhOoyru9qzn3Vkw01Vdkwk7hFr_t5glBG2BYJlOYfFKEUpiH5H4gQ73n_-Y$
>>>>>>
>>>>>>
>>>>>>The conclusion that we came to was : usb requests with actual uvc fra=
me
>>>>>>data were missing their scheduled uframes in the usb controller. As a
>>>>>>mitigation, we started sending 0 length usb requests when there was no
>>>>>>uvc frame buffer available to get data from. Even with this mitigatio=
n,
>>>>>>we are seeing glitches - albeit at a lower frequency.
>>>>>>
>>>>>>After some investigation, it is seen that we=E2=80=99re getting isoc =
errors when
>>>>>>the worker thread serving video_pump() work items, doesn=E2=80=99t ge=
t scheduled
>>>>>>for longer periods of time - than usual - in most cases > 6ms.
>>>>>>This is close enough to the 8ms limit that we have when the number of=
 usb
>>>>>>requests in the queue is 64 (since we have a 125us uframe period). In=
 order
>>>>>>to tolerate the scheduling delays better, it helps to increase the nu=
mber of
>>>>>>usb requests in the queue . In that case, we have more 0 length reque=
sts
>>>>>>given to the udc driver - and as a result we can wait longer for uvc
>>>>>>frames with valid data to get processed by video_pump(). I=E2=80=99m =
attaching a
>>>>>>patch which lets one configure the upper bound on the number of usb
>>>>>>requests allocated through configfs. Please let me know your thoughts.
>>>>>>I can formalize=C2=A0 the patch if it looks okay.
>>>>>Why do you want to limit the upper bound?  Why not just not submit so
>>>>>many requests from userspace as you control that, right?
>>>>
>>>>Userspace negotiates a video frame rate (typically 30/60fps) with the h=
ost that does
>>>>not necessarily correspond to the ISOC cadence. After the
>>>>patch at https://urldefense.com/v3/__https://lkml.org/lkml/diff/2023/5/=
8/1115/1__;!!A4F2R9G_pg!e3zVZGt-6Td6HJXqh8GaZAsUeKyvKBhOoyru9qzn3Vkw01Vdkwk=
7hFr_t5glBG2BYJlOYfFKEUpiH5H4gWbb9bvy$  was submitted, we are
>>>>maintaining back pressure on the usb controller even if we do not have =
uvc frame
>>>>data, by sending the controller 0 length requests (as long as usb_reque=
sts are
>>>>available). Also, even if the userspace application were to somehow pro=
duce
>>>>data to match the ISOC rate, it would  need to have information about U=
SB
>>>>timing details - which I am not sure is available to userspace or is th=
e right
>>>>thing to do here ?
>>>>
>>>>Here, we are trying to handle the scenario in which the video_pump() wo=
rker
>>>>thread does not get scheduled in time - by increasing the number of usb=
 requests
>>>>allocated in the queue. This would send more usb requests to the usb co=
ntroller,
>>>>when video_pump() does get scheduled - even if they're 0 length. This b=
uys
>>>>the video_pump() worker thread scheduling time -since more usb requests
>>>>are with the controller, subsequent requests sent will not be 'stale' a=
nd
>>>>dropped by the usb controller.
>>>>
>>>I believe you're testing against dwc3 controller right? I may not be as
>>>familiar with UVC function driver, but based on the previous
>>>discussions, I think the driver should be able to handle this without
>>>the user input.
>>
>>Yes we are testing against the dwc3 controller.
>>
>>>
>>>The frequency of the request submission should not depend on the
>>>video_pump() work thread since it can vary. The frequency of request
>>>submission should match with the request completion. We know that
>>>request completion rate should be fixed (1 uframe/request + when you
>>>don't set no_interrupt). Base on this you can do your calculation on how
>>>often you should set no_interrupt and how many requests you must submit.
>>>You don't have to wait for the video_pump() to submit 0-length requests.
>>>
>>>The only variable here is the completion handler delay or system
>>>latency, which should not be much and should be within your calculation.
>>
>>
>>Thanks for the suggestion. It indeed makes sense that we do not completel=
y depend on
>>video_pump() for sending 0 length requests. I was concerned about
>>synchronization needed when we send requests to the dwc3 controller from
>>different threads. I see that the dwc3 controller code does internally se=
rialize
>>queueing requests, can we expect this from other controllers as well ?
>>
>>This brings me to another question for Michael - I see
>>that we introduced a worker thread for pumping  usb requests to the usb e=
ndpoint
>>in https://lore.kernel.org/all/20200427151614.10868-1-m.grzeschik@pengutr=
onix.de/
>>(I see multiple email addresses, so apologies if I used the incorrect one=
).
>>
>>Did we introduce the worker thread to solve some specific deadlock scenar=
ios ?
>
>Exactly. This was the reason why we moved to the pump worker. I actually
>looked into the host side implementation of the uvc driver. There we
>also queue an worker from the complete function:
>
>https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/media/usb/uvc/uvc_video.c#n1646
>
>So this sounded reasonable to me. However we faced similar issues like
>you and introduced different ways to improve the latency issue.
>
>One thing we did was improving the latency by adding WQ_HIGHPRI
>
>https://lore.kernel.org/linux-usb/20220907215818.2670097-1-m.grzeschik@pen=
gutronix.de/
>
>Another patch here is also adding WQ_CPU_INTENSIVE.
>
>But, after all the input from Thinh it is probably better to solve the
>issue in a more reliable way.
>
>>Or was it a general mitigation against racy usb request submission from v=
4l2 buffer
>>queuing, stream enable and the video complete handler firing ?
>
>I don't remember all of the issues we saw back then. But this is also an v=
ery
>likely scenario.
>
>>I was chatting with Avi about this, what if we submit requests to the end=
point
>>only at two points in the streaming lifecycle -
>>1) The whole 64 (or however many usb requests are allocated) when
>>  uvcg_video_enable() is called - with 0 length usb_requests.
>>2) In the video complete handler - if a video buffer is available, we enc=
ode it
>>  and submit it to the endpoint. If not, we send a 0 length request.
>
>It really sounds like a good idea.
>
>>This way we're really maintaining back pressure and sending requests as s=
oon
>>as we can to the dwc3 controller. Encoding is mostly memcpys from what I =
see
>>so hopefully not too heavy on the interrupt handler. I will work on proto=
typing
>>this meanwhile.

[1] https://lore.kernel.org/linux-usb/20230930184821.310143-1-arakesh@googl=
e.com/T/#t

It was actually not that hard to do that.
With the patches from this thread applied [1] , the unformal changes looks =
like this:

#change 1

diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/fu=
nction/uvc_v4l2.c
index f64d03136c5665..29cd23c38eb99d 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -626,8 +626,7 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4l2_=
buffer *b)
  	if (ret < 0)
  		return ret;
 =20
-	if (uvc->state =3D=3D UVC_STATE_STREAMING)
-		queue_work(video->async_wq, &video->pump);
+	uvcg_video_pump(video);
 =20
  	return ret;
  }
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/f=
unction/uvc_video.c
index 2ec51ed5e9d074..2fe800500c88a3 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -329,7 +329,9 @@ uvc_video_complete(struct usb_ep *ep, struct usb_reques=
t *req)
  	 */
  	if (video->is_enabled) {
  		list_add_tail(&req->list, &video->req_free);
-		queue_work(video->async_wq, &video->pump);
+		spin_unlock_irqrestore(&video->req_lock, flags);
+		uvcg_video_pump(video);
+		return;
  	} else {
  		uvc_video_free_request(ureq, ep);
  	}
@@ -413,9 +415,8 @@ uvc_video_alloc_requests(struct uvc_video *video)
   * This function fills the available USB requests (listed in req_free) wi=
th
   * video data from the queued buffers.
   */
-static void uvcg_video_pump(struct work_struct *work)
+int uvcg_video_pump(struct uvc_video *video)
  {
-	struct uvc_video *video =3D container_of(work, struct uvc_video, pump);
  	struct uvc_video_queue *queue =3D &video->queue;
  	/* video->max_payload_size is only set when using bulk transfer */
  	bool is_bulk =3D video->max_payload_size;
@@ -427,7 +428,7 @@ static void uvcg_video_pump(struct work_struct *work)
 =20
  	while(true) {
  		if (!video->ep->enabled)
-			return;
+			return 0;
 =20
  		/*
  		 * Check is_enabled and retrieve the first available USB
@@ -436,7 +437,7 @@ static void uvcg_video_pump(struct work_struct *work)
  		spin_lock_irqsave(&video->req_lock, flags);
  		if (!video->is_enabled || list_empty(&video->req_free)) {
  			spin_unlock_irqrestore(&video->req_lock, flags);
-			return;
+			return -EBUSY;
  		}
  		req =3D list_first_entry(&video->req_free, struct usb_request,
  					list);
@@ -513,7 +514,7 @@ static void uvcg_video_pump(struct work_struct *work)
  	}
 =20
  	if (!req)
-		return;
+		return 0;
 =20
  	spin_lock_irqsave(&video->req_lock, flags);
  	if (video->is_enabled)
@@ -521,6 +522,8 @@ static void uvcg_video_pump(struct work_struct *work)
  	else
  		uvc_video_free_request(req->context, video->ep);
  	spin_unlock_irqrestore(&video->req_lock, flags);
+
+	return 0;
  }
 =20
  /*
@@ -554,7 +557,6 @@ uvcg_video_disable(struct uvc_video *video)
  	}
  	spin_unlock_irqrestore(&video->req_lock, flags);
 =20
-	cancel_work_sync(&video->pump);
  	uvcg_queue_cancel(&video->queue, 0);
 =20
  	spin_lock_irqsave(&video->req_lock, flags);
@@ -635,8 +637,6 @@ int uvcg_video_enable(struct uvc_video *video, int enab=
le)
 =20
  	video->req_int_count =3D 0;
 =20
-	queue_work(video->async_wq, &video->pump);
-
  	return ret;
  }
 =20
@@ -649,12 +649,6 @@ int uvcg_video_init(struct uvc_video *video, struct uv=
c_device *uvc)
  	INIT_LIST_HEAD(&video->ureqs);
  	INIT_LIST_HEAD(&video->req_free);
  	spin_lock_init(&video->req_lock);
-	INIT_WORK(&video->pump, uvcg_video_pump);
-
-	/* Allocate a work queue for asynchronous video pump handler. */
-	video->async_wq =3D alloc_workqueue("uvcgadget", WQ_UNBOUND | WQ_HIGHPRI =
| WQ_CPU_INTENSIVE, 0);
-	if (!video->async_wq)
-		return -EINVAL;
 =20
  	video->uvc =3D uvc;
 =20
diff --git a/drivers/usb/gadget/function/uvc_video.h b/drivers/usb/gadget/f=
unction/uvc_video.h
index 03adeefa343b71..322b05da43965f 100644
--- a/drivers/usb/gadget/function/uvc_video.h
+++ b/drivers/usb/gadget/function/uvc_video.h
@@ -16,6 +16,8 @@ struct uvc_video;
 =20
  int uvcg_video_enable(struct uvc_video *video, int enable);
 =20
+int uvcg_video_pump(struct uvc_video *video);
+
  int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc);
 =20
  #endif /* __UVC_VIDEO_H__ */


#change 2

Also if you would like to revert the zero request generation apply this ont=
op.

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/f=
unction/uvc_video.c
index 82695a2ff39aa3..2a3c87079c548d 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -418,12 +418,9 @@ uvc_video_alloc_requests(struct uvc_video *video)
  int uvcg_video_pump(struct uvc_video *video)
  {
  	struct uvc_video_queue *queue =3D &video->queue;
-	/* video->max_payload_size is only set when using bulk transfer */
-	bool is_bulk =3D video->max_payload_size;
  	struct usb_request *req =3D NULL;
  	struct uvc_buffer *buf;
  	unsigned long flags;
-	bool buf_done;
  	int ret;
 =20
  	while(true) {
@@ -450,28 +447,13 @@ int uvcg_video_pump(struct uvc_video *video)
  		 */
  		spin_lock_irqsave(&queue->irqlock, flags);
  		buf =3D uvcg_queue_head(queue);
-
-		if (buf !=3D NULL) {
-			video->encode(req, video, buf);
-			buf_done =3D buf->state =3D=3D UVC_BUF_STATE_DONE;
-		} else if (!(queue->flags & UVC_QUEUE_DISCONNECTED) && !is_bulk) {
-			/*
-			 * No video buffer available; the queue is still connected and
-			 * we're transferring over ISOC. Queue a 0 length request to
-			 * prevent missed ISOC transfers.
-			 */
-			req->length =3D 0;
-			buf_done =3D false;
-		} else {
-			/*
-			 * Either the queue has been disconnected or no video buffer
-			 * available for bulk transfer. Either way, stop processing
-			 * further.
-			 */
+		if (buf =3D=3D NULL) {
  			spin_unlock_irqrestore(&queue->irqlock, flags);
  			break;
  		}
 =20
+		video->encode(req, video, buf);
+
  		/*
  		 * With USB3 handling more requests at a higher speed, we can't
  		 * afford to generate an interrupt for every request. Decide to
@@ -490,7 +472,8 @@ int uvcg_video_pump(struct uvc_video *video)
  		 *   indicated by video->uvc_num_requests), as a trade-off
  		 *   between latency and interrupt load.
  		 */
-		if (list_empty(&video->req_free) || buf_done ||
+		if (list_empty(&video->req_free) ||
+		    buf->state =3D=3D UVC_BUF_STATE_DONE ||
  		    !(video->req_int_count %
  		       DIV_ROUND_UP(video->uvc_num_requests, 4))) {
  			video->req_int_count =3D 0;
@@ -510,7 +493,8 @@ int uvcg_video_pump(struct uvc_video *video)
 =20
  		/* Endpoint now owns the request */
  		req =3D NULL;
-		video->req_int_count++;
+		if(buf->state !=3D UVC_BUF_STATE_DONE)
+			video->req_int_count++;
  	}
 =20
  	if (!req)


In my case this did not change a lot with the flickering.

In fact I did see the most effective change when increasing the
fifo size in the dwc3 controller like this in drivers/usb/dwc3/gadget.c

-813         fifo =3D dwc3_gadget_calc_tx_fifo_size(dwc, 1);
+813         fifo =3D dwc3_gadget_calc_tx_fifo_size(dwc, 3);

My system I am testing against is stressed with a high memory bandwidth
use. So it is possible that in this scenario the hardware fifo will not
get filled fast enough. Thus, changing the fifo size helps here. It is
still just a string to pull on but I think it is worth to dig a bit
deeper here.

I am not sure if you are already aware of the following discussion:

https://lore.kernel.org/all/ZPo51EUtBgH+qw44@pengutronix.de/T/

Rergards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--/mT6pBcTMuGn/oWy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmUxuJQACgkQC+njFXoe
LGRNQw//YKXsgFihDJqBB0Gqqpw6mrplfKd4AfxojlzeE9LF8ofsz9MIgSQTinQW
08mrVs/nCrP7/rOZNFojEeJefg/77EaSF+L1AfYjAXVceYZpX4Srx5aTlNxQPXo8
xiZOPpUTBGKb/V+RSKwhzKppi2HfM8FbbrSV44YesB4DQo6kYxxQTuw+gkbAWTiA
j+O4+gUz83fIRvJIS43eSDMGz+OUZ/GrBg2UqHQWLdrsvsNE9JCbdWYX2yO2q3UO
4UxWzJaLCIpiSyTgYHPTL9DE+nxGV4Z74Is4U3is4vniGq3IRF9tXpNSs4bvnxKL
g0kq3brB7cXPjbsTIvZVrCrZ/dZZWHPx7mr2O9bvmwPIX/j7P/lelhLdUPwOXhh6
aQytgbEprDClgMHI/ht4Gi6SGPTETlyJC6LMi8GklxYxpqTg0N6+TKqZ1XP3rFID
U0VYQ7NaVHTtZF523H80Pq8iFCv52NKYH9w9Wb9aWK/T+hB1zMqPKYzipVAJy76v
fK+HkPi4ngs2lO0JJv4rNMrCYGo0bfXykRevAneng2+Fj49H7UW2MKNmimdjJg4k
SU/FFteEI/SF8AQj9gGKxuN+8jJmK01Imw1nK8s3gicDASbH/Uv8gcMpcAkig8Mo
6JB1apMDjB2zJu4SBq4seykl+/aitWdLmSVK99mKEVFbCFsKd7w=
=qU8W
-----END PGP SIGNATURE-----

--/mT6pBcTMuGn/oWy--

