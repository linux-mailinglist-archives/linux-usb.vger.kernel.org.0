Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B18C84203EA
	for <lists+linux-usb@lfdr.de>; Sun,  3 Oct 2021 22:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbhJCUbe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 Oct 2021 16:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbhJCUbc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 3 Oct 2021 16:31:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45342C061781
        for <linux-usb@vger.kernel.org>; Sun,  3 Oct 2021 13:29:44 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mX87C-0003Ro-A5; Sun, 03 Oct 2021 22:29:42 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mX87B-0000Aa-Rs; Sun, 03 Oct 2021 22:29:41 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com
Subject: [PATCH v2 6/7] usb: gadget: uvc: ensure the vdev is unset
Date:   Sun,  3 Oct 2021 22:29:38 +0200
Message-Id: <20211003202939.306-7-m.grzeschik@pengutronix.de>
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

Since the uvc video device is created on demand, we have to ensure
that the struct is always zeroed. Otherwise the previous settings
might collide with the new values.

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
v2: - added reviewed by
    - fixed patch description

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

