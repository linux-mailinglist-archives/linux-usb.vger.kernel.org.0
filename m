Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70B6E2F20F3
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 21:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731409AbhAKUjK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 15:39:10 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:46646 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730894AbhAKUjK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jan 2021 15:39:10 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F1B51C0352;
        Mon, 11 Jan 2021 20:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610397489; bh=LfJEm8M3DwR2MuaT3slIfsMotJ8UFL0PBObxIwjicag=;
        h=Date:From:Subject:To:From;
        b=FM33qDgnoR+PpvZcbWyXRWmgCz8TttTJEA6mlIcP02e0lMo9gB5D9AfrLoVYOSOcG
         68Gq60niz1fTrURprJABBdKu1+KggD81DwLFbYbmq0cmxK9BTT15dIHJfmoPRLjOF7
         08QKI8h3zu/sEuSCrYddIz7/5cUAx3kFDPIhpykmXOppP/vBDP0OwImOqSqFV11eEM
         QnRNePowsKLy36P1uHo5/PWE5LoJ40rf8zlI1JUN1zAKG311Rzm9VhMnZAZsB5l6YK
         S5b9bw/2d5043Rc0cBy5Az4sZFXX//kojsaQiTDFbP0W4+0VIA7aXXwMjo23O8WGnp
         jIxQg5wWtMqnA==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 71367A0096;
        Mon, 11 Jan 2021 20:38:05 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 11 Jan 2021 12:38:05 -0800
Date:   Mon, 11 Jan 2021 12:38:05 -0800
Message-Id: <a7c4112fcd4dc2f0169af94a24f5685ca77f09fd.1610395599.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: udc: core: Introduce started state
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For some UDCs, the initialization sequence by udc_start() should not be
repeated until it is properly cleaned up with udc_stop() and vise versa.
We may run into some cleanup failure as seen with the DWC3 driver during
the irq cleanup. This issue can occur when the user triggers
soft-connect/soft-disconnect from the soft_connect sysfs. To avoid
adding checks to every UDC driver, at the UDC framework, introduce a
"started" state to track and prevent the UDC from repeating the
udc_start() and udc_stop() if it had already started/stopped.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Suggested by Felipe:
https://lore.kernel.org/linux-usb/87a6tmcxhi.fsf@kernel.org/

 drivers/usb/gadget/udc/core.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 6a62bbd01324..98cf9216f3cb 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -29,6 +29,7 @@
  * @list: for use by the udc class driver
  * @vbus: for udcs who care about vbus status, this value is real vbus status;
  * for udcs who do not care about vbus status, this value is always true
+ * @started: the UDC's started state. True if the UDC had started.
  *
  * This represents the internal data structure which is used by the UDC-class
  * to hold information about udc driver and gadget together.
@@ -39,6 +40,7 @@ struct usb_udc {
 	struct device			dev;
 	struct list_head		list;
 	bool				vbus;
+	bool				started;
 };
 
 static struct class *udc_class;
@@ -1082,7 +1084,18 @@ EXPORT_SYMBOL_GPL(usb_gadget_udc_reset);
  */
 static inline int usb_gadget_udc_start(struct usb_udc *udc)
 {
-	return udc->gadget->ops->udc_start(udc->gadget, udc->driver);
+	int ret;
+
+	if (udc->started) {
+		dev_err(&udc->dev, "UDC had already started\n");
+		return -EBUSY;
+	}
+
+	ret = udc->gadget->ops->udc_start(udc->gadget, udc->driver);
+	if (!ret)
+		udc->started = true;
+
+	return ret;
 }
 
 /**
@@ -1098,7 +1111,13 @@ static inline int usb_gadget_udc_start(struct usb_udc *udc)
  */
 static inline void usb_gadget_udc_stop(struct usb_udc *udc)
 {
+	if (!udc->started) {
+		dev_err(&udc->dev, "UDC had already stopped\n");
+		return;
+	}
+
 	udc->gadget->ops->udc_stop(udc->gadget);
+	udc->started = false;
 }
 
 /**
@@ -1222,6 +1241,8 @@ int usb_add_gadget(struct usb_gadget *gadget)
 	udc->gadget = gadget;
 	gadget->udc = udc;
 
+	udc->started = false;
+
 	mutex_lock(&udc_lock);
 	list_add_tail(&udc->list, &udc_list);
 

base-commit: 7c53f6b671f4aba70ff15e1b05148b10d58c2837
-- 
2.28.0

