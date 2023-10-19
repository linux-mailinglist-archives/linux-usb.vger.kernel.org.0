Return-Path: <linux-usb+bounces-1896-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6907CF52A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF5641C20F54
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCABB18C23;
	Thu, 19 Oct 2023 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5PK+lMv"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CD118B09
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:28:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7BEF124
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697711282; x=1729247282;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ycwQOekfeCf9aGdjcilX7Xz05ht1qjBD5sMbAwLVD0w=;
  b=b5PK+lMvxKqq7DFvpeh9xZZRzsamj2BaCYQbxZVJSH44QcA0ANRmaYbu
   ld3t3o38wdDVKQqBtZ20/+JNkBlaRydcUK0wNldwAoAQTJBqefjWMmJ/F
   vHdzE3anmLCSwWDJeSrAahmcfQlzwDJPuwvy7bGdNz722i7mfLiw5JDNt
   G4SH7w8Hd3e7/jwg4eWuUbx/g156IhOEe6928UCTrG8ZL0kQ3xlQwPVKI
   WJZNo5zfm4bqH+JSUZh6tANsPsgrBpTK/qQW7iAxf+ulkc5cDZtYG3l3n
   1grUkyjx4psPNhCEvjdvMmf9huYushnKjVQar59aL5H3SPPPsc18ToX5i
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389075769"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="389075769"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930557467"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930557467"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 03:28:00 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 01/19] xhci: pass port structure to tracing instead of port number
Date: Thu, 19 Oct 2023 13:29:06 +0300
Message-Id: <20231019102924.2797346-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
References: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We want to trace other port structure members than just port number
so pass entire port structure as parameter instead of just port number.

Dig the port number from the port structure.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c   |  4 ++--
 drivers/usb/host/xhci-ring.c  |  2 +-
 drivers/usb/host/xhci-trace.h | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 0df5d807a77e..0980ade2a234 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1262,7 +1262,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			retval = -ENODEV;
 			break;
 		}
-		trace_xhci_get_port_status(wIndex, temp);
+		trace_xhci_get_port_status(port, temp);
 		status = xhci_get_port_status(hcd, bus_state, wIndex, temp,
 					      &flags);
 		if (status == 0xffffffff)
@@ -1687,7 +1687,7 @@ int xhci_hub_status_data(struct usb_hcd *hcd, char *buf)
 			retval = -ENODEV;
 			break;
 		}
-		trace_xhci_hub_status_data(i, temp);
+		trace_xhci_hub_status_data(ports[i], temp);
 
 		if ((temp & mask) != 0 ||
 			(bus_state->port_c_suspend & 1 << i) ||
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 3e5dc0723a8f..48daeb4b4a46 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1906,7 +1906,7 @@ static void handle_port_status(struct xhci_hcd *xhci,
 	xhci_dbg(xhci, "Port change event, %d-%d, id %d, portsc: 0x%x\n",
 		 hcd->self.busnum, hcd_portnum + 1, port_id, portsc);
 
-	trace_xhci_handle_port_status(hcd_portnum, portsc);
+	trace_xhci_handle_port_status(port, portsc);
 
 	if (hcd->state == HC_STATE_SUSPENDED) {
 		xhci_dbg(xhci, "resume root hub\n");
diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index d6b32f2ad90e..2208eda1ff27 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -509,14 +509,14 @@ DEFINE_EVENT(xhci_log_ring, xhci_inc_deq,
 );
 
 DECLARE_EVENT_CLASS(xhci_log_portsc,
-		    TP_PROTO(u32 portnum, u32 portsc),
-		    TP_ARGS(portnum, portsc),
+		    TP_PROTO(struct xhci_port *port, u32 portsc),
+		    TP_ARGS(port, portsc),
 		    TP_STRUCT__entry(
 				     __field(u32, portnum)
 				     __field(u32, portsc)
 				     ),
 		    TP_fast_assign(
-				   __entry->portnum = portnum;
+				   __entry->portnum = port->hcd_portnum;
 				   __entry->portsc = portsc;
 				   ),
 		    TP_printk("port-%d: %s",
@@ -526,18 +526,18 @@ DECLARE_EVENT_CLASS(xhci_log_portsc,
 );
 
 DEFINE_EVENT(xhci_log_portsc, xhci_handle_port_status,
-	     TP_PROTO(u32 portnum, u32 portsc),
-	     TP_ARGS(portnum, portsc)
+	     TP_PROTO(struct xhci_port *port, u32 portsc),
+	     TP_ARGS(port, portsc)
 );
 
 DEFINE_EVENT(xhci_log_portsc, xhci_get_port_status,
-	     TP_PROTO(u32 portnum, u32 portsc),
-	     TP_ARGS(portnum, portsc)
+	     TP_PROTO(struct xhci_port *port, u32 portsc),
+	     TP_ARGS(port, portsc)
 );
 
 DEFINE_EVENT(xhci_log_portsc, xhci_hub_status_data,
-	     TP_PROTO(u32 portnum, u32 portsc),
-	     TP_ARGS(portnum, portsc)
+	     TP_PROTO(struct xhci_port *port, u32 portsc),
+	     TP_ARGS(port, portsc)
 );
 
 DECLARE_EVENT_CLASS(xhci_log_doorbell,
-- 
2.25.1


