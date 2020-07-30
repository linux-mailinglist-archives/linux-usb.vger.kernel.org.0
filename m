Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18749233C27
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jul 2020 01:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730737AbgG3X3F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jul 2020 19:29:05 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:33916 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728846AbgG3X3F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jul 2020 19:29:05 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BAC8D406ED;
        Thu, 30 Jul 2020 23:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1596151744; bh=24CB1kjGqoFkzWcq09RLL8eyVapklybhg+lj89Te5z4=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=BvA64JzFJpcccBPSeQXFTihGmnL3/nptjnRfbnL6fBOPaWfXxYRtqCh6ss+aLVrA0
         mLUeTjMGG6rZH0yjn89/jnvSNZwfizvWyElE+/3qtpdUzOxs+JCzDvPjuMdElThgQl
         YuHBtMzCAjLjoKbBhTkSJxbD+nxDhta1BGIMZAmtMymx9JhcUuiQIgiLfzu6fnI+FX
         26/HyqogAgruMXcZBse3njnLGev9pjHeO8HDSTul2eLuKMsF0CtHFIrOplDbsYc+xT
         8Bk8QlDEoSyhpCAqqv2LeF+0Zn6X4MBHkb35E6ucFyr7EOBKjQGlSE+INhL+934ApE
         xGhlbo246C+UA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 92602A0096;
        Thu, 30 Jul 2020 23:29:03 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 30 Jul 2020 16:29:03 -0700
Date:   Thu, 30 Jul 2020 16:29:03 -0700
Message-Id: <c00979b5559e59d70e3cec019c668785b152362c.1596151437.git.thinhn@synopsys.com>
In-Reply-To: <cover.1596151437.git.thinhn@synopsys.com>
References: <cover.1596151437.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 3/3] usb: dwc3: gadget: Refactor ep command completion
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Refactor END_TRANSFER command completion handling and move it outside of
the switch statement to its own function. This makes it cleaner and
consistent with other event handler functions. No functional change
here.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 71 +++++++++++++++++++++++++----------------------
 1 file changed, 38 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 8c89444efd9f..cd68c5070084 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2829,6 +2829,43 @@ static void dwc3_gadget_endpoint_transfer_not_ready(struct dwc3_ep *dep,
 	(void) __dwc3_gadget_start_isoc(dep);
 }
 
+static void dwc3_gadget_endpoint_command_complete(struct dwc3_ep *dep,
+		const struct dwc3_event_depevt *event)
+{
+	u8 cmd = DEPEVT_PARAMETER_CMD(event->parameters);
+
+	if (cmd != DWC3_DEPCMD_ENDTRANSFER)
+		return;
+
+	dep->flags &= ~DWC3_EP_END_TRANSFER_PENDING;
+	dep->flags &= ~DWC3_EP_TRANSFER_STARTED;
+	dwc3_gadget_ep_cleanup_cancelled_requests(dep);
+
+	if (dep->flags & DWC3_EP_PENDING_CLEAR_STALL) {
+		struct dwc3 *dwc = dep->dwc;
+
+		dep->flags &= ~DWC3_EP_PENDING_CLEAR_STALL;
+		if (dwc3_send_clear_stall_ep_cmd(dep)) {
+			struct usb_ep *ep0 = &dwc->eps[0]->endpoint;
+
+			dev_err(dwc->dev, "failed to clear STALL on %s\n", dep->name);
+			if (dwc->delayed_status)
+				__dwc3_gadget_ep0_set_halt(ep0, 1);
+			return;
+		}
+
+		dep->flags &= ~(DWC3_EP_STALL | DWC3_EP_WEDGE);
+		if (dwc->delayed_status)
+			dwc3_ep0_send_delayed_status(dwc);
+	}
+
+	if ((dep->flags & DWC3_EP_DELAY_START) &&
+	    !usb_endpoint_xfer_isoc(dep->endpoint.desc))
+		__dwc3_gadget_kick_transfer(dep);
+
+	dep->flags &= ~DWC3_EP_DELAY_START;
+}
+
 static void dwc3_gadget_endpoint_stream_event(struct dwc3_ep *dep,
 		const struct dwc3_event_depevt *event)
 {
@@ -2898,7 +2935,6 @@ static void dwc3_endpoint_interrupt(struct dwc3 *dwc,
 {
 	struct dwc3_ep		*dep;
 	u8			epnum = event->endpoint_number;
-	u8			cmd;
 
 	dep = dwc->eps[epnum];
 
@@ -2924,38 +2960,7 @@ static void dwc3_endpoint_interrupt(struct dwc3 *dwc,
 		dwc3_gadget_endpoint_transfer_not_ready(dep, event);
 		break;
 	case DWC3_DEPEVT_EPCMDCMPLT:
-		cmd = DEPEVT_PARAMETER_CMD(event->parameters);
-
-		if (cmd == DWC3_DEPCMD_ENDTRANSFER) {
-			dep->flags &= ~DWC3_EP_END_TRANSFER_PENDING;
-			dep->flags &= ~DWC3_EP_TRANSFER_STARTED;
-			dwc3_gadget_ep_cleanup_cancelled_requests(dep);
-
-			if (dep->flags & DWC3_EP_PENDING_CLEAR_STALL) {
-				struct dwc3 *dwc = dep->dwc;
-
-				dep->flags &= ~DWC3_EP_PENDING_CLEAR_STALL;
-				if (dwc3_send_clear_stall_ep_cmd(dep)) {
-					struct usb_ep *ep0 = &dwc->eps[0]->endpoint;
-
-					dev_err(dwc->dev, "failed to clear STALL on %s\n",
-						dep->name);
-					if (dwc->delayed_status)
-						__dwc3_gadget_ep0_set_halt(ep0, 1);
-					return;
-				}
-
-				dep->flags &= ~(DWC3_EP_STALL | DWC3_EP_WEDGE);
-				if (dwc->delayed_status)
-					dwc3_ep0_send_delayed_status(dwc);
-			}
-
-			if ((dep->flags & DWC3_EP_DELAY_START) &&
-			    !usb_endpoint_xfer_isoc(dep->endpoint.desc))
-				__dwc3_gadget_kick_transfer(dep);
-
-			dep->flags &= ~DWC3_EP_DELAY_START;
-		}
+		dwc3_gadget_endpoint_command_complete(dep, event);
 		break;
 	case DWC3_DEPEVT_XFERCOMPLETE:
 		dwc3_gadget_endpoint_transfer_complete(dep, event);
-- 
2.11.0

