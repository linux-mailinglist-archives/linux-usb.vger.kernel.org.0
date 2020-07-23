Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6455422B1AC
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729144AbgGWOm4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:56 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgGWOmz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:55 -0400
IronPort-SDR: RMCLQwgDL7pSsX5Ooapa4VvYghxPFFgg+V7soDINXEGGQotJduMjia4M1zT+Z3Ur8WzjZ9fDjt
 l42RIuOnCC3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607482"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607482"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:54 -0700
IronPort-SDR: 9qR0FihDZLG3oo3OMAcAMTEVtuRFNAJ9+AuKG5LTFMNWbISAiLjmfhBFINgjTr0/q7RjTSu0pZ
 0xVnLWgmhdoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672485"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:52 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 22/27] xhci: dbc: simplify dbc requests allocation and queueing
Date:   Thu, 23 Jul 2020 17:45:25 +0300
Message-Id: <20200723144530.9992-23-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Don't pass endpoint pointer, dbctty should not be aware of
struct dbc_ep, knowing the direction is enough.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 43 ++++++++++++++++++++++------------
 drivers/usb/host/xhci-dbgcap.h | 12 ++++++----
 drivers/usb/host/xhci-dbgtty.c | 33 +++++++++++++-------------
 3 files changed, 52 insertions(+), 36 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index af6e3622e53a..e3eec628edb5 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -135,8 +135,7 @@ static void xhci_dbc_giveback(struct dbc_request *req, int status)
 	__releases(&dbc->lock)
 	__acquires(&dbc->lock)
 {
-	struct dbc_ep		*dep = req->dep;
-	struct xhci_dbc		*dbc = dep->dbc;
+	struct xhci_dbc		*dbc = req->dbc;
 	struct device		*dev = dbc->dev;
 
 	list_del_init(&req->list_pending);
@@ -151,7 +150,7 @@ static void xhci_dbc_giveback(struct dbc_request *req, int status)
 	dma_unmap_single(dev,
 			 req->dma,
 			 req->length,
-			 dbc_ep_dma_direction(dep));
+			 dbc_ep_dma_direction(req));
 
 	/* Give back the transfer request: */
 	spin_unlock(&dbc->lock);
@@ -187,18 +186,25 @@ static void xhci_dbc_flush_requests(struct xhci_dbc *dbc)
 }
 
 struct dbc_request *
-dbc_alloc_request(struct dbc_ep *dep, gfp_t gfp_flags)
+dbc_alloc_request(struct xhci_dbc *dbc, unsigned int direction, gfp_t flags)
 {
 	struct dbc_request	*req;
 
-	req = kzalloc(sizeof(*req), gfp_flags);
+	if (direction != BULK_IN &&
+	    direction != BULK_OUT)
+		return NULL;
+
+	if (!dbc)
+		return NULL;
+
+	req = kzalloc(sizeof(*req), flags);
 	if (!req)
 		return NULL;
 
-	req->dep = dep;
+	req->dbc = dbc;
 	INIT_LIST_HEAD(&req->list_pending);
 	INIT_LIST_HEAD(&req->list_pool);
-	req->direction = dep->direction;
+	req->direction = direction;
 
 	trace_xhci_dbc_alloc_request(req);
 
@@ -206,7 +212,7 @@ dbc_alloc_request(struct dbc_ep *dep, gfp_t gfp_flags)
 }
 
 void
-dbc_free_request(struct dbc_ep *dep, struct dbc_request *req)
+dbc_free_request(struct dbc_request *req)
 {
 	trace_xhci_dbc_free_request(req);
 
@@ -242,7 +248,7 @@ static int xhci_dbc_queue_bulk_tx(struct dbc_ep *dep,
 	u64			addr;
 	union xhci_trb		*trb;
 	unsigned int		num_trbs;
-	struct xhci_dbc		*dbc = dep->dbc;
+	struct xhci_dbc		*dbc = req->dbc;
 	struct xhci_ring	*ring = dep->ring;
 	u32			length, control, cycle;
 
@@ -286,11 +292,12 @@ static int xhci_dbc_queue_bulk_tx(struct dbc_ep *dep,
 }
 
 static int
-dbc_ep_do_queue(struct dbc_ep *dep, struct dbc_request *req)
+dbc_ep_do_queue(struct dbc_request *req)
 {
 	int			ret;
-	struct xhci_dbc		*dbc = dep->dbc;
+	struct xhci_dbc		*dbc = req->dbc;
 	struct device		*dev = dbc->dev;
+	struct dbc_ep		*dep = &dbc->eps[req->direction];
 
 	if (!req->length || !req->buf)
 		return -EINVAL;
@@ -322,16 +329,22 @@ dbc_ep_do_queue(struct dbc_ep *dep, struct dbc_request *req)
 	return 0;
 }
 
-int dbc_ep_queue(struct dbc_ep *dep, struct dbc_request *req,
-		 gfp_t gfp_flags)
+int dbc_ep_queue(struct dbc_request *req)
 {
 	unsigned long		flags;
-	struct xhci_dbc		*dbc = dep->dbc;
+	struct xhci_dbc		*dbc = req->dbc;
 	int			ret = -ESHUTDOWN;
 
+	if (!dbc)
+		return -ENODEV;
+
+	if (req->direction != BULK_IN &&
+	    req->direction != BULK_OUT)
+		return -EINVAL;
+
 	spin_lock_irqsave(&dbc->lock, flags);
 	if (dbc->state == DS_CONFIGURED)
-		ret = dbc_ep_do_queue(dep, req);
+		ret = dbc_ep_do_queue(req);
 	spin_unlock_irqrestore(&dbc->lock, flags);
 
 	mod_delayed_work(system_wq, &dbc->event_work, 0);
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index 9e3c5940f27b..fe360cf712c1 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -88,7 +88,7 @@ struct dbc_ep {
 	struct xhci_dbc			*dbc;
 	struct list_head		list_pending;
 	struct xhci_ring		*ring;
-	unsigned			direction:1;
+	unsigned int			direction:1;
 };
 
 #define DBC_QUEUE_SIZE			16
@@ -147,7 +147,7 @@ struct dbc_request {
 	int				status;
 	unsigned int			actual;
 
-	struct dbc_ep			*dep;
+	struct xhci_dbc			*dbc;
 	struct list_head		list_pending;
 	dma_addr_t			trb_dma;
 	union xhci_trb			*trb;
@@ -196,9 +196,11 @@ int xhci_dbc_tty_register_driver(struct xhci_hcd *xhci);
 void xhci_dbc_tty_unregister_driver(void);
 int xhci_dbc_tty_register_device(struct xhci_dbc *dbc);
 void xhci_dbc_tty_unregister_device(struct xhci_dbc *dbc);
-struct dbc_request *dbc_alloc_request(struct dbc_ep *dep, gfp_t gfp_flags);
-void dbc_free_request(struct dbc_ep *dep, struct dbc_request *req);
-int dbc_ep_queue(struct dbc_ep *dep, struct dbc_request *req, gfp_t gfp_flags);
+struct dbc_request *dbc_alloc_request(struct xhci_dbc *dbc,
+				      unsigned int direction,
+				      gfp_t flags);
+void dbc_free_request(struct dbc_request *req);
+int dbc_ep_queue(struct dbc_request *req);
 #ifdef CONFIG_PM
 int xhci_dbc_suspend(struct xhci_hcd *xhci);
 int xhci_dbc_resume(struct xhci_hcd *xhci);
diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 967f0419dad7..9886d42e1ff2 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -48,7 +48,7 @@ static int dbc_start_tx(struct dbc_port *port)
 		list_del(&req->list_pool);
 
 		spin_unlock(&port->port_lock);
-		status = dbc_ep_queue(port->out, req, GFP_ATOMIC);
+		status = dbc_ep_queue(req);
 		spin_lock(&port->port_lock);
 
 		if (status) {
@@ -80,7 +80,7 @@ static void dbc_start_rx(struct dbc_port *port)
 		req->length = DBC_MAX_PACKET;
 
 		spin_unlock(&port->port_lock);
-		status = dbc_ep_queue(port->in, req, GFP_ATOMIC);
+		status = dbc_ep_queue(req);
 		spin_lock(&port->port_lock);
 
 		if (status) {
@@ -123,28 +123,29 @@ static void dbc_write_complete(struct xhci_dbc *dbc, struct dbc_request *req)
 	spin_unlock_irqrestore(&port->port_lock, flags);
 }
 
-static void xhci_dbc_free_req(struct dbc_ep *dep, struct dbc_request *req)
+static void xhci_dbc_free_req(struct dbc_request *req)
 {
 	kfree(req->buf);
-	dbc_free_request(dep, req);
+	dbc_free_request(req);
 }
 
 static int
-xhci_dbc_alloc_requests(struct dbc_ep *dep, struct list_head *head,
+xhci_dbc_alloc_requests(struct xhci_dbc *dbc, unsigned int direction,
+			struct list_head *head,
 			void (*fn)(struct xhci_dbc *, struct dbc_request *))
 {
 	int			i;
 	struct dbc_request	*req;
 
 	for (i = 0; i < DBC_QUEUE_SIZE; i++) {
-		req = dbc_alloc_request(dep, GFP_KERNEL);
+		req = dbc_alloc_request(dbc, direction, GFP_KERNEL);
 		if (!req)
 			break;
 
 		req->length = DBC_MAX_PACKET;
 		req->buf = kmalloc(req->length, GFP_KERNEL);
 		if (!req->buf) {
-			dbc_free_request(dep, req);
+			dbc_free_request(req);
 			break;
 		}
 
@@ -156,14 +157,14 @@ xhci_dbc_alloc_requests(struct dbc_ep *dep, struct list_head *head,
 }
 
 static void
-xhci_dbc_free_requests(struct dbc_ep *dep, struct list_head *head)
+xhci_dbc_free_requests(struct list_head *head)
 {
 	struct dbc_request	*req;
 
 	while (!list_empty(head)) {
 		req = list_entry(head->next, struct dbc_request, list_pool);
 		list_del(&req->list_pool);
-		xhci_dbc_free_req(dep, req);
+		xhci_dbc_free_req(req);
 	}
 }
 
@@ -456,12 +457,12 @@ int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
 	if (ret)
 		goto buf_alloc_fail;
 
-	ret = xhci_dbc_alloc_requests(port->in, &port->read_pool,
+	ret = xhci_dbc_alloc_requests(dbc, BULK_IN, &port->read_pool,
 				      dbc_read_complete);
 	if (ret)
 		goto request_fail;
 
-	ret = xhci_dbc_alloc_requests(port->out, &port->write_pool,
+	ret = xhci_dbc_alloc_requests(dbc, BULK_OUT, &port->write_pool,
 				      dbc_write_complete);
 	if (ret)
 		goto request_fail;
@@ -471,8 +472,8 @@ int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
 	return 0;
 
 request_fail:
-	xhci_dbc_free_requests(port->in, &port->read_pool);
-	xhci_dbc_free_requests(port->out, &port->write_pool);
+	xhci_dbc_free_requests(&port->read_pool);
+	xhci_dbc_free_requests(&port->write_pool);
 	kfifo_free(&port->write_fifo);
 
 buf_alloc_fail:
@@ -495,7 +496,7 @@ void xhci_dbc_tty_unregister_device(struct xhci_dbc *dbc)
 	port->registered = false;
 
 	kfifo_free(&port->write_fifo);
-	xhci_dbc_free_requests(get_out_ep(dbc), &port->read_pool);
-	xhci_dbc_free_requests(get_out_ep(dbc), &port->read_queue);
-	xhci_dbc_free_requests(get_in_ep(dbc), &port->write_pool);
+	xhci_dbc_free_requests(&port->read_pool);
+	xhci_dbc_free_requests(&port->read_queue);
+	xhci_dbc_free_requests(&port->write_pool);
 }
-- 
2.17.1

