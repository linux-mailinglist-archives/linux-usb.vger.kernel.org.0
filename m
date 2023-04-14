Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B37826E2B6F
	for <lists+linux-usb@lfdr.de>; Fri, 14 Apr 2023 23:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjDNVDd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Apr 2023 17:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbjDNVDc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Apr 2023 17:03:32 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C79272BE
        for <linux-usb@vger.kernel.org>; Fri, 14 Apr 2023 14:03:14 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id c10so3956921iob.9
        for <linux-usb@vger.kernel.org>; Fri, 14 Apr 2023 14:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681506193; x=1684098193;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4jIbxstsWzozI+z9IxShqmgfJvBhxEOl913YZK7ju7c=;
        b=f5ojvrHVEqFVAbP08t1mhgTud+98HtiLrpl+giyW4bw8Flm7btLO2wMNnsrHOO6qGV
         yWFdyILgqgzSvU4QrZ2dv5Ou3uxZKBzdQgrm67XjYj5oTdJBW9JYsUTH6zbhQzXbK25Z
         KI49NnpWMjvYqIPtM133L+exvg0liXQKH05Yr52TwRHorS3fBERM446Lg9pSoOOOOvr7
         5rPRkMUyfLOziXXZVax1x8dALnq1QjUhzA2ceiwJhk91wLyrcPmyKZe26zjLq1ASzpUd
         n6XvzjniLAnV1dMDbpvayvRG4p1Ac2y+d536H6kPYXffduIPhhmxpcVxKNitTDeqpqvZ
         O2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681506193; x=1684098193;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4jIbxstsWzozI+z9IxShqmgfJvBhxEOl913YZK7ju7c=;
        b=UOUeE4o3oRGAzxP1i4ukH+bOxNvQ+dxhEAQ5bjGyYvWl1411vXH0ppSyNYm+6J/haG
         bwenqNMLLxoHP3FAd6+uDEUzOHctdlTACSbewcG4I/9r8AKw4Vu7hnzG7F7h0bk4S6GF
         1y/5ASuOifiDlXpqVFyLmWY57WnrsEWUH126Lfc+ZVH1rsE28nxMlJ6ZaG6+sqYMdb0/
         E3ZW2DvT2IyK8ezOe3jgb0DEtg5OYj1UXJuPm05sDXBUe6Amkc2UbI22iL80S00gUPQq
         V5bFqj+rlRjQSERIyHeM1cUa+S9irZmkXWspn95ovnNpcHEZFk9Y/Q2BB0UcxZfAmKV5
         6kyA==
X-Gm-Message-State: AAQBX9eZYutk2LCZzFCWOnkUeryBLG8ikSkclaxprdM2dgXRrHq7Elko
        5gZkuVEYmYebOt9BpCbpVa0htegZlAW5Mef/AQeHZg==
X-Google-Smtp-Source: AKy350YE75eNO+N43Cd/+brYjQKHa9SrRmVfgc3mXKPdaEU/rKBcv0QWWnGTHV6gO/pR33fEXC31AW1d2oYDiCbhOnA=
X-Received: by 2002:a02:6f06:0:b0:40f:7a52:d66c with SMTP id
 x6-20020a026f06000000b0040f7a52d66cmr1370855jab.5.1681506193336; Fri, 14 Apr
 2023 14:03:13 -0700 (PDT)
MIME-Version: 1.0
From:   Avichal Rakesh <arakesh@google.com>
Date:   Fri, 14 Apr 2023 14:03:02 -0700
Message-ID: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
Subject: UVC Gadget Driver shows glitched frames with a Linux host
To:     laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com,
        gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
        linux-usb@vger.kernel.org
Cc:     Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey all,

First off, I am very new to the kernel space, so apologies for any
newb mistakes. Please feel free to point them out!

I've been trying to get the UVC gadget driver to work on an Android
device and have been seeing partial/glitched frames when streaming to
a Linux (or Windows) host fairly frequently (once every 2-4s). The UVC
gadget driver shows no error/exception logs, and neither does the
host's UVC driver.

Enabling tracing for the UVC gadget driver and the host's UVC driver
shows that the gadget sees a missed ISOC transfer, and the host sees a
frame with suspiciously low packet count at the same time as the
glitched frame.

```
[691171.704583] usb 1-4: frame 9274 stats: 0/8/8 packets, 0/0/0 pts
(!early !initial), 7/8 scr, last pts/stc/sof 0/259279856/14353
[691171.704602] usb 1-4: Frame complete (EOF found)
[691171.732584] usb 1-4: frame 9275 stats: 0/4/4 packets, 0/0/0 pts
(!early !initial), 3/4 scr, last pts/stc/sof 0/261131744/14661
[691171.732621] usb 1-4: Frame complete (EOF found)
[691171.768578] usb 1-4: frame 9276 stats: 0/8/8 packets, 0/0/0 pts
(!early !initial), 7/8 scr, last pts/stc/sof 0/262525136/14894
[691171.768616] usb 1-4: Frame complete (EOF found)
```

For reference, I am streaming 640x480 MJPEG frames of a (mostly)
static scene, and every frame takes 7-8 packets (~22kB). So 4 packets
for a frame is definitely not normal. From the logs, it looks like the
host sees an EOF header for the video frame that had the ISOC failure
and tries to display the frame with a partial buffer resulting in the
glitched frame.

This can happen because the UVC gadget driver waits for the encode
loop to drop the video frame
(https://lore.kernel.org/all/20221018215044.765044-4-w36195@motorola.com/).
However, because video frames are encoded (to usb_requests)
asynchronously, it is possible that the video frame is completely
encoded before the ISOC transfer failure is reported. In this case,
the next frame would be dropped, but the frame with missed ISOC will
remain in queue.

This problem may be further exaggerated by the DWC3 controller driver
(which is what my device has) not setting the IMI flag when
no_interrupt flag is set
(https://lore.kernel.org/all/ced336c84434571340c07994e3667a0ee284fefe.1666735451.git.Thinh.Nguyen@synopsys.com/)?
UVC Gadget Driver sets the no_interrupt flag for ~3/4 of its queued
usb_request, so an ISOC failure may not immediately interrupt the UVC
gadget driver, leaving more time for the frame to finish encoding.

I couldn't find any concrete error handling rules in the UVC specs, so
I am not sure what the proper solution here is. To try out, I created
a patch (attached below) that dequeues all queued usb_requests from
the endpoint in case of an ISOC failure and clears the uvc buffer
queue. This eliminated the partial frames with no perceivable frame
drops.

So my questions here are:
1. Is this a known issue, and if so are there workarounds for it?
2. If the answer to above is "No", does the explanation and mitigation
seem reasonable?

Patch follows (mostly for illustration, I can formalize it if
needed!). It adds a new 'req_inflight' list to track queued
usb_requests that have not been given back to the gadget driver and
drops all the queued requests in case of an ISOC failure. The other
changes are for the extra bookkeeping required to handle dropping all
frames. I haven't been able to confirm it, but as far as I can tell
the issue exists at ToT as well.

---
drivers/usb/gadget/function/uvc.h | 6 ++-
drivers/usb/gadget/function/uvc_queue.c | 16 ++++--
drivers/usb/gadget/function/uvc_queue.h | 2 +-
drivers/usb/gadget/function/uvc_video.c | 71 +++++++++++++++++++------
4 files changed, 72 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc.h
b/drivers/usb/gadget/function/uvc.h
index 100475b1363e..d2c837011546 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -80,7 +80,8 @@ struct uvc_request {
struct uvc_video *video;
struct sg_table sgt;
u8 header[UVCG_REQUEST_HEADER_LEN];
- struct uvc_buffer *last_buf;
+ struct uvc_buffer *uvc_buf;
+ bool is_last;
};

struct uvc_video {
@@ -103,8 +104,9 @@ struct uvc_video {
/* Requests */
unsigned int req_size;
struct uvc_request *ureq;
- struct list_head req_free;
+ struct list_head req_free; /* protected by req_lock */
spinlock_t req_lock;
+ struct list_head req_inflight; /* protected by queue->irqlock */

unsigned int req_int_count;

diff --git a/drivers/usb/gadget/function/uvc_queue.c
b/drivers/usb/gadget/function/uvc_queue.c
index 0aa3d7e1f3cc..32fab1e5b32d 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -250,10 +250,22 @@ unsigned long
uvcg_queue_get_unmapped_area(struct uvc_video_queue *queue,
*/
void uvcg_queue_cancel(struct uvc_video_queue *queue, int disconnect)
{
- struct uvc_buffer *buf;
unsigned long flags;

spin_lock_irqsave(&queue->irqlock, flags);
+ uvcg_queue_cancel_locked(queue, disconnect);
+ spin_unlock_irqrestore(&queue->irqlock, flags);
+}
+
+/*
+ * see uvcg_queue_cancel()
+ *
+ * Must be called with &queue_irqlock held.
+ */
+void uvcg_queue_cancel_locked(struct uvc_video_queue *queue, int disconnect)
+{
+ struct uvc_buffer *buf;
+
while (!list_empty(&queue->irqqueue)) {
buf = list_first_entry(&queue->irqqueue, struct uvc_buffer,
queue);
@@ -272,7 +284,6 @@ void uvcg_queue_cancel(struct uvc_video_queue
*queue, int disconnect)
*/
if (disconnect)
queue->flags |= UVC_QUEUE_DISCONNECTED;
- spin_unlock_irqrestore(&queue->irqlock, flags);
}

/*
@@ -356,4 +367,3 @@ struct uvc_buffer *uvcg_queue_head(struct
uvc_video_queue *queue)

return buf;
}
-
diff --git a/drivers/usb/gadget/function/uvc_queue.h
b/drivers/usb/gadget/function/uvc_queue.h
index 41f87b917f6b..622c0f146847 100644
--- a/drivers/usb/gadget/function/uvc_queue.h
+++ b/drivers/usb/gadget/function/uvc_queue.h
@@ -89,6 +89,7 @@ unsigned long uvcg_queue_get_unmapped_area(struct
uvc_video_queue *queue,
#endif /* CONFIG_MMU */

void uvcg_queue_cancel(struct uvc_video_queue *queue, int disconnect);
+void uvcg_queue_cancel_locked(struct uvc_video_queue *queue, int disconnect);

int uvcg_queue_enable(struct uvc_video_queue *queue, int enable);

@@ -98,4 +99,3 @@ void uvcg_complete_buffer(struct uvc_video_queue *queue,
struct uvc_buffer *uvcg_queue_head(struct uvc_video_queue *queue);

#endif /* _UVC_QUEUE_H_ */
-
diff --git a/drivers/usb/gadget/function/uvc_video.c
b/drivers/usb/gadget/function/uvc_video.c
index dd1c6b2ca7c6..6c2698eca242 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -109,19 +109,18 @@ uvc_video_encode_bulk(struct usb_request *req,
struct uvc_video *video,

req->length = video->req_size - len;
req->zero = video->payload_size == video->max_payload_size;
+ ureq->uvc_buf = buf;

if (buf->bytesused == video->queue.buf_used) {
video->queue.buf_used = 0;
buf->state = UVC_BUF_STATE_DONE;
list_del(&buf->queue);
video->fid ^= UVC_STREAM_FID;
- ureq->last_buf = buf;
-
+ ureq->is_last = true;
video->payload_size = 0;
}

if (video->payload_size == video->max_payload_size ||
- video->queue.flags & UVC_QUEUE_DROP_INCOMPLETE ||
buf->bytesused == video->queue.buf_used)
video->payload_size = 0;
}
@@ -181,15 +180,15 @@ uvc_video_encode_isoc_sg(struct usb_request
*req, struct uvc_video *video,

req->length -= len;
video->queue.buf_used += req->length - header_len;
+ ureq->uvc_buf = buf;

- if (buf->bytesused == video->queue.buf_used || !buf->sg ||
- video->queue.flags & UVC_QUEUE_DROP_INCOMPLETE) {
+ if (buf->bytesused == video->queue.buf_used || !buf->sg) {
video->queue.buf_used = 0;
buf->state = UVC_BUF_STATE_DONE;
buf->offset = 0;
list_del(&buf->queue);
video->fid ^= UVC_STREAM_FID;
- ureq->last_buf = buf;
+ ureq->is_last = true;
}
}

@@ -212,14 +211,14 @@ uvc_video_encode_isoc(struct usb_request *req,
struct uvc_video *video,
len -= ret;

req->length = video->req_size - len;
+ ureq->uvc_buf = buf;

- if (buf->bytesused == video->queue.buf_used ||
- video->queue.flags & UVC_QUEUE_DROP_INCOMPLETE) {
+ if (buf->bytesused == video->queue.buf_used) {
video->queue.buf_used = 0;
buf->state = UVC_BUF_STATE_DONE;
list_del(&buf->queue);
video->fid ^= UVC_STREAM_FID;
- ureq->last_buf = buf;
+ ureq->is_last = true;
}
}

@@ -231,11 +230,13 @@ static int uvcg_video_ep_queue(struct uvc_video
*video, struct usb_request *req)
{
int ret;

+ list_add_tail(&req->list, &video->req_inflight);
ret = usb_ep_queue(video->ep, req, GFP_ATOMIC);
if (ret < 0) {
uvcg_err(&video->uvc->func, "Failed to queue request (%d).\n",
ret);

+ list_del(&req->list);
/* If the endpoint is disabled the descriptor may be NULL. */
if (video->ep->desc) {
/* Isochronous endpoints can't be halted. */
@@ -254,15 +255,46 @@ uvc_video_complete(struct usb_ep *ep, struct
usb_request *req)
struct uvc_video *video = ureq->video;
struct uvc_video_queue *queue = &video->queue;
struct uvc_device *uvc = video->uvc;
+ struct uvc_buffer *uvc_buf = ureq->uvc_buf;
+ struct usb_request *itr;
unsigned long flags;

+ spin_lock_irqsave(&queue->irqlock, flags);
+ list_del(&req->list);
+ spin_unlock_irqrestore(&queue->irqlock, flags);
+
switch (req->status) {
case 0:
break;

case -EXDEV:
uvcg_dbg(&video->uvc->func, "VS request missed xfer.\n");
- queue->flags |= UVC_QUEUE_DROP_INCOMPLETE;
+ spin_lock_irqsave(&queue->irqlock, flags);
+ list_for_each_entry(itr, &video->req_inflight, list) {
+ usb_ep_dequeue(ep, itr);
+ }
+
+ if (uvc_buf->state != UVC_BUF_STATE_DONE) {
+ video->fid = UVC_STREAM_FID;
+ } else {
+ queue->flags |= UVC_QUEUE_DROP_INCOMPLETE;
+ }
+
+ /*
+ * We cancel the entire queue because calling usb_ep_dequeue on any
pending request will
+ * cancel all queued requests (on some USB controllers). ISOC
transfers are "best effort"
+ * and a missed frame or two won't really be noticeable. Rather than
adding extra
+ * bookkeeping to try and find the precise set of frames that need to
be dropped, we drop
+ * the entire queue.
+ */
+ uvcg_queue_cancel_locked(queue, 0);
+ video->req_int_count = 0;
+ spin_unlock_irqrestore(&queue->irqlock, flags);
+ break;
+
+ case -ECONNRESET:
+ uvcg_dbg(&video->uvc->func, "VS request dqed.\n");
+ // Request dequeued using usb_ep_dequeue, no special handling required
break;

case -ESHUTDOWN: /* disconnect from host. */
@@ -277,10 +309,11 @@ uvc_video_complete(struct usb_ep *ep, struct
usb_request *req)
uvcg_queue_cancel(queue, 0);
}

- if (ureq->last_buf) {
- uvcg_complete_buffer(&video->queue, ureq->last_buf);
- ureq->last_buf = NULL;
+ if (ureq->is_last) {
+ uvcg_complete_buffer(&video->queue, ureq->uvc_buf);
}
+ ureq->is_last = false;
+ ureq->uvc_buf = NULL;

spin_lock_irqsave(&video->req_lock, flags);
list_add_tail(&req->list, &video->req_free);
@@ -315,6 +348,7 @@ uvc_video_free_requests(struct uvc_video *video)
}

INIT_LIST_HEAD(&video->req_free);
+ INIT_LIST_HEAD(&video->req_inflight);
video->req_size = 0;
return 0;
}
@@ -350,7 +384,8 @@ uvc_video_alloc_requests(struct uvc_video *video)
video->ureq[i].req->complete = uvc_video_complete;
video->ureq[i].req->context = &video->ureq[i];
video->ureq[i].video = video;
- video->ureq[i].last_buf = NULL;
+ video->ureq[i].uvc_buf = NULL;
+ video->ureq[i].is_last = false;

list_add_tail(&video->ureq[i].req->list, &video->req_free);
/* req_size/PAGE_SIZE + 1 for overruns and + 1 for header */
@@ -385,6 +420,7 @@ static void uvcg_video_pump(struct work_struct *work)
struct usb_request *req = NULL;
struct uvc_buffer *buf;
unsigned long flags;
+ bool must_interrupt = false;
int ret;

while (video->ep->enabled) {
@@ -400,6 +436,7 @@ static void uvcg_video_pump(struct work_struct *work)
req = list_first_entry(&video->req_free, struct usb_request,
list);
list_del(&req->list);
+ must_interrupt = list_empty(&video->req_free);
spin_unlock_irqrestore(&video->req_lock, flags);

/*
@@ -420,14 +457,14 @@ static void uvcg_video_pump(struct work_struct *work)
* interrupt load to a quarter but also catches the corner
* cases, which needs to be handled.
*/
- if (list_empty(&video->req_free) ||
+ if (must_interrupt ||
buf->state == UVC_BUF_STATE_DONE ||
!(video->req_int_count %
DIV_ROUND_UP(video->uvc_num_requests, 4))) {
video->req_int_count = 0;
req->no_interrupt = 0;
} else {
- req->no_interrupt = 1;
+ req->no_interrupt = 0;
}

/* Queue the USB request */
@@ -507,6 +544,7 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
{
INIT_LIST_HEAD(&video->req_free);
+ INIT_LIST_HEAD(&video->req_inflight);
spin_lock_init(&video->req_lock);
INIT_WORK(&video->pump, uvcg_video_pump);

@@ -527,4 +565,3 @@ int uvcg_video_init(struct uvc_video *video,
struct uvc_device *uvc)
V4L2_BUF_TYPE_VIDEO_OUTPUT, &video->mutex);
return 0;
}
-
--
