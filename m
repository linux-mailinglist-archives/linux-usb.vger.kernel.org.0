Return-Path: <linux-usb+bounces-27556-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7C6B440D6
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 17:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89907A42CED
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 15:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0EC8280334;
	Thu,  4 Sep 2025 15:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQYKzyul"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCD6283C82
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 15:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757000628; cv=none; b=jkhCH23JPV3kBko4b7jxtbq71AY7fqs7EB6JCQDyt3s4ziBXKtWlRnszp6gz+qtaAfYd2p3eJgNWSeCznjIdp7wLFmeFSBWCfwkNdCkCM2oowiwOQ3+ZFIcjtg5+KfMyGwP1RssunBui+jS3k9aAutkpRC8r7TufAPkvFLBXPeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757000628; c=relaxed/simple;
	bh=wv7pGbLov20KABtezrPINt/XiYLT0pu98D0ATWmZeiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KK9b57VgF1w1WJseOCF9/k5yKib4Gpo3QrfCdmig/E+dDF+w+Fia0Z8tUwpxXj2Ho+80mnpHM25k5o581nT6tFUxy4IfolAZnTeqn37t0a2TX1mh+zl6BkZKs2z4pN74efz4/p3jjgxcUjd+iwqPCiXO42j2f2K7Wc4Iq2NN7U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQYKzyul; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757000624; x=1788536624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wv7pGbLov20KABtezrPINt/XiYLT0pu98D0ATWmZeiw=;
  b=HQYKzyulql3Q0jkOaYLJAU901aSTyina/raRp9gBe252tme+B/q6ovK2
   izXqXTssX3/Bu8HdQDDAJXoLDIQ5o4xO9zhe96Jjsyu/04dPbFFgKHpXp
   ijng/ddXjichE/9EbyiqZdGT57CeZUOxvqGmMcTOdfR61iYDnWAJDjM9h
   GTHCu2qWHswjjVTwAD8lhx5MOT6e2MOsdvfmEzxxA1inw+E7LPJ5SCGeE
   HOnmUof3mtRgRwlZevU25GY+7mIn6PJMOsrsxY3NVLthIEbra0so0de1u
   Fh+SFA1Dq8KNKF3k1aB04Csc6/Lr2o1tY84eMJNmwgqzNxpPq3X5FQBnD
   w==;
X-CSE-ConnectionGUID: nzm7Dh+PStamNKLlwRsVZg==
X-CSE-MsgGUID: qPHhT+auTEutTQJpCJpB8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59492535"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="59492535"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 08:43:42 -0700
X-CSE-ConnectionGUID: ZcGNSm++TSCnApz7AomL1w==
X-CSE-MsgGUID: thi7w9SMSQa/Bmd6ieLWdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="172288309"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 04 Sep 2025 08:43:40 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 3237A98; Thu, 04 Sep 2025 17:43:40 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 6/7] usb: xhci: implement USB Port Register Set struct
Date: Thu,  4 Sep 2025 17:42:19 +0200
Message-ID: <20250904154221.2314596-7-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250904154221.2314596-1-niklas.neronin@linux.intel.com>
References: <20250904154221.2314596-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Refactor the 'xhci_port' struct by changing the 'addr' field from a
'__le32' pointer to a pointer to the 'xhci_port_regs' struct.

Previously, the 'xhci_port' struct contained a '__le32' pointer named addr,
which pointed to the Host Controller USB Port Register Set.
Accessing specific registers required using a macro,
such as port->addr + PORTHLPMC, which was less readable.

Before:
 port->addr
 port->addr + PORTPMSC
 port->addr + PORTLI
 port->addr + PORTHLPMC

After:
 port->addr->portsc
 port->addr->portpmsc
 port->addr->portli
 port->addr->porthlmpc

This change simplifies the code by directly accessing the registers through
the 'xhci_port_regs' struct, making it more intuitive and easier to
follow.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c |  4 +-
 drivers/usb/host/xhci-hub.c     | 84 ++++++++++++++++-----------------
 drivers/usb/host/xhci-mem.c     |  2 +-
 drivers/usb/host/xhci-pci.c     |  2 +-
 drivers/usb/host/xhci-ring.c    |  2 +-
 drivers/usb/host/xhci-tegra.c   | 12 ++---
 drivers/usb/host/xhci.c         | 35 +++++++-------
 drivers/usb/host/xhci.h         |  7 +--
 8 files changed, 71 insertions(+), 77 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 11edb5c54cfa..134b53ae01ce 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -329,7 +329,7 @@ static int xhci_portsc_show(struct seq_file *s, void *unused)
 	u32			portsc;
 	char			str[XHCI_MSG_MAX];
 
-	portsc = readl(port->addr);
+	portsc = readl(&port->addr->portsc);
 	seq_printf(s, "%s\n", xhci_decode_portsc(str, portsc));
 
 	return 0;
@@ -359,7 +359,7 @@ static ssize_t xhci_port_write(struct file *file,  const char __user *ubuf,
 			return count;
 		spin_lock_irqsave(&xhci->lock, flags);
 		/* compliance mode can only be enabled on ports in RxDetect */
-		portsc = readl(port->addr);
+		portsc = readl(&port->addr->portsc);
 		if ((portsc & PORT_PLS_MASK) != XDEV_RXDETECT) {
 			spin_unlock_irqrestore(&xhci->lock, flags);
 			return -EPERM;
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 155fb9159934..15e790e992b3 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -299,7 +299,7 @@ static void xhci_usb2_hub_descriptor(struct usb_hcd *hcd, struct xhci_hcd *xhci,
 	 */
 	memset(port_removable, 0, sizeof(port_removable));
 	for (i = 0; i < ports; i++) {
-		portsc = readl(rhub->ports[i]->addr);
+		portsc = readl(&rhub->ports[i]->addr->portsc);
 		/* If a device is removable, PORTSC reports a 0, same as in the
 		 * hub descriptor DeviceRemovable bits.
 		 */
@@ -356,7 +356,7 @@ static void xhci_usb3_hub_descriptor(struct usb_hcd *hcd, struct xhci_hcd *xhci,
 	port_removable = 0;
 	/* bit 0 is reserved, bit 1 is for port 1, etc. */
 	for (i = 0; i < ports; i++) {
-		portsc = readl(rhub->ports[i]->addr);
+		portsc = readl(&rhub->ports[i]->addr->portsc);
 		if (portsc & PORT_DEV_REMOVE)
 			port_removable |= 1 << (i + 1);
 	}
@@ -566,13 +566,13 @@ static void xhci_disable_port(struct xhci_hcd *xhci, struct xhci_port *port)
 		return;
 	}
 
-	portsc = readl(port->addr);
+	portsc = readl(&port->addr->portsc);
 	portsc = xhci_port_state_to_neutral(portsc);
 
 	/* Write 1 to disable the port */
 	xhci_set_portsc(port, portsc | PORT_PE);
 
-	portsc = readl(port->addr);
+	portsc = readl(&port->addr->portsc);
 	xhci_dbg(xhci, "disable port %d-%d, portsc: 0x%x\n",
 		 hcd->self.busnum, port->hcd_portnum + 1, portsc);
 }
@@ -622,7 +622,7 @@ static void xhci_clear_port_change_bit(struct xhci_hcd *xhci, u16 wValue,
 	}
 	/* Change bits are all write 1 to clear */
 	xhci_set_portsc(port, port_status | status);
-	port_status = readl(port->addr);
+	port_status = readl(&port->addr->portsc);
 
 	xhci_dbg(xhci, "clear port%d %s change, portsc: 0x%x\n",
 		 wIndex + 1, port_change_bit, port_status);
@@ -650,7 +650,7 @@ static void xhci_set_port_power(struct xhci_hcd *xhci, struct xhci_port *port,
 	u32 temp;
 
 	hcd = port->rhub->hcd;
-	temp = readl(port->addr);
+	temp = readl(&port->addr->portsc);
 
 	xhci_dbg(xhci, "set port power %d-%d %s, portsc: 0x%x\n",
 		 hcd->self.busnum, port->hcd_portnum + 1, on ? "ON" : "OFF", temp);
@@ -660,7 +660,7 @@ static void xhci_set_port_power(struct xhci_hcd *xhci, struct xhci_port *port,
 	if (on) {
 		/* Power on */
 		xhci_set_portsc(port, temp | PORT_POWER);
-		readl(port->addr);
+		readl(&port->addr->portsc);
 	} else {
 		/* Power off */
 		xhci_set_portsc(port, temp & ~PORT_POWER);
@@ -683,9 +683,9 @@ static void xhci_port_set_test_mode(struct xhci_hcd *xhci,
 
 	/* xhci only supports test mode for usb2 ports */
 	port = xhci->usb2_rhub.ports[wIndex];
-	temp = readl(port->addr + PORTPMSC);
+	temp = readl(&port->addr->portpmsc);
 	temp |= test_mode << PORT_TEST_MODE_SHIFT;
-	writel(temp, port->addr + PORTPMSC);
+	writel(temp, &port->addr->portpmsc);
 	xhci->test_mode = test_mode;
 	if (test_mode == USB_TEST_FORCE_ENABLE)
 		xhci_start(xhci);
@@ -802,7 +802,7 @@ void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
 	u32 temp;
 	u32 portsc;
 
-	portsc = readl(port->addr);
+	portsc = readl(&port->addr->portsc);
 	temp = xhci_port_state_to_neutral(portsc);
 	temp &= ~PORT_PLS_MASK;
 	temp |= PORT_LINK_STROBE | link_state;
@@ -818,7 +818,7 @@ static void xhci_set_remote_wake_mask(struct xhci_hcd *xhci,
 {
 	u32 temp;
 
-	temp = readl(port->addr);
+	temp = readl(&port->addr->portsc);
 	temp = xhci_port_state_to_neutral(temp);
 
 	if (wake_mask & USB_PORT_FEAT_REMOTE_WAKE_CONNECT)
@@ -845,7 +845,7 @@ void xhci_test_and_clear_bit(struct xhci_hcd *xhci, struct xhci_port *port,
 {
 	u32 temp;
 
-	temp = readl(port->addr);
+	temp = readl(&port->addr->portsc);
 	if (temp & port_bit) {
 		temp = xhci_port_state_to_neutral(temp);
 		temp |= port_bit;
@@ -1003,7 +1003,7 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
 			}
 			xhci_ring_device(xhci, port->slot_id);
 		} else {
-			int port_status = readl(port->addr);
+			int port_status = readl(&port->addr->portsc);
 
 			xhci_warn(xhci, "Port resume timed out, port %d-%d: 0x%x\n",
 				  hcd->self.busnum, wIndex + 1, port_status);
@@ -1264,7 +1264,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 
 		wIndex--;
 		port = ports[portnum1 - 1];
-		temp = readl(port->addr);
+		temp = readl(&port->addr->portsc);
 		if (temp == ~(u32)0) {
 			xhci_hc_died(xhci);
 			retval = -ENODEV;
@@ -1289,7 +1289,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				retval = -EINVAL;
 				break;
 			}
-			port_li = readl(port->addr + PORTLI);
+			port_li = readl(&port->addr->portli);
 			status = xhci_get_ext_port_status(temp, port_li);
 			put_unaligned_le32(status, &buf[4]);
 		}
@@ -1310,7 +1310,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 
 		port = ports[portnum1 - 1];
 		wIndex--;
-		temp = readl(port->addr);
+		temp = readl(&port->addr->portsc);
 		if (temp == ~(u32)0) {
 			xhci_hc_died(xhci);
 			retval = -ENODEV;
@@ -1320,7 +1320,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		/* FIXME: What new port features do we need to support? */
 		switch (wValue) {
 		case USB_PORT_FEAT_SUSPEND:
-			temp = readl(port->addr);
+			temp = readl(&port->addr->portsc);
 			if ((temp & PORT_PLS_MASK) != XDEV_U0) {
 				/* Resume the port to U0 first */
 				xhci_set_link_state(xhci, port, XDEV_U0);
@@ -1332,7 +1332,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			 * a port unless the port reports that it is in the
 			 * enabled (PED = ‘1’,PLS < ‘3’) state.
 			 */
-			temp = readl(port->addr);
+			temp = readl(&port->addr->portsc);
 			if ((temp & PORT_PE) == 0 || (temp & PORT_RESET)
 				|| (temp & PORT_PLS_MASK) >= XDEV_U3) {
 				xhci_warn(xhci, "USB core suspending port %d-%d not in U0/U1/U2\n",
@@ -1355,11 +1355,11 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			msleep(10); /* wait device to enter */
 			spin_lock_irqsave(&xhci->lock, flags);
 
-			temp = readl(port->addr);
+			temp = readl(&port->addr->portsc);
 			bus_state->suspended_ports |= 1 << wIndex;
 			break;
 		case USB_PORT_FEAT_LINK_STATE:
-			temp = readl(port->addr);
+			temp = readl(&port->addr->portsc);
 			/* Disable port */
 			if (link_state == USB_SS_PORT_LS_SS_DISABLED) {
 				xhci_dbg(xhci, "Disable port %d-%d\n",
@@ -1373,7 +1373,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 					PORT_OCC | PORT_RC | PORT_PLC |
 					PORT_CEC;
 				xhci_set_portsc(port, temp | PORT_PE);
-				temp = readl(port->addr);
+				temp = readl(&port->addr->portsc);
 				break;
 			}
 
@@ -1382,7 +1382,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				xhci_dbg(xhci, "Enable port %d-%d\n",
 					 hcd->self.busnum, portnum1);
 				xhci_set_link_state(xhci, port,	link_state);
-				temp = readl(port->addr);
+				temp = readl(&port->addr->portsc);
 				break;
 			}
 
@@ -1415,7 +1415,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 					 hcd->self.busnum, portnum1);
 				xhci_set_link_state(xhci, port, link_state);
 
-				temp = readl(port->addr);
+				temp = readl(&port->addr->portsc);
 				break;
 			}
 			/* Port must be enabled */
@@ -1463,7 +1463,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 					xhci_dbg(xhci, "missing U0 port change event for port %d-%d\n",
 						 hcd->self.busnum, portnum1);
 				spin_lock_irqsave(&xhci->lock, flags);
-				temp = readl(port->addr);
+				temp = readl(&port->addr->portsc);
 				break;
 			}
 
@@ -1481,12 +1481,12 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				spin_unlock_irqrestore(&xhci->lock, flags);
 				while (retries--) {
 					usleep_range(4000, 8000);
-					temp = readl(port->addr);
+					temp = readl(&port->addr->portsc);
 					if ((temp & PORT_PLS_MASK) == XDEV_U3)
 						break;
 				}
 				spin_lock_irqsave(&xhci->lock, flags);
-				temp = readl(port->addr);
+				temp = readl(&port->addr->portsc);
 				bus_state->suspended_ports |= 1 << wIndex;
 			}
 			break;
@@ -1503,36 +1503,36 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			temp = (temp | PORT_RESET);
 			xhci_set_portsc(port, temp);
 
-			temp = readl(port->addr);
+			temp = readl(&port->addr->portsc);
 			xhci_dbg(xhci, "set port reset, actual port %d-%d status  = 0x%x\n",
 				 hcd->self.busnum, portnum1, temp);
 			break;
 		case USB_PORT_FEAT_REMOTE_WAKE_MASK:
 			xhci_set_remote_wake_mask(xhci, port, wake_mask);
-			temp = readl(port->addr);
+			temp = readl(&port->addr->portsc);
 			xhci_dbg(xhci, "set port remote wake mask, actual port %d-%d status  = 0x%x\n",
 				 hcd->self.busnum, portnum1, temp);
 			break;
 		case USB_PORT_FEAT_BH_PORT_RESET:
 			temp |= PORT_WR;
 			xhci_set_portsc(port, temp);
-			temp = readl(port->addr);
+			temp = readl(&port->addr->portsc);
 			break;
 		case USB_PORT_FEAT_U1_TIMEOUT:
 			if (hcd->speed < HCD_USB3)
 				goto error;
-			temp = readl(port->addr + PORTPMSC);
+			temp = readl(&port->addr->portpmsc);
 			temp &= ~PORT_U1_TIMEOUT_MASK;
 			temp |= PORT_U1_TIMEOUT(timeout);
-			writel(temp, port->addr + PORTPMSC);
+			writel(temp, &port->addr->portpmsc);
 			break;
 		case USB_PORT_FEAT_U2_TIMEOUT:
 			if (hcd->speed < HCD_USB3)
 				goto error;
-			temp = readl(port->addr + PORTPMSC);
+			temp = readl(&port->addr->portpmsc);
 			temp &= ~PORT_U2_TIMEOUT_MASK;
 			temp |= PORT_U2_TIMEOUT(timeout);
-			writel(temp, port->addr + PORTPMSC);
+			writel(temp, &port->addr->portpmsc);
 			break;
 		case USB_PORT_FEAT_TEST:
 			/* 4.19.6 Port Test Modes (USB2 Test Mode) */
@@ -1548,7 +1548,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			goto error;
 		}
 		/* unblock any posted writes */
-		temp = readl(port->addr);
+		temp = readl(&port->addr->portsc);
 		break;
 	case ClearPortFeature:
 		if (!portnum1 || portnum1 > max_ports)
@@ -1557,7 +1557,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		port = ports[portnum1 - 1];
 
 		wIndex--;
-		temp = readl(port->addr);
+		temp = readl(&port->addr->portsc);
 		if (temp == ~(u32)0) {
 			xhci_hc_died(xhci);
 			retval = -ENODEV;
@@ -1567,7 +1567,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		temp = xhci_port_state_to_neutral(temp);
 		switch (wValue) {
 		case USB_PORT_FEAT_SUSPEND:
-			temp = readl(port->addr);
+			temp = readl(&port->addr->portsc);
 			xhci_dbg(xhci, "clear USB_PORT_FEAT_SUSPEND\n");
 			xhci_dbg(xhci, "PORTSC %04x\n", temp);
 			if (temp & PORT_RESET)
@@ -1682,7 +1682,7 @@ int xhci_hub_status_data(struct usb_hcd *hcd, char *buf)
 
 	/* For each port, did anything change?  If so, set that bit in buf. */
 	for (i = 0; i < max_ports; i++) {
-		temp = readl(ports[i]->addr);
+		temp = readl(&ports[i]->addr->portsc);
 		if (temp == ~(u32)0) {
 			xhci_hc_died(xhci);
 			retval = -ENODEV;
@@ -1751,7 +1751,7 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 		u32 t1, t2;
 		int retries = 10;
 retry:
-		t1 = readl(ports[port_index]->addr);
+		t1 = readl(&ports[port_index]->addr->portsc);
 		t2 = xhci_port_state_to_neutral(t1);
 		portsc_buf[port_index] = 0;
 
@@ -1850,7 +1850,7 @@ static bool xhci_port_missing_cas_quirk(struct xhci_port *port)
 {
 	u32 portsc;
 
-	portsc = readl(port->addr);
+	portsc = readl(&port->addr->portsc);
 
 	/* if any of these are set we are not stuck */
 	if (portsc & (PORT_CONNECT | PORT_CAS))
@@ -1865,7 +1865,7 @@ static bool xhci_port_missing_cas_quirk(struct xhci_port *port)
 	portsc |= PORT_WR;
 	xhci_set_portsc(port, portsc);
 	/* flush write */
-	readl(port->addr);
+	readl(&port->addr->portsc);
 	return true;
 }
 
@@ -1912,7 +1912,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 	}
 	port_index = max_ports;
 	while (port_index--) {
-		portsc = readl(ports[port_index]->addr);
+		portsc = readl(&ports[port_index]->addr->portsc);
 
 		/* warm reset CAS limited ports stuck in polling/compliance */
 		if ((xhci->quirks & XHCI_MISSING_CAS) &&
@@ -1963,7 +1963,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 
 	/* poll for U0 link state complete, both USB2 and USB3 */
 	for_each_set_bit(port_index, &bus_state->bus_suspended, BITS_PER_LONG) {
-		sret = xhci_handshake(ports[port_index]->addr, PORT_PLC,
+		sret = xhci_handshake(&ports[port_index]->addr->portsc, PORT_PLC,
 				      PORT_PLC, 10 * 1000);
 		if (sret) {
 			xhci_warn(xhci, "port %d-%d resume PLC timeout\n",
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index edd37108e5a8..bfd8e471d3c2 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2204,7 +2204,7 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 		return -ENOMEM;
 
 	for (i = 0; i < num_ports; i++) {
-		xhci->hw_ports[i].addr = &xhci->op_regs->port_regs[i].portsc;
+		xhci->hw_ports[i].addr = &xhci->op_regs->port_regs[i];
 		xhci->hw_ports[i].hw_portnum = i;
 
 		init_completion(&xhci->hw_ports[i].rexit_done);
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 4df8dfd13443..74d6a4f31956 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -891,7 +891,7 @@ static int xhci_pci_poweroff_late(struct usb_hcd *hcd, bool do_wakeup)
 
 	for (i = 0; i < HCS_MAX_PORTS(xhci->hcs_params1); i++) {
 		port = &xhci->hw_ports[i];
-		portsc = readl(port->addr);
+		portsc = readl(&port->addr->portsc);
 
 		if ((portsc & PORT_PLS_MASK) != XDEV_U3)
 			continue;
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ecd757d482c5..6241a8d28ab3 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2023,7 +2023,7 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 	hcd = port->rhub->hcd;
 	bus_state = &port->rhub->bus_state;
 	hcd_portnum = port->hcd_portnum;
-	portsc = readl(port->addr);
+	portsc = readl(&port->addr->portsc);
 
 	xhci_dbg(xhci, "Port change event, %d-%d, id %d, portsc: 0x%x\n",
 		 hcd->self.busnum, hcd_portnum + 1, port_id, portsc);
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 0c7af44d4dae..0ee5192f67fa 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1969,7 +1969,7 @@ static bool xhci_hub_ports_suspended(struct xhci_hub *hub)
 	u32 value;
 
 	for (i = 0; i < hub->num_ports; i++) {
-		value = readl(hub->ports[i]->addr);
+		value = readl(&hub->ports[i]->addr->portsc);
 		if ((value & PORT_PE) == 0)
 			continue;
 
@@ -2095,7 +2095,7 @@ static void tegra_xhci_enable_phy_sleepwalk_wake(struct tegra_xusb *tegra)
 			if (!is_host_mode_phy(tegra, i, j))
 				continue;
 
-			portsc = readl(rhub->ports[index]->addr);
+			portsc = readl(&rhub->ports[index]->addr->portsc);
 			speed = tegra_xhci_portsc_to_speed(tegra, portsc);
 			tegra_xusb_padctl_enable_phy_sleepwalk(padctl, phy, speed);
 			tegra_xusb_padctl_enable_phy_wake(padctl, phy);
@@ -2190,7 +2190,7 @@ static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool is_auto_resume)
 	for (i = 0; i < xhci->usb2_rhub.num_ports; i++) {
 		if (!xhci->usb2_rhub.ports[i])
 			continue;
-		portsc = readl(xhci->usb2_rhub.ports[i]->addr);
+		portsc = readl(&xhci->usb2_rhub.ports[i]->addr->portsc);
 		tegra->lp0_utmi_pad_mask &= ~BIT(i);
 		if (((portsc & PORT_PLS_MASK) == XDEV_U3) || ((portsc & DEV_SPEED_MASK) == XDEV_FS))
 			tegra->lp0_utmi_pad_mask |= BIT(i);
@@ -2712,7 +2712,7 @@ static int tegra_xhci_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value,
 		while (i--) {
 			if (!test_bit(i, &bus_state->resuming_ports))
 				continue;
-			portsc = readl(ports[i]->addr);
+			portsc = readl(&ports[i]->addr->portsc);
 			if ((portsc & PORT_PLS_MASK) == XDEV_RESUME)
 				tegra_phy_xusb_utmi_pad_power_on(
 					tegra_xusb_get_phy(tegra, "usb2", (int) i));
@@ -2730,7 +2730,7 @@ static int tegra_xhci_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value,
 			if (!index || index > rhub->num_ports)
 				return -EPIPE;
 			ports = rhub->ports;
-			portsc = readl(ports[port]->addr);
+			portsc = readl(&ports[port]->addr->portsc);
 			if (portsc & PORT_CONNECT)
 				tegra_phy_xusb_utmi_pad_power_on(phy);
 		}
@@ -2749,7 +2749,7 @@ static int tegra_xhci_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value,
 
 		if ((type_req == ClearPortFeature) && (value == USB_PORT_FEAT_C_CONNECTION)) {
 			ports = rhub->ports;
-			portsc = readl(ports[port]->addr);
+			portsc = readl(&ports[port]->addr->portsc);
 			if (!(portsc & PORT_CONNECT)) {
 				/* We don't suspend the PAD while HNP role swap happens on the OTG
 				 * port
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 0d380fb3fcd6..676441dc3141 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -44,7 +44,7 @@ MODULE_PARM_DESC(quirks, "Bit flags for quirks to be enabled as default");
 void xhci_set_portsc(struct xhci_port *port, u32 val)
 {
 	trace_xhci_set_portsc(port, val);
-	writel(val, port->addr);
+	writel(val, &port->addr->portsc);
 }
 
 static bool td_on_ring(struct xhci_td *td, struct xhci_ring *ring)
@@ -377,7 +377,7 @@ static void compliance_mode_recovery(struct timer_list *t)
 		return;
 
 	for (i = 0; i < rhub->num_ports; i++) {
-		temp = readl(rhub->ports[i]->addr);
+		temp = readl(&rhub->ports[i]->addr->portsc);
 		if ((temp & PORT_PLS_MASK) == USB_SS_PORT_LS_COMP_MOD) {
 			/*
 			 * Compliance Mode Detected. Letting USB Core
@@ -900,7 +900,7 @@ static void xhci_disable_hub_port_wake(struct xhci_hcd *xhci,
 	spin_lock_irqsave(&xhci->lock, flags);
 
 	for (i = 0; i < rhub->num_ports; i++) {
-		portsc = readl(rhub->ports[i]->addr);
+		portsc = readl(&rhub->ports[i]->addr->portsc);
 		t1 = xhci_port_state_to_neutral(portsc);
 		t2 = t1;
 
@@ -940,7 +940,7 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
 	port_index = xhci->usb2_rhub.num_ports;
 	ports = xhci->usb2_rhub.ports;
 	while (port_index--) {
-		portsc = readl(ports[port_index]->addr);
+		portsc = readl(&ports[port_index]->addr->portsc);
 		if (portsc & PORT_CHANGE_MASK ||
 		    (portsc & PORT_PLS_MASK) == XDEV_RESUME)
 			return true;
@@ -948,7 +948,7 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
 	port_index = xhci->usb3_rhub.num_ports;
 	ports = xhci->usb3_rhub.ports;
 	while (port_index--) {
-		portsc = readl(ports[port_index]->addr);
+		portsc = readl(&ports[port_index]->addr->portsc);
 		if (portsc & (PORT_CHANGE_MASK | PORT_CAS) ||
 		    (portsc & PORT_PLS_MASK) == XDEV_RESUME)
 			return true;
@@ -4619,7 +4619,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 {
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	struct xhci_port **ports;
-	__le32 __iomem	*pm_addr, *hlpm_addr;
+	struct xhci_port_regs __iomem *port_regs;
 	u32		pm_val, hlpm_val, field;
 	unsigned int	port_num;
 	unsigned long	flags;
@@ -4644,9 +4644,8 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 
 	ports = xhci->usb2_rhub.ports;
 	port_num = udev->portnum - 1;
-	pm_addr = ports[port_num]->addr + PORTPMSC;
-	pm_val = readl(pm_addr);
-	hlpm_addr = ports[port_num]->addr + PORTHLPMC;
+	port_regs = ports[port_num]->addr;
+	pm_val = readl(&port_regs->portpmsc);
 
 	xhci_dbg(xhci, "%s port %d USB2 hardware LPM\n",
 		 str_enable_disable(enable), port_num + 1);
@@ -4675,30 +4674,30 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 			spin_lock_irqsave(&xhci->lock, flags);
 
 			hlpm_val = xhci_calculate_usb2_hw_lpm_params(udev);
-			writel(hlpm_val, hlpm_addr);
+			writel(hlpm_val, &port_regs->porthlmpc);
 			/* flush write */
-			readl(hlpm_addr);
+			readl(&port_regs->porthlmpc);
 		} else {
 			hird = xhci_calculate_hird_besl(xhci, udev);
 		}
 
 		pm_val &= ~PORT_HIRD_MASK;
 		pm_val |= PORT_HIRD(hird) | PORT_RWE | PORT_L1DS(udev->slot_id);
-		writel(pm_val, pm_addr);
-		pm_val = readl(pm_addr);
+		writel(pm_val, &port_regs->portpmsc);
+		pm_val = readl(&port_regs->portpmsc);
 		pm_val |= PORT_HLE;
-		writel(pm_val, pm_addr);
+		writel(pm_val, &port_regs->portpmsc);
 		/* flush write */
-		readl(pm_addr);
+		readl(&port_regs->portpmsc);
 	} else {
 		pm_val &= ~(PORT_HLE | PORT_RWE | PORT_HIRD_MASK | PORT_L1DS_MASK);
-		writel(pm_val, pm_addr);
+		writel(pm_val, &port_regs->portpmsc);
 		/* flush write */
-		readl(pm_addr);
+		readl(&port_regs->portpmsc);
 		if (udev->usb2_hw_lpm_besl_capable) {
 			spin_unlock_irqrestore(&xhci->lock, flags);
 			xhci_change_max_exit_latency(xhci, udev, 0);
-			readl_poll_timeout(ports[port_num]->addr, pm_val,
+			readl_poll_timeout(&ports[port_num]->addr->portsc, pm_val,
 					   (pm_val & PORT_PLS_MASK) == XDEV_U0,
 					   100, 10000);
 			return 0;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 5b04757325c1..38edc430ee49 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -66,11 +66,6 @@ struct xhci_cap_regs {
 	/* Reserved up to (CAPLENGTH - 0x1C) */
 };
 
-#define PORTSC		0
-#define PORTPMSC	1
-#define PORTLI		2
-#define PORTHLPMC	3
-
 /*
  * struct xhci_port_regs - Host Controller USB Port Register Set. xHCI spec 5.4.8
  * @portsc:	Port Status and Control
@@ -1469,7 +1464,7 @@ struct xhci_port_cap {
 };
 
 struct xhci_port {
-	__le32 __iomem		*addr;
+	struct xhci_port_regs __iomem	*addr;
 	int			hw_portnum;
 	int			hcd_portnum;
 	struct xhci_hub		*rhub;
-- 
2.50.1


