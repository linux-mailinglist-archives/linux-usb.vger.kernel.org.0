Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 617B24F1155
	for <lists+linux-usb@lfdr.de>; Mon,  4 Apr 2022 10:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240558AbiDDIvd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Apr 2022 04:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235886AbiDDIva (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Apr 2022 04:51:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C56DC1E3F4
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 01:49:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nbIOy-0004kh-Uk; Mon, 04 Apr 2022 10:49:32 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nanKw-000dF4-P4; Sun, 03 Apr 2022 01:39:17 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nanKu-00FD9Y-AF; Sun, 03 Apr 2022 01:39:16 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: [PATCH 3/5] usb: gadget: uvc: increase worker prio to WQ_HIGHPRI
Date:   Sun,  3 Apr 2022 01:39:12 +0200
Message-Id: <20220402233914.3625405-4-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220402233914.3625405-1-m.grzeschik@pengutronix.de>
References: <20220402233914.3625405-1-m.grzeschik@pengutronix.de>
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

Likewise to the uvcvideo hostside driver, this patch is changing the
simple workqueue to an async_wq with higher priority. This ensures that
the worker will not be scheduled away while the video stream is handled.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/uvc.h       | 1 +
 drivers/usb/gadget/function/uvc_v4l2.c  | 2 +-
 drivers/usb/gadget/function/uvc_video.c | 9 +++++++--
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index c3607a32b98624..ab537acdae3184 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -86,6 +86,7 @@ struct uvc_video {
 	struct usb_ep *ep;
 
 	struct work_struct pump;
+	struct workqueue_struct *async_wq;
 
 	/* Frame parameters */
 	u8 bpp;
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index a2c78690c5c288..9b1488f7abd736 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -170,7 +170,7 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
 		return ret;
 
 	if (uvc->state == UVC_STATE_STREAMING)
-		schedule_work(&video->pump);
+		queue_work(video->async_wq, &video->pump);
 
 	return ret;
 }
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 7f59a0c4740209..b1075e23a61010 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -269,7 +269,7 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 	spin_unlock_irqrestore(&video->req_lock, flags);
 
 	if (uvc->state == UVC_STATE_STREAMING)
-		schedule_work(&video->pump);
+		queue_work(video->async_wq, &video->pump);
 }
 
 static int
@@ -469,7 +469,7 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 
 	video->req_int_count = 0;
 
-	schedule_work(&video->pump);
+	queue_work(video->async_wq, &video->pump);
 
 	return ret;
 }
@@ -483,6 +483,11 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 	spin_lock_init(&video->req_lock);
 	INIT_WORK(&video->pump, uvcg_video_pump);
 
+	/* Allocate a stream specific work queue for asynchronous tasks. */
+	video->async_wq = alloc_workqueue("uvcvideo", WQ_UNBOUND | WQ_HIGHPRI, 0);
+	if (!video->async_wq)
+		return -EINVAL;
+
 	video->uvc = uvc;
 	video->fcc = V4L2_PIX_FMT_YUYV;
 	video->bpp = 16;
-- 
2.30.2

