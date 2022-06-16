Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB59854EA4B
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jun 2022 21:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378284AbiFPTpI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jun 2022 15:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347111AbiFPTpI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jun 2022 15:45:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BF959974
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 12:45:07 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1o1vQP-0000sB-De; Thu, 16 Jun 2022 21:45:05 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1o1vQN-000vS8-3P; Thu, 16 Jun 2022 21:45:04 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1o1vQN-00CVdn-Fy; Thu, 16 Jun 2022 21:45:03 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     peter.chen@kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: [PATCH] usb: chipidea: udc: implement get_frame
Date:   Thu, 16 Jun 2022 21:44:59 +0200
Message-Id: <20220616194459.2981519-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
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

The chipidea udc core is capable of reading the current frame index from
hardware. This patch adds the get_frame callback to the driver.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/chipidea/ci.h   |  1 +
 drivers/usb/chipidea/core.c |  2 ++
 drivers/usb/chipidea/udc.c  | 14 ++++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index 99440baa6458ab..a4a3be04991099 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -49,6 +49,7 @@ enum ci_hw_regs {
 	OP_USBCMD,
 	OP_USBSTS,
 	OP_USBINTR,
+	OP_FRINDEX,
 	OP_DEVICEADDR,
 	OP_ENDPTLISTADDR,
 	OP_TTCTRL,
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 5359b2a2e4d243..6330fa9117926a 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -53,6 +53,7 @@ static const u8 ci_regs_nolpm[] = {
 	[OP_USBCMD]		= 0x00U,
 	[OP_USBSTS]		= 0x04U,
 	[OP_USBINTR]		= 0x08U,
+	[OP_FRINDEX]		= 0x0CU,
 	[OP_DEVICEADDR]		= 0x14U,
 	[OP_ENDPTLISTADDR]	= 0x18U,
 	[OP_TTCTRL]		= 0x1CU,
@@ -78,6 +79,7 @@ static const u8 ci_regs_lpm[] = {
 	[OP_USBCMD]		= 0x00U,
 	[OP_USBSTS]		= 0x04U,
 	[OP_USBINTR]		= 0x08U,
+	[OP_FRINDEX]		= 0x0CU,
 	[OP_DEVICEADDR]		= 0x14U,
 	[OP_ENDPTLISTADDR]	= 0x18U,
 	[OP_TTCTRL]		= 0x1CU,
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 15d211a8b3ac54..054e5077b39834 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1651,6 +1651,19 @@ static const struct usb_ep_ops usb_ep_ops = {
 /******************************************************************************
  * GADGET block
  *****************************************************************************/
+
+static int ci_udc_get_frame(struct usb_gadget *_gadget)
+{
+	struct ci_hdrc *ci = container_of(_gadget, struct ci_hdrc, gadget);
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&ci->lock, flags);
+	ret = hw_read(ci, OP_FRINDEX, 0x3fff);
+	spin_unlock_irqrestore(&ci->lock, flags);
+	return ret >> 3;
+}
+
 /*
  * ci_hdrc_gadget_connect: caller makes sure gadget driver is binded
  */
@@ -1807,6 +1820,7 @@ static struct usb_ep *ci_udc_match_ep(struct usb_gadget *gadget,
  * Check  "usb_gadget.h" for details
  */
 static const struct usb_gadget_ops usb_gadget_ops = {
+	.get_frame	= ci_udc_get_frame,
 	.vbus_session	= ci_udc_vbus_session,
 	.wakeup		= ci_udc_wakeup,
 	.set_selfpowered	= ci_udc_selfpowered,
-- 
2.30.2

