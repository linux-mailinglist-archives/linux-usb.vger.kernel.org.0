Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D01C46E472
	for <lists+linux-usb@lfdr.de>; Thu,  9 Dec 2021 09:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235072AbhLIIrA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Dec 2021 03:47:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235056AbhLIIq7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Dec 2021 03:46:59 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB945C061746
        for <linux-usb@vger.kernel.org>; Thu,  9 Dec 2021 00:43:26 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mvF1R-0003qz-1f; Thu, 09 Dec 2021 09:43:25 +0100
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1mvF1Q-00BCfh-3f; Thu, 09 Dec 2021 09:43:24 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de
Subject: [PATCH v5 3/7] usb: gadget: uvc: prevent index variables to start from 0
Date:   Thu,  9 Dec 2021 09:43:18 +0100
Message-Id: <20211209084322.2662616-4-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211209084322.2662616-1-m.grzeschik@pengutronix.de>
References: <20211209084322.2662616-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some configfs variables like bDefaultFrameIndex are always starting by
1. This patch adds a check to prevent setting those variables to 0.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: -
v2 -> v3: -
v3 -> v4: -
v4 -> v5: -

 drivers/usb/gadget/function/uvc_configfs.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 77d64031aa9c2a..b6bb5706299951 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -1565,6 +1565,12 @@ uvcg_uncompressed_##cname##_store(struct config_item *item,		\
 	if (ret)							\
 		goto end;						\
 									\
+	/* index values in uvc are never 0 */				\
+	if (!num) {							\
+		ret = -EINVAL;						\
+		goto end;						\
+	}								\
+									\
 	u->desc.aname = num;						\
 	ret = len;							\
 end:									\
@@ -1758,6 +1764,12 @@ uvcg_mjpeg_##cname##_store(struct config_item *item,			\
 	if (ret)							\
 		goto end;						\
 									\
+	/* index values in uvc are never 0 */				\
+	if (!num) {							\
+		ret = -EINVAL;						\
+		goto end;						\
+	}								\
+									\
 	u->desc.aname = num;						\
 	ret = len;							\
 end:									\
-- 
2.30.2

