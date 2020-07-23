Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA6F22B1A7
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728873AbgGWOms (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:48 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgGWOmr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:47 -0400
IronPort-SDR: BM0/6T6AcsAlgTdgKchu2hYgufVgg7dJQwAxS63pTu23BBJh78PV8SugJYtztOqEhU312skTkB
 RAlZHbxh1PGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607456"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607456"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:47 -0700
IronPort-SDR: OazlnkZCLIHRwBaa3/pddOPUZXbreAeoSAeJ+UjXJ9kH/ybcRamqImlS4hQ3lcIDWyuZaJKgLp
 5aaJ5s9OKcbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672447"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:45 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 17/27] xhci: dbc: Use dbc structure in the request completion instead of xhci_hcd
Date:   Thu, 23 Jul 2020 17:45:20 +0300
Message-Id: <20200723144530.9992-18-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The dbc request completion callback doesn't need a xhci_hcd pointer.
The only user of the xhci_hcd pointer in dbgtty request callback was
the xhci_warn() function. Change it to dev_warn() instead.

While changing the callback function parameter to dbc in struct
xhci_requeset, move the struct xhci_request declaraion down a bit in the
header file to avoid compiler warinings

No functional changes
This change helps decoupling xhci and DbC

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c |  5 ++---
 drivers/usb/host/xhci-dbgcap.h | 34 +++++++++++++++++-----------------
 drivers/usb/host/xhci-dbgtty.c | 10 ++++------
 3 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 26e693dd7414..2473100b955a 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -114,8 +114,7 @@ static void xhci_dbc_giveback(struct dbc_request *req, int status)
 {
 	struct dbc_ep		*dep = req->dep;
 	struct xhci_dbc		*dbc = dep->dbc;
-	struct xhci_hcd		*xhci = dbc->xhci;
-	struct device		*dev = xhci_to_hcd(dbc->xhci)->self.sysdev;
+	struct device		*dev = dbc->dev;
 
 	list_del_init(&req->list_pending);
 	req->trb_dma = 0;
@@ -133,7 +132,7 @@ static void xhci_dbc_giveback(struct dbc_request *req, int status)
 
 	/* Give back the transfer request: */
 	spin_unlock(&dbc->lock);
-	req->complete(xhci, req);
+	req->complete(dbc, req);
 	spin_lock(&dbc->lock);
 }
 
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index dc7d2d157e7b..9e3c5940f27b 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -84,23 +84,6 @@ enum dbc_state {
 	DS_STALLED,
 };
 
-struct dbc_request {
-	void				*buf;
-	unsigned int			length;
-	dma_addr_t			dma;
-	void				(*complete)(struct xhci_hcd *xhci,
-						    struct dbc_request *req);
-	struct list_head		list_pool;
-	int				status;
-	unsigned int			actual;
-
-	struct dbc_ep			*dep;
-	struct list_head		list_pending;
-	dma_addr_t			trb_dma;
-	union xhci_trb			*trb;
-	unsigned			direction:1;
-};
-
 struct dbc_ep {
 	struct xhci_dbc			*dbc;
 	struct list_head		list_pending;
@@ -154,6 +137,23 @@ struct xhci_dbc {
 	struct dbc_port			port;
 };
 
+struct dbc_request {
+	void				*buf;
+	unsigned int			length;
+	dma_addr_t			dma;
+	void				(*complete)(struct xhci_dbc *dbc,
+						    struct dbc_request *req);
+	struct list_head		list_pool;
+	int				status;
+	unsigned int			actual;
+
+	struct dbc_ep			*dep;
+	struct list_head		list_pending;
+	dma_addr_t			trb_dma;
+	union xhci_trb			*trb;
+	unsigned			direction:1;
+};
+
 #define dbc_bulkout_ctx(d)		\
 	((struct xhci_ep_ctx *)((d)->ctx->bytes + DBC_CONTEXT_SIZE))
 #define dbc_bulkin_ctx(d)		\
diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 0ef48862f4a7..967f0419dad7 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -91,10 +91,9 @@ static void dbc_start_rx(struct dbc_port *port)
 }
 
 static void
-dbc_read_complete(struct xhci_hcd *xhci, struct dbc_request *req)
+dbc_read_complete(struct xhci_dbc *dbc, struct dbc_request *req)
 {
 	unsigned long		flags;
-	struct xhci_dbc		*dbc = xhci->dbc;
 	struct dbc_port		*port = &dbc->port;
 
 	spin_lock_irqsave(&port->port_lock, flags);
@@ -103,10 +102,9 @@ dbc_read_complete(struct xhci_hcd *xhci, struct dbc_request *req)
 	spin_unlock_irqrestore(&port->port_lock, flags);
 }
 
-static void dbc_write_complete(struct xhci_hcd *xhci, struct dbc_request *req)
+static void dbc_write_complete(struct xhci_dbc *dbc, struct dbc_request *req)
 {
 	unsigned long		flags;
-	struct xhci_dbc		*dbc = xhci->dbc;
 	struct dbc_port		*port = &dbc->port;
 
 	spin_lock_irqsave(&port->port_lock, flags);
@@ -118,7 +116,7 @@ static void dbc_write_complete(struct xhci_hcd *xhci, struct dbc_request *req)
 	case -ESHUTDOWN:
 		break;
 	default:
-		xhci_warn(xhci, "unexpected write complete status %d\n",
+		dev_warn(dbc->dev, "unexpected write complete status %d\n",
 			  req->status);
 		break;
 	}
@@ -133,7 +131,7 @@ static void xhci_dbc_free_req(struct dbc_ep *dep, struct dbc_request *req)
 
 static int
 xhci_dbc_alloc_requests(struct dbc_ep *dep, struct list_head *head,
-			void (*fn)(struct xhci_hcd *, struct dbc_request *))
+			void (*fn)(struct xhci_dbc *, struct dbc_request *))
 {
 	int			i;
 	struct dbc_request	*req;
-- 
2.17.1

