Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A363D4F115B
	for <lists+linux-usb@lfdr.de>; Mon,  4 Apr 2022 10:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241104AbiDDIvj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Apr 2022 04:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240104AbiDDIvb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Apr 2022 04:51:31 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB9751EAD9
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 01:49:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nbIOz-0004pL-63; Mon, 04 Apr 2022 10:49:33 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nan9p-000dDe-4c; Sun, 03 Apr 2022 01:27:47 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nan9m-00FCQh-KZ; Sun, 03 Apr 2022 01:27:46 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: [PATCH v2 1/3] usb: gadget: uvc: rework uvcg_queue_next_buffer to uvcg_complete_buffer
Date:   Sun,  3 Apr 2022 01:27:42 +0200
Message-Id: <20220402232744.3622565-2-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220402232744.3622565-1-m.grzeschik@pengutronix.de>
References: <20220402232744.3622565-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The function uvcg_queue_next_buffer is used different than its name
suggests. The return value nextbuf is never used by any caller. This
patch reworks the function to its actual purpose, by removing the unused
code and renaming it. The function name uvcg_complete_buffer makes it
more clear that it is actually marking the current video buffer as
complete.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: - only removed the nextbuf handling code
          - improved patch description
	  - renamed from "usb: gadget: uvc: clean and rename uvcg_queue_next_buffer to uvcg_complete_buffer"

 drivers/usb/gadget/function/uvc_queue.c | 13 ++-----------
 drivers/usb/gadget/function/uvc_queue.h |  2 +-
 drivers/usb/gadget/function/uvc_video.c |  6 +++---
 3 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
index d852ac9e47e72c..9ed8d98d7d4c4a 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -326,24 +326,17 @@ int uvcg_queue_enable(struct uvc_video_queue *queue, int enable)
 }
 
 /* called with &queue_irqlock held.. */
-struct uvc_buffer *uvcg_queue_next_buffer(struct uvc_video_queue *queue,
+void uvcg_complete_buffer(struct uvc_video_queue *queue,
 					  struct uvc_buffer *buf)
 {
-	struct uvc_buffer *nextbuf;
-
 	if ((queue->flags & UVC_QUEUE_DROP_INCOMPLETE) &&
 	     buf->length != buf->bytesused) {
 		buf->state = UVC_BUF_STATE_QUEUED;
 		vb2_set_plane_payload(&buf->buf.vb2_buf, 0, 0);
-		return buf;
+		return;
 	}
 
 	list_del(&buf->queue);
-	if (!list_empty(&queue->irqqueue))
-		nextbuf = list_first_entry(&queue->irqqueue, struct uvc_buffer,
-					   queue);
-	else
-		nextbuf = NULL;
 
 	buf->buf.field = V4L2_FIELD_NONE;
 	buf->buf.sequence = queue->sequence++;
@@ -351,8 +344,6 @@ struct uvc_buffer *uvcg_queue_next_buffer(struct uvc_video_queue *queue,
 
 	vb2_set_plane_payload(&buf->buf.vb2_buf, 0, buf->bytesused);
 	vb2_buffer_done(&buf->buf.vb2_buf, VB2_BUF_STATE_DONE);
-
-	return nextbuf;
 }
 
 struct uvc_buffer *uvcg_queue_head(struct uvc_video_queue *queue)
diff --git a/drivers/usb/gadget/function/uvc_queue.h b/drivers/usb/gadget/function/uvc_queue.h
index 05360a0767f61f..b668927b5d2c4e 100644
--- a/drivers/usb/gadget/function/uvc_queue.h
+++ b/drivers/usb/gadget/function/uvc_queue.h
@@ -93,7 +93,7 @@ void uvcg_queue_cancel(struct uvc_video_queue *queue, int disconnect);
 
 int uvcg_queue_enable(struct uvc_video_queue *queue, int enable);
 
-struct uvc_buffer *uvcg_queue_next_buffer(struct uvc_video_queue *queue,
+void uvcg_complete_buffer(struct uvc_video_queue *queue,
 					  struct uvc_buffer *buf);
 
 struct uvc_buffer *uvcg_queue_head(struct uvc_video_queue *queue);
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 7f59a0c4740209..0c8d146b840321 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -112,7 +112,7 @@ uvc_video_encode_bulk(struct usb_request *req, struct uvc_video *video,
 	if (buf->bytesused == video->queue.buf_used) {
 		video->queue.buf_used = 0;
 		buf->state = UVC_BUF_STATE_DONE;
-		uvcg_queue_next_buffer(&video->queue, buf);
+		uvcg_complete_buffer(&video->queue, buf);
 		video->fid ^= UVC_STREAM_FID;
 
 		video->payload_size = 0;
@@ -183,7 +183,7 @@ uvc_video_encode_isoc_sg(struct usb_request *req, struct uvc_video *video,
 		video->queue.buf_used = 0;
 		buf->state = UVC_BUF_STATE_DONE;
 		buf->offset = 0;
-		uvcg_queue_next_buffer(&video->queue, buf);
+		uvcg_complete_buffer(&video->queue, buf);
 		video->fid ^= UVC_STREAM_FID;
 	}
 }
@@ -210,7 +210,7 @@ uvc_video_encode_isoc(struct usb_request *req, struct uvc_video *video,
 	if (buf->bytesused == video->queue.buf_used) {
 		video->queue.buf_used = 0;
 		buf->state = UVC_BUF_STATE_DONE;
-		uvcg_queue_next_buffer(&video->queue, buf);
+		uvcg_complete_buffer(&video->queue, buf);
 		video->fid ^= UVC_STREAM_FID;
 	}
 }
-- 
2.30.2

