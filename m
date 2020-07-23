Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D03DB22B1A4
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbgGWOmo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:44 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgGWOmo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:44 -0400
IronPort-SDR: NbyLw8SC7GTnWPfDLiiDC/CazRhuPaxygxk7uWKRDkPVKOb6vyBuvA3Tw0LEqKy8gZdkeNVQVJ
 5BZc/AyuNmow==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607441"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607441"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:43 -0700
IronPort-SDR: Cabq8Z191NWZ2uFxv8EsKojRNrE3qE/LLDzLB9kSxCvLwG80q2QfRDu6oWshWFWPr81NAf1jeR
 +Y1YwtUxXwpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672431"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:41 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 14/27] xhci: dbc: Pass dbc pointer to dbc_handle_xfer_event() instead of xhci_hcd pointer
Date:   Thu, 23 Jul 2020 17:45:17 +0300
Message-Id: <20200723144530.9992-15-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The event handling function only used xhci pointer to get the dbc pointer.
Pass the dbc pointer instead as a parameter

No functional changes
This change helps decoupling xhci and DbC

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 7dce1e094364..1c53fdc791a4 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -579,7 +579,7 @@ dbc_handle_port_status(struct xhci_dbc *dbc, union xhci_trb *event)
 	writel(portsc & ~DBC_PORTSC_RESET_CHANGE, &dbc->regs->portsc);
 }
 
-static void dbc_handle_xfer_event(struct xhci_hcd *xhci, union xhci_trb *event)
+static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
 {
 	struct dbc_ep		*dep;
 	struct xhci_ring	*ring;
@@ -588,7 +588,6 @@ static void dbc_handle_xfer_event(struct xhci_hcd *xhci, union xhci_trb *event)
 	u32			comp_code;
 	size_t			remain_length;
 	struct dbc_request	*req = NULL, *r;
-	struct xhci_dbc		*dbc = xhci->dbc;
 
 	comp_code	= GET_COMP_CODE(le32_to_cpu(event->generic.field[2]));
 	remain_length	= EVENT_TRB_LEN(le32_to_cpu(event->generic.field[2]));
@@ -654,7 +653,6 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 	struct dbc_ep		*dep;
 	union xhci_trb		*evt;
 	u32			ctrl, portsc;
-	struct xhci_hcd		*xhci = dbc->xhci;
 	bool			update_erdp = false;
 
 	/* DbC state machine: */
@@ -763,7 +761,7 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 			dbc_handle_port_status(dbc, evt);
 			break;
 		case TRB_TYPE(TRB_TRANSFER):
-			dbc_handle_xfer_event(xhci, evt);
+			dbc_handle_xfer_event(dbc, evt);
 			break;
 		default:
 			break;
-- 
2.17.1

