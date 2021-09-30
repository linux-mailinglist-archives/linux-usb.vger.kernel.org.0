Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 519ED41D7B1
	for <lists+linux-usb@lfdr.de>; Thu, 30 Sep 2021 12:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349991AbhI3K3U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 06:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349992AbhI3K3J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Sep 2021 06:29:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8FECC061771
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 03:27:26 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mVtHg-0002sU-PU; Thu, 30 Sep 2021 12:27:24 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mVtHd-00088P-CL; Thu, 30 Sep 2021 12:27:21 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com
Subject: [PATCH 6/7] usb: gadget: uvc: ensure the vdev is unset
Date:   Thu, 30 Sep 2021 12:27:16 +0200
Message-Id: <20210930102717.15720-7-m.grzeschik@pengutronix.de>
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

Since the uvc video device will be created on demand, we have to ensure
that the struct is always unprepared. Otherwise the previous settings
will colide with the new perparation.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/f_uvc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 1e93ab5c0c88d..b3279ba357331 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -417,6 +417,7 @@ uvc_register_video(struct uvc_device *uvc)
 	int ret;
 
 	/* TODO reference counting. */
+	memset(&uvc->vdev, 0, sizeof(struct video_device));
 	uvc->vdev.v4l2_dev = &uvc->v4l2_dev;
 	uvc->vdev.v4l2_dev->dev = &cdev->gadget->dev;
 	uvc->vdev.fops = &uvc_v4l2_fops;
-- 
2.30.2

