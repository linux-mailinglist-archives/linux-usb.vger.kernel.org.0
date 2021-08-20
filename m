Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9E33F2C21
	for <lists+linux-usb@lfdr.de>; Fri, 20 Aug 2021 14:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240394AbhHTMdY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Aug 2021 08:33:24 -0400
Received: from mga03.intel.com ([134.134.136.65]:32166 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240416AbhHTMdX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Aug 2021 08:33:23 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="216799531"
X-IronPort-AV: E=Sophos;i="5.84,337,1620716400"; 
   d="scan'208";a="216799531"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2021 05:32:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,337,1620716400"; 
   d="scan'208";a="680077977"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga006.fm.intel.com with ESMTP; 20 Aug 2021 05:32:44 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 6/6] xhci: Add bus number to some debug messages
Date:   Fri, 20 Aug 2021 15:35:03 +0300
Message-Id: <20210820123503.2605901-7-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820123503.2605901-1-mathias.nyman@linux.intel.com>
References: <20210820123503.2605901-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As we register two usb buses for each xHC, and systems with several
hosts are more and more common it is getting hard to follow the
flow of debug messages without knowing which bus they belong to

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c  | 6 ++++--
 drivers/usb/host/xhci-ring.c | 3 ++-
 drivers/usb/host/xhci.c      | 6 ++++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 151e93c4bd57..a3f875eea751 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1667,7 +1667,8 @@ int xhci_hub_status_data(struct usb_hcd *hcd, char *buf)
 			status = 1;
 	}
 	if (!status && !reset_change) {
-		xhci_dbg(xhci, "%s: stopping port polling.\n", __func__);
+		xhci_dbg(xhci, "%s: stopping usb%d port polling\n",
+			 __func__, hcd->self.busnum);
 		clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	}
 	spin_unlock_irqrestore(&xhci->lock, flags);
@@ -1699,7 +1700,8 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 		if (bus_state->resuming_ports ||	/* USB2 */
 		    bus_state->port_remote_wakeup) {	/* USB3 */
 			spin_unlock_irqrestore(&xhci->lock, flags);
-			xhci_dbg(xhci, "suspend failed because a port is resuming\n");
+			xhci_dbg(xhci, "usb%d bus suspend to fail because a port is resuming\n",
+				 hcd->self.busnum);
 			return -EBUSY;
 		}
 	}
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 8be4ba3758b1..e676749f543b 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2031,7 +2031,8 @@ static void handle_port_status(struct xhci_hcd *xhci,
 	 * bits are still set.  When an event occurs, switch over to
 	 * polling to avoid losing status changes.
 	 */
-	xhci_dbg(xhci, "%s: starting port polling.\n", __func__);
+	xhci_dbg(xhci, "%s: starting usb%d port polling.\n",
+		 __func__, hcd->self.busnum);
 	set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	spin_unlock(&xhci->lock);
 	/* Pass this up to the core */
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 18a203c9011e..f3dabd02382c 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -993,7 +993,8 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 	xhci_dbc_suspend(xhci);
 
 	/* Don't poll the roothubs on bus suspend. */
-	xhci_dbg(xhci, "%s: stopping port polling.\n", __func__);
+	xhci_dbg(xhci, "%s: stopping usb%d port polling.\n",
+		 __func__, hcd->self.busnum);
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	del_timer_sync(&hcd->rh_timer);
 	clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
@@ -1257,7 +1258,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		usb_asmedia_modifyflowcontrol(to_pci_dev(hcd->self.controller));
 
 	/* Re-enable port polling. */
-	xhci_dbg(xhci, "%s: starting port polling.\n", __func__);
+	xhci_dbg(xhci, "%s: starting usb%d port polling.\n",
+		 __func__, hcd->self.busnum);
 	set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
 	usb_hcd_poll_rh_status(xhci->shared_hcd);
 	set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
-- 
2.25.1

