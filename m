Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E93B6125983
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2019 03:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbfLSCOx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Dec 2019 21:14:53 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47296 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726463AbfLSCOw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Dec 2019 21:14:52 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BFC8AC0094;
        Thu, 19 Dec 2019 02:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576721691; bh=aQwbs/8BNn+vYA1vPtRXFWD3Zq8NzbMkHxN0WRsRY+k=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=j+e/IHSRurniIrylbltYIklebZGtJgzNXbZ28wJYBzxO+rmIfryOQzTTmU4VxwCNq
         oN6GlM9IQpateCCJZ3dYYAtHqpgf183rk7cokAPRKFDUbnOLERHTOi0oyELlERs4eP
         73sJX3DxVxEu9qqlwvCzmv7Rw0uACaDkHbNKRL2lMrQtZnDyJc2QGgqAjmDsEcn1Rz
         GD8yCNgs6VYSX2Ne/8B/YDEBtBvxBRFojmn7krGkkS32XO0rWsGv5+oON23Pp9Rlsm
         TnWR3xp4rcX7V6QkqDvUx9aiSg8iadYY3hZR5UFnBBnpUKBH8RdAbN28Le4Mj8I/hp
         JwnVrR0v+MB2A==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 3DEA2A007D;
        Thu, 19 Dec 2019 02:14:50 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 18 Dec 2019 18:14:50 -0800
Date:   Wed, 18 Dec 2019 18:14:50 -0800
Message-Id: <48b8a653c3c31a6143b27676583c8353a4611adf.1576715470.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576715470.git.thinhn@synopsys.com>
References: <cover.1576715470.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 2/3] usb: dwc3: gadget: Delay starting transfer
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Baolin Wang <baolin.wang@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the END_TRANSFER command hasn't completed yet, then don't send the
START_TRANSFER command. The controller may not be able to start if
that's the case. Some controller revisions depend on this. See
commit 76a638f8ac0d ("usb: dwc3: gadget: wait for End Transfer to
complete"). Let's only send START_TRANSFER command after the
END_TRANSFER command had completed.

Fixes: 3aec99154db3 ("usb: dwc3: gadget: remove DWC3_EP_END_TRANSFER_PENDING")
Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v2:
 - None

 drivers/usb/dwc3/core.h   |  1 +
 drivers/usb/dwc3/gadget.c | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index da0af11fbc1a..77c4a9abe365 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -690,6 +690,7 @@ struct dwc3_ep {
 #define DWC3_EP_TRANSFER_STARTED BIT(3)
 #define DWC3_EP_END_TRANSFER_PENDING BIT(4)
 #define DWC3_EP_PENDING_REQUEST	BIT(5)
+#define DWC3_EP_DELAY_START	BIT(6)
 
 	/* This last one is specific to EP0 */
 #define DWC3_EP0_DIR_IN		BIT(31)
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 218022c261bc..61b7bef98cf9 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1450,6 +1450,12 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
 	list_add_tail(&req->list, &dep->pending_list);
 	req->status = DWC3_REQUEST_STATUS_QUEUED;
 
+	/* Start the transfer only after the END_TRANSFER is completed */
+	if (dep->flags & DWC3_EP_END_TRANSFER_PENDING) {
+		dep->flags |= DWC3_EP_DELAY_START;
+		return 0;
+	}
+
 	/*
 	 * NOTICE: Isochronous endpoints should NEVER be prestarted. We must
 	 * wait for a XferNotReady event so we will know what's the current
@@ -2624,6 +2630,11 @@ static void dwc3_endpoint_interrupt(struct dwc3 *dwc,
 			dep->flags &= ~DWC3_EP_END_TRANSFER_PENDING;
 			dep->flags &= ~DWC3_EP_TRANSFER_STARTED;
 			dwc3_gadget_ep_cleanup_cancelled_requests(dep);
+			if ((dep->flags & DWC3_EP_DELAY_START) &&
+			    !usb_endpoint_xfer_isoc(dep->endpoint.desc))
+				__dwc3_gadget_kick_transfer(dep);
+
+			dep->flags &= ~DWC3_EP_DELAY_START;
 		}
 		break;
 	case DWC3_DEPEVT_STREAMEVT:
-- 
2.11.0

