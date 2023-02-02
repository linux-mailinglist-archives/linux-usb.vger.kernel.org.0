Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3A59688112
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 16:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbjBBPGY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 10:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232256AbjBBPGL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 10:06:11 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB4E561A3
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 07:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675350369; x=1706886369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sUKJw7373aG8Mbue1dQeyPCbXQ/N6Kum1f0+YetfkVE=;
  b=Me7KayCZRHwjVvDrF8Jq/QjU39LuqQncGrIKTD6DS0b5wLmbpmPXC4dG
   IgW0Maunmaw5Vn7zBdzDKW7omfdRRX/64B4MmSbaPou41BSWH5OzFf0ry
   WfZU0OK4JXbK6zrDFJ+XVlb26WqyATaH+YdvQVXbLCoB26HJ+k8l/Jf5I
   FwqTzILYx+2Y/gFqFQT3AN+YeYIvVVFguSA2OxHVoplt7OC8pM+ETSSCM
   fas5X5RJGeL0GkoqU6m8IexnNmtXwflK3+YzLSbM02A2Z0OrT4pTq38Lg
   OB+17inG9VyC1XKj5Q5DjMPyd6sEaNkKejEkkCzyA9ZKzV/EzV/cy9BE7
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="327114060"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="327114060"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 07:04:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="728905839"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="728905839"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2023 07:04:01 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 09/11] xhci: rename resume_done to resume_timestamp
Date:   Thu,  2 Feb 2023 17:05:03 +0200
Message-Id: <20230202150505.618915-10-mathias.nyman@linux.intel.com>
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

resume_done is just a timestamp, avoid confusing it with completions
related to port state transitions that are named *_done

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c  | 20 ++++++++++----------
 drivers/usb/host/xhci-ring.c |  4 ++--
 drivers/usb/host/xhci.h      |  2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index b27969e3cdcf..a2053aa9b4a9 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -943,7 +943,7 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 		return -EINVAL;
 	}
 	/* did port event handler already start resume timing? */
-	if (!port->resume_done) {
+	if (!port->resume_timestamp) {
 		/* If not, maybe we are in a host initated resume? */
 		if (test_bit(wIndex, &bus_state->resuming_ports)) {
 			/* Host initated resume doesn't time the resume
@@ -960,18 +960,18 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 				msecs_to_jiffies(USB_RESUME_TIMEOUT);
 
 			set_bit(wIndex, &bus_state->resuming_ports);
-			port->resume_done = timeout;
+			port->resume_timestamp = timeout;
 			mod_timer(&hcd->rh_timer, timeout);
 			usb_hcd_start_port_resume(&hcd->self, wIndex);
 		}
 	/* Has resume been signalled for USB_RESUME_TIME yet? */
-	} else if (time_after_eq(jiffies, port->resume_done)) {
+	} else if (time_after_eq(jiffies, port->resume_timestamp)) {
 		int time_left;
 
 		xhci_dbg(xhci, "resume USB2 port %d-%d\n",
 			 hcd->self.busnum, wIndex + 1);
 
-		port->resume_done = 0;
+		port->resume_timestamp = 0;
 		clear_bit(wIndex, &bus_state->resuming_ports);
 		port->rexit_active = true;
 
@@ -1106,10 +1106,10 @@ static void xhci_get_usb2_port_status(struct xhci_port *port, u32 *status,
 		if (link_state == XDEV_U2)
 			*status |= USB_PORT_STAT_L1;
 		if (link_state == XDEV_U0) {
-			if (port->resume_done)
+			if (port->resume_timestamp)
 				usb_hcd_end_port_resume(&port->rhub->hcd->self,
 							portnum);
-			port->resume_done = 0;
+			port->resume_timestamp = 0;
 			clear_bit(portnum, &bus_state->resuming_ports);
 			if (bus_state->suspended_ports & (1 << portnum)) {
 				bus_state->suspended_ports &= ~(1 << portnum);
@@ -1181,11 +1181,11 @@ static u32 xhci_get_port_status(struct usb_hcd *hcd,
 	 * Clear stale usb2 resume signalling variables in case port changed
 	 * state during resume signalling. For example on error
 	 */
-	if ((port->resume_done ||
+	if ((port->resume_timestamp ||
 	     test_bit(wIndex, &bus_state->resuming_ports)) &&
 	    (raw_port_status & PORT_PLS_MASK) != XDEV_U3 &&
 	    (raw_port_status & PORT_PLS_MASK) != XDEV_RESUME) {
-		port->resume_done = 0;
+		port->resume_timestamp = 0;
 		clear_bit(wIndex, &bus_state->resuming_ports);
 		usb_hcd_end_port_resume(&hcd->self, wIndex);
 	}
@@ -1693,8 +1693,8 @@ int xhci_hub_status_data(struct usb_hcd *hcd, char *buf)
 
 		if ((temp & mask) != 0 ||
 			(bus_state->port_c_suspend & 1 << i) ||
-			(ports[i]->resume_done && time_after_eq(
-			    jiffies, ports[i]->resume_done))) {
+			(ports[i]->resume_timestamp && time_after_eq(
+			    jiffies, ports[i]->resume_timestamp))) {
 			buf[(i + 1) / 8] |= 1 << (i + 1) % 8;
 			status = 1;
 		}
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 611580d4adad..eb788c60c1c0 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1924,7 +1924,7 @@ static void handle_port_status(struct xhci_hcd *xhci,
 			goto cleanup;
 		} else if (!test_bit(hcd_portnum, &bus_state->resuming_ports)) {
 			xhci_dbg(xhci, "resume HS port %d\n", port_id);
-			port->resume_done = jiffies +
+			port->resume_timestamp = jiffies +
 				msecs_to_jiffies(USB_RESUME_TIMEOUT);
 			set_bit(hcd_portnum, &bus_state->resuming_ports);
 			/* Do the rest in GetPortStatus after resume time delay.
@@ -1933,7 +1933,7 @@ static void handle_port_status(struct xhci_hcd *xhci,
 			 */
 			set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 			mod_timer(&hcd->rh_timer,
-				  port->resume_done);
+				  port->resume_timestamp);
 			usb_hcd_start_port_resume(&hcd->self, hcd_portnum);
 			bogus_port_status = true;
 		}
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 578e219292fd..786002bb35db 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1740,7 +1740,7 @@ struct xhci_port {
 	struct xhci_hub		*rhub;
 	struct xhci_port_cap	*port_cap;
 	unsigned int		lpm_incapable:1;
-	unsigned long		resume_done;
+	unsigned long		resume_timestamp;
 	bool			rexit_active;
 	struct completion	rexit_done;
 	struct completion	u3exit_done;
-- 
2.25.1

