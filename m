Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 641BA22B1A3
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728820AbgGWOmm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:42 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgGWOmm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:42 -0400
IronPort-SDR: GzWzaIfbDTyelIX4U/T3ls0D3pLLHaM/qt+EIR4KlUCX0ADwDbJR4JC9vVrkwy97uJQBSRjWsB
 bszwBrtY3IBA==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607436"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607436"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:42 -0700
IronPort-SDR: 9OXtSKxljPoXu9gpkJgZBaT7QoAuAiwOU2Wbkrt82POQ4ME8zcHqqV+auW+r0+GwDyAQsjqo4g
 YCBJkVEh1E1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672426"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:40 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 13/27] xhci: dbc: Change to pass dbc pointer to xhci_do_dbc_stop()
Date:   Thu, 23 Jul 2020 17:45:16 +0300
Message-Id: <20200723144530.9992-14-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Pass the dbc pointer instead of xhci_hcd pointer in order to
decouple xhci and dbc.

xhci_do_dbc_stop() only used xhci to get the dbc pointer.
Pass the dbc pointer instead as a parameter

No functional changes
This change helps decoupling xhci and DbC

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 6114b334eb61..7dce1e094364 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -500,10 +500,8 @@ static int xhci_do_dbc_start(struct xhci_hcd *xhci)
 	return 0;
 }
 
-static int xhci_do_dbc_stop(struct xhci_hcd *xhci)
+static int xhci_do_dbc_stop(struct xhci_dbc *dbc)
 {
-	struct xhci_dbc		*dbc = xhci->dbc;
-
 	if (dbc->state == DS_DISABLED)
 		return -1;
 
@@ -550,7 +548,7 @@ static void xhci_dbc_stop(struct xhci_hcd *xhci)
 		xhci_dbc_tty_unregister_device(xhci);
 
 	spin_lock_irqsave(&dbc->lock, flags);
-	ret = xhci_do_dbc_stop(xhci);
+	ret = xhci_do_dbc_stop(dbc);
 	spin_unlock_irqrestore(&dbc->lock, flags);
 
 	if (!ret) {
-- 
2.17.1

