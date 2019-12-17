Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6E21221A5
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2019 02:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfLQBqe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Dec 2019 20:46:34 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:55624 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726016AbfLQBqe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Dec 2019 20:46:34 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B912340642;
        Tue, 17 Dec 2019 01:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576547193; bh=5MP6IFdEBDdzfrYyxGZQnthkQWE2lYT5jSegjERSL/4=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=ar9XtKrs7JA8i2YbsiwFEqQOdBcwccqFZIbjGI4FsUEd6qmhDQT3sp5xOMlaoZSPs
         a/bRpfxZGtPzIf3wBQ11NSMm/mz1k/Y6VMqMp9EVeMAVKxG4iMMggTnjHM7MKUokqI
         RPsHvkf/QFsfbWY4PfmsXA16LZsyZso2bIUMVNCgL+juOECitVtlFqJrayUprnqUSv
         ZkqW00yUPNe3/Uno2xQh4lQ4ZXzZhCAHUrscKV4pTg5R7Q0wHrhLU3rJg+0AylNS2x
         JFBn7QV9h7uK1vdOBgZtfqDvh8Y0KDuu/PDMx8bEI0zxl3iompMVF+43e4Y1f66VxT
         mJljUgBQpMw4g==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 3A4B8A00D4;
        Tue, 17 Dec 2019 01:46:32 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 16 Dec 2019 17:46:31 -0800
Date:   Mon, 16 Dec 2019 17:46:31 -0800
Message-Id: <40972b3c729d6ce8844abed743b1284066148d39.1576546936.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576546936.git.thinhn@synopsys.com>
References: <cover.1576546936.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 2/3] usb: dwc3: gadget: Delay starting transfer
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

