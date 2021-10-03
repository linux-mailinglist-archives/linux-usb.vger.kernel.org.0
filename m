Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A8A4203EE
	for <lists+linux-usb@lfdr.de>; Sun,  3 Oct 2021 22:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbhJCUbf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 Oct 2021 16:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231598AbhJCUbc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 3 Oct 2021 16:31:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A8D5C061788
        for <linux-usb@vger.kernel.org>; Sun,  3 Oct 2021 13:29:44 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mX87C-0003Rn-BL; Sun, 03 Oct 2021 22:29:42 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mX87B-0000AX-RR; Sun, 03 Oct 2021 22:29:41 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com
Subject: [PATCH v2 5/7] usb: gadget: uvc: only pump video data if necessary
Date:   Sun,  3 Oct 2021 22:29:37 +0200
Message-Id: <20211003202939.306-6-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211003202939.306-1-m.grzeschik@pengutronix.de>
References: <20211003202939.306-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the streaming endpoint is not enabled, the worker has nothing to do.
In the case it still got enqueued, this patch ensueres that it will bail
out without handling any data.

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
v2: - added reviewed by

 drivers/usb/gadget/function/uvc_video.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index ccee35177411d..152647495fa61 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -335,12 +335,12 @@ static void uvcg_video_pump(struct work_struct *work)
 {
 	struct uvc_video *video = container_of(work, struct uvc_video, pump);
 	struct uvc_video_queue *queue = &video->queue;
-	struct usb_request *req;
+	struct usb_request *req = NULL;
 	struct uvc_buffer *buf;
 	unsigned long flags;
 	int ret;
 
-	while (1) {
+	while (video->ep->enabled) {
 		/* Retrieve the first available USB request, protected by the
 		 * request lock.
 		 */
@@ -390,6 +390,9 @@ static void uvcg_video_pump(struct work_struct *work)
 		video->req_int_count++;
 	}
 
+	if (!req)
+		return;
+
 	spin_lock_irqsave(&video->req_lock, flags);
 	list_add_tail(&req->list, &video->req_free);
 	spin_unlock_irqrestore(&video->req_lock, flags);
-- 
2.30.2

