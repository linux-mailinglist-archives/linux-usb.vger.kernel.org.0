Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D47A31CC52
	for <lists+linux-usb@lfdr.de>; Tue, 16 Feb 2021 15:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbhBPOru (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Feb 2021 09:47:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:36896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230186AbhBPOrj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Feb 2021 09:47:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42C4364E07;
        Tue, 16 Feb 2021 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613486819;
        bh=zmn614JYtoyUSsnbtbv/zyWvVIMu+sq0svOUWahtZ78=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O2CiQRx3M4H7477TdblHZicJ2o7E//l4JcfToUPRluCndks033NdMgF4aAm5R6b2A
         bKbQJm7+Rpb3mwlcNE4+vGXafi9YlLm7l6XnDACzsjEtIwqsJDz8P87GySbqLyYS3B
         90r40Wuxn1y0dfMxlrXSZFwg/f67blpiHUIV781Y=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH 4/6] USB: host: uhci: remove dentry pointer for debugfs
Date:   Tue, 16 Feb 2021 15:46:43 +0100
Message-Id: <20210216144645.3813043-4-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210216144645.3813043-1-gregkh@linuxfoundation.org>
References: <20210216144645.3813043-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need to keep the dentry pointer around for the created
debugfs file, as it is only needed when removing it from the system.
When it is to be removed, ask debugfs itself for the pointer, to save on
storage and make things a bit simpler.

And, no one noticed that a __maybe_unused dentry * in uhci_start()
really was unused, so remove that as it's obviously not needed, and
hasn't been for quite some time.

Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/host/uhci-hcd.c | 12 +++++-------
 drivers/usb/host/uhci-hcd.h |  4 ----
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/uhci-hcd.c b/drivers/usb/host/uhci-hcd.c
index 03bc59755123..d90b869f5f40 100644
--- a/drivers/usb/host/uhci-hcd.c
+++ b/drivers/usb/host/uhci-hcd.c
@@ -536,7 +536,8 @@ static void release_uhci(struct uhci_hcd *uhci)
 	uhci->is_initialized = 0;
 	spin_unlock_irq(&uhci->lock);
 
-	debugfs_remove(uhci->dentry);
+	debugfs_remove(debugfs_lookup(uhci_to_hcd(uhci)->self.bus_name,
+				      uhci_debugfs_root));
 
 	for (i = 0; i < UHCI_NUM_SKELQH; i++)
 		uhci_free_qh(uhci, uhci->skelqh[i]);
@@ -577,7 +578,6 @@ static int uhci_start(struct usb_hcd *hcd)
 	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
 	int retval = -EBUSY;
 	int i;
-	struct dentry __maybe_unused *dentry;
 
 	hcd->uses_new_polling = 1;
 	/* Accept arbitrarily long scatter-gather lists */
@@ -590,10 +590,8 @@ static int uhci_start(struct usb_hcd *hcd)
 	init_waitqueue_head(&uhci->waitqh);
 
 #ifdef UHCI_DEBUG_OPS
-	uhci->dentry = debugfs_create_file(hcd->self.bus_name,
-					   S_IFREG|S_IRUGO|S_IWUSR,
-					   uhci_debugfs_root, uhci,
-					   &uhci_debug_operations);
+	debugfs_create_file(hcd->self.bus_name, S_IFREG|S_IRUGO|S_IWUSR,
+			    uhci_debugfs_root, uhci, &uhci_debug_operations);
 #endif
 
 	uhci->frame = dma_alloc_coherent(uhci_dev(uhci),
@@ -702,7 +700,7 @@ static int uhci_start(struct usb_hcd *hcd)
 			uhci->frame, uhci->frame_dma_handle);
 
 err_alloc_frame:
-	debugfs_remove(uhci->dentry);
+	debugfs_remove(debugfs_lookup(hcd->self.bus_name, uhci_debugfs_root));
 
 	return retval;
 }
diff --git a/drivers/usb/host/uhci-hcd.h b/drivers/usb/host/uhci-hcd.h
index 7f9f33c8c232..8ae5ccd26753 100644
--- a/drivers/usb/host/uhci-hcd.h
+++ b/drivers/usb/host/uhci-hcd.h
@@ -381,10 +381,6 @@ enum uhci_rh_state {
  * The full UHCI controller information:
  */
 struct uhci_hcd {
-
-	/* debugfs */
-	struct dentry *dentry;
-
 	/* Grabbed from PCI */
 	unsigned long io_addr;
 
-- 
2.30.1

