Return-Path: <linux-usb+bounces-30706-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 15169C6F4FF
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CB3F74FA499
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39AFC369208;
	Wed, 19 Nov 2025 14:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHFjnWsF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE4B369202
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562285; cv=none; b=lzrFA3xMxkB4dFuYfBug18Sd2zr29a9M1bi51JTwQbK7iOg2u7CzusN0Uq9iRm1y4U7ItlA2Z27qdhau2P++/Jt1n5Hli+3yNs3NFh5WTNCGeEbsu3JNA0usZQYvyUqyrZtSF8Qm5Ndf98Rp+0N35b6KOjmXuj+7NftZEoLsA44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562285; c=relaxed/simple;
	bh=zgl68TYJCl82VQY9IR7Gcl98L4pqVBjrowEM8D4sXno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZWp4LRHNZJYY9jR9G1arcEv+mpSC6v/DgaUWE4Gwv1jiRqEnE6jFdbKTQpv03f+/Idvl+rSHpfKqqxW7k150jWEcl9jRVjbkOUlaJ3V4Rjs7oUHq5Xd3eov878GDywGCdW7kVQnyLpJLqpkw1uuhXxyDDHm0LPh27Z6m8SRBXNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHFjnWsF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562284; x=1795098284;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zgl68TYJCl82VQY9IR7Gcl98L4pqVBjrowEM8D4sXno=;
  b=HHFjnWsFYakZUTUQD29ScI8lXk5DHT3fjBwLibf+2ZtmEQSMeEfceoCx
   rYLZJnM0XiBdM1c5uIhZJKxlvyxK3rtiL+uO7pWQAzPZn34b9RGieVTpk
   VOcSrR2PE+cxSc9y8x9UOdvTq19UX0p2+i084xbAmr12jGx6BFGP5fple
   wGrp+1DrQf02KY+w/UkMacYRZ7HJouAKMXSm9/jhf6dGi1Z6Vg5RLuk84
   5yD8eLZmsnjPXCFnXd1vQFZTLQ2tgppiHa/1dEMvgYVBYXMwMVB0Dwt1f
   e20BOBcv/0n9N03Mgt15CzD16mIbMqCKVBh5y8Y9GMrqqtONIaq5+iHhD
   A==;
X-CSE-ConnectionGUID: oVs6ewgVTniIhfy7ARMsmQ==
X-CSE-MsgGUID: g9JhMXvhQZij2IaiQKtUwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645513"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645513"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:43 -0800
X-CSE-ConnectionGUID: vqGfLYIfQM6RGYurJMxa3Q==
X-CSE-MsgGUID: iGyPWNuhQI+glOBRNdLICA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221992004"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:41 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 05/23] usb: xhci: add tracing for PORTSC register writes
Date: Wed, 19 Nov 2025 16:23:59 +0200
Message-ID: <20251119142417.2820519-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
References: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Introduce a dedicated write function for the USB Port Register Set (PORTSC)
that includes tracing capabilities for values written to the PORTSC
register. This enhancement minimizes code duplication and improves
debugging.

The PORTSC register is part of the Host Controller USB Port Register Set,
comprising 4 x 32-bit registers. As the first register, PORTSC is accessed
directly via 'port->addr'. Future commits will introduce a dedicated Port
register struct to further streamline access.
By adding the xhci_portsc_writel() function prior to these changes, we
significantly reduce the number of same line modifications required.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c |  2 +-
 drivers/usb/host/xhci-hub.c     | 33 ++++++++++++++++-----------------
 drivers/usb/host/xhci-pci.c     |  2 +-
 drivers/usb/host/xhci-trace.h   |  5 +++++
 drivers/usb/host/xhci.c         |  9 ++++++++-
 drivers/usb/host/xhci.h         |  1 +
 6 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index c6d44977193f..df99fffc6120 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -367,7 +367,7 @@ static ssize_t xhci_port_write(struct file *file,  const char __user *ubuf,
 		portsc = xhci_port_state_to_neutral(portsc);
 		portsc &= ~PORT_PLS_MASK;
 		portsc |= PORT_LINK_STROBE | XDEV_COMP_MODE;
-		writel(portsc, port->addr);
+		xhci_portsc_writel(port, portsc);
 		spin_unlock_irqrestore(&xhci->lock, flags);
 	} else {
 		return -EINVAL;
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 5e1442e91743..d0300c097803 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -570,7 +570,7 @@ static void xhci_disable_port(struct xhci_hcd *xhci, struct xhci_port *port)
 	portsc = xhci_port_state_to_neutral(portsc);
 
 	/* Write 1 to disable the port */
-	writel(portsc | PORT_PE, port->addr);
+	xhci_portsc_writel(port, portsc | PORT_PE);
 
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
+	xhci_portsc_writel(port, port_status | status);
+	port_status = readl(port->addr);
 
 	xhci_dbg(xhci, "clear port%d %s change, portsc: 0x%x\n",
 		 wIndex + 1, port_change_bit, port_status);
@@ -659,11 +659,11 @@ static void xhci_set_port_power(struct xhci_hcd *xhci, struct xhci_port *port,
 
 	if (on) {
 		/* Power on */
-		writel(temp | PORT_POWER, port->addr);
+		xhci_portsc_writel(port, temp | PORT_POWER);
 		readl(port->addr);
 	} else {
 		/* Power off */
-		writel(temp & ~PORT_POWER, port->addr);
+		xhci_portsc_writel(port, temp & ~PORT_POWER);
 	}
 
 	spin_unlock_irqrestore(&xhci->lock, *flags);
@@ -805,7 +805,7 @@ void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
 	temp = xhci_port_state_to_neutral(portsc);
 	temp &= ~PORT_PLS_MASK;
 	temp |= PORT_LINK_STROBE | link_state;
-	writel(temp, port->addr);
+	xhci_portsc_writel(port, temp);
 
 	xhci_dbg(xhci, "Set port %d-%d link state, portsc: 0x%x, write 0x%x",
 		 port->rhub->hcd->self.busnum, port->hcd_portnum + 1,
@@ -835,7 +835,7 @@ static void xhci_set_remote_wake_mask(struct xhci_hcd *xhci,
 	else
 		temp &= ~PORT_WKOC_E;
 
-	writel(temp, port->addr);
+	xhci_portsc_writel(port, temp);
 }
 
 /* Test and clear port RWC bit */
@@ -848,7 +848,7 @@ void xhci_test_and_clear_bit(struct xhci_hcd *xhci, struct xhci_port *port,
 	if (temp & port_bit) {
 		temp = xhci_port_state_to_neutral(temp);
 		temp |= port_bit;
-		writel(temp, port->addr);
+		xhci_portsc_writel(port, temp);
 	}
 }
 
@@ -1371,7 +1371,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 				temp |= PORT_CSC | PORT_PEC | PORT_WRC |
 					PORT_OCC | PORT_RC | PORT_PLC |
 					PORT_CEC;
-				writel(temp | PORT_PE, port->addr);
+				xhci_portsc_writel(port, temp | PORT_PE);
 				temp = readl(port->addr);
 				break;
 			}
@@ -1500,7 +1500,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			break;
 		case USB_PORT_FEAT_RESET:
 			temp = (temp | PORT_RESET);
-			writel(temp, port->addr);
+			xhci_portsc_writel(port, temp);
 
 			temp = readl(port->addr);
 			xhci_dbg(xhci, "set port reset, actual port %d-%d status  = 0x%x\n",
@@ -1514,7 +1514,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			break;
 		case USB_PORT_FEAT_BH_PORT_RESET:
 			temp |= PORT_WR;
-			writel(temp, port->addr);
+			xhci_portsc_writel(port, temp);
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
+		xhci_portsc_writel(ports[port_index], portsc_buf[port_index]);
 	}
 	hcd->state = HC_STATE_SUSPENDED;
 	bus_state->next_statechange = jiffies + msecs_to_jiffies(10);
@@ -1863,7 +1862,7 @@ static bool xhci_port_missing_cas_quirk(struct xhci_port *port)
 	/* clear wakeup/change bits, and do a warm port reset */
 	portsc &= ~(PORT_RWC_BITS | PORT_CEC | PORT_WAKE_BITS);
 	portsc |= PORT_WR;
-	writel(portsc, port->addr);
+	xhci_portsc_writel(port, portsc);
 	/* flush write */
 	readl(port->addr);
 	return true;
@@ -1942,7 +1941,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 			}
 		/* disable wake for all ports, write new link state if needed */
 		portsc &= ~(PORT_RWC_BITS | PORT_CEC | PORT_WAKE_BITS);
-		writel(portsc, ports[port_index]->addr);
+		xhci_portsc_writel(ports[port_index], portsc);
 	}
 
 	/* USB2 specific resume signaling delay and U0 link state transition */
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index f67a4d956204..b1192648aee7 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -919,7 +919,7 @@ static int xhci_pci_poweroff_late(struct usb_hcd *hcd, bool do_wakeup)
 		xhci_dbg(xhci, "port %d-%d in U3 without wakeup, disable it\n",
 			 port->rhub->hcd->self.busnum, port->hcd_portnum + 1);
 		portsc = xhci_port_state_to_neutral(portsc);
-		writel(portsc | PORT_PE, port->addr);
+		xhci_portsc_writel(port, portsc | PORT_PE);
 	}
 
 	return 0;
diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 9abc904f1749..481becbcbf81 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -575,6 +575,11 @@ DEFINE_EVENT(xhci_log_portsc, xhci_hub_status_data,
 	     TP_ARGS(port, portsc)
 );
 
+DEFINE_EVENT(xhci_log_portsc, xhci_portsc_writel,
+	     TP_PROTO(struct xhci_port *port, u32 portsc),
+	     TP_ARGS(port, portsc)
+);
+
 DECLARE_EVENT_CLASS(xhci_log_doorbell,
 	TP_PROTO(u32 slot, u32 doorbell),
 	TP_ARGS(slot, doorbell),
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 0cb45b95e4f5..84e109dbabe8 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -41,6 +41,13 @@ static unsigned long long quirks;
 module_param(quirks, ullong, S_IRUGO);
 MODULE_PARM_DESC(quirks, "Bit flags for quirks to be enabled as default");
 
+void xhci_portsc_writel(struct xhci_port *port, u32 val)
+{
+	trace_xhci_portsc_writel(port, val);
+	writel(val, port->addr);
+}
+EXPORT_SYMBOL_GPL(xhci_portsc_writel);
+
 static bool td_on_ring(struct xhci_td *td, struct xhci_ring *ring)
 {
 	struct xhci_segment *seg;
@@ -909,7 +916,7 @@ static void xhci_disable_hub_port_wake(struct xhci_hcd *xhci,
 			t2 |= PORT_CSC;
 
 		if (t1 != t2) {
-			writel(t2, rhub->ports[i]->addr);
+			xhci_portsc_writel(rhub->ports[i], t2);
 			xhci_dbg(xhci, "config port %d-%d wake bits, portsc: 0x%x, write: 0x%x\n",
 				 rhub->hcd->self.busnum, i + 1, portsc, t2);
 		}
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 8e1311f90fdb..3b6b2d0d4c60 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1961,6 +1961,7 @@ void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num);
 int xhci_usb_endpoint_maxp(struct usb_device *udev,
 			   struct usb_host_endpoint *host_ep);
+void xhci_portsc_writel(struct xhci_port *port, u32 val);
 
 /* xHCI roothub code */
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
-- 
2.43.0


