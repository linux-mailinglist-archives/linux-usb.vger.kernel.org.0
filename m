Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2FD873140E
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jun 2023 11:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245564AbjFOJfi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Jun 2023 05:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343677AbjFOJfQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Jun 2023 05:35:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E6A6296C
        for <linux-usb@vger.kernel.org>; Thu, 15 Jun 2023 02:34:42 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A389D891;
        Thu, 15 Jun 2023 11:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686821638;
        bh=EMVHHDNjTFDWVR5Sel489tDhF3Mz9rJupABwul5BqXI=;
        h=From:To:Subject:Date:From;
        b=oI0pqCJu1qM6mpUrBcmPGSvqSs43LTyR0cH14+xgcSfjqJsKbs5sKe6g6J+xi0mEE
         EB8XM5vymASJdlnyI9oLS546yUaGgFPcsMN/EM7iRKFOC7r5ai+IMaXtjRvlqTqDLq
         meMnaChJaJe4IgKkbjHg5QWb+hl8M8jhgVjBVmKE=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: uvc: Move usb_ep_disable() to uvcg_video_enable()
Date:   Thu, 15 Jun 2023 10:34:06 +0100
Message-Id: <20230615093406.80195-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently the UVC Gadget's .set_alt() callback disables the USB
endpoint, following which a V4L2 event is queued that closes
down the workqueue. This ordering results in repeated calls to
usb_ep_queue() from the workqueue whilst usb_ep_disable() is
running - behaviour that the documentation for usb_ep_disable()
specifically prohibits.

Move the call to usb_ep_disable() until after cancel_work_sync(),
which will guarantee the endpoint is no longer in use when
usb_ep_disable() is called.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/usb/gadget/function/f_uvc.c     | 3 ---
 drivers/usb/gadget/function/uvc_video.c | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 5e919fb65833..4b91bd572a83 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -337,9 +337,6 @@ uvc_function_set_alt(struct usb_function *f, unsigned interface, unsigned alt)
 		if (uvc->state != UVC_STATE_STREAMING)
 			return 0;
 
-		if (uvc->video.ep)
-			usb_ep_disable(uvc->video.ep);
-
 		memset(&v4l2_event, 0, sizeof(v4l2_event));
 		v4l2_event.type = UVC_EVENT_STREAMOFF;
 		v4l2_event_queue(&uvc->vdev, &v4l2_event);
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 91af3b1ef0d4..c7e38fa26492 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -499,6 +499,10 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 
 	if (!enable) {
 		cancel_work_sync(&video->pump);
+
+		if (video->ep)
+			usb_ep_disable(video->ep);
+
 		uvcg_queue_cancel(&video->queue, 0);
 
 		for (i = 0; i < video->uvc_num_requests; ++i)
-- 
2.34.1

