Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08E6C688113
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 16:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232527AbjBBPGY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 10:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232107AbjBBPGL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 10:06:11 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F3992199
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 07:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675350370; x=1706886370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7+6XXt495wim3QyX/4YDPMGqDaQK/tAEdqMG+xui9gw=;
  b=D0h7U1zWMdtELsNSyQ+fCfA3ddNCWC0quam44yQzJJ6E5N3QlI6vYPHI
   Rf9WS4bE3kV9b9hhJxO4l0SUIq328xkUD2K6ZH8wiLy9VXUV4r91+u2M7
   HkXbfH9s4C7AynE2jLLE+/FABhZ3f30nq2K7WkjGy5aw4ddLz/4iA55TU
   jv5h0phKhF/xLGEmF9O79E59Q2xO9JgP0qvTIP/taYaChCXOrjRcK5JFZ
   Ua9tJEVu9LZK7ETH1hiR7v8jBN4CDFZ01rxVqq1wZxnt3+yBOcqvIjvmh
   dOxuAkNXeAIz7gYkqiApuejxJL2f0pA99ZuHs1JmCxWWB+SpW0KECFxNg
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="327114073"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="327114073"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 07:04:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="728905883"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="728905883"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2023 07:04:03 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 10/11] xhci: clear usb2 resume related variables in one place.
Date:   Thu,  2 Feb 2023 17:05:04 +0200
Message-Id: <20230202150505.618915-11-mathias.nyman@linux.intel.com>
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

Initially resume related USB2 variables were cleared once port
successfully resumed to U0. Later code was added to clean up
stale resume variables in case of port failed to resume to U0.

Clear the variables in one place after port is no longer resuming
or in suspended U3 state.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 38 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index a2053aa9b4a9..541ccc45ea51 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1090,7 +1090,6 @@ static void xhci_get_usb2_port_status(struct xhci_port *port, u32 *status,
 	struct xhci_bus_state *bus_state;
 	u32 link_state;
 	u32 portnum;
-	int ret;
 
 	bus_state = &port->rhub->bus_state;
 	link_state = portsc & PORT_PLS_MASK;
@@ -1106,23 +1105,30 @@ static void xhci_get_usb2_port_status(struct xhci_port *port, u32 *status,
 		if (link_state == XDEV_U2)
 			*status |= USB_PORT_STAT_L1;
 		if (link_state == XDEV_U0) {
-			if (port->resume_timestamp)
-				usb_hcd_end_port_resume(&port->rhub->hcd->self,
-							portnum);
-			port->resume_timestamp = 0;
-			clear_bit(portnum, &bus_state->resuming_ports);
 			if (bus_state->suspended_ports & (1 << portnum)) {
 				bus_state->suspended_ports &= ~(1 << portnum);
 				bus_state->port_c_suspend |= 1 << portnum;
 			}
 		}
 		if (link_state == XDEV_RESUME) {
-			ret = xhci_handle_usb2_port_link_resume(port, status,
-								portsc, flags);
-			if (ret)
-				return;
+			xhci_handle_usb2_port_link_resume(port, status, portsc,
+							  flags);
 		}
 	}
+
+	/*
+	 * Clear usb2 resume signalling variables if port is no longer suspended
+	 * or resuming. Port either resumed to U0/U1/U2, disconnected, or in a
+	 * error state. Resume related variables should be cleared in all those cases.
+	 */
+	if ((link_state != XDEV_U3 &&
+	     link_state != XDEV_RESUME) &&
+	    (port->resume_timestamp ||
+	     test_bit(portnum, &bus_state->resuming_ports))) {
+		port->resume_timestamp = 0;
+		clear_bit(portnum, &bus_state->resuming_ports);
+		usb_hcd_end_port_resume(&port->rhub->hcd->self, portnum);
+	}
 }
 
 /*
@@ -1177,18 +1183,6 @@ static u32 xhci_get_port_status(struct usb_hcd *hcd,
 	else
 		xhci_get_usb2_port_status(port, &status, raw_port_status,
 					  flags);
-	/*
-	 * Clear stale usb2 resume signalling variables in case port changed
-	 * state during resume signalling. For example on error
-	 */
-	if ((port->resume_timestamp ||
-	     test_bit(wIndex, &bus_state->resuming_ports)) &&
-	    (raw_port_status & PORT_PLS_MASK) != XDEV_U3 &&
-	    (raw_port_status & PORT_PLS_MASK) != XDEV_RESUME) {
-		port->resume_timestamp = 0;
-		clear_bit(wIndex, &bus_state->resuming_ports);
-		usb_hcd_end_port_resume(&hcd->self, wIndex);
-	}
 
 	if (bus_state->port_c_suspend & (1 << wIndex))
 		status |= USB_PORT_STAT_C_SUSPEND << 16;
-- 
2.25.1

