Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34C183ADA93
	for <lists+linux-usb@lfdr.de>; Sat, 19 Jun 2021 17:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234584AbhFSPUx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Jun 2021 11:20:53 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:63426 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234530AbhFSPUs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 19 Jun 2021 11:20:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624115917; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=nsh9GKcZWWMRDjAmNGHkpMxKoKQb97Frcy6QbqpT8ck=; b=sJbJaaLYJallEIPioi4mFQ94t5AkJR6wlYXkNKGzu6OHprZQ486ABbHloro4VHPBp3Zy45+S
 hGc8Kt0qy+frg45Y57hL1XWbippBSd5ddOf+gotSHwwFR95RAwvBjLZMQ5wevJsv8JnrGMvE
 CbxOYk0yYw/RdhF/WfCfbKPRMfk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60ce0ac26ddc3305c4037969 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 19 Jun 2021 15:18:26
 GMT
Sender: linyyuan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 603E5C433F1; Sat, 19 Jun 2021 15:18:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from localhost.localdomain (unknown [101.87.142.17])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: linyyuan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E0568C433F1;
        Sat, 19 Jun 2021 15:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E0568C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=linyyuan@codeaurora.org
From:   Linyu Yuan <linyyuan@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jack Pham <jackp@codeaurora.org>,
        Linyu Yuan <linyyuan@codeaurora.org>
Subject: [PATCH 2/2] usb: dwc3: fix race of usb_gadget_driver operation
Date:   Sat, 19 Jun 2021 23:17:47 +0800
Message-Id: <20210619151747.51706-1-linyyuan@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

there is following race condition,

      CPU1                         CPU2
dwc3_runtime_suspend()        dwc3_gadget_stop()
spin_lock(&dwc->lock)
dwc3_gadget_suspend()
dwc3_disconnect_gadget()
dwc->gadget_driver != NULL
spin_unlock(&dwc->lock)
                              spin_lock(&dwc->lock)
                              dwc->gadget_driver = NULL
                              spin_unlock(&dwc->lock)
dwc->gadget_driver->disconnect(dwc->gadget);

system will crash when access NULL pointer.

this change will remove pointer of upper layer
struct usb_gadget_driver,
use UDC safe api to access necessary function.

Signed-off-by: Linyu Yuan <linyyuan@codeaurora.org>
---
 drivers/usb/dwc3/core.h   |  2 --
 drivers/usb/dwc3/ep0.c    |  6 +----
 drivers/usb/dwc3/gadget.c | 53 ++++++++++-----------------------------
 3 files changed, 14 insertions(+), 47 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index dccdf13b5f9e..4db64d103446 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -962,7 +962,6 @@ struct dwc3_scratchpad_array {
  * @ev_buf: struct dwc3_event_buffer pointer
  * @eps: endpoint array
  * @gadget: device side representation of the peripheral controller
- * @gadget_driver: pointer to the gadget driver
  * @clks: array of clocks
  * @num_clks: number of clocks
  * @reset: reset control
@@ -1108,7 +1107,6 @@ struct dwc3 {
 	struct dwc3_ep		*eps[DWC3_ENDPOINTS_NUM];
 
 	struct usb_gadget	*gadget;
-	struct usb_gadget_driver *gadget_driver;
 
 	struct clk_bulk_data	*clks;
 	int			num_clks;
diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 3cd294264372..89f63be00902 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -600,7 +600,7 @@ static int dwc3_ep0_delegate_req(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
 	int ret;
 
 	spin_unlock(&dwc->lock);
-	ret = dwc->gadget_driver->setup(dwc->gadget, ctrl);
+	ret = usb_gadget_udc_setup(dwc->gadget, ctrl);
 	spin_lock(&dwc->lock);
 	return ret;
 }
@@ -795,9 +795,6 @@ static void dwc3_ep0_inspect_setup(struct dwc3 *dwc,
 	int ret = -EINVAL;
 	u32 len;
 
-	if (!dwc->gadget_driver)
-		goto out;
-
 	trace_dwc3_ctrl_req(ctrl);
 
 	len = le16_to_cpu(ctrl->wLength);
@@ -819,7 +816,6 @@ static void dwc3_ep0_inspect_setup(struct dwc3 *dwc,
 	if (ret == USB_GADGET_DELAYED_STATUS)
 		dwc->delayed_status = true;
 
-out:
 	if (ret < 0)
 		dwc3_ep0_stall_and_restart(dwc);
 }
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index af6d7f157989..8cb7a9826ee1 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2464,7 +2464,6 @@ static int dwc3_gadget_start(struct usb_gadget *g,
 		struct usb_gadget_driver *driver)
 {
 	struct dwc3		*dwc = gadget_to_dwc(g);
-	unsigned long		flags;
 	int			ret;
 	int			irq;
 
@@ -2477,10 +2476,6 @@ static int dwc3_gadget_start(struct usb_gadget *g,
 		return ret;
 	}
 
-	spin_lock_irqsave(&dwc->lock, flags);
-	dwc->gadget_driver	= driver;
-	spin_unlock_irqrestore(&dwc->lock, flags);
-
 	return 0;
 }
 
@@ -2494,11 +2489,6 @@ static void __dwc3_gadget_stop(struct dwc3 *dwc)
 static int dwc3_gadget_stop(struct usb_gadget *g)
 {
 	struct dwc3		*dwc = gadget_to_dwc(g);
-	unsigned long		flags;
-
-	spin_lock_irqsave(&dwc->lock, flags);
-	dwc->gadget_driver	= NULL;
-	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	free_irq(dwc->irq_gadget, dwc->ev_buf);
 
@@ -3231,39 +3221,30 @@ static void dwc3_endpoint_interrupt(struct dwc3 *dwc,
 
 static void dwc3_disconnect_gadget(struct dwc3 *dwc)
 {
-	if (dwc->gadget_driver && dwc->gadget_driver->disconnect) {
-		spin_unlock(&dwc->lock);
-		dwc->gadget_driver->disconnect(dwc->gadget);
-		spin_lock(&dwc->lock);
-	}
+	spin_unlock(&dwc->lock);
+	usb_gadget_udc_disconnect(dwc->gadget);
+	spin_lock(&dwc->lock);
 }
 
 static void dwc3_suspend_gadget(struct dwc3 *dwc)
 {
-	if (dwc->gadget_driver && dwc->gadget_driver->suspend) {
-		spin_unlock(&dwc->lock);
-		dwc->gadget_driver->suspend(dwc->gadget);
-		spin_lock(&dwc->lock);
-	}
+	spin_unlock(&dwc->lock);
+	usb_gadget_udc_suspend(dwc->gadget);
+	spin_lock(&dwc->lock);
 }
 
 static void dwc3_resume_gadget(struct dwc3 *dwc)
 {
-	if (dwc->gadget_driver && dwc->gadget_driver->resume) {
-		spin_unlock(&dwc->lock);
-		dwc->gadget_driver->resume(dwc->gadget);
-		spin_lock(&dwc->lock);
-	}
+	spin_unlock(&dwc->lock);
+	usb_gadget_udc_resume(dwc->gadget);
+	spin_lock(&dwc->lock);
 }
 
 static void dwc3_reset_gadget(struct dwc3 *dwc)
 {
-	if (!dwc->gadget_driver)
-		return;
-
 	if (dwc->gadget->speed != USB_SPEED_UNKNOWN) {
 		spin_unlock(&dwc->lock);
-		usb_gadget_udc_reset(dwc->gadget, dwc->gadget_driver);
+		usb_gadget_udc_reset(dwc->gadget, NULL);
 		spin_lock(&dwc->lock);
 	}
 }
@@ -3585,11 +3566,9 @@ static void dwc3_gadget_wakeup_interrupt(struct dwc3 *dwc)
 	 * implemented.
 	 */
 
-	if (dwc->gadget_driver && dwc->gadget_driver->resume) {
-		spin_unlock(&dwc->lock);
-		dwc->gadget_driver->resume(dwc->gadget);
-		spin_lock(&dwc->lock);
-	}
+	spin_unlock(&dwc->lock);
+	usb_gadget_udc_resume(dwc->gadget);
+	spin_lock(&dwc->lock);
 }
 
 static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
@@ -4085,9 +4064,6 @@ void dwc3_gadget_exit(struct dwc3 *dwc)
 
 int dwc3_gadget_suspend(struct dwc3 *dwc)
 {
-	if (!dwc->gadget_driver)
-		return 0;
-
 	dwc3_gadget_run_stop(dwc, false, false);
 	dwc3_disconnect_gadget(dwc);
 	__dwc3_gadget_stop(dwc);
@@ -4099,9 +4075,6 @@ int dwc3_gadget_resume(struct dwc3 *dwc)
 {
 	int			ret;
 
-	if (!dwc->gadget_driver)
-		return 0;
-
 	ret = __dwc3_gadget_start(dwc);
 	if (ret < 0)
 		goto err0;
-- 
2.25.1

