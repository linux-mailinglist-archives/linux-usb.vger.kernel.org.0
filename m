Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADFB9688114
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 16:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbjBBPGZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 10:06:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232535AbjBBPGM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 10:06:12 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6FB8921A6
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 07:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675350370; x=1706886370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tmWob8C9oCAnTzzL7c9APENU1tp0rhM3drazZIf6DTA=;
  b=mrjrXQPm/tQPh4+hiINBr5a5f5RoErihWF0znncK81zywQcQkBxaqaR0
   378vZcKKFCiE7NIrtdVavgf12yw/pWOVDhXXKi/EiqEGXLGilThCDzXVO
   iHJ/Pmi/Dkt4miCphZi8mVK3ZPoQ+7qY7CZBXWxiqkWRgvGJ6Sv4dBd3+
   Lyd0igMeAwkRQGcGIkoQ02ROkLvttZ+AUpBjzjjzhGJNBoclRXknnfdNQ
   63hqZB+fY3oAfT1UBS5j2VAADd6QVayC/Ml6fGMapyzMtADOknmU5BXhX
   TWxeJnwqeZBWSuF86zbGJgLs6Jdt3CQgz2t4FeHQk+hSNNDZ3q7/AIZRQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="327114088"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="327114088"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 07:04:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="728905923"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="728905923"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2023 07:04:04 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 11/11] xhci: decouple usb2 port resume and get_port_status request handling
Date:   Thu,  2 Feb 2023 17:05:05 +0200
Message-Id: <20230202150505.618915-12-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230202150505.618915-1-mathias.nyman@linux.intel.com>
References: <20230202150505.618915-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The get port status hub request code in xhci-hub.c will complete usb2
port resume signalling if signalling has been going on for long enough.

The code that completes the resume signalling, and the code that returns
the port status have gotten too intertwined, so separate them a bit.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 47 ++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 541ccc45ea51..0054d02239e2 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -924,7 +924,7 @@ static void xhci_del_comp_mod_timer(struct xhci_hcd *xhci, u32 status,
 }
 
 static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
-					     u32 *status, u32 portsc,
+					     u32 portsc,
 					     unsigned long *flags)
 {
 	struct xhci_bus_state *bus_state;
@@ -939,7 +939,6 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 	wIndex = port->hcd_portnum;
 
 	if ((portsc & PORT_RESET) || !(portsc & PORT_PE)) {
-		*status = 0xffffffff;
 		return -EINVAL;
 	}
 	/* did port event handler already start resume timing? */
@@ -973,6 +972,8 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 
 		port->resume_timestamp = 0;
 		clear_bit(wIndex, &bus_state->resuming_ports);
+
+		reinit_completion(&port->rexit_done);
 		port->rexit_active = true;
 
 		xhci_test_and_clear_bit(xhci, port, PORT_PLC);
@@ -989,7 +990,6 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 							    wIndex + 1);
 			if (!slot_id) {
 				xhci_dbg(xhci, "slot_id is zero\n");
-				*status = 0xffffffff;
 				return -ENODEV;
 			}
 			xhci_ring_device(xhci, slot_id);
@@ -998,22 +998,19 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 
 			xhci_warn(xhci, "Port resume timed out, port %d-%d: 0x%x\n",
 				  hcd->self.busnum, wIndex + 1, port_status);
-			*status |= USB_PORT_STAT_SUSPEND;
-			port->rexit_active = false;
+			/*
+			 * keep rexit_active set if U0 transition failed so we
+			 * know to report PORT_STAT_SUSPEND status back to
+			 * usbcore. It will be cleared later once the port is
+			 * out of RESUME/U3 state
+			 */
 		}
 
 		usb_hcd_end_port_resume(&hcd->self, wIndex);
 		bus_state->port_c_suspend |= 1 << wIndex;
 		bus_state->suspended_ports &= ~(1 << wIndex);
-	} else {
-		/*
-		 * The resume has been signaling for less than
-		 * USB_RESUME_TIME. Report the port status as SUSPEND,
-		 * let the usbcore check port status again and clear
-		 * resume signaling later.
-		 */
-		*status |= USB_PORT_STAT_SUSPEND;
 	}
+
 	return 0;
 }
 
@@ -1090,6 +1087,7 @@ static void xhci_get_usb2_port_status(struct xhci_port *port, u32 *status,
 	struct xhci_bus_state *bus_state;
 	u32 link_state;
 	u32 portnum;
+	int err;
 
 	bus_state = &port->rhub->bus_state;
 	link_state = portsc & PORT_PLS_MASK;
@@ -1111,8 +1109,12 @@ static void xhci_get_usb2_port_status(struct xhci_port *port, u32 *status,
 			}
 		}
 		if (link_state == XDEV_RESUME) {
-			xhci_handle_usb2_port_link_resume(port, status, portsc,
-							  flags);
+			err = xhci_handle_usb2_port_link_resume(port, portsc,
+								flags);
+			if (err < 0)
+				*status = 0xffffffff;
+			else if (port->resume_timestamp || port->rexit_active)
+				*status |= USB_PORT_STAT_SUSPEND;
 		}
 	}
 
@@ -1121,13 +1123,14 @@ static void xhci_get_usb2_port_status(struct xhci_port *port, u32 *status,
 	 * or resuming. Port either resumed to U0/U1/U2, disconnected, or in a
 	 * error state. Resume related variables should be cleared in all those cases.
 	 */
-	if ((link_state != XDEV_U3 &&
-	     link_state != XDEV_RESUME) &&
-	    (port->resume_timestamp ||
-	     test_bit(portnum, &bus_state->resuming_ports))) {
-		port->resume_timestamp = 0;
-		clear_bit(portnum, &bus_state->resuming_ports);
-		usb_hcd_end_port_resume(&port->rhub->hcd->self, portnum);
+	if (link_state != XDEV_U3 && link_state != XDEV_RESUME) {
+		if (port->resume_timestamp ||
+		    test_bit(portnum, &bus_state->resuming_ports)) {
+			port->resume_timestamp = 0;
+			clear_bit(portnum, &bus_state->resuming_ports);
+			usb_hcd_end_port_resume(&port->rhub->hcd->self, portnum);
+		}
+		port->rexit_active = 0;
 	}
 }
 
-- 
2.25.1

