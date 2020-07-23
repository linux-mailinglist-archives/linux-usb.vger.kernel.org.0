Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52F022B19D
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728753AbgGWOmf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:35 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgGWOme (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:34 -0400
IronPort-SDR: z5zcW+wJOWL3vzydh3m+X133YZrJs3LwPEmCkPsXvmGrJxauxNMPiRW1JfH7XBtCPrd5tJIpa3
 3CB0glqG2V+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607397"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607397"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:34 -0700
IronPort-SDR: QzjXYE70HiiHbm28Om5u1SxOCQxwCAhrfY+RW3Zo1wHByc+18jF7o/tdJw1aWeAn35OtuF7wzN
 vhrE8jAypeTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672384"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:32 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 07/27] xhci: dbc: Add device pointer to dbc structure
Date:   Thu, 23 Jul 2020 17:45:10 +0300
Message-Id: <20200723144530.9992-8-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently the dbc structure contains a pointer to struct xhci_hcd,
and dbc functions use that to dig up the underlying device pointer.

We are trying to decouple xhci and dbc code, and prepare for
code that use dbc such as dbctty into into real device drivers.
This is one step along the way.

Keep functionality the same and keep the xhci pointer, and
let the new device pointer point to the xhci device for now.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 1 +
 drivers/usb/host/xhci-dbgcap.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 5bec36ed97c6..ae584d6ae10c 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -878,6 +878,7 @@ static int xhci_do_dbc_init(struct xhci_hcd *xhci)
 	spin_unlock_irqrestore(&xhci->lock, flags);
 
 	dbc->xhci = xhci;
+	dbc->dev = xhci_to_hcd(xhci)->self.sysdev;
 	INIT_DELAYED_WORK(&dbc->event_work, xhci_dbc_handle_events);
 	spin_lock_init(&dbc->lock);
 
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index ce0c6072bd48..7ca2f4ccc537 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -133,6 +133,7 @@ struct dbc_port {
 
 struct xhci_dbc {
 	spinlock_t			lock;		/* device access */
+	struct device			*dev;
 	struct xhci_hcd			*xhci;
 	struct dbc_regs __iomem		*regs;
 	struct xhci_ring		*ring_evt;
-- 
2.17.1

