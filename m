Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D36522B19E
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728772AbgGWOmg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:36 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgGWOmg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:36 -0400
IronPort-SDR: i5U7WxRpOna5NG6mO09MaY80WvX3g4dSTzmfCVhJBzF7uUSPwATYWaeEhnoo6rg/jSFhNc6o9l
 8gjJqqq28U+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607405"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607405"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:35 -0700
IronPort-SDR: iHguRDZHkZG4a118x8vEujj6SxUdVa/j3623/somihEbRJPdcCdUHL6KG7SC2I+OEyLVr3d+1h
 F/+L6uqt7bIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672389"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:33 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 08/27] xhci: dbc: Use dev_info() and similar instead of xhci_info()
Date:   Thu, 23 Jul 2020 17:45:11 +0300
Message-Id: <20200723144530.9992-9-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To make this change possible we also need to change
dbc_handle_port_status() to take dbc pointer as parameter instead of
xhci_hcd pointer.

Note that xhci_info() used xhci_to_hcd(xhci)->self.controller as the
device while for dev_info we use xhci_to_hcd(xhci)->self.sysdev.

In many cases those are the same, but not for some device where
a dwc3 controller creates a xhci platform device. In th this case
self.controller may be the platform device while self.sysdev is
the actual device known to firmware (dwc3).

This change helps decoupling xhci and DbC

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 42 +++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index ae584d6ae10c..3375be7ea642 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -286,13 +286,13 @@ dbc_ep_do_queue(struct dbc_ep *dep, struct dbc_request *req)
 				  req->length,
 				  dbc_ep_dma_direction(dep));
 	if (dma_mapping_error(dev, req->dma)) {
-		xhci_err(xhci, "failed to map buffer\n");
+		dev_err(dbc->dev, "failed to map buffer\n");
 		return -EFAULT;
 	}
 
 	ret = xhci_dbc_queue_bulk_tx(dep, req);
 	if (ret) {
-		xhci_err(xhci, "failed to queue trbs\n");
+		dev_err(dbc->dev, "failed to queue trbs\n");
 		dma_unmap_single(dev,
 				 req->dma,
 				 req->length,
@@ -567,23 +567,22 @@ static void xhci_dbc_stop(struct xhci_hcd *xhci)
 }
 
 static void
-dbc_handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
+dbc_handle_port_status(struct xhci_dbc *dbc, union xhci_trb *event)
 {
 	u32			portsc;
-	struct xhci_dbc		*dbc = xhci->dbc;
 
 	portsc = readl(&dbc->regs->portsc);
 	if (portsc & DBC_PORTSC_CONN_CHANGE)
-		xhci_info(xhci, "DbC port connect change\n");
+		dev_info(dbc->dev, "DbC port connect change\n");
 
 	if (portsc & DBC_PORTSC_RESET_CHANGE)
-		xhci_info(xhci, "DbC port reset change\n");
+		dev_info(dbc->dev, "DbC port reset change\n");
 
 	if (portsc & DBC_PORTSC_LINK_CHANGE)
-		xhci_info(xhci, "DbC port link status change\n");
+		dev_info(dbc->dev, "DbC port link status change\n");
 
 	if (portsc & DBC_PORTSC_CONFIG_CHANGE)
-		xhci_info(xhci, "DbC config error change\n");
+		dev_info(dbc->dev, "DbC config error change\n");
 
 	/* Port reset change bit will be cleared in other place: */
 	writel(portsc & ~DBC_PORTSC_RESET_CHANGE, &dbc->regs->portsc);
@@ -598,6 +597,7 @@ static void dbc_handle_xfer_event(struct xhci_hcd *xhci, union xhci_trb *event)
 	u32			comp_code;
 	size_t			remain_length;
 	struct dbc_request	*req = NULL, *r;
+	struct xhci_dbc		*dbc = xhci->dbc;
 
 	comp_code	= GET_COMP_CODE(le32_to_cpu(event->generic.field[2]));
 	remain_length	= EVENT_TRB_LEN(le32_to_cpu(event->generic.field[2]));
@@ -617,11 +617,11 @@ static void dbc_handle_xfer_event(struct xhci_hcd *xhci, union xhci_trb *event)
 	case COMP_BABBLE_DETECTED_ERROR:
 	case COMP_USB_TRANSACTION_ERROR:
 	case COMP_STALL_ERROR:
-		xhci_warn(xhci, "tx error %d detected\n", comp_code);
+		dev_warn(dbc->dev, "tx error %d detected\n", comp_code);
 		status = -comp_code;
 		break;
 	default:
-		xhci_err(xhci, "unknown tx error %d\n", comp_code);
+		dev_err(dbc->dev, "unknown tx error %d\n", comp_code);
 		status = -comp_code;
 		break;
 	}
@@ -635,7 +635,7 @@ static void dbc_handle_xfer_event(struct xhci_hcd *xhci, union xhci_trb *event)
 	}
 
 	if (!req) {
-		xhci_warn(xhci, "no matched request\n");
+		dev_warn(dbc->dev, "no matched request\n");
 		return;
 	}
 
@@ -676,7 +676,7 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 		portsc = readl(&dbc->regs->portsc);
 		if (portsc & DBC_PORTSC_CONN_STATUS) {
 			dbc->state = DS_CONNECTED;
-			xhci_info(xhci, "DbC connected\n");
+			dev_info(dbc->dev, "DbC connected\n");
 		}
 
 		return EVT_DONE;
@@ -684,7 +684,7 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 		ctrl = readl(&dbc->regs->control);
 		if (ctrl & DBC_CTRL_DBC_RUN) {
 			dbc->state = DS_CONFIGURED;
-			xhci_info(xhci, "DbC configured\n");
+			dev_info(dbc->dev, "DbC configured\n");
 			portsc = readl(&dbc->regs->portsc);
 			writel(portsc, &dbc->regs->portsc);
 			return EVT_GSER;
@@ -696,7 +696,7 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 		portsc = readl(&dbc->regs->portsc);
 		if (!(portsc & DBC_PORTSC_PORT_ENABLED) &&
 		    !(portsc & DBC_PORTSC_CONN_STATUS)) {
-			xhci_info(xhci, "DbC cable unplugged\n");
+			dev_info(dbc->dev, "DbC cable unplugged\n");
 			dbc->state = DS_ENABLED;
 			xhci_dbc_flush_requests(dbc);
 
@@ -705,7 +705,7 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 
 		/* Handle debug port reset event: */
 		if (portsc & DBC_PORTSC_RESET_CHANGE) {
-			xhci_info(xhci, "DbC port reset\n");
+			dev_info(dbc->dev, "DbC port reset\n");
 			writel(portsc, &dbc->regs->portsc);
 			dbc->state = DS_ENABLED;
 			xhci_dbc_flush_requests(dbc);
@@ -717,7 +717,7 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 		ctrl = readl(&dbc->regs->control);
 		if ((ctrl & DBC_CTRL_HALT_IN_TR) ||
 		    (ctrl & DBC_CTRL_HALT_OUT_TR)) {
-			xhci_info(xhci, "DbC Endpoint stall\n");
+			dev_info(dbc->dev, "DbC Endpoint stall\n");
 			dbc->state = DS_STALLED;
 
 			if (ctrl & DBC_CTRL_HALT_IN_TR) {
@@ -751,7 +751,7 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 
 		return EVT_DONE;
 	default:
-		xhci_err(xhci, "Unknown DbC state %d\n", dbc->state);
+		dev_err(dbc->dev, "Unknown DbC state %d\n", dbc->state);
 		break;
 	}
 
@@ -769,7 +769,7 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 
 		switch (le32_to_cpu(evt->event_cmd.flags) & TRB_TYPE_BITMASK) {
 		case TRB_TYPE(TRB_PORT_STATUS):
-			dbc_handle_port_status(xhci, evt);
+			dbc_handle_port_status(dbc, evt);
 			break;
 		case TRB_TYPE(TRB_TRANSFER):
 			dbc_handle_xfer_event(xhci, evt);
@@ -813,11 +813,11 @@ static void xhci_dbc_handle_events(struct work_struct *work)
 	case EVT_GSER:
 		ret = xhci_dbc_tty_register_device(xhci);
 		if (ret) {
-			xhci_err(xhci, "failed to alloc tty device\n");
+			dev_err(dbc->dev, "failed to alloc tty device\n");
 			break;
 		}
 
-		xhci_info(xhci, "DbC now attached to /dev/ttyDBC0\n");
+		dev_info(dbc->dev, "DbC now attached to /dev/ttyDBC0\n");
 		break;
 	case EVT_DISC:
 		xhci_dbc_tty_unregister_device(xhci);
@@ -825,7 +825,7 @@ static void xhci_dbc_handle_events(struct work_struct *work)
 	case EVT_DONE:
 		break;
 	default:
-		xhci_info(xhci, "stop handling dbc events\n");
+		dev_info(dbc->dev, "stop handling dbc events\n");
 		return;
 	}
 
-- 
2.17.1

