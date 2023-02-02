Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE07168810E
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 16:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232371AbjBBPGQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 10:06:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232432AbjBBPGH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 10:06:07 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E3E392195
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 07:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675350352; x=1706886352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0gF5Z8g4fpUa6HSzCTodGpu1AGK1rxYmSufRSB1tj9g=;
  b=Unc9DDg17X9U7SF9d4xhYpTGkNaQXn0wfrPZie3v8VqhQwcFhn/jeU74
   GS2ZbKg71EAnRG1Rlu/sQCxlXuy+boOLWngSzdsJh+wi+SNadMaNypT91
   1qO/lxQED6SIZonO1I0+bxPFGyoxcHHIk/bTkpfUAUxhAhw0ikaaqfEWY
   3FSs3tO6VOtlPcG4qxhNW7qZYSDLfiFAs/b29L0tYex8N/CMq5isUXQ7B
   ygaQxUON8Kd6+RvQHKDWyd0aEnFG14Y/TsdfIWDh6CrHVobm+4zwIIo2w
   eBJpxUYI3RD/jULHAEkaGU3pTKn7Wriyh6JQfGrhsXiYBQF9ZNr5ySrQ+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="327114015"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="327114015"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 07:03:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="728905748"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="728905748"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2023 07:03:57 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 06/11] xhci: pass port pointer as parameter to xhci_set_port_power()
Date:   Thu,  2 Feb 2023 17:05:00 +0200
Message-Id: <20230202150505.618915-7-mathias.nyman@linux.intel.com>
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

Pass the port structure pointer directly to xhci_set_port_power()
instead of hcd and port index.

cleanup

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 181c070d6a99..238d05206d2c 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -666,20 +666,18 @@ struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd)
  * It will release and re-aquire the lock while calling ACPI
  * method.
  */
-static void xhci_set_port_power(struct xhci_hcd *xhci, struct usb_hcd *hcd,
-				u16 index, bool on, unsigned long *flags)
+static void xhci_set_port_power(struct xhci_hcd *xhci, struct xhci_port *port,
+				bool on, unsigned long *flags)
 	__must_hold(&xhci->lock)
 {
-	struct xhci_hub *rhub;
-	struct xhci_port *port;
+	struct usb_hcd *hcd;
 	u32 temp;
 
-	rhub = xhci_get_rhub(hcd);
-	port = rhub->ports[index];
+	hcd = port->rhub->hcd;
 	temp = readl(port->addr);
 
 	xhci_dbg(xhci, "set port power %d-%d %s, portsc: 0x%x\n",
-		 hcd->self.busnum, index + 1, on ? "ON" : "OFF", temp);
+		 hcd->self.busnum, port->hcd_portnum + 1, on ? "ON" : "OFF", temp);
 
 	temp = xhci_port_state_to_neutral(temp);
 
@@ -694,10 +692,10 @@ static void xhci_set_port_power(struct xhci_hcd *xhci, struct usb_hcd *hcd,
 
 	spin_unlock_irqrestore(&xhci->lock, *flags);
 	temp = usb_acpi_power_manageable(hcd->self.root_hub,
-					index);
+					 port->hcd_portnum);
 	if (temp)
 		usb_acpi_set_power_state(hcd->self.root_hub,
-			index, on);
+					 port->hcd_portnum, on);
 	spin_lock_irqsave(&xhci->lock, *flags);
 }
 
@@ -721,7 +719,6 @@ static int xhci_enter_test_mode(struct xhci_hcd *xhci,
 				u16 test_mode, u16 wIndex, unsigned long *flags)
 	__must_hold(&xhci->lock)
 {
-	struct usb_hcd *usb3_hcd = xhci_get_usb3_hcd(xhci);
 	int i, retval;
 
 	/* Disable all Device Slots */
@@ -742,10 +739,10 @@ static int xhci_enter_test_mode(struct xhci_hcd *xhci,
 	xhci_dbg(xhci, "Disable all port (PP = 0)\n");
 	/* Power off USB3 ports*/
 	for (i = 0; i < xhci->usb3_rhub.num_ports; i++)
-		xhci_set_port_power(xhci, usb3_hcd, i, false, flags);
+		xhci_set_port_power(xhci, xhci->usb3_rhub.ports[i], false, flags);
 	/* Power off USB2 ports*/
 	for (i = 0; i < xhci->usb2_rhub.num_ports; i++)
-		xhci_set_port_power(xhci, xhci->main_hcd, i, false, flags);
+		xhci_set_port_power(xhci, xhci->usb2_rhub.ports[i], false, flags);
 	/* Stop the controller */
 	xhci_dbg(xhci, "Stop controller\n");
 	retval = xhci_halt(xhci);
@@ -1492,7 +1489,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			 * However, hub_wq will ignore the roothub events until
 			 * the roothub is registered.
 			 */
-			xhci_set_port_power(xhci, hcd, wIndex, true, &flags);
+			xhci_set_port_power(xhci, port, true, &flags);
 			break;
 		case USB_PORT_FEAT_RESET:
 			temp = (temp | PORT_RESET);
@@ -1609,7 +1606,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 					port->addr, temp);
 			break;
 		case USB_PORT_FEAT_POWER:
-			xhci_set_port_power(xhci, hcd, wIndex, false, &flags);
+			xhci_set_port_power(xhci, port, false, &flags);
 			break;
 		case USB_PORT_FEAT_TEST:
 			retval = xhci_exit_test_mode(xhci);
-- 
2.25.1

