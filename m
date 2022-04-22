Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 529AE50ADB1
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 04:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443309AbiDVCZf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Apr 2022 22:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443307AbiDVCZc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Apr 2022 22:25:32 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29D5496A1
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 19:22:40 -0700 (PDT)
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 559D7C48D2;
        Fri, 22 Apr 2022 02:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1650594160; bh=/0Un8rZ5O1F2QOpWVOdmGTYHFPsuL68QahvHUDeIrOA=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=X5jqPzqC72D+Ko6TavARF8yF6piImyK+2cYX9i2g34fAOPJDBd1Xyh8ankP4yKYmz
         ciLwj14hvU6TqnfKjKm68yfJi/h4fMZHFjuXEg17kCYNRCxsR3IAARnqm5XLaotpO8
         +3lj3KmYMRqE/fad5l/9WcN2ABWwDG00UtPV49f38deZakKGx00Klxgd609x9FGk8t
         dQYR5Hb96N9CS4z2wWAciinYB4SWSPUyxxovXazHQpjz3PzR8BavHO0OnUxVgVcNTu
         o/pi8cLiOaEt1CJV0XlFnmltNkRXLWdH1i28NbwFFSM88oi1w52dY4ag32SUv8BHCk
         L7kIcpnoHqceQ==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id A9182A006F;
        Fri, 22 Apr 2022 02:22:38 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Thu, 21 Apr 2022 19:22:38 -0700
Date:   Thu, 21 Apr 2022 19:22:38 -0700
Message-Id: <4c0f259b17d95acaaa931f90276683a48a32fe22.1650593829.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
References: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 2/6] usb: dwc3: gadget: Refactor pullup()
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Move soft-disconnect sequence out of dwc3_gadget_pullup(). No
functional change here.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 65 ++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index f30468b35c8c..d8e95196967c 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2498,6 +2498,40 @@ static void dwc3_gadget_disable_irq(struct dwc3 *dwc);
 static void __dwc3_gadget_stop(struct dwc3 *dwc);
 static int __dwc3_gadget_start(struct dwc3 *dwc);
 
+static int dwc3_gadget_soft_disconnect(struct dwc3 *dwc)
+{
+	u32 count;
+
+	dwc->connected = false;
+
+	/*
+	 * In the Synopsys DesignWare Cores USB3 Databook Rev. 3.30a
+	 * Section 4.1.8 Table 4-7, it states that for a device-initiated
+	 * disconnect, the SW needs to ensure that it sends "a DEPENDXFER
+	 * command for any active transfers" before clearing the RunStop
+	 * bit.
+	 */
+	dwc3_stop_active_transfers(dwc);
+	__dwc3_gadget_stop(dwc);
+
+	/*
+	 * In the Synopsys DesignWare Cores USB3 Databook Rev. 3.30a
+	 * Section 1.3.4, it mentions that for the DEVCTRLHLT bit, the
+	 * "software needs to acknowledge the events that are generated
+	 * (by writing to GEVNTCOUNTn) while it is waiting for this bit
+	 * to be set to '1'."
+	 */
+	count = dwc3_readl(dwc->regs, DWC3_GEVNTCOUNT(0));
+	count &= DWC3_GEVNTCOUNT_MASK;
+	if (count > 0) {
+		dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), count);
+		dwc->ev_buf->lpos = (dwc->ev_buf->lpos + count) %
+			dwc->ev_buf->length;
+	}
+
+	return dwc3_gadget_run_stop(dwc, false, false);
+}
+
 static int dwc3_gadget_pullup(struct usb_gadget *g, int is_on)
 {
 	struct dwc3		*dwc = gadget_to_dwc(g);
@@ -2554,33 +2588,7 @@ static int dwc3_gadget_pullup(struct usb_gadget *g, int is_on)
 	spin_lock_irqsave(&dwc->lock, flags);
 
 	if (!is_on) {
-		u32 count;
-
-		dwc->connected = false;
-		/*
-		 * In the Synopsis DesignWare Cores USB3 Databook Rev. 3.30a
-		 * Section 4.1.8 Table 4-7, it states that for a device-initiated
-		 * disconnect, the SW needs to ensure that it sends "a DEPENDXFER
-		 * command for any active transfers" before clearing the RunStop
-		 * bit.
-		 */
-		dwc3_stop_active_transfers(dwc);
-		__dwc3_gadget_stop(dwc);
-
-		/*
-		 * In the Synopsis DesignWare Cores USB3 Databook Rev. 3.30a
-		 * Section 1.3.4, it mentions that for the DEVCTRLHLT bit, the
-		 * "software needs to acknowledge the events that are generated
-		 * (by writing to GEVNTCOUNTn) while it is waiting for this bit
-		 * to be set to '1'."
-		 */
-		count = dwc3_readl(dwc->regs, DWC3_GEVNTCOUNT(0));
-		count &= DWC3_GEVNTCOUNT_MASK;
-		if (count > 0) {
-			dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), count);
-			dwc->ev_buf->lpos = (dwc->ev_buf->lpos + count) %
-						dwc->ev_buf->length;
-		}
+		ret = dwc3_gadget_soft_disconnect(dwc);
 	} else {
 		/*
 		 * In the Synopsys DWC_usb31 1.90a programming guide section
@@ -2594,9 +2602,8 @@ static int dwc3_gadget_pullup(struct usb_gadget *g, int is_on)
 
 		dwc3_event_buffers_setup(dwc);
 		__dwc3_gadget_start(dwc);
+		ret = dwc3_gadget_run_stop(dwc, true, false);
 	}
-
-	ret = dwc3_gadget_run_stop(dwc, is_on, false);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 	enable_irq(dwc->irq_gadget);
 
-- 
2.28.0

