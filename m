Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A155E249459
	for <lists+linux-usb@lfdr.de>; Wed, 19 Aug 2020 07:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgHSFRs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Aug 2020 01:17:48 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:57491 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbgHSFRq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Aug 2020 01:17:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597814265; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=5+Xq0E9EK519scA6vaX/lUwdzuv3I0cgSK1tWmFZ1y8=; b=IWiUBtUIcLfjFMrnLSVvjd3BqT0qW1VU2HYt9KjmJSPtBUsJmDhfItGqYvZ5FgXIY+Zjv71d
 05OZ3oPetbxHnuJm2ZohAn39YX2PiPAbhmjJGxvswF62lQnmeS97+YL6S6t3XAPBlbSh/nLr
 Dyx8ildQ7dRinhZOhsIRmcW2h4w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f3cb5f8d96d28d61eeafaf7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 19 Aug 2020 05:17:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9706CC433CB; Wed, 19 Aug 2020 05:17:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 867DAC433CA;
        Wed, 19 Aug 2020 05:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 867DAC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH] usb: dwc3: Stop active transfers before halting the controller
Date:   Tue, 18 Aug 2020 22:17:39 -0700
Message-Id: <20200819051739.22123-1-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In the DWC3 databook, for a device initiated disconnect, the driver is
required to send dependxfer commands for any pending transfers.
In addition, before the controller can move to the halted state, the SW
needs to acknowledge any pending events.  If the controller is not halted
properly, there is a chance the controller will continue accessing stale or
freed TRBs and buffers.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>

---
Verified fix by adding a check for ETIMEDOUT during the run stop call.
Shell script writing to the configfs UDC file to trigger disconnect and
connect.  Batch script to have PC execute data transfers over adb (ie adb
push)  After a few iterations, we'd run into a scenario where the
controller wasn't halted.  With the following change, no failed halts after
many iterations.
---
 drivers/usb/dwc3/ep0.c    |  2 +-
 drivers/usb/dwc3/gadget.c | 59 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 59f2e8c31bd1..456aa87e8778 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -197,7 +197,7 @@ int dwc3_gadget_ep0_queue(struct usb_ep *ep, struct usb_request *request,
 	int				ret;
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	if (!dep->endpoint.desc) {
+	if (!dep->endpoint.desc || !dwc->pullups_connected) {
 		dev_err(dwc->dev, "%s: can't queue to disabled endpoint\n",
 				dep->name);
 		ret = -ESHUTDOWN;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 3ab6f118c508..1f981942d7f9 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1516,7 +1516,7 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
 {
 	struct dwc3		*dwc = dep->dwc;
 
-	if (!dep->endpoint.desc) {
+	if (!dep->endpoint.desc || !dwc->pullups_connected) {
 		dev_err(dwc->dev, "%s: can't queue to disabled endpoint\n",
 				dep->name);
 		return -ESHUTDOWN;
@@ -1926,6 +1926,24 @@ static int dwc3_gadget_set_selfpowered(struct usb_gadget *g,
 	return 0;
 }
 
+static void dwc3_stop_active_transfers(struct dwc3 *dwc)
+{
+	u32 epnum;
+
+	for (epnum = 2; epnum < DWC3_ENDPOINTS_NUM; epnum++) {
+		struct dwc3_ep *dep;
+
+		dep = dwc->eps[epnum];
+		if (!dep)
+			continue;
+
+		if (!(dep->flags & DWC3_EP_ENABLED))
+			continue;
+
+		dwc3_remove_requests(dwc, dep);
+	}
+}
+
 static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on, int suspend)
 {
 	u32			reg;
@@ -1950,16 +1968,37 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on, int suspend)
 
 		dwc->pullups_connected = true;
 	} else {
+		dwc->pullups_connected = false;
+
+		__dwc3_gadget_ep_disable(dwc->eps[0]);
+		__dwc3_gadget_ep_disable(dwc->eps[1]);
+
+		/*
+		 * The databook explicitly mentions for a device-initiated
+		 * disconnect sequence, the SW needs to ensure that it ends any
+		 * active transfers.
+		 */
+		dwc3_stop_active_transfers(dwc);
+
 		reg &= ~DWC3_DCTL_RUN_STOP;
 
 		if (dwc->has_hibernation && !suspend)
 			reg &= ~DWC3_DCTL_KEEP_CONNECT;
-
-		dwc->pullups_connected = false;
 	}
 
 	dwc3_gadget_dctl_write_safe(dwc, reg);
 
+	/* Controller is not halted until pending events are acknowledged */
+	if (!is_on) {
+		reg = dwc3_readl(dwc->regs, DWC3_GEVNTCOUNT(0));
+		reg &= DWC3_GEVNTCOUNT_MASK;
+		if (reg > 0) {
+			dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), reg);
+			dwc->ev_buf->lpos = (dwc->ev_buf->lpos + reg) %
+						dwc->ev_buf->length;
+		}
+	}
+
 	do {
 		reg = dwc3_readl(dwc->regs, DWC3_DSTS);
 		reg &= DWC3_DSTS_DEVCTRLHLT;
@@ -1994,9 +2033,15 @@ static int dwc3_gadget_pullup(struct usb_gadget *g, int is_on)
 		}
 	}
 
+	/*
+	 * Synchronize and disable any further event handling while controller
+	 * is being enabled/disabled.
+	 */
+	disable_irq(dwc->irq_gadget);
 	spin_lock_irqsave(&dwc->lock, flags);
 	ret = dwc3_gadget_run_stop(dwc, is_on, false);
 	spin_unlock_irqrestore(&dwc->lock, flags);
+	enable_irq(dwc->irq_gadget);
 
 	return ret;
 }
@@ -3535,6 +3580,14 @@ static irqreturn_t dwc3_check_event_buf(struct dwc3_event_buffer *evt)
 	if (!count)
 		return IRQ_NONE;
 
+	/* Controller is halted; ignore new/pending events */
+	if (!dwc->pullups_connected) {
+		dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), count);
+		dwc->ev_buf->lpos = (dwc->ev_buf->lpos + count) %
+					dwc->ev_buf->length;
+		return IRQ_HANDLED;
+	}
+
 	evt->count = count;
 	evt->flags |= DWC3_EVENT_PENDING;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

