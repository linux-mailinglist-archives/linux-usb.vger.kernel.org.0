Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D71C141D7AB
	for <lists+linux-usb@lfdr.de>; Thu, 30 Sep 2021 12:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349995AbhI3K3J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 06:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349906AbhI3K3J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Sep 2021 06:29:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BCB6C06176A
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 03:27:26 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mVtHg-0002sR-PN; Thu, 30 Sep 2021 12:27:24 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mVtHd-00086y-7F; Thu, 30 Sep 2021 12:27:21 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com
Subject: [PATCH 3/7] usb: gadget: uvc: test if ep->desc is valid on ep_queue
Date:   Thu, 30 Sep 2021 12:27:13 +0200
Message-Id: <20210930102717.15720-4-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930102717.15720-1-m.grzeschik@pengutronix.de>
References: <20210930102717.15720-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The reason that the ep_queue has failed could be an disabled endpoint.
In that case it is not guaranteed that the ep->desc is still valid.
This patch adds an check for NULL.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/uvc_video.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index da93b46df464d..cdfd3726a86ae 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -199,9 +199,11 @@ static int uvcg_video_ep_queue(struct uvc_video *video, struct usb_request *req)
 		uvcg_err(&video->uvc->func, "Failed to queue request (%d).\n",
 			 ret);
 
-		/* Isochronous endpoints can't be halted. */
-		if (usb_endpoint_xfer_bulk(video->ep->desc))
-			usb_ep_set_halt(video->ep);
+		if (video->ep->desc) {
+			/* Isochronous endpoints can't be halted. */
+			if (usb_endpoint_xfer_bulk(video->ep->desc))
+				usb_ep_set_halt(video->ep);
+		}
 	}
 
 	return ret;
-- 
2.30.2

