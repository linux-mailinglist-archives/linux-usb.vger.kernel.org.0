Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABE1183372
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2020 15:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgCLOnD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Mar 2020 10:43:03 -0400
Received: from mga09.intel.com ([134.134.136.24]:50332 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727766AbgCLOnC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Mar 2020 10:43:02 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 07:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; 
   d="scan'208";a="443955797"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga006.fm.intel.com with ESMTP; 12 Mar 2020 07:43:01 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/9] xhci: Show host status when watchdog triggers and host is assumed dead.
Date:   Thu, 12 Mar 2020 16:45:11 +0200
Message-Id: <20200312144517.1593-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200312144517.1593-1-mathias.nyman@linux.intel.com>
References: <20200312144517.1593-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Additional debugging to show xHC USBSTS register when stop endpoint
command watchdog triggers and host is assumed dead.

useful to know the current status before the controller is stopped by
the xhci driver and everything is released and freed.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c |  4 ++++
 drivers/usb/host/xhci.h      | 29 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index efcddc0c0991..ba512b25901a 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -955,6 +955,7 @@ void xhci_stop_endpoint_command_watchdog(struct timer_list *t)
 	struct xhci_virt_ep *ep = from_timer(ep, t, stop_cmd_timer);
 	struct xhci_hcd *xhci = ep->xhci;
 	unsigned long flags;
+	u32 usbsts;
 
 	spin_lock_irqsave(&xhci->lock, flags);
 
@@ -965,8 +966,11 @@ void xhci_stop_endpoint_command_watchdog(struct timer_list *t)
 		xhci_dbg(xhci, "Stop EP timer raced with cmd completion, exit");
 		return;
 	}
+	usbsts = readl(&xhci->op_regs->status);
 
 	xhci_warn(xhci, "xHCI host not responding to stop endpoint command.\n");
+	xhci_warn(xhci, "USBSTS:%s\n", xhci_decode_usbsts(usbsts));
+
 	ep->ep_state &= ~EP_STOP_CMD_PENDING;
 
 	xhci_halt(xhci);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 3ecee10fdcdc..d74f1be26a58 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2589,6 +2589,35 @@ static inline const char *xhci_decode_portsc(u32 portsc)
 	return str;
 }
 
+static inline const char *xhci_decode_usbsts(u32 usbsts)
+{
+	static char str[256];
+	int ret = 0;
+
+	if (usbsts == ~(u32)0)
+		return " 0xffffffff";
+	if (usbsts & STS_HALT)
+		ret += sprintf(str + ret, " HCHalted");
+	if (usbsts & STS_FATAL)
+		ret += sprintf(str + ret, " HSE");
+	if (usbsts & STS_EINT)
+		ret += sprintf(str + ret, " EINT");
+	if (usbsts & STS_PORT)
+		ret += sprintf(str + ret, " PCD");
+	if (usbsts & STS_SAVE)
+		ret += sprintf(str + ret, " SSS");
+	if (usbsts & STS_RESTORE)
+		ret += sprintf(str + ret, " RSS");
+	if (usbsts & STS_SRE)
+		ret += sprintf(str + ret, " SRE");
+	if (usbsts & STS_CNR)
+		ret += sprintf(str + ret, " CNR");
+	if (usbsts & STS_HCE)
+		ret += sprintf(str + ret, " HCE");
+
+	return str;
+}
+
 static inline const char *xhci_decode_doorbell(u32 slot, u32 doorbell)
 {
 	static char str[256];
-- 
2.17.1

