Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 453A478E0D0
	for <lists+linux-usb@lfdr.de>; Wed, 30 Aug 2023 22:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236721AbjH3Uj6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Aug 2023 16:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232674AbjH3Uj5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Aug 2023 16:39:57 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DFC519B3
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 13:39:33 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68bed2c786eso85099b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 13:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693427907; x=1694032707; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wwSOHwsk5Aim9fjPaZmWVEYVhe4qvz3/Ggg8XSukRnk=;
        b=Qia+KrFpbEK9P+tYs48i3T0VCod0nHFF2KTUErYHD6z8XtwMQHU4IiHngtRoqOf1Xo
         yYdWZ4445GbusyHpQAvYp8EdF5g0bPGkb9y1uohQ0NUuH4QPob1IYGUShO+AjuZsWJPa
         fH4ffUY728LykaDJqEMBeUetdm8G1OY/gZKL/3pIYEabeFpvcy7t6AE5NEJGH67AQ5Sc
         03qRLh+6ntCDNhJq2Pqae76toM4Ghd9EVVBw9PkO/VxtSWoSYq6bshZmuwU/E1zFUi4y
         onWCKU52bxm9A1LG95kOIpBDXeFF6WfIxU3iDVNOHa2u9sRke5yjXcB44KmCyN8HrREP
         ktMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693427907; x=1694032707;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wwSOHwsk5Aim9fjPaZmWVEYVhe4qvz3/Ggg8XSukRnk=;
        b=Hc5Sqy41coZGsDEYDK0SpMnRjasIyGnJ0rBTpufoT0mobKQbueBU8fy32ASnJnQ6B6
         5NF8u97yyeOWXLdmCDdXPw2BtgHgGd293Lrb2vzw//NVj79fCp6sXvwaSkIX8iLtPEJR
         x4SeVkGSwXGAwI8AEIjQmvlXcrDGQExBE6SNY77UHoXKRkvcWNfzDB2ApTOd2OHhqnkZ
         ApKfwrp3KHMTORi6ZiKALj0/Qjc+hZYV2xWfaHoDp5lI7Ixff0HwjX8gBqyw2lk4DJ+p
         jwllm/spJNQn4yLujU82/cWT9TJayYGluoW5dplWJKBst1T8pp4LMA7xQIIDclc2gZMS
         Jkpw==
X-Gm-Message-State: AOJu0YxQkmo3nhXYgLeuP1gcFwgT/0dZrj3EhovV2NXqcqL0fS0WzIFU
        cR/xDnXZOekRoq0NVxucN5H4Fqt1vJ9p5y4NjD5C4A==
X-Google-Smtp-Source: AGHT+IF+sQLrGChAsEQ9ryY6fYK3rtJ/EjemDIaFoCAh0Ug7PkeM4+Hyr/SmtlkyxY21eIj+8XHBOA==
X-Received: by 2002:a05:6a00:98c:b0:68a:4dc3:dbb9 with SMTP id u12-20020a056a00098c00b0068a4dc3dbb9mr3681145pfg.28.1693427906641;
        Wed, 30 Aug 2023 13:38:26 -0700 (PDT)
Received: from [192.168.60.239] (124.190.199.35.bc.googleusercontent.com. [35.199.190.124])
        by smtp.gmail.com with ESMTPSA id a14-20020a62bd0e000000b0068718aadda7sm10313982pff.108.2023.08.30.13.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 13:38:26 -0700 (PDT)
Message-ID: <dbf1e426-cf86-46c4-afb9-9d6983f0fb6d@google.com>
Date:   Wed, 30 Aug 2023 13:38:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: uvc: Move usb_ep_disable() to
 uvcg_video_enable()
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>
References: <20230615093406.80195-1-dan.scally@ideasonboard.com>
 <20230615171558.GK741@pendragon.ideasonboard.com>
From:   Avichal Rakesh <arakesh@google.com>
In-Reply-To: <20230615171558.GK741@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 6/15/23 10:15, Laurent Pinchart wrote:
> Hi Dan,
> 
> Thank you for the patch.
> 
> On Thu, Jun 15, 2023 at 10:34:06AM +0100, Daniel Scally wrote:
>> Currently the UVC Gadget's .set_alt() callback disables the USB
>> endpoint, following which a V4L2 event is queued that closes
>> down the workqueue. This ordering results in repeated calls to
>> usb_ep_queue() from the workqueue whilst usb_ep_disable() is
>> running - behaviour that the documentation for usb_ep_disable()
>> specifically prohibits.
>>
>> Move the call to usb_ep_disable() until after cancel_work_sync(),
>> which will guarantee the endpoint is no longer in use when
>> usb_ep_disable() is called.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>>  drivers/usb/gadget/function/f_uvc.c     | 3 ---
>>  drivers/usb/gadget/function/uvc_video.c | 4 ++++
>>  2 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
>> index 5e919fb65833..4b91bd572a83 100644
>> --- a/drivers/usb/gadget/function/f_uvc.c
>> +++ b/drivers/usb/gadget/function/f_uvc.c
>> @@ -337,9 +337,6 @@ uvc_function_set_alt(struct usb_function *f, unsigned interface, unsigned alt)
>>  		if (uvc->state != UVC_STATE_STREAMING)
>>  			return 0;
>>  
>> -		if (uvc->video.ep)
>> -			usb_ep_disable(uvc->video.ep);
>> -
>>  		memset(&v4l2_event, 0, sizeof(v4l2_event));
>>  		v4l2_event.type = UVC_EVENT_STREAMOFF;
>>  		v4l2_event_queue(&uvc->vdev, &v4l2_event);
> 
> If we don't disable the endpoint here, should we return
> USB_GADGET_DELAYED_STATUS here (and call uvc_function_setup_continue()
> in uvc_v4l2_streamoff()) or is that not needed ? The uvc->state updated
> should then possibly be moved to uvc_v4l2_streamoff() (checking if this
> would cause any race condition would also be a nice bonus :-)).
> 

Hey all,

First off, apologies for reviving an old thread. We've also been seeing the
"no resource for ep2in" warning from dwc3 controller, followed by the UVC gadget
not streaming any frames, when there is a quick STREAMOFF->STREAMON sequence.

It looks like this is the same root cause as what Dan mentioned in
https://lore.kernel.org/20230531085544.253363-1-dan.scally@ideasonboard.com/
and this patch seems to solve. (Thank you Dan, for posting the stacktrace in
that email thread! I had been banging my head for a couple of days before
thinking of looking up the exact stack :|)

IIUC, this stems from workqueue not fully shutting down by the time the usb
endpoint is disabled and we need stronger guarantees that the workqueue pumping
usb_requests doesn't accidentally queue usb_requests _after_ we've disabled
the streaming endpoint on the usb controller.

Attached is a patch that attempts to address the concerns raised here and sets
up some stronger timing and memory guarantees.

So here are the list of changes over what Dan had already started:

 - Return USB_GADGET_DELAYED_STATUS from set_alt. This is to ensure there are no
   more control transfers while we're waiting on the workqueue to wind down.

 - Move updating uvc->state to uvc_v4l2_streamoff as Laurent suggested.
   This ensures that setting uvc->state to STREAMING or CONNECTED
   happens as a result of streamoff and streamon events which makes things
   easier to reason about.

 - Guard video_pump with uvc->state so the thread can be stopped by setting
   uvc->state to anything other than UVC_STATE_STREAMING. This effectively makes
   uvc->state a flag for the video_pump loop to exit. This is the same flag that
   the complete callback uses to restart the workqueue, so all interactions
   with the controller are effectively guarded by the same flag now.

 - Set uvc->state to UVC_STATE_CONNECTED before winding down the work queue.
   Now that all usb logic is guarded by the same flag, setting the flag should
   stop all usb packet queuing once current execution finishes.

 - Add some memory guarantees in uvcg_video_enable(). At the moment, we don't
   really consider the fact that usb_ep_dequeue is async, which means that the
   usb_requests may not have been returned to the gadget before we start
   deallocating them. With this patch, we wait until all usb_requests have been
   returned to us before deallocating them (this adds a little bit of
   bookkeeping, but nothing too complicated).

   This also guarantees that the complete callback won't accidentally
   re-queue work on the workqueue. Earlier, it was possible that with bad
   enough luck (or scheduler), the complete callback re-triggered the
   workqueue after uvcg_video_enable has already returned.

 - And finally, call usb_ep_disable after uvcg_video_enable returns, which, with
   the new guarantees should ensure that it is safe to disable the endpoint.

I am not sure if this is the best way to do it, but in local testing it seems
to solve the issue. Let me know what you think or if there are better ways to
achieve this.

Thank you!

- Avi.

---
 drivers/usb/gadget/function/f_uvc.c     | 11 ++++----
 drivers/usb/gadget/function/f_uvc.h     |  2 +-
 drivers/usb/gadget/function/uvc.h       |  5 +++-
 drivers/usb/gadget/function/uvc_v4l2.c  | 21 ++++++++++++---
 drivers/usb/gadget/function/uvc_video.c | 34 +++++++++++++++++++++++--
 5 files changed, 60 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index faa398109431..75c9f9a3f884 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -263,10 +263,13 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 	return 0;
 }

-void uvc_function_setup_continue(struct uvc_device *uvc)
+void uvc_function_setup_continue(struct uvc_device *uvc, int disable_ep)
 {
 	struct usb_composite_dev *cdev = uvc->func.config->cdev;

+	if (disable_ep && uvc->video.ep) {
+		usb_ep_disable(uvc->video.ep);
+	}
 	usb_composite_setup_continue(cdev);
 }

@@ -337,15 +340,11 @@ uvc_function_set_alt(struct usb_function *f, unsigned interface, unsigned alt)
 		if (uvc->state != UVC_STATE_STREAMING)
 			return 0;

-		if (uvc->video.ep)
-			usb_ep_disable(uvc->video.ep);
-
 		memset(&v4l2_event, 0, sizeof(v4l2_event));
 		v4l2_event.type = UVC_EVENT_STREAMOFF;
 		v4l2_event_queue(&uvc->vdev, &v4l2_event);

-		uvc->state = UVC_STATE_CONNECTED;
-		return 0;
+		return USB_GADGET_DELAYED_STATUS;

 	case 1:
 		if (uvc->state != UVC_STATE_CONNECTED)
diff --git a/drivers/usb/gadget/function/f_uvc.h b/drivers/usb/gadget/function/f_uvc.h
index 1db972d4beeb..e7f9f13f14dc 100644
--- a/drivers/usb/gadget/function/f_uvc.h
+++ b/drivers/usb/gadget/function/f_uvc.h
@@ -11,7 +11,7 @@

 struct uvc_device;

-void uvc_function_setup_continue(struct uvc_device *uvc);
+void uvc_function_setup_continue(struct uvc_device *uvc, int disale_ep);

 void uvc_function_connect(struct uvc_device *uvc);

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 6751de8b63ad..e40e702a7074 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -104,8 +104,11 @@ struct uvc_video {
 	unsigned int req_size;
 	struct uvc_request *ureq;
 	struct list_head req_free;
+	unsigned int req_free_count; /* number of requests in req_free */
 	spinlock_t req_lock;

+	wait_queue_head_t req_free_queue;
+
 	unsigned int req_int_count;

 	void (*encode) (struct usb_request *req, struct uvc_video *video,
@@ -177,7 +180,7 @@ struct uvc_file_handle {
  * Functions
  */

-extern void uvc_function_setup_continue(struct uvc_device *uvc);
+extern void uvc_function_setup_continue(struct uvc_device *uvc, int disable_ep);
 extern void uvc_function_connect(struct uvc_device *uvc);
 extern void uvc_function_disconnect(struct uvc_device *uvc);

diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 3f0a9795c0d4..3d3469883ed0 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -451,7 +451,7 @@ uvc_v4l2_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	 * Complete the alternate setting selection setup phase now that
 	 * userspace is ready to provide video frames.
 	 */
-	uvc_function_setup_continue(uvc);
+	uvc_function_setup_continue(uvc, 0);
 	uvc->state = UVC_STATE_STREAMING;

 	return 0;
@@ -463,11 +463,19 @@ uvc_v4l2_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
 	struct uvc_video *video = &uvc->video;
+	int ret = 0;

 	if (type != video->queue.queue.type)
 		return -EINVAL;

-	return uvcg_video_enable(video, 0);
+	uvc->state = UVC_STATE_CONNECTED;
+	ret = uvcg_video_enable(video, 0);
+	if (ret < 0) {
+		return ret;
+	}
+
+	uvc_function_setup_continue(uvc, 1);
+	return 0;
 }

 static int
@@ -500,6 +508,14 @@ uvc_v4l2_subscribe_event(struct v4l2_fh *fh,
 static void uvc_v4l2_disable(struct uvc_device *uvc)
 {
 	uvc_function_disconnect(uvc);
+	if (uvc->state == UVC_STATE_STREAMING) {
+		/*
+		 * Drop uvc->state to CONNECTED if it was streaming before.
+		 * This ensures that the usb_requests are no longer queued
+		 * to the controller.
+		 */
+		uvc->state = UVC_STATE_CONNECTED;
+	}
 	uvcg_video_enable(&uvc->video, 0);
 	uvcg_free_buffers(&uvc->video.queue);
 	uvc->func_connected = false;
@@ -647,4 +663,3 @@ const struct v4l2_file_operations uvc_v4l2_fops = {
 	.get_unmapped_area = uvcg_v4l2_get_unmapped_area,
 #endif
 };
-
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 91af3b1ef0d4..3ea7d52df80d 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -284,10 +284,18 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)

 	spin_lock_irqsave(&video->req_lock, flags);
 	list_add_tail(&req->list, &video->req_free);
+	video->req_free_count++;
 	spin_unlock_irqrestore(&video->req_lock, flags);

-	if (uvc->state == UVC_STATE_STREAMING)
+	if (uvc->state == UVC_STATE_STREAMING) {
 		queue_work(video->async_wq, &video->pump);
+	} else if (video->req_free_count == video->req_size) {
+		/*
+		 * Wake up thread waiting for all requests to be returned to
+		 * the gadget driver.
+		 */
+		wake_up_interruptible(&video->req_free_queue);
+	}
 }

 static int
@@ -316,6 +324,7 @@ uvc_video_free_requests(struct uvc_video *video)

 	INIT_LIST_HEAD(&video->req_free);
 	video->req_size = 0;
+	video->req_free_count = 0;
 	return 0;
 }

@@ -360,6 +369,7 @@ uvc_video_alloc_requests(struct uvc_video *video)
 	}

 	video->req_size = req_size;
+	video->req_free_count = req_size; /* all requests are currently free */

 	return 0;

@@ -382,6 +392,7 @@ static void uvcg_video_pump(struct work_struct *work)
 {
 	struct uvc_video *video = container_of(work, struct uvc_video, pump);
 	struct uvc_video_queue *queue = &video->queue;
+	struct uvc_device *uvc = video->uvc;
 	/* video->max_payload_size is only set when using bulk transfer */
 	bool is_bulk = video->max_payload_size;
 	struct usb_request *req = NULL;
@@ -390,7 +401,7 @@ static void uvcg_video_pump(struct work_struct *work)
 	bool buf_done;
 	int ret;

-	while (video->ep->enabled) {
+	while (uvc->state == UVC_STATE_STREAMING && video->ep->enabled) {
 		/*
 		 * Retrieve the first available USB request, protected by the
 		 * request lock.
@@ -403,6 +414,7 @@ static void uvcg_video_pump(struct work_struct *work)
 		req = list_first_entry(&video->req_free, struct usb_request,
 					list);
 		list_del(&req->list);
+		video->req_free_count--;
 		spin_unlock_irqrestore(&video->req_lock, flags);

 		/*
@@ -479,6 +491,7 @@ static void uvcg_video_pump(struct work_struct *work)

 	spin_lock_irqsave(&video->req_lock, flags);
 	list_add_tail(&req->list, &video->req_free);
+	video->req_free_count++;
 	spin_unlock_irqrestore(&video->req_lock, flags);
 	return;
 }
@@ -505,6 +518,22 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 			if (video->ureq && video->ureq[i].req)
 				usb_ep_dequeue(video->ep, video->ureq[i].req);

+		/*
+		 * Wait 500ms for the usb_requests to be given back to the
+		 * gadget driver. This ensures that we don't accidentally
+		 * reference de-allocated usb_requests in the complete callback.
+		 */
+		if (video->req_free_count != video->req_size) {
+			uvcg_info(&video->uvc->func,
+					"Waiting 500ms for usb_request complete callbacks.\n");
+			ret = wait_event_interruptible_timeout(
+					video->req_free_queue,
+					video->req_free_count == video->req_size,
+					msecs_to_jiffies(500));
+			uvcg_info(&video->uvc->func,
+					"Done waiting for complete callbacks: %d\n", ret);
+		}
+
 		uvc_video_free_requests(video);
 		uvcg_queue_enable(&video->queue, 0);
 		return 0;
@@ -537,6 +566,7 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 {
 	INIT_LIST_HEAD(&video->req_free);
 	spin_lock_init(&video->req_lock);
+	init_waitqueue_head(&video->req_free_queue);
 	INIT_WORK(&video->pump, uvcg_video_pump);

 	/* Allocate a work queue for asynchronous video pump handler. */
--
