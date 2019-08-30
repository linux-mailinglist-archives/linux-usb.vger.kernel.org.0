Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D24BA37DF
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2019 15:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbfH3Nho (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Aug 2019 09:37:44 -0400
Received: from mga12.intel.com ([192.55.52.136]:23363 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727904AbfH3Nhn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Aug 2019 09:37:43 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Aug 2019 06:37:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,447,1559545200"; 
   d="scan'208";a="332860301"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga004.jf.intel.com with ESMTP; 30 Aug 2019 06:37:41 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>, Ikjoon Jang <ikjn@chromium.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 4/4] xhci: fix possible memleak on setup address fails.
Date:   Fri, 30 Aug 2019 16:39:16 +0300
Message-Id: <1567172356-12915-5-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567172356-12915-1-git-send-email-mathias.nyman@linux.intel.com>
References: <1567172356-12915-1-git-send-email-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ikjoon Jang <ikjn@chromium.org>

Xhci re-enables a slot on transaction error in set_address using
xhci_disable_slot() + xhci_alloc_dev().

But in this case, xhci_alloc_dev() creates debugfs entries upon an
existing device without cleaning up old entries, thus memory leaks.

So this patch simply moves calling xhci_debugfs_free_dev() from
xhci_free_dev() to xhci_disable_slot().

[added "possible" to header as this is about failure codepath -Mathias]
Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e315c0158e90..500865975687 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3814,7 +3814,6 @@ static void xhci_free_dev(struct usb_hcd *hcd, struct usb_device *udev)
 		virt_dev->eps[i].ep_state &= ~EP_STOP_CMD_PENDING;
 		del_timer_sync(&virt_dev->eps[i].stop_cmd_timer);
 	}
-	xhci_debugfs_remove_slot(xhci, udev->slot_id);
 	virt_dev->udev = NULL;
 	ret = xhci_disable_slot(xhci, udev->slot_id);
 	if (ret)
@@ -3832,6 +3831,8 @@ int xhci_disable_slot(struct xhci_hcd *xhci, u32 slot_id)
 	if (!command)
 		return -ENOMEM;
 
+	xhci_debugfs_remove_slot(xhci, slot_id);
+
 	spin_lock_irqsave(&xhci->lock, flags);
 	/* Don't disable the slot if the host controller is dead. */
 	state = readl(&xhci->op_regs->status);
-- 
2.7.4

