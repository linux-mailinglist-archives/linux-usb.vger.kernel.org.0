Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFB2C7919B6
	for <lists+linux-usb@lfdr.de>; Mon,  4 Sep 2023 16:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235441AbjIDOgo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Sep 2023 10:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbjIDOgo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Sep 2023 10:36:44 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C6D5CC8
        for <linux-usb@vger.kernel.org>; Mon,  4 Sep 2023 07:36:39 -0700 (PDT)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qdAgt-0001ut-5o; Mon, 04 Sep 2023 16:36:35 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qdAgr-004kP7-M3; Mon, 04 Sep 2023 16:36:33 +0200
Date:   Mon, 4 Sep 2023 16:36:33 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Avichal Rakesh <arakesh@google.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Message-ID: <ZPXrceImaT9GevmA@pengutronix.de>
References: <20230615093406.80195-1-dan.scally@ideasonboard.com>
 <20230615171558.GK741@pendragon.ideasonboard.com>
 <dbf1e426-cf86-46c4-afb9-9d6983f0fb6d@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Sh8kzIkGJ0MRG9hi"
Content-Disposition: inline
In-Reply-To: <dbf1e426-cf86-46c4-afb9-9d6983f0fb6d@google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:2:b01:1d::c5
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
Subject: Re: [PATCH] usb: gadget: uvc: Move usb_ep_disable() to
 uvcg_video_enable()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.whiteo.stw.pengutronix.de)
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--Sh8kzIkGJ0MRG9hi
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avichal

Cc'ing: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

On Wed, Aug 30, 2023 at 01:38:23PM -0700, Avichal Rakesh wrote:
>On 6/15/23 10:15, Laurent Pinchart wrote:
>> On Thu, Jun 15, 2023 at 10:34:06AM +0100, Daniel Scally wrote:
>>> Currently the UVC Gadget's .set_alt() callback disables the USB
>>> endpoint, following which a V4L2 event is queued that closes
>>> down the workqueue. This ordering results in repeated calls to
>>> usb_ep_queue() from the workqueue whilst usb_ep_disable() is
>>> running - behaviour that the documentation for usb_ep_disable()
>>> specifically prohibits.
>>>
>>> Move the call to usb_ep_disable() until after cancel_work_sync(),
>>> which will guarantee the endpoint is no longer in use when
>>> usb_ep_disable() is called.
>>>
>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>> ---
>>>  drivers/usb/gadget/function/f_uvc.c     | 3 ---
>>>  drivers/usb/gadget/function/uvc_video.c | 4 ++++
>>>  2 files changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/f=
unction/f_uvc.c
>>> index 5e919fb65833..4b91bd572a83 100644
>>> --- a/drivers/usb/gadget/function/f_uvc.c
>>> +++ b/drivers/usb/gadget/function/f_uvc.c
>>> @@ -337,9 +337,6 @@ uvc_function_set_alt(struct usb_function *f, unsign=
ed interface, unsigned alt)
>>>  		if (uvc->state !=3D UVC_STATE_STREAMING)
>>>  			return 0;
>>>
>>> -		if (uvc->video.ep)
>>> -			usb_ep_disable(uvc->video.ep);
>>> -
>>>  		memset(&v4l2_event, 0, sizeof(v4l2_event));
>>>  		v4l2_event.type =3D UVC_EVENT_STREAMOFF;
>>>  		v4l2_event_queue(&uvc->vdev, &v4l2_event);
>>
>> If we don't disable the endpoint here, should we return
>> USB_GADGET_DELAYED_STATUS here (and call uvc_function_setup_continue()
>> in uvc_v4l2_streamoff()) or is that not needed ? The uvc->state updated
>> should then possibly be moved to uvc_v4l2_streamoff() (checking if this
>> would cause any race condition would also be a nice bonus :-)).
>>
>
>Hey all,
>
>First off, apologies for reviving an old thread. We've also been seeing the
>"no resource for ep2in" warning from dwc3 controller, followed by the UVC =
gadget
>not streaming any frames, when there is a quick STREAMOFF->STREAMON sequen=
ce.
>
>It looks like this is the same root cause as what Dan mentioned in
>https://lore.kernel.org/20230531085544.253363-1-dan.scally@ideasonboard.co=
m/
>and this patch seems to solve. (Thank you Dan, for posting the stacktrace =
in
>that email thread! I had been banging my head for a couple of days before
>thinking of looking up the exact stack :|)
>
>IIUC, this stems from workqueue not fully shutting down by the time the usb
>endpoint is disabled and we need stronger guarantees that the workqueue pu=
mping
>usb_requests doesn't accidentally queue usb_requests _after_ we've disabled
>the streaming endpoint on the usb controller.
>
>Attached is a patch that attempts to address the concerns raised here and =
sets
>up some stronger timing and memory guarantees.
>
>So here are the list of changes over what Dan had already started:
>
> - Return USB_GADGET_DELAYED_STATUS from set_alt. This is to ensure there =
are no
>   more control transfers while we're waiting on the workqueue to wind dow=
n.
>
> - Move updating uvc->state to uvc_v4l2_streamoff as Laurent suggested.
>   This ensures that setting uvc->state to STREAMING or CONNECTED
>   happens as a result of streamoff and streamon events which makes things
>   easier to reason about.
>
> - Guard video_pump with uvc->state so the thread can be stopped by setting
>   uvc->state to anything other than UVC_STATE_STREAMING. This effectively=
 makes
>   uvc->state a flag for the video_pump loop to exit. This is the same fla=
g that
>   the complete callback uses to restart the workqueue, so all interactions
>   with the controller are effectively guarded by the same flag now.
>
> - Set uvc->state to UVC_STATE_CONNECTED before winding down the work queu=
e.
>   Now that all usb logic is guarded by the same flag, setting the flag sh=
ould
>   stop all usb packet queuing once current execution finishes.
>
> - Add some memory guarantees in uvcg_video_enable(). At the moment, we do=
n't
>   really consider the fact that usb_ep_dequeue is async, which means that=
 the
>   usb_requests may not have been returned to the gadget before we start
>   deallocating them. With this patch, we wait until all usb_requests have=
 been
>   returned to us before deallocating them (this adds a little bit of
>   bookkeeping, but nothing too complicated).

I am currently trying to solve that by preparing a patch that is
fixing the use of the requests when deallocating them. Since currently
the uvc_gadget is also running into wild use after free issues because
of exactly that async dequeue and dealloc situation. IMHO it should be
save to call dealloc after calling dequeue. Which is probably true for
other usb device controller driver other then dwc3.

For some background. The dwc3 is putting the requests into a cancelled list
that will be cleared by the interrupt handler and that is dequeuing them
instead. In between the dequeue call and the interrupt call the uvc layer c=
ould
dealloc the request which leads the interrupt handler to dequeue an
already freed request.

>   This also guarantees that the complete callback won't accidentally
>   re-queue work on the workqueue. Earlier, it was possible that with bad
>   enough luck (or scheduler), the complete callback re-triggered the
>   workqueue after uvcg_video_enable has already returned.
>
> - And finally, call usb_ep_disable after uvcg_video_enable returns, which=
, with
>   the new guarantees should ensure that it is safe to disable the endpoin=
t.
>
>I am not sure if this is the best way to do it, but in local testing it se=
ems
>to solve the issue. Let me know what you think or if there are better ways=
 to
>achieve this.
>
>Thank you!
>
>- Avi.
>
>---
> drivers/usb/gadget/function/f_uvc.c     | 11 ++++----
> drivers/usb/gadget/function/f_uvc.h     |  2 +-
> drivers/usb/gadget/function/uvc.h       |  5 +++-
> drivers/usb/gadget/function/uvc_v4l2.c  | 21 ++++++++++++---
> drivers/usb/gadget/function/uvc_video.c | 34 +++++++++++++++++++++++--
> 5 files changed, 60 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/func=
tion/f_uvc.c
>index faa398109431..75c9f9a3f884 100644
>--- a/drivers/usb/gadget/function/f_uvc.c
>+++ b/drivers/usb/gadget/function/f_uvc.c
>@@ -263,10 +263,13 @@ uvc_function_setup(struct usb_function *f, const str=
uct usb_ctrlrequest *ctrl)
> 	return 0;
> }
>
>-void uvc_function_setup_continue(struct uvc_device *uvc)
>+void uvc_function_setup_continue(struct uvc_device *uvc, int disable_ep)
> {
> 	struct usb_composite_dev *cdev =3D uvc->func.config->cdev;
>
>+	if (disable_ep && uvc->video.ep) {
>+		usb_ep_disable(uvc->video.ep);
>+	}
> 	usb_composite_setup_continue(cdev);
> }
>
>@@ -337,15 +340,11 @@ uvc_function_set_alt(struct usb_function *f, unsigne=
d interface, unsigned alt)
> 		if (uvc->state !=3D UVC_STATE_STREAMING)
> 			return 0;
>
>-		if (uvc->video.ep)
>-			usb_ep_disable(uvc->video.ep);
>-
> 		memset(&v4l2_event, 0, sizeof(v4l2_event));
> 		v4l2_event.type =3D UVC_EVENT_STREAMOFF;
> 		v4l2_event_queue(&uvc->vdev, &v4l2_event);
>
>-		uvc->state =3D UVC_STATE_CONNECTED;
>-		return 0;
>+		return USB_GADGET_DELAYED_STATUS;
>
> 	case 1:
> 		if (uvc->state !=3D UVC_STATE_CONNECTED)
>diff --git a/drivers/usb/gadget/function/f_uvc.h b/drivers/usb/gadget/func=
tion/f_uvc.h
>index 1db972d4beeb..e7f9f13f14dc 100644
>--- a/drivers/usb/gadget/function/f_uvc.h
>+++ b/drivers/usb/gadget/function/f_uvc.h
>@@ -11,7 +11,7 @@
>
> struct uvc_device;
>
>-void uvc_function_setup_continue(struct uvc_device *uvc);
>+void uvc_function_setup_continue(struct uvc_device *uvc, int disale_ep);
>
> void uvc_function_connect(struct uvc_device *uvc);
>
>diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/functi=
on/uvc.h
>index 6751de8b63ad..e40e702a7074 100644
>--- a/drivers/usb/gadget/function/uvc.h
>+++ b/drivers/usb/gadget/function/uvc.h
>@@ -104,8 +104,11 @@ struct uvc_video {
> 	unsigned int req_size;
> 	struct uvc_request *ureq;
> 	struct list_head req_free;
>+	unsigned int req_free_count; /* number of requests in req_free */
> 	spinlock_t req_lock;
>
>+	wait_queue_head_t req_free_queue;
>+
> 	unsigned int req_int_count;
>
> 	void (*encode) (struct usb_request *req, struct uvc_video *video,
>@@ -177,7 +180,7 @@ struct uvc_file_handle {
>  * Functions
>  */
>
>-extern void uvc_function_setup_continue(struct uvc_device *uvc);
>+extern void uvc_function_setup_continue(struct uvc_device *uvc, int disab=
le_ep);
> extern void uvc_function_connect(struct uvc_device *uvc);
> extern void uvc_function_disconnect(struct uvc_device *uvc);
>
>diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/f=
unction/uvc_v4l2.c
>index 3f0a9795c0d4..3d3469883ed0 100644
>--- a/drivers/usb/gadget/function/uvc_v4l2.c
>+++ b/drivers/usb/gadget/function/uvc_v4l2.c
>@@ -451,7 +451,7 @@ uvc_v4l2_streamon(struct file *file, void *fh, enum v4=
l2_buf_type type)
> 	 * Complete the alternate setting selection setup phase now that
> 	 * userspace is ready to provide video frames.
> 	 */
>-	uvc_function_setup_continue(uvc);
>+	uvc_function_setup_continue(uvc, 0);
> 	uvc->state =3D UVC_STATE_STREAMING;
>
> 	return 0;
>@@ -463,11 +463,19 @@ uvc_v4l2_streamoff(struct file *file, void *fh, enum=
 v4l2_buf_type type)
> 	struct video_device *vdev =3D video_devdata(file);
> 	struct uvc_device *uvc =3D video_get_drvdata(vdev);
> 	struct uvc_video *video =3D &uvc->video;
>+	int ret =3D 0;
>
> 	if (type !=3D video->queue.queue.type)
> 		return -EINVAL;
>
>-	return uvcg_video_enable(video, 0);
>+	uvc->state =3D UVC_STATE_CONNECTED;
>+	ret =3D uvcg_video_enable(video, 0);
>+	if (ret < 0) {
>+		return ret;
>+	}
>+
>+	uvc_function_setup_continue(uvc, 1);
>+	return 0;
> }
>
> static int
>@@ -500,6 +508,14 @@ uvc_v4l2_subscribe_event(struct v4l2_fh *fh,
> static void uvc_v4l2_disable(struct uvc_device *uvc)
> {
> 	uvc_function_disconnect(uvc);
>+	if (uvc->state =3D=3D UVC_STATE_STREAMING) {
>+		/*
>+		 * Drop uvc->state to CONNECTED if it was streaming before.
>+		 * This ensures that the usb_requests are no longer queued
>+		 * to the controller.
>+		 */
>+		uvc->state =3D UVC_STATE_CONNECTED;
>+	}
> 	uvcg_video_enable(&uvc->video, 0);
> 	uvcg_free_buffers(&uvc->video.queue);
> 	uvc->func_connected =3D false;
>@@ -647,4 +663,3 @@ const struct v4l2_file_operations uvc_v4l2_fops =3D {
> 	.get_unmapped_area =3D uvcg_v4l2_get_unmapped_area,
> #endif
> };
>-
>diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/=
function/uvc_video.c
>index 91af3b1ef0d4..3ea7d52df80d 100644
>--- a/drivers/usb/gadget/function/uvc_video.c
>+++ b/drivers/usb/gadget/function/uvc_video.c
>@@ -284,10 +284,18 @@ uvc_video_complete(struct usb_ep *ep, struct usb_req=
uest *req)
>
> 	spin_lock_irqsave(&video->req_lock, flags);
> 	list_add_tail(&req->list, &video->req_free);
>+	video->req_free_count++;
> 	spin_unlock_irqrestore(&video->req_lock, flags);
>
>-	if (uvc->state =3D=3D UVC_STATE_STREAMING)
>+	if (uvc->state =3D=3D UVC_STATE_STREAMING) {
> 		queue_work(video->async_wq, &video->pump);
>+	} else if (video->req_free_count =3D=3D video->req_size) {
>+		/*
>+		 * Wake up thread waiting for all requests to be returned to
>+		 * the gadget driver.
>+		 */
>+		wake_up_interruptible(&video->req_free_queue);
>+	}
> }
>
> static int
>@@ -316,6 +324,7 @@ uvc_video_free_requests(struct uvc_video *video)
>
> 	INIT_LIST_HEAD(&video->req_free);
> 	video->req_size =3D 0;
>+	video->req_free_count =3D 0;
> 	return 0;
> }
>
>@@ -360,6 +369,7 @@ uvc_video_alloc_requests(struct uvc_video *video)
> 	}
>
> 	video->req_size =3D req_size;
>+	video->req_free_count =3D req_size; /* all requests are currently free */
>
> 	return 0;
>
>@@ -382,6 +392,7 @@ static void uvcg_video_pump(struct work_struct *work)
> {
> 	struct uvc_video *video =3D container_of(work, struct uvc_video, pump);
> 	struct uvc_video_queue *queue =3D &video->queue;
>+	struct uvc_device *uvc =3D video->uvc;
> 	/* video->max_payload_size is only set when using bulk transfer */
> 	bool is_bulk =3D video->max_payload_size;
> 	struct usb_request *req =3D NULL;
>@@ -390,7 +401,7 @@ static void uvcg_video_pump(struct work_struct *work)
> 	bool buf_done;
> 	int ret;
>
>-	while (video->ep->enabled) {
>+	while (uvc->state =3D=3D UVC_STATE_STREAMING && video->ep->enabled) {
> 		/*
> 		 * Retrieve the first available USB request, protected by the
> 		 * request lock.
>@@ -403,6 +414,7 @@ static void uvcg_video_pump(struct work_struct *work)
> 		req =3D list_first_entry(&video->req_free, struct usb_request,
> 					list);
> 		list_del(&req->list);
>+		video->req_free_count--;
> 		spin_unlock_irqrestore(&video->req_lock, flags);
>
> 		/*
>@@ -479,6 +491,7 @@ static void uvcg_video_pump(struct work_struct *work)
>
> 	spin_lock_irqsave(&video->req_lock, flags);
> 	list_add_tail(&req->list, &video->req_free);
>+	video->req_free_count++;
> 	spin_unlock_irqrestore(&video->req_lock, flags);
> 	return;
> }
>@@ -505,6 +518,22 @@ int uvcg_video_enable(struct uvc_video *video, int en=
able)
> 			if (video->ureq && video->ureq[i].req)
> 				usb_ep_dequeue(video->ep, video->ureq[i].req);
>
>+		/*
>+		 * Wait 500ms for the usb_requests to be given back to the
>+		 * gadget driver. This ensures that we don't accidentally
>+		 * reference de-allocated usb_requests in the complete callback.
>+		 */
>+		if (video->req_free_count !=3D video->req_size) {
>+			uvcg_info(&video->uvc->func,
>+					"Waiting 500ms for usb_request complete callbacks.\n");
>+			ret =3D wait_event_interruptible_timeout(
>+					video->req_free_queue,
>+					video->req_free_count =3D=3D video->req_size,
>+					msecs_to_jiffies(500));
>+			uvcg_info(&video->uvc->func,
>+					"Done waiting for complete callbacks: %d\n", ret);
>+		}
>+
> 		uvc_video_free_requests(video);
> 		uvcg_queue_enable(&video->queue, 0);
> 		return 0;
>@@ -537,6 +566,7 @@ int uvcg_video_init(struct uvc_video *video, struct uv=
c_device *uvc)
> {
> 	INIT_LIST_HEAD(&video->req_free);
> 	spin_lock_init(&video->req_lock);
>+	init_waitqueue_head(&video->req_free_queue);
> 	INIT_WORK(&video->pump, uvcg_video_pump);
>
> 	/* Allocate a work queue for asynchronous video pump handler. */
>--

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--Sh8kzIkGJ0MRG9hi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmT1624ACgkQC+njFXoe
LGScXxAArz4WMWdICNAdC13k6RqJ6sdnpeA79rEhRDwucwXjGpVgx0w/3WLn/2+3
X4n5yXwb8ZBzg2de9P3ZzvBlFag0sJljR3hFRPNOIDQTaMrNS5SPspveAg5VPinP
BnP3aRX/IhHw5Jcz6k/Q+SBM3t2pLUv8iUuva0e4DvPv1smmvXBSd0jiSFH2QvWT
WKDOQ/WRteeJYN47G1Qacm5yJ9Pl8144DJGZ8+Dvahheq2qYMdczC9JAwwBbu9sd
sJaaXQB477wthZFF8YwfwLljnVDiTgGOti4DUGwzTPrRpfUOt/mvLWmyykjwWCLU
4/zL8dE2EdymtVwZXgJdwiga/tMCo7sjsvTR4HLLyLhp0vLSotMyodqAwYQvApKq
JU5Fkl/e9P0bzvG5cKtTjmyNk6koN/X7+YQKDWNjQwgh0OT5cqcBKYvFVBTgCqSj
XPcTmWz1Thj6uFQXag57EE8H3qv/MPSRUENHJcvFN1/3FqL0qNPusRRR73u3dbXB
brU+C3z1zb681XKd+eheKLaukeK2VxLkinRhnFx5b8HrVF+Q7TqJEBGFfmmRlHWJ
F836tRR4iZ/10HXR07C9gh83gHu8zUGtfq0ezYCW6ss9tWHeA09j5RyU+/pa5SaT
4Zcc8oie4K93+4vYxya03hFt74niVouUoAX/gtJBXhNxGpCFHfI=
=iieZ
-----END PGP SIGNATURE-----

--Sh8kzIkGJ0MRG9hi--
