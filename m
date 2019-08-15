Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6AF8EFCC
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 17:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbfHOPvC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 15 Aug 2019 11:51:02 -0400
Received: from us-smtp-delivery-131.mimecast.com ([63.128.21.131]:56038 "EHLO
        us-smtp-delivery-131.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726008AbfHOPvC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Aug 2019 11:51:02 -0400
Received: from mailhub4.stratus.com (134.111.1.17 [134.111.1.17]) by
 relay.mimecast.com with ESMTP id us-mta-13-1pp4TEQpP4-kzb87p5zsnA-1; Thu,
 15 Aug 2019 11:49:55 -0400
Received: from EXHQ1.corp.stratus.com (exhq1.corp.stratus.com [134.111.200.125])
        by mailhub4.stratus.com (8.12.11/8.12.11) with ESMTP id x7FFnt2A020349
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2019 11:49:55 -0400
Received: from linuxdev.lnx.eng.stratus.com (134.111.220.63) by
 EXHQ1.corp.stratus.com (134.111.200.125) with Microsoft SMTP Server (TLS) id
 14.3.279.2; Thu, 15 Aug 2019 11:49:39 -0400
From:   Bill Kuzeja <William.Kuzeja@stratus.com>
To:     <linux-usb@vger.kernel.org>, <William.Kuzeja@stratus.com>
Subject: [PATCH RESEND] xhci: Prevent deadlock when xhci adapter breaks during init
Date:   Thu, 15 Aug 2019 11:49:54 -0400
Message-ID: <1565884194-11149-1-git-send-email-William.Kuzeja@stratus.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MC-Unique: 1pp4TEQpP4-kzb87p5zsnA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The system can hit a deadlock if xhci adapter breaks while initializing. 
The deadlock is between two threads: thread 1 is tearing down the 
adapter and is stuck in usb_unlocked_disable_lpm waiting to lock the 
hcd->handwidth_mutex. Thread 2 is holding this mutex (while still trying 
to add a usb device), but is stuck in xhci_endpoint_reset waiting for a 
stop or config command to complete. A reboot is required to resolve. 

It turns out when calling xhci_queue_stop_endpoint and 
xhci_queue_configure_endpoint in xhci_endpoint_reset, the return code is
not checked for errors. If the timing is right and the adapter dies just
before either of these commands get issued, we hang indefinitely waiting 
for a completion on a command that didn't get issued.

This wasn't a problem before the following fix because we didn't send 
commands in xhci_endpoint_reset:

commit f5249461b504 ("xhci: Clear the host side toggle manually when endpoint is soft reset")

With the patch I am submitting, a duration test which breaks adapters 
during initialization (and which deadlocks with the standard kernel) runs 
without issue.

Fixes: f5249461b504 ("xhci: Clear the host side toggle manually when endpoint is soft reset")
Signed-off-by: Bill Kuzeja <william.kuzeja@stratus.com>
---
 drivers/usb/host/xhci.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 248cd7a..835708d 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3132,7 +3132,16 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 		xhci_free_command(xhci, cfg_cmd);
 		goto cleanup;
 	}
-	xhci_queue_stop_endpoint(xhci, stop_cmd, udev->slot_id, ep_index, 0);
+
+	if (xhci_queue_stop_endpoint(xhci, stop_cmd, udev->slot_id,
+					ep_index, 0) < 0) {
+		spin_unlock_irqrestore(&xhci->lock, flags);
+		xhci_free_command(xhci, cfg_cmd);
+		xhci_warn(xhci, "%s: stop_cmd xhci_queue_stop_endpoint "
+				"returns error, exiting\n", __func__);
+		goto cleanup;
+	}
+
 	xhci_ring_cmd_db(xhci);
 	spin_unlock_irqrestore(&xhci->lock, flags);
 
@@ -3146,8 +3155,15 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 					   ctrl_ctx, ep_flag, ep_flag);
 	xhci_endpoint_copy(xhci, cfg_cmd->in_ctx, vdev->out_ctx, ep_index);
 
-	xhci_queue_configure_endpoint(xhci, cfg_cmd, cfg_cmd->in_ctx->dma,
-				      udev->slot_id, false);
+	if (xhci_queue_configure_endpoint(xhci, cfg_cmd, cfg_cmd->in_ctx->dma,
+				      udev->slot_id, false) < 0) {
+		spin_unlock_irqrestore(&xhci->lock, flags);
+		xhci_free_command(xhci, cfg_cmd);
+		xhci_warn(xhci, "%s: cfg_cmd xhci_queue_configure_endpoint "
+				"returns error, exiting\n", __func__);
+		goto cleanup;
+	}
+
 	xhci_ring_cmd_db(xhci);
 	spin_unlock_irqrestore(&xhci->lock, flags);
 
-- 
1.8.3.1

