Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58482430C6B
	for <lists+linux-usb@lfdr.de>; Sun, 17 Oct 2021 23:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344700AbhJQVwb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 17 Oct 2021 17:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242525AbhJQVwa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 17 Oct 2021 17:52:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D2FC06161C
        for <linux-usb@vger.kernel.org>; Sun, 17 Oct 2021 14:50:20 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mcE2s-00057f-Ti; Sun, 17 Oct 2021 23:50:18 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mcE2s-0004xN-BU; Sun, 17 Oct 2021 23:50:18 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com
Subject: [PATCH v3 3/6] usb: gadget: uvc: test if ep->desc is valid on ep_queue
Date:   Sun, 17 Oct 2021 23:50:14 +0200
Message-Id: <20211017215017.18392-4-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211017215017.18392-1-m.grzeschik@pengutronix.de>
References: <20211017215017.18392-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The reason that the ep_queue has failed could be a disabled endpoint.
In that case it is not guaranteed that the ep->desc is still valid.
This patch adds a check for NULL.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v3: - fixed commit description
    - added comment to condition

 drivers/usb/gadget/function/uvc_video.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index f3e97a4fc0303..4222192fa624c 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -199,9 +199,12 @@ static int uvcg_video_ep_queue(struct uvc_video *video, struct usb_request *req)
 		uvcg_err(&video->uvc->func, "Failed to queue request (%d).\n",
 			 ret);
 
-		/* Isochronous endpoints can't be halted. */
-		if (usb_endpoint_xfer_bulk(video->ep->desc))
-			usb_ep_set_halt(video->ep);
+		/* If the endpoint is disabled the descriptor may be NULL. */
+		if (video->ep->desc) {
+			/* Isochronous endpoints can't be halted. */
+			if (usb_endpoint_xfer_bulk(video->ep->desc))
+				usb_ep_set_halt(video->ep);
+		}
 	}
 
 	return ret;
-- 
2.30.2

