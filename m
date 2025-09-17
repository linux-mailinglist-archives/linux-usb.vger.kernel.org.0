Return-Path: <linux-usb+bounces-28220-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B8AB7F1B6
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 15:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50745327321
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 13:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D87335922;
	Wed, 17 Sep 2025 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOxkOkjq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDBD32E752
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 12:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758113949; cv=none; b=KJU3sCH1c53bSmjlhyTEGL8MDGhkRlPbIbO3MtgGCLYohFwSAiZQis9LAp5xKg6rx0MXXRlYsWgpmUTJrOB5+x9G9JHEq3nKCsIFfCelysqcPEdDIrkvaDAvc6kzZUneDYmRWTIanv6BKVLGZbpgpK3YMoSg2rPhOjyRtYybmz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758113949; c=relaxed/simple;
	bh=uegbOAAoDAU0hYuOCx6+Iq3vVlv8kh2xG4mVCN1O2II=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBd/27muctXEAcgyiWnTB79Xq3Jm4Lk25ZGgCc8Eng+rBsamFVE5DnJO9AWJWsCuNsuaKnXAOGtEmm7CPZfKFSgmVwNako45iGWjR+BKdzLAh2pAtXDVF7a23pGTQFKDW+bKEH5RfG7NeHAVXI0GrU1yUcp2fynx6ABsSaDca8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOxkOkjq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758113947; x=1789649947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uegbOAAoDAU0hYuOCx6+Iq3vVlv8kh2xG4mVCN1O2II=;
  b=gOxkOkjq2BcdvIo0/7ri72WvX2gMTIoK6YtS+Bb7nbGL89Pmnpu5x5C9
   7+5Xa15P5nEqyOWz1CtUqTXckwnYn6KQ0DDkhzWWjaQ5Zr2RXtepHfBMQ
   /ao+/NjTuQR3x4ghOUSPYzIROHc2NOvcBk0/S+0ewf4oXZ6B9q3HVLHUn
   Snb7Bv6Jt1nfJiIqH8HCTe5fAvYajc2xK/g/WcRZflKtEJuZyyYZSLJBI
   5xGeZQbc0ICbiTiwKSVCH4xoc5tTkOOt7YdGkfj+WRBQZrJab6hRoUVGD
   6ZkBxeTu0WE1+rO1BkxZzUHDMF2q3d3J9cDo8ELZmvTiyiZN+Q6HgYKoA
   A==;
X-CSE-ConnectionGUID: 8gV4AwT4QwC+OXFR0WF+2g==
X-CSE-MsgGUID: iyF96av7Tlirn/RCDZQKEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60484588"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="60484588"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 05:59:05 -0700
X-CSE-ConnectionGUID: NzmxhukPSJ2Z5vgiC+BCbA==
X-CSE-MsgGUID: HEEbnlfVRN2tc3+ciZ9FuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="175159046"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 17 Sep 2025 05:59:04 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 5A9CB9B; Wed, 17 Sep 2025 14:59:03 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	peter.chen@kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 4/8] usb: xhci: add tracing for PORTSC register writes
Date: Wed, 17 Sep 2025 14:58:45 +0200
Message-ID: <20250917125850.3380560-5-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250917125850.3380560-1-niklas.neronin@linux.intel.com>
References: <20250917125850.3380560-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a dedicated write function for the USB Port Register Set
(PORTSC) that includes tracing capabilities for values written to the
PORTSC register. This enhancement minimizes code duplication and improves
debugging.

The PORTSC register is part of the Host Controller USB Port Register Set,
comprising 4 x 32-bit registers. As the first register, PORTSC is accessed
directly via 'port->addr'. Future commits will introduce a dedicated
Port register struct to further streamline access.
By adding the xhci_set_portsc() function prior to these changes, we
significantly reduce the number of same line modifications required.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c |  2 +-
 drivers/usb/host/xhci-hub.c     | 33 ++++++++++++++++-----------------
 drivers/usb/host/xhci-pci.c     |  2 +-
 drivers/usb/host/xhci-trace.h   |  5 +++++
 drivers/usb/host/xhci.c         |  8 +++++++-
 drivers/usb/host/xhci.h         |  1 +
 6 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index c6d44977193f..11edb5c54cfa 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -367,7 +367,7 @@ static ssize_t xhci_port_write(struct file *file,  const char __user *ubuf,
 		portsc = xhci_port_state_to_neutral(portsc);
 		portsc &= ~PORT_PLS_MASK;
 		portsc |= PORT_LINK_STROBE | XDEV_COMP_MODE;
-		writel(portsc, port->addr);
+		xhci_set_portsc(port, portsc);
 		spin_unlock_irqrestore(&xhci->lock, flags);
 	} else {
 		return -EINVAL;
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index b3a59ce1b3f4..b91883f8ec3f 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -570,7 +570,7 @@ static void xhci_disable_port(struct xhci_hcd *xhci, struct xhci_port *port)
 	portsc = xhci_port_state_to_neutral(portsc);
 
 	/* Write 1 to disable the port */
-	writel(portsc | PORT_PE, port->addr);
+	xhci_set_portsc(port, portsc | PORT_PE);
 
 	portsc = readl(port->addr);
 	xhci_dbg(xhci, "disable port %d-%d, portsc: 0x%x\n",
@@ -578,7 +578,7 @@ static void xhci_disable_port(struct xhci_hcd *xhci, struct xhci_port *port)
 }
 
 static void xhci_clear_port_change_bit(struct xhci_hcd *xhci, u16 wValue,
-		u16 wIndex, __le32 __iomem *addr, u32 port_status)
+		u16 wIndex, struct xhci_port *port, u32 port_status)
 {
 	char *port_change_bit;
 	u32 status;
@@ -621,8 +621,8 @@ static void xhci_clear_port_change_bit(struct xhci_hcd *xhci, u16 wValue,
 		return;
 	}
 	/* Change bits are all write 1 to clear */
-	writel(port_status | status, addr);
-	port_status = readl(addr);
+	xhci_set_portsc(port, port_status | status);
+	port_status = readl(port->addr);
 
 	xhci_dbg(xhci, "clear port%d %s change, portsc: 0x%x\n",
 		 wIndex + 1, port_change_bit, port_status);
@@ -659,11 +659,11 @@ static void xhci_set_port_power(struct xhci_hcd *xhci, struct xhci_port *port,
 
 	if (on) {
 		/* Power on */
-		writel(temp | PORT_POWER, port->addr);
+		xhci_set_portsc(port, temp | PORT_POWER);
 		readl(port->addr);
 	} else {
 		/* Power off */
-		writel(temp & ~PORT_POWER, port->addr);
+		xhci_set_portsc(port, temp & ~PORT_POWER);
 	}
 
 	spin_unlock_irqrestore(&xhci->lock, *flags);
@@ -805,7 +805,7 @@ void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
 	temp = xhci_port_state_to_neutral(portsc);
 	temp &= ~PORT_PLS_MASK;
 	temp |= PORT_LINK_STROBE | link_state;
-	writel(temp, port->addr);
+	xhci_set_portsc(port, temp);
 
 	xhci_dbg(xhci, "Set port %d-%d link state, portsc: 0x%x, write 0x%x",
 		 port->rhub->hcd->self.busnum, port->hcd_portnum + 1,
@@ -835,7 +835,7 @@ static void xhci_set_remote_wake_mask(struct xhci_hcd *xhci,
 	else
 		temp &= ~PORT_WKOC_E;
 
-	writel(temp, port->addr);
+	xhci_set_portsc(port, temp);
 }
 
 /* Test and clear port RWC bit */
@@ -848,7 +848,7 @@ void xhci_test_and_clear_bit(struct xhci_hcd *xhci, struct xhci_port *port,
 	if (temp & port_bit) {
 		temp = xhci_port_state_to_neutral(temp);
 		temp |= port_bit;
-		writel(temp, port->addr);
+		xhci_set_portsc(port, temp);
 	}
 }
 
@@ -1371,7 +1371,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				temp |= PORT_CSC | PORT_PEC | PORT_WRC |
 					PORT_OCC | PORT_RC | PORT_PLC |
 					PORT_CEC;
-				writel(temp | PORT_PE, port->addr);
+				xhci_set_portsc(port, temp | PORT_PE);
 				temp = readl(port->addr);
 				break;
 			}
@@ -1500,7 +1500,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			break;
 		case USB_PORT_FEAT_RESET:
 			temp = (temp | PORT_RESET);
-			writel(temp, port->addr);
+			xhci_set_portsc(port, temp);
 
 			temp = readl(port->addr);
 			xhci_dbg(xhci, "set port reset, actual port %d-%d status  = 0x%x\n",
@@ -1514,7 +1514,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			break;
 		case USB_PORT_FEAT_BH_PORT_RESET:
 			temp |= PORT_WR;
-			writel(temp, port->addr);
+			xhci_set_portsc(port, temp);
 			temp = readl(port->addr);
 			break;
 		case USB_PORT_FEAT_U1_TIMEOUT:
@@ -1603,8 +1603,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		case USB_PORT_FEAT_C_ENABLE:
 		case USB_PORT_FEAT_C_PORT_LINK_STATE:
 		case USB_PORT_FEAT_C_PORT_CONFIG_ERROR:
-			xhci_clear_port_change_bit(xhci, wValue, wIndex,
-					port->addr, temp);
+			xhci_clear_port_change_bit(xhci, wValue, wIndex, port, temp);
 			break;
 		case USB_PORT_FEAT_ENABLE:
 			xhci_disable_port(xhci, port);
@@ -1829,7 +1828,7 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 				spin_lock_irqsave(&xhci->lock, flags);
 			}
 		}
-		writel(portsc_buf[port_index], ports[port_index]->addr);
+		xhci_set_portsc(ports[port_index], portsc_buf[port_index]);
 	}
 	hcd->state = HC_STATE_SUSPENDED;
 	bus_state->next_statechange = jiffies + msecs_to_jiffies(10);
@@ -1863,7 +1862,7 @@ static bool xhci_port_missing_cas_quirk(struct xhci_port *port)
 	/* clear wakeup/change bits, and do a warm port reset */
 	portsc &= ~(PORT_RWC_BITS | PORT_CEC | PORT_WAKE_BITS);
 	portsc |= PORT_WR;
-	writel(portsc, port->addr);
+	xhci_set_portsc(port, portsc);
 	/* flush write */
 	readl(port->addr);
 	return true;
@@ -1942,7 +1941,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 			}
 		/* disable wake for all ports, write new link state if needed */
 		portsc &= ~(PORT_RWC_BITS | PORT_CEC | PORT_WAKE_BITS);
-		writel(portsc, ports[port_index]->addr);
+		xhci_set_portsc(ports[port_index], portsc);
 	}
 
 	/* USB2 specific resume signaling delay and U0 link state transition */
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 00fac8b233d2..4df8dfd13443 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -912,7 +912,7 @@ static int xhci_pci_poweroff_late(struct usb_hcd *hcd, bool do_wakeup)
 		xhci_dbg(xhci, "port %d-%d in U3 without wakeup, disable it\n",
 			 port->rhub->hcd->self.busnum, port->hcd_portnum + 1);
 		portsc = xhci_port_state_to_neutral(portsc);
-		writel(portsc | PORT_PE, port->addr);
+		xhci_set_portsc(port, portsc | PORT_PE);
 	}
 
 	return 0;
diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 9abc904f1749..4d3abacf92c7 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -575,6 +575,11 @@ DEFINE_EVENT(xhci_log_portsc, xhci_hub_status_data,
 	     TP_ARGS(port, portsc)
 );
 
+DEFINE_EVENT(xhci_log_portsc, xhci_set_portsc,
+	     TP_PROTO(struct xhci_port *port, u32 portsc),
+	     TP_ARGS(port, portsc)
+);
+
 DECLARE_EVENT_CLASS(xhci_log_doorbell,
 	TP_PROTO(u32 slot, u32 doorbell),
 	TP_ARGS(slot, doorbell),
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 742c23826e17..c7ed662d9f65 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -41,6 +41,12 @@ static unsigned long long quirks;
 module_param(quirks, ullong, S_IRUGO);
 MODULE_PARM_DESC(quirks, "Bit flags for quirks to be enabled as default");
 
+void xhci_set_portsc(struct xhci_port *port, u32 val)
+{
+	trace_xhci_set_portsc(port, val);
+	writel(val, port->addr);
+}
+
 static bool td_on_ring(struct xhci_td *td, struct xhci_ring *ring)
 {
 	struct xhci_segment *seg;
@@ -909,7 +915,7 @@ static void xhci_disable_hub_port_wake(struct xhci_hcd *xhci,
 			t2 |= PORT_CSC;
 
 		if (t1 != t2) {
-			writel(t2, rhub->ports[i]->addr);
+			xhci_set_portsc(rhub->ports[i], t2);
 			xhci_dbg(xhci, "config port %d-%d wake bits, portsc: 0x%x, write: 0x%x\n",
 				 rhub->hcd->self.busnum, i + 1, portsc, t2);
 		}
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 7a245745b289..065478086f76 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1958,6 +1958,7 @@ void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 			      struct xhci_interrupter *ir,
 			      bool clear_ehb);
 void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num);
+void xhci_set_portsc(struct xhci_port *port, u32 val);
 
 /* xHCI roothub code */
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
-- 
2.50.1


