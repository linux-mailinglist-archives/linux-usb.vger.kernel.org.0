Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0922F41D7B0
	for <lists+linux-usb@lfdr.de>; Thu, 30 Sep 2021 12:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350005AbhI3K3T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 06:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349991AbhI3K3J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Sep 2021 06:29:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32A3C061770
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 03:27:26 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mVtHg-0002sP-PN; Thu, 30 Sep 2021 12:27:24 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mVtHd-000865-3V; Thu, 30 Sep 2021 12:27:21 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com
Subject: [PATCH 1/7] usb: gadget: uvc: consistently use define for headerlen
Date:   Thu, 30 Sep 2021 12:27:11 +0200
Message-Id: <20210930102717.15720-2-m.grzeschik@pengutronix.de>
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

The uvc request headerlen of 2 was defined as UVCG_REQUEST_HEADER_LEN
in commit e81e7f9a0eb9 ("usb: gadget: uvc: add scatter gather support").
We missed to use it consistently. This patch fixes that.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/uvc_video.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index b4a763e5f70e1..da93b46df464d 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -302,7 +302,9 @@ uvc_video_alloc_requests(struct uvc_video *video)
 		list_add_tail(&video->ureq[i].req->list, &video->req_free);
 		/* req_size/PAGE_SIZE + 1 for overruns and + 1 for header */
 		sg_alloc_table(&video->ureq[i].sgt,
-			       DIV_ROUND_UP(req_size - 2, PAGE_SIZE) + 2,
+			       DIV_ROUND_UP(req_size - UVCG_REQUEST_HEADER_LEN,
+					    PAGE_SIZE) +
+			       UVCG_REQUEST_HEADER_LEN,
 			       GFP_KERNEL);
 	}
 
-- 
2.30.2

