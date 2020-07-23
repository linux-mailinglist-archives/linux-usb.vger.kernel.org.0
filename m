Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B482D22B1A6
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbgGWOmq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:46 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgGWOmq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:46 -0400
IronPort-SDR: b3iRQ6n/udIFHPbEmZbmefFVAXOBXKjy9Dv/9VVYx1xLMTjmltYQWk2EM+9u61tp5ppzvGoPiN
 pq034zR2YRPw==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607451"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607451"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:46 -0700
IronPort-SDR: 2BrFJe+SXmRl9nQ7bExeDQSg9CYYWJSPoxvZEaaQBv56yfiHFmF7eJmwzeb9ol0CeDwcluqYYJ
 1XWr2493bZrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672441"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:44 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 16/27] xhci: dbc: Pass dbc pointer to get_in/out_ep() helper functions to get endpoints
Date:   Thu, 23 Jul 2020 17:45:19 +0300
Message-Id: <20200723144530.9992-17-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Pass dbc pointer instead of struct xhci_hcd pointer to the get_in_ep() and
get_out_ep() helper functions.

No functional changes
This change helps decoupling xhci and DbC

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c |  6 +++---
 drivers/usb/host/xhci-dbgcap.h |  8 ++------
 drivers/usb/host/xhci-dbgtty.c | 14 +++++++-------
 3 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index dd8ac5918ad8..26e693dd7414 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -593,7 +593,7 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
 	remain_length	= EVENT_TRB_LEN(le32_to_cpu(event->generic.field[2]));
 	ep_id		= TRB_TO_EP_ID(le32_to_cpu(event->generic.field[3]));
 	dep		= (ep_id == EPID_OUT) ?
-				get_out_ep(xhci) : get_in_ep(xhci);
+				get_out_ep(dbc) : get_in_ep(dbc);
 	ring		= dep->ring;
 
 	switch (comp_code) {
@@ -710,12 +710,12 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 			dbc->state = DS_STALLED;
 
 			if (ctrl & DBC_CTRL_HALT_IN_TR) {
-				dep = get_in_ep(xhci);
+				dep = get_in_ep(dbc);
 				xhci_dbc_flush_endpoint_requests(dep);
 			}
 
 			if (ctrl & DBC_CTRL_HALT_OUT_TR) {
-				dep = get_out_ep(xhci);
+				dep = get_out_ep(dbc);
 				xhci_dbc_flush_endpoint_requests(dep);
 			}
 
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index 628f85f97dfe..dc7d2d157e7b 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -179,17 +179,13 @@ enum evtreturn {
 	EVT_DISC,
 };
 
-static inline struct dbc_ep *get_in_ep(struct xhci_hcd *xhci)
+static inline struct dbc_ep *get_in_ep(struct xhci_dbc *dbc)
 {
-	struct xhci_dbc		*dbc = xhci->dbc;
-
 	return &dbc->eps[BULK_IN];
 }
 
-static inline struct dbc_ep *get_out_ep(struct xhci_hcd *xhci)
+static inline struct dbc_ep *get_out_ep(struct xhci_dbc *dbc)
 {
-	struct xhci_dbc		*dbc = xhci->dbc;
-
 	return &dbc->eps[BULK_OUT];
 }
 
diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 545e8cb0221a..0ef48862f4a7 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -418,7 +418,7 @@ static const struct tty_port_operations dbc_port_ops = {
 };
 
 static void
-xhci_dbc_tty_init_port(struct xhci_hcd *xhci, struct dbc_port *port)
+xhci_dbc_tty_init_port(struct xhci_dbc *dbc, struct dbc_port *port)
 {
 	tty_port_init(&port->port);
 	spin_lock_init(&port->port_lock);
@@ -427,8 +427,8 @@ xhci_dbc_tty_init_port(struct xhci_hcd *xhci, struct dbc_port *port)
 	INIT_LIST_HEAD(&port->read_queue);
 	INIT_LIST_HEAD(&port->write_pool);
 
-	port->in =		get_in_ep(xhci);
-	port->out =		get_out_ep(xhci);
+	port->in =		get_in_ep(dbc);
+	port->out =		get_out_ep(dbc);
 	port->port.ops =	&dbc_port_ops;
 	port->n_read =		0;
 }
@@ -446,7 +446,7 @@ int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
 	struct device		*tty_dev;
 	struct dbc_port		*port = &dbc->port;
 
-	xhci_dbc_tty_init_port(xhci, port);
+	xhci_dbc_tty_init_port(dbc, port);
 	tty_dev = tty_port_register_device(&port->port,
 					   dbc_tty_driver, 0, NULL);
 	if (IS_ERR(tty_dev)) {
@@ -497,7 +497,7 @@ void xhci_dbc_tty_unregister_device(struct xhci_dbc *dbc)
 	port->registered = false;
 
 	kfifo_free(&port->write_fifo);
-	xhci_dbc_free_requests(get_out_ep(xhci), &port->read_pool);
-	xhci_dbc_free_requests(get_out_ep(xhci), &port->read_queue);
-	xhci_dbc_free_requests(get_in_ep(xhci), &port->write_pool);
+	xhci_dbc_free_requests(get_out_ep(dbc), &port->read_pool);
+	xhci_dbc_free_requests(get_out_ep(dbc), &port->read_queue);
+	xhci_dbc_free_requests(get_in_ep(dbc), &port->write_pool);
 }
-- 
2.17.1

