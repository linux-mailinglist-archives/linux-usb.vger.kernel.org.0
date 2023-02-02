Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBA0688111
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 16:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232517AbjBBPGV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 10:06:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbjBBPGK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 10:06:10 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4EC623672
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 07:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675350366; x=1706886366;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nKb6PkWhM6YoZxHrfPvCEVmnkcaWDOAMxfmkrevVPjg=;
  b=jlRnVvztfj22TDR9z//6OXifi9WpXF5dl7fzMEOVjxT0OQlHzFes7gKt
   oczUvYs2pB/+sC0PgB2fHCgV7QGUj+GEYvujoNRDTLzkBt0ErmuPjBXqB
   dPd9R8NkkIntN9JNcS/G3PjpmtQvy4QqMrYT3Hpxt3mifwoad8N6jeys6
   NdctOJ2l6wRDZOKhcdTS3kqdBhCp+zSDAu2v38O+K2Sq8g9k1lJ0m0TIh
   DmcL6jXvO272792QiZQIYj1exWc7gaHp0JhchpdhujqFmQmmFt0popZ0R
   c7k1ni9bKGtJ/3YDOjw1kf+rU9uoXyzLayykcdwJROAd1mKX4h3GuuOMM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="327114048"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="327114048"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 07:04:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="728905789"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="728905789"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2023 07:04:00 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 08/11] xhci: Pass port structure as parameter to xhci_disable_port().
Date:   Thu,  2 Feb 2023 17:05:02 +0200
Message-Id: <20230202150505.618915-9-mathias.nyman@linux.intel.com>
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

Pass the port structure to xhci_disable_port() instead of
address, index, and value.

re-read the port portsc value before disabling the port.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 75c9609f32f0..b27969e3cdcf 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -578,13 +578,16 @@ void xhci_ring_device(struct xhci_hcd *xhci, int slot_id)
 	return;
 }
 
-static void xhci_disable_port(struct usb_hcd *hcd, struct xhci_hcd *xhci,
-		u16 wIndex, __le32 __iomem *addr, u32 port_status)
+static void xhci_disable_port(struct xhci_hcd *xhci, struct xhci_port *port)
 {
+	struct usb_hcd *hcd;
+	u32 portsc;
+
+	hcd = port->rhub->hcd;
+
 	/* Don't allow the USB core to disable SuperSpeed ports. */
 	if (hcd->speed >= HCD_USB3) {
-		xhci_dbg(xhci, "Ignoring request to disable "
-				"SuperSpeed port.\n");
+		xhci_dbg(xhci, "Ignoring request to disable SuperSpeed port.\n");
 		return;
 	}
 
@@ -594,11 +597,15 @@ static void xhci_disable_port(struct usb_hcd *hcd, struct xhci_hcd *xhci,
 		return;
 	}
 
+	portsc = readl(port->addr);
+	portsc = xhci_port_state_to_neutral(portsc);
+
 	/* Write 1 to disable the port */
-	writel(port_status | PORT_PE, addr);
-	port_status = readl(addr);
+	writel(portsc | PORT_PE, port->addr);
+
+	portsc = readl(port->addr);
 	xhci_dbg(xhci, "disable port %d-%d, portsc: 0x%x\n",
-		 hcd->self.busnum, wIndex + 1, port_status);
+		 hcd->self.busnum, port->hcd_portnum + 1, portsc);
 }
 
 static void xhci_clear_port_change_bit(struct xhci_hcd *xhci, u16 wValue,
@@ -1601,8 +1608,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 					port->addr, temp);
 			break;
 		case USB_PORT_FEAT_ENABLE:
-			xhci_disable_port(hcd, xhci, wIndex,
-					port->addr, temp);
+			xhci_disable_port(xhci, port);
 			break;
 		case USB_PORT_FEAT_POWER:
 			xhci_set_port_power(xhci, port, false, &flags);
-- 
2.25.1

