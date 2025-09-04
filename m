Return-Path: <linux-usb+bounces-27554-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67348B440D3
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 17:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D6E6A42D2F
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 15:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223F0286D57;
	Thu,  4 Sep 2025 15:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5oaqq9Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD41928134C
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 15:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757000624; cv=none; b=pW28hChgA7rQAl1I5dYEh09qQ9Opl9vJovsDoiQ1PpTIKwF8aPjv+cQwg3z1ZwmuZa08x0HSI8plVffDuCc9H+xY3AeBSQUJrSaDc3IffdiKmjYK3P0BbfttnhvICwtPaObNyxuAQHhGA3XMqhXs6woYOAh9tpodUMCzfrbDhQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757000624; c=relaxed/simple;
	bh=OCS1VfaGJ4qJ026fA0aV2B9JrPi2NFc0YLi8VtHuNjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bsXhPDIAL65ntmJgxGK9FjQ33GnaCUlCPTN/02QZunOU41/SzVCso2OQ+U8U1GOWBqpppWYlXOMqIGYma+ahqmMm6Rx4WLEu1BrPPHkUCTrV3HkPO+eC6gRLLu6DxluemhDwbDW8MUMN8Uw2i8TCIbObCpKqNMHJO5dU5VKci9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5oaqq9Q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757000622; x=1788536622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OCS1VfaGJ4qJ026fA0aV2B9JrPi2NFc0YLi8VtHuNjc=;
  b=H5oaqq9Q3p4TYo9GFS7COJihC29Y2ArNNl/sUj0OZQopLaoTJtpf+3Pj
   DuCFrXFq4iudHdH2J4KBy7Xg+SC454azpGBC8K8UzCaQwYMm/Z35MUexj
   eSGxIS9zZSTrCh/n6Jtk72/CmLRU3D3k4Cu3sQESjFD6YxBHIDEniOIjG
   AfOUlcSQULZ7BMad8eP8fIiR5+3n3/0sWbjZ9YWCz61XuJF6867XzPJaQ
   vdcf5lS0XNT5XnnVgXTcAn5ESJIPsBqCx1XwtLF/AJV2EIoNNodqapKA5
   seNP6a7gYa60Wfq9KTbOQZvuYe1F413pUVfg0BgUw/z6vx6h7ym6DPDqW
   g==;
X-CSE-ConnectionGUID: 40h/FSPDRc6bbgcBc3fjmg==
X-CSE-MsgGUID: nfaB+K1YQoO+X3f6wl33Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59492532"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="59492532"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 08:43:41 -0700
X-CSE-ConnectionGUID: Hkhgf6+4RlKXFAiI9JjUmQ==
X-CSE-MsgGUID: 903Luk3YTL+wvuvfrIYDug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="172288307"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 04 Sep 2025 08:43:40 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 7087494; Thu, 04 Sep 2025 17:43:39 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 4/7] usb: xhci: add tracing for PORTCS register writes
Date: Thu,  4 Sep 2025 17:42:17 +0200
Message-ID: <20250904154221.2314596-5-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250904154221.2314596-1-niklas.neronin@linux.intel.com>
References: <20250904154221.2314596-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a dedicated write function for the USB Port Register Set
(PORTCS) that includes tracing capabilities for values written to the
PORTCS register. This enhancement minimizes code duplication and improves
debugging.

The PORTCS register is part of the Host Controller USB Port Register Set,
comprising 4 x 32-bit registers. As the first register, PORTCS is accessed
directly via 'port->addr'. Future commits will introduce a dedicated
Port register struct to further streamline access.
By adding the xhci_set_portcs() function prior to these changes, we
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
index 92bb84f8132a..155fb9159934 100644
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
@@ -806,7 +806,7 @@ void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
 	temp = xhci_port_state_to_neutral(portsc);
 	temp &= ~PORT_PLS_MASK;
 	temp |= PORT_LINK_STROBE | link_state;
-	writel(temp, port->addr);
+	xhci_set_portsc(port, temp);
 
 	xhci_dbg(xhci, "Set port %d-%d link state, portsc: 0x%x, write 0x%x",
 		 port->rhub->hcd->self.busnum, port->hcd_portnum + 1,
@@ -836,7 +836,7 @@ static void xhci_set_remote_wake_mask(struct xhci_hcd *xhci,
 	else
 		temp &= ~PORT_WKOC_E;
 
-	writel(temp, port->addr);
+	xhci_set_portsc(port, temp);
 }
 
 /* Test and clear port RWC bit */
@@ -849,7 +849,7 @@ void xhci_test_and_clear_bit(struct xhci_hcd *xhci, struct xhci_port *port,
 	if (temp & port_bit) {
 		temp = xhci_port_state_to_neutral(temp);
 		temp |= port_bit;
-		writel(temp, port->addr);
+		xhci_set_portsc(port, temp);
 	}
 }
 
@@ -1372,7 +1372,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				temp |= PORT_CSC | PORT_PEC | PORT_WRC |
 					PORT_OCC | PORT_RC | PORT_PLC |
 					PORT_CEC;
-				writel(temp | PORT_PE, port->addr);
+				xhci_set_portsc(port, temp | PORT_PE);
 				temp = readl(port->addr);
 				break;
 			}
@@ -1501,7 +1501,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			break;
 		case USB_PORT_FEAT_RESET:
 			temp = (temp | PORT_RESET);
-			writel(temp, port->addr);
+			xhci_set_portsc(port, temp);
 
 			temp = readl(port->addr);
 			xhci_dbg(xhci, "set port reset, actual port %d-%d status  = 0x%x\n",
@@ -1515,7 +1515,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			break;
 		case USB_PORT_FEAT_BH_PORT_RESET:
 			temp |= PORT_WR;
-			writel(temp, port->addr);
+			xhci_set_portsc(port, temp);
 			temp = readl(port->addr);
 			break;
 		case USB_PORT_FEAT_U1_TIMEOUT:
@@ -1604,8 +1604,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 		case USB_PORT_FEAT_C_ENABLE:
 		case USB_PORT_FEAT_C_PORT_LINK_STATE:
 		case USB_PORT_FEAT_C_PORT_CONFIG_ERROR:
-			xhci_clear_port_change_bit(xhci, wValue, wIndex,
-					port->addr, temp);
+			xhci_clear_port_change_bit(xhci, wValue, wIndex, port, temp);
 			break;
 		case USB_PORT_FEAT_ENABLE:
 			xhci_disable_port(xhci, port);
@@ -1830,7 +1829,7 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
 				spin_lock_irqsave(&xhci->lock, flags);
 			}
 		}
-		writel(portsc_buf[port_index], ports[port_index]->addr);
+		xhci_set_portsc(ports[port_index], portsc_buf[port_index]);
 	}
 	hcd->state = HC_STATE_SUSPENDED;
 	bus_state->next_statechange = jiffies + msecs_to_jiffies(10);
@@ -1864,7 +1863,7 @@ static bool xhci_port_missing_cas_quirk(struct xhci_port *port)
 	/* clear wakeup/change bits, and do a warm port reset */
 	portsc &= ~(PORT_RWC_BITS | PORT_CEC | PORT_WAKE_BITS);
 	portsc |= PORT_WR;
-	writel(portsc, port->addr);
+	xhci_set_portsc(port, portsc);
 	/* flush write */
 	readl(port->addr);
 	return true;
@@ -1943,7 +1942,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
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
index 47151ca527bf..0d380fb3fcd6 100644
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
@@ -907,7 +913,7 @@ static void xhci_disable_hub_port_wake(struct xhci_hcd *xhci,
 			t2 |= PORT_CSC;
 
 		if (t1 != t2) {
-			writel(t2, rhub->ports[i]->addr);
+			xhci_set_portsc(rhub->ports[i], t2);
 			xhci_dbg(xhci, "config port %d-%d wake bits, portsc: 0x%x, write: 0x%x\n",
 				 rhub->hcd->self.busnum, i + 1, portsc, t2);
 		}
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index f37965e64fd5..20bc5ae3500d 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1957,6 +1957,7 @@ void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 			      struct xhci_interrupter *ir,
 			      bool clear_ehb);
 void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num);
+void xhci_set_portsc(struct xhci_port *port, u32 val);
 
 /* xHCI roothub code */
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
-- 
2.50.1


