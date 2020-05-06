Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4EF1C65FA
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2020 04:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbgEFCrA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 22:47:00 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:50100 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725900AbgEFCq7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 22:46:59 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C5DDAC1324;
        Wed,  6 May 2020 02:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588733218; bh=0SfLJBqomQSNCzEXBWY9qdA1GMz+7S/c7taKJul25Hc=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=AD/aY3YdxzOpvJuOg/X5iTlnuGInGWxvfr7GT5yoRGfxN9pvqgou2nu9NQxHzt0VZ
         cJMhirLbY+9oZcWk4Xyh7l315tVYQj6H5ngE7JS17TXKVbceTvVLOYW+A0vHfp5v0v
         2lcLDLNOI2cH/lMm3uYADClYAXoicHbNMVQU2Od6YwO5b6JdMgC7Jkh+XM+W25DDps
         MK2VQpdlLz2T9eSJ/807YfKofhpfOz9EmLCuxgmLFDAuLD3LLDlEZhZmX1DXUVOlGZ
         x52SMRT7lnqSB2W2IdB74035dG8Q/Qc9G+rK5gyJCIl7Xo9rEMbI13JD8WpglbF3IO
         Hge6XDFWUP2Mw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 9575DA0259;
        Wed,  6 May 2020 02:46:57 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 05 May 2020 19:46:57 -0700
Date:   Tue, 05 May 2020 19:46:57 -0700
Message-Id: <710d4c82ec587f6653c476b0ec5a9f94c7ab7446.1588732815.git.thinhn@synopsys.com>
In-Reply-To: <cover.1588732815.git.thinhn@synopsys.com>
References: <cover.1588732815.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 08/11] usb: dwc3: gadget: Wait for transfer completion
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If a transfer is in-progress, any new request should not kick off
another transfer. The driver needs to wait for the current transfer to
complete before starting off the next transfer. Introduce a new flag
DWC3_EP_WAIT_TRANSFER_COMPLETE for this.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.h   | 1 +
 drivers/usb/dwc3/gadget.c | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 7204a838ec06..b11183a715a7 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -701,6 +701,7 @@ struct dwc3_ep {
 #define DWC3_EP_END_TRANSFER_PENDING BIT(4)
 #define DWC3_EP_PENDING_REQUEST	BIT(5)
 #define DWC3_EP_DELAY_START	BIT(6)
+#define DWC3_EP_WAIT_TRANSFER_COMPLETE	BIT(7)
 
 	/* This last one is specific to EP0 */
 #define DWC3_EP0_DIR_IN		BIT(31)
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 052f6dc52a51..97c6a5785725 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1292,6 +1292,9 @@ static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
 		return ret;
 	}
 
+	if (dep->stream_capable && req->request.is_last)
+		dep->flags |= DWC3_EP_WAIT_TRANSFER_COMPLETE;
+
 	return 0;
 }
 
@@ -1498,6 +1501,9 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
 	list_add_tail(&req->list, &dep->pending_list);
 	req->status = DWC3_REQUEST_STATUS_QUEUED;
 
+	if (dep->flags & DWC3_EP_WAIT_TRANSFER_COMPLETE)
+		return 0;
+
 	/* Start the transfer only after the END_TRANSFER is completed */
 	if (dep->flags & DWC3_EP_END_TRANSFER_PENDING) {
 		dep->flags |= DWC3_EP_DELAY_START;
@@ -2735,7 +2741,8 @@ static void dwc3_gadget_endpoint_transfer_complete(struct dwc3_ep *dep,
 	if (event->status & DEPEVT_STATUS_BUSERR)
 		status = -ECONNRESET;
 
-	dwc3_gadget_endpoint_trbs_complete(dep, event, status);
+	if (dwc3_gadget_endpoint_trbs_complete(dep, event, status))
+		dep->flags &= ~DWC3_EP_WAIT_TRANSFER_COMPLETE;
 }
 
 static void dwc3_gadget_endpoint_transfer_not_ready(struct dwc3_ep *dep,
-- 
2.11.0

