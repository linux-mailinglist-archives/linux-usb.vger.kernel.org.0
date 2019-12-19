Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFDF125982
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2019 03:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbfLSCOq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Dec 2019 21:14:46 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:53190 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726463AbfLSCOq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Dec 2019 21:14:46 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 64C16404CE;
        Thu, 19 Dec 2019 02:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576721685; bh=vNt9hoeC6x96G0s26VecpP8EPpQLGS48x7JgVsv7UP4=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=NdLHNDCl+4hqzEtCbNDYJgMK7vmYLCD9rcnMfc5Si/XzPsBU02WvEDi5vBR4KkVk+
         hIiuX/l+KrW4Imzw5p5Bm3apjSu173JNUqAqU+35JOS/NiT+tOMX6UoZn6h/c1yRGy
         J2Wl7lBNKmHrIZZmU5LbPFfHidAoeOIh6rfJFPZDUy++eqJh//7sHcOFoyv/ypF+1i
         W+x1XOIuFogi331TwQjQBWx9MqiMGFLkFtL26u61qD1vRufhR1bFvbMvwCSQOh2sCy
         IrTwCf2vUDxb/CuzGrcahuDfRlb/UsEyD+aqLvaDXypbDotpKxDoaiXoAF7cZcmumz
         gcG1If/bYb5eA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 2C235A006D;
        Thu, 19 Dec 2019 02:14:44 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 18 Dec 2019 18:14:44 -0800
Date:   Wed, 18 Dec 2019 18:14:44 -0800
Message-Id: <8516e98e3322dfdeb8d7fdd153322a141cab49f7.1576715470.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576715470.git.thinhn@synopsys.com>
References: <cover.1576715470.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 1/3] usb: dwc3: gadget: Check END_TRANSFER completion
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

While the END_TRANSFER command is sent but not completed, any request
dequeue during this time will cause the driver to issue the END_TRANSFER
command. The driver needs to submit the command only once to stop the
controller from processing further. The controller may take more time to
process the same command multiple times unnecessarily. Let's add a flag
DWC3_EP_END_TRANSFER_PENDING to check for this condition.

Fixes: 3aec99154db3 ("usb: dwc3: gadget: remove DWC3_EP_END_TRANSFER_PENDING")
Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v2:
 - None

 drivers/usb/dwc3/core.h   | 1 +
 drivers/usb/dwc3/ep0.c    | 4 +++-
 drivers/usb/dwc3/gadget.c | 6 +++++-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 1c8b349379af..da0af11fbc1a 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -688,6 +688,7 @@ struct dwc3_ep {
 #define DWC3_EP_STALL		BIT(1)
 #define DWC3_EP_WEDGE		BIT(2)
 #define DWC3_EP_TRANSFER_STARTED BIT(3)
+#define DWC3_EP_END_TRANSFER_PENDING BIT(4)
 #define DWC3_EP_PENDING_REQUEST	BIT(5)
 
 	/* This last one is specific to EP0 */
diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index fd1b100d2927..6dee4dabc0a4 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -1136,8 +1136,10 @@ void dwc3_ep0_interrupt(struct dwc3 *dwc,
 	case DWC3_DEPEVT_EPCMDCMPLT:
 		cmd = DEPEVT_PARAMETER_CMD(event->parameters);
 
-		if (cmd == DWC3_DEPCMD_ENDTRANSFER)
+		if (cmd == DWC3_DEPCMD_ENDTRANSFER) {
+			dep->flags &= ~DWC3_EP_END_TRANSFER_PENDING;
 			dep->flags &= ~DWC3_EP_TRANSFER_STARTED;
+		}
 		break;
 	}
 }
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index b3f8514d1f27..218022c261bc 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2621,6 +2621,7 @@ static void dwc3_endpoint_interrupt(struct dwc3 *dwc,
 		cmd = DEPEVT_PARAMETER_CMD(event->parameters);
 
 		if (cmd == DWC3_DEPCMD_ENDTRANSFER) {
+			dep->flags &= ~DWC3_EP_END_TRANSFER_PENDING;
 			dep->flags &= ~DWC3_EP_TRANSFER_STARTED;
 			dwc3_gadget_ep_cleanup_cancelled_requests(dep);
 		}
@@ -2679,7 +2680,8 @@ static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
 	u32 cmd;
 	int ret;
 
-	if (!(dep->flags & DWC3_EP_TRANSFER_STARTED))
+	if (!(dep->flags & DWC3_EP_TRANSFER_STARTED) ||
+	    (dep->flags & DWC3_EP_END_TRANSFER_PENDING))
 		return;
 
 	/*
@@ -2724,6 +2726,8 @@ static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
 
 	if (!interrupt)
 		dep->flags &= ~DWC3_EP_TRANSFER_STARTED;
+	else
+		dep->flags |= DWC3_EP_END_TRANSFER_PENDING;
 
 	if (dwc3_is_usb31(dwc) || dwc->revision < DWC3_REVISION_310A)
 		udelay(100);
-- 
2.11.0

