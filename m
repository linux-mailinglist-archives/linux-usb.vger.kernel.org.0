Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D891E6970
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 20:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405904AbgE1Sf6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 14:35:58 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:42498 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405891AbgE1Sf4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 28 May 2020 14:35:56 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 49XxGf65JDzBn;
        Thu, 28 May 2020 20:35:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1590690954; bh=QjngVfF3jGFX7hjsYC0+ki+GV1G3GFLfuWLY+mPbiy8=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=mjOQBr4a0z6i6cI5tKBgwyT5sDSr+t668gVJneiKtoM8WU27fbdcalb43S5QkFoJ5
         idpS8+XgQIXeIK0cX+uBp3z6rbvLhe2Q7xmL+nGTh9CEAqIFHasXlJ2ai4yQQBwFtN
         A2GuVMXuhg6g7lCM081DGpeCJjH2TFsWkkOJKQ6Oh1EHb95Wz4Dq9Z1QrqETuIOsv/
         XuwG9FZ9vNw0TDieZibrq989ipD0ypwzy9orWcSQEJwK52S18WVKTFhlf8FPP8CS4T
         MAjH6iuiD8WurIhd/K8NBHsnm82furj3JTSieDPiRGzBlua33OwlyM3ULgUTjIm84+
         TlQAc1yXCB/SA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Thu, 28 May 2020 20:35:54 +0200
Message-Id: <e4d649e657f67ca422252331b560c29bc3f63515.1590690650.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1590690650.git.mirq-linux@rere.qmqm.pl>
References: <cover.1590690650.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 3/3] usb: gadget: udc: atmel: implement .pullup callback
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Cristian Birsan <cristian.birsan@microchip.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Songjun Wu <songjun.wu@atmel.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Implement udc->pullup callback, so that udc_connect/disconnect work.
This is needed for composite gadget, as it assumes udc_disconnect()
actually works and calls gadget's ->disconnect callback.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/usb/gadget/udc/atmel_usba_udc.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
index 9342a3d24963..c5128c229c52 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -1028,6 +1028,7 @@ usba_udc_set_selfpowered(struct usb_gadget *gadget, int is_selfpowered)
 	return 0;
 }
 
+static int atmel_usba_pullup(struct usb_gadget *gadget, int is_on);
 static int atmel_usba_start(struct usb_gadget *gadget,
 		struct usb_gadget_driver *driver);
 static int atmel_usba_stop(struct usb_gadget *gadget);
@@ -1101,6 +1102,7 @@ static const struct usb_gadget_ops usba_udc_ops = {
 	.get_frame		= usba_udc_get_frame,
 	.wakeup			= usba_udc_wakeup,
 	.set_selfpowered	= usba_udc_set_selfpowered,
+	.pullup			= atmel_usba_pullup,
 	.udc_start		= atmel_usba_start,
 	.udc_stop		= atmel_usba_stop,
 	.match_ep		= atmel_usba_match_ep,
@@ -1957,6 +1959,24 @@ static irqreturn_t usba_vbus_irq_thread(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
+static int atmel_usba_pullup(struct usb_gadget *gadget, int is_on)
+{
+	struct usba_udc *udc = container_of(gadget, struct usba_udc, gadget);
+	unsigned long flags;
+	u32 ctrl;
+
+	spin_lock_irqsave(&udc->lock, flags);
+	ctrl = usba_readl(udc, CTRL);
+	if (is_on)
+		ctrl &= ~USBA_DETACH;
+	else
+		ctrl |= USBA_DETACH;
+	usba_writel(udc, CTRL, ctrl);
+	spin_unlock_irqrestore(&udc->lock, flags);
+
+	return 0;
+}
+
 static int atmel_usba_start(struct usb_gadget *gadget,
 		struct usb_gadget_driver *driver)
 {
-- 
2.20.1

