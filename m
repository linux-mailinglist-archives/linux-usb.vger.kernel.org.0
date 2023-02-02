Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACD1688110
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 16:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232475AbjBBPGS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 10:06:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbjBBPGI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 10:06:08 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF378921AB
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 07:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675350353; x=1706886353;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MW73nPiu9by+PT8pD5gb2q2KRhsNkhWG/b6wbmbf9EA=;
  b=I0q9eZJIvNLUxbZ/cM2h6N3eaLemz4szcbswSqeqm/WofXh8C3h/K9NJ
   ySlcu6wb0KJbMm1uSoh7r0HYDuTB5a5KvwDU4nM9Gr2StEhn5bQ343kzl
   cGMna6AcQtmiJS68UGTs9eF9NtKJqvLiNC1Dq0pygaZ6kwwncZf4PpjLv
   ku+YPSEfCT2zrYH9dM3z/3jcfuNbTjUmpLPTfQmaHSlHIccg8xH+OXk3W
   KwaUL7O75RbEQDP9UbaH3aMtAbji85UxNZbbdyFptTX7aqMwm23yZVPuM
   hSREyVBkvp0UxKgyXBVY/houB7/Ww4YlmXG/a2KDUQszoyKnPHCjv7Oe/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="327114029"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="327114029"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 07:04:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="728905764"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="728905764"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2023 07:03:58 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 07/11] xhci: move port specific items such as state completions to port structure
Date:   Thu,  2 Feb 2023 17:05:01 +0200
Message-Id: <20230202150505.618915-8-mathias.nyman@linux.intel.com>
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

Now that we have a port structure for each port it makes sense to
move per port variables, timestamps and completions there.
Get rid of storing bitfileds and arrays of port specific items per bus.

Move
unsigned long           resume_done;
insigned long		rexit_ports
struct completion       rexit_done;
struct completion       u3exit_done;

Rename rexit_ports to rexit_active, and remove a redundant hcd
speed check while checking if rexit_active is set.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c  | 31 +++++++++++++++----------------
 drivers/usb/host/xhci-mem.c  | 10 +++-------
 drivers/usb/host/xhci-ring.c | 13 ++++++-------
 drivers/usb/host/xhci.h      |  9 ++++-----
 4 files changed, 28 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 238d05206d2c..75c9609f32f0 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -936,7 +936,7 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 		return -EINVAL;
 	}
 	/* did port event handler already start resume timing? */
-	if (!bus_state->resume_done[wIndex]) {
+	if (!port->resume_done) {
 		/* If not, maybe we are in a host initated resume? */
 		if (test_bit(wIndex, &bus_state->resuming_ports)) {
 			/* Host initated resume doesn't time the resume
@@ -953,28 +953,27 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 				msecs_to_jiffies(USB_RESUME_TIMEOUT);
 
 			set_bit(wIndex, &bus_state->resuming_ports);
-			bus_state->resume_done[wIndex] = timeout;
+			port->resume_done = timeout;
 			mod_timer(&hcd->rh_timer, timeout);
 			usb_hcd_start_port_resume(&hcd->self, wIndex);
 		}
 	/* Has resume been signalled for USB_RESUME_TIME yet? */
-	} else if (time_after_eq(jiffies, bus_state->resume_done[wIndex])) {
+	} else if (time_after_eq(jiffies, port->resume_done)) {
 		int time_left;
 
 		xhci_dbg(xhci, "resume USB2 port %d-%d\n",
 			 hcd->self.busnum, wIndex + 1);
 
-		bus_state->resume_done[wIndex] = 0;
+		port->resume_done = 0;
 		clear_bit(wIndex, &bus_state->resuming_ports);
-
-		set_bit(wIndex, &bus_state->rexit_ports);
+		port->rexit_active = true;
 
 		xhci_test_and_clear_bit(xhci, port, PORT_PLC);
 		xhci_set_link_state(xhci, port, XDEV_U0);
 
 		spin_unlock_irqrestore(&xhci->lock, *flags);
 		time_left = wait_for_completion_timeout(
-			&bus_state->rexit_done[wIndex],
+			&port->rexit_done,
 			msecs_to_jiffies(XHCI_MAX_REXIT_TIMEOUT_MS));
 		spin_lock_irqsave(&xhci->lock, *flags);
 
@@ -993,7 +992,7 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 			xhci_warn(xhci, "Port resume timed out, port %d-%d: 0x%x\n",
 				  hcd->self.busnum, wIndex + 1, port_status);
 			*status |= USB_PORT_STAT_SUSPEND;
-			clear_bit(wIndex, &bus_state->rexit_ports);
+			port->rexit_active = false;
 		}
 
 		usb_hcd_end_port_resume(&hcd->self, wIndex);
@@ -1100,10 +1099,10 @@ static void xhci_get_usb2_port_status(struct xhci_port *port, u32 *status,
 		if (link_state == XDEV_U2)
 			*status |= USB_PORT_STAT_L1;
 		if (link_state == XDEV_U0) {
-			if (bus_state->resume_done[portnum])
+			if (port->resume_done)
 				usb_hcd_end_port_resume(&port->rhub->hcd->self,
 							portnum);
-			bus_state->resume_done[portnum] = 0;
+			port->resume_done = 0;
 			clear_bit(portnum, &bus_state->resuming_ports);
 			if (bus_state->suspended_ports & (1 << portnum)) {
 				bus_state->suspended_ports &= ~(1 << portnum);
@@ -1175,11 +1174,11 @@ static u32 xhci_get_port_status(struct usb_hcd *hcd,
 	 * Clear stale usb2 resume signalling variables in case port changed
 	 * state during resume signalling. For example on error
 	 */
-	if ((bus_state->resume_done[wIndex] ||
+	if ((port->resume_done ||
 	     test_bit(wIndex, &bus_state->resuming_ports)) &&
 	    (raw_port_status & PORT_PLS_MASK) != XDEV_U3 &&
 	    (raw_port_status & PORT_PLS_MASK) != XDEV_RESUME) {
-		bus_state->resume_done[wIndex] = 0;
+		port->resume_done = 0;
 		clear_bit(wIndex, &bus_state->resuming_ports);
 		usb_hcd_end_port_resume(&hcd->self, wIndex);
 	}
@@ -1438,7 +1437,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				    pls == XDEV_RESUME ||
 				    pls == XDEV_RECOVERY) {
 					wait_u0 = true;
-					reinit_completion(&bus_state->u3exit_done[wIndex]);
+					reinit_completion(&port->u3exit_done);
 				}
 				if (pls <= XDEV_U3) /* U1, U2, U3 */
 					xhci_set_link_state(xhci, port, USB_SS_PORT_LS_U0);
@@ -1448,7 +1447,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 					break;
 				}
 				spin_unlock_irqrestore(&xhci->lock, flags);
-				if (!wait_for_completion_timeout(&bus_state->u3exit_done[wIndex],
+				if (!wait_for_completion_timeout(&port->u3exit_done,
 								 msecs_to_jiffies(500)))
 					xhci_dbg(xhci, "missing U0 port change event for port %d-%d\n",
 						 hcd->self.busnum, portnum1);
@@ -1688,8 +1687,8 @@ int xhci_hub_status_data(struct usb_hcd *hcd, char *buf)
 
 		if ((temp & mask) != 0 ||
 			(bus_state->port_c_suspend & 1 << i) ||
-			(bus_state->resume_done[i] && time_after_eq(
-			    jiffies, bus_state->resume_done[i]))) {
+			(ports[i]->resume_done && time_after_eq(
+			    jiffies, ports[i]->resume_done))) {
 			buf[(i + 1) / 8] |= 1 << (i + 1) % 8;
 			status = 1;
 		}
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 6b83c5c35cf8..d0a9467aa5fc 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2154,6 +2154,9 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 		xhci->hw_ports[i].addr = &xhci->op_regs->port_status_base +
 			NUM_PORT_REGS * i;
 		xhci->hw_ports[i].hw_portnum = i;
+
+		init_completion(&xhci->hw_ports[i].rexit_done);
+		init_completion(&xhci->hw_ports[i].u3exit_done);
 	}
 
 	xhci->rh_bw = kcalloc_node(num_ports, sizeof(*xhci->rh_bw), flags,
@@ -2439,13 +2442,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	 */
 	for (i = 0; i < MAX_HC_SLOTS; i++)
 		xhci->devs[i] = NULL;
-	for (i = 0; i < USB_MAXCHILDREN; i++) {
-		xhci->usb2_rhub.bus_state.resume_done[i] = 0;
-		xhci->usb3_rhub.bus_state.resume_done[i] = 0;
-		/* Only the USB 2.0 completions will ever be used. */
-		init_completion(&xhci->usb2_rhub.bus_state.rexit_done[i]);
-		init_completion(&xhci->usb3_rhub.bus_state.u3exit_done[i]);
-	}
 
 	if (scratchpad_alloc(xhci, flags))
 		goto fail;
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 451d48b87cf7..611580d4adad 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1924,7 +1924,7 @@ static void handle_port_status(struct xhci_hcd *xhci,
 			goto cleanup;
 		} else if (!test_bit(hcd_portnum, &bus_state->resuming_ports)) {
 			xhci_dbg(xhci, "resume HS port %d\n", port_id);
-			bus_state->resume_done[hcd_portnum] = jiffies +
+			port->resume_done = jiffies +
 				msecs_to_jiffies(USB_RESUME_TIMEOUT);
 			set_bit(hcd_portnum, &bus_state->resuming_ports);
 			/* Do the rest in GetPortStatus after resume time delay.
@@ -1933,7 +1933,7 @@ static void handle_port_status(struct xhci_hcd *xhci,
 			 */
 			set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 			mod_timer(&hcd->rh_timer,
-				  bus_state->resume_done[hcd_portnum]);
+				  port->resume_done);
 			usb_hcd_start_port_resume(&hcd->self, hcd_portnum);
 			bogus_port_status = true;
 		}
@@ -1945,7 +1945,7 @@ static void handle_port_status(struct xhci_hcd *xhci,
 	     (portsc & PORT_PLS_MASK) == XDEV_U1 ||
 	     (portsc & PORT_PLS_MASK) == XDEV_U2)) {
 		xhci_dbg(xhci, "resume SS port %d finished\n", port_id);
-		complete(&bus_state->u3exit_done[hcd_portnum]);
+		complete(&port->u3exit_done);
 		/* We've just brought the device into U0/1/2 through either the
 		 * Resume state after a device remote wakeup, or through the
 		 * U3Exit state after a host-initiated resume.  If it's a device
@@ -1970,10 +1970,9 @@ static void handle_port_status(struct xhci_hcd *xhci,
 	 * RExit to a disconnect state).  If so, let the driver know it's
 	 * out of the RExit state.
 	 */
-	if (!DEV_SUPERSPEED_ANY(portsc) && hcd->speed < HCD_USB3 &&
-			test_and_clear_bit(hcd_portnum,
-				&bus_state->rexit_ports)) {
-		complete(&bus_state->rexit_done[hcd_portnum]);
+	if (hcd->speed < HCD_USB3 && port->rexit_active) {
+		complete(&port->rexit_done);
+		port->rexit_active = false;
 		bogus_port_status = true;
 		goto cleanup;
 	}
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 95eb235d1f70..578e219292fd 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1704,13 +1704,8 @@ struct xhci_bus_state {
 	u32			port_c_suspend;
 	u32			suspended_ports;
 	u32			port_remote_wakeup;
-	unsigned long		resume_done[USB_MAXCHILDREN];
 	/* which ports have started to resume */
 	unsigned long		resuming_ports;
-	/* Which ports are waiting on RExit to U0 transition. */
-	unsigned long		rexit_ports;
-	struct completion	rexit_done[USB_MAXCHILDREN];
-	struct completion	u3exit_done[USB_MAXCHILDREN];
 };
 
 struct xhci_interrupter {
@@ -1745,6 +1740,10 @@ struct xhci_port {
 	struct xhci_hub		*rhub;
 	struct xhci_port_cap	*port_cap;
 	unsigned int		lpm_incapable:1;
+	unsigned long		resume_done;
+	bool			rexit_active;
+	struct completion	rexit_done;
+	struct completion	u3exit_done;
 };
 
 struct xhci_hub {
-- 
2.25.1

