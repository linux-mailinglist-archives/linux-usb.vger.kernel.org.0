Return-Path: <linux-usb+bounces-24004-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2BFAB88BF
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11EB87B22E8
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6061DE3B5;
	Thu, 15 May 2025 13:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEsajQuh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4722E20C47C
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317430; cv=none; b=pzAdd919qvRKstba5T09IBJ3cF0EglCg7qmbB+4Gb5xhS7O/D5haCLL4pO6y0Xv+rPFUsWCChinbTM62QA0SQaqZ0KbY5hfEKBjLDUdiaqlaqei/dkyH37Ox3U/F2qCn+VJoDEDbn22DmsZqwwiNqPabvSC+qoBuaWb8bLPYkls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317430; c=relaxed/simple;
	bh=OPYAJ6P7PxPxXwYkuk5OUY5zNJFkKO37Ga+TLCNsGc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bMfsgy54RXQKkrHVeRoJ77jxazDHMcE683lmdXFb/wB7vy2u+TmhlkoC0JzmU7rzkeYuF0z6hdC9b6fmqLpy+MEGDrD+wyKyRdAvBORNox9J2aEnk0JeyU9rX+gwv2Lxp6DUU+iuPACsDLk8ZSgHnltdJuBN2wod8bKXegqy9Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEsajQuh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317430; x=1778853430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OPYAJ6P7PxPxXwYkuk5OUY5zNJFkKO37Ga+TLCNsGc4=;
  b=aEsajQuhn1oYEuRbH8X2MaZGxCsUI8fQwai29aYeXcs7cSAvnNDVXsaL
   RrPFfw04Ub6+eUrTgcowJMeRzPKQGi9JZZGmAJeCB1jb57cheK3Vlg450
   CimWNsyBiUhRhNVwVR/zTXX2UthEj3GV/AG98ngXacNMHc3hHDZB4fR44
   BZ2vMOOmVE/4wcHPBLyxj0/u8Gmv6CMHeNZKUXf4O1plftvq6HAky1biP
   4OF42xk7J9vP7lm9j3JTCFRJVyes3iVGEUo/E0yb0OlxdaI/ckPhUifX3
   Q0KkaOllFbctlKJGSbT8LBwThPdgb0kItPpTS0s30LM8WrxfZKmhmnAdJ
   w==;
X-CSE-ConnectionGUID: LKpt9qf6QtOaF5njXrLmrQ==
X-CSE-MsgGUID: 63ChEpOsQX6dqrjRquA2Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270117"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270117"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:57:09 -0700
X-CSE-ConnectionGUID: wKBCMOCZQhqzQ8i062Mz5g==
X-CSE-MsgGUID: YALbe7knSwGUF6QtTlBw5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372463"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:57:07 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 24/24] xhci: Add host support for eUSB2 double isochronous bandwidth devices
Date: Thu, 15 May 2025 16:56:21 +0300
Message-ID: <20250515135621.335595-25-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Amardeep Rai <amardeep.rai@intel.com>

Detect eUSB2 double isoc bw capable hosts and devices, and set the proper
xhci endpoint context values such as 'Mult', 'Max Burst Size', and 'Max
ESIT Payload' to enable the double isochronous bandwidth endpoints.

Intel xHC uses the endpoint context 'Mult' field for eUSB2 isoc
endpoints even if hosts supporting Large ESIT Payload Capability should
normally ignore the mult field.

Signed-off-by: Amardeep Rai <amardeep.rai@intel.com>
Co-developed-by: Kannappan R <r.kannappan@intel.com>
Signed-off-by: Kannappan R <r.kannappan@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-caps.h |  2 ++
 drivers/usb/host/xhci-mem.c  | 62 ++++++++++++++++++++++++++++--------
 drivers/usb/host/xhci-ring.c |  6 ++--
 drivers/usb/host/xhci.c      | 17 +++++++++-
 drivers/usb/host/xhci.h      | 19 +++++++++++
 5 files changed, 89 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index 4b8ff4815644..723a56052439 100644
--- a/drivers/usb/host/xhci-caps.h
+++ b/drivers/usb/host/xhci-caps.h
@@ -89,3 +89,5 @@
 #define HCC2_GSC(p)             ((p) & (1 << 8))
 /* true: HC support Virtualization Based Trusted I/O Capability */
 #define HCC2_VTC(p)             ((p) & (1 << 9))
+/* true: HC support Double BW on a eUSB2 HS ISOC EP */
+#define HCC2_EUSB2_DIC(p)	((p) & (1 << 11))
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index bd745a0f2f78..494f9eacab84 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1328,18 +1328,36 @@ static unsigned int xhci_get_endpoint_interval(struct usb_device *udev,
 	return interval;
 }
 
-/* The "Mult" field in the endpoint context is only set for SuperSpeed isoc eps.
+/*
+ * xHCs without LEC use the "Mult" field in the endpoint context for SuperSpeed
+ * isoc eps, and High speed isoc eps that support bandwidth doubling. Standard
  * High speed endpoint descriptors can define "the number of additional
  * transaction opportunities per microframe", but that goes in the Max Burst
  * endpoint context field.
  */
-static u32 xhci_get_endpoint_mult(struct usb_device *udev,
-		struct usb_host_endpoint *ep)
+static u32 xhci_get_endpoint_mult(struct xhci_hcd *xhci,
+				  struct usb_device *udev,
+				  struct usb_host_endpoint *ep)
 {
-	if (udev->speed < USB_SPEED_SUPER ||
-			!usb_endpoint_xfer_isoc(&ep->desc))
+	bool lec;
+
+	/* xhci 1.1 with LEC set does not use mult field, except intel eusb2 */
+	lec = xhci->hci_version > 0x100 && HCC2_LEC(xhci->hcc_params2);
+
+	/* eusb2 double isoc bw devices are the only usb2 devices using mult */
+	if (xhci_eusb2_is_isoc_bw_double(udev, ep)) {
+		if (!lec || xhci->quirks & XHCI_INTEL_HOST)
+			return 1;
+	}
+
+	/* Oherwise only isoc transfers on hosts without LEC uses mult field */
+	if (!usb_endpoint_xfer_isoc(&ep->desc) || lec)
 		return 0;
-	return ep->ss_ep_comp.bmAttributes;
+
+	if (udev->speed >= USB_SPEED_SUPER)
+		return ep->ss_ep_comp.bmAttributes;
+
+	return 0;
 }
 
 static u32 xhci_get_endpoint_max_burst(struct usb_device *udev,
@@ -1351,8 +1369,18 @@ static u32 xhci_get_endpoint_max_burst(struct usb_device *udev,
 
 	if (udev->speed == USB_SPEED_HIGH &&
 	    (usb_endpoint_xfer_isoc(&ep->desc) ||
-	     usb_endpoint_xfer_int(&ep->desc)))
-		return usb_endpoint_maxp_mult(&ep->desc) - 1;
+	     usb_endpoint_xfer_int(&ep->desc))) {
+		if (xhci_eusb2_is_isoc_bw_double(udev, ep))
+			/*
+			 * eUSB2 double isoc bw endpoints max packet field
+			 * service opportunity bits 12:11 are not valid, so set
+			 * the ctx burst to max service opportunity "2" as these
+			 * eps support transferring over 3072 bytes per interval
+			 */
+			return 2;
+		else
+			return usb_endpoint_maxp_mult(&ep->desc) - 1;
+	}
 
 	return 0;
 }
@@ -1400,6 +1428,10 @@ static u32 xhci_get_max_esit_payload(struct usb_device *udev,
 	if (udev->speed >= USB_SPEED_SUPER)
 		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
 
+	/* High speed eusb2 double isoc bw with over 3072 bytes per esit */
+	if (xhci_eusb2_is_isoc_bw_double(udev, ep))
+		return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
+
 	max_packet = usb_endpoint_maxp(&ep->desc);
 	max_burst = usb_endpoint_maxp_mult(&ep->desc);
 	/* A 0 in max burst means 1 transfer per ESIT */
@@ -1437,6 +1469,13 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 
 	ring_type = usb_endpoint_type(&ep->desc);
 
+	/* Ensure host supports double isoc bandwidth for eusb2 devices */
+	if (xhci_eusb2_is_isoc_bw_double(udev, ep) &&
+	    !HCC2_EUSB2_DIC(xhci->hcc_params2))	{
+		dev_dbg(&udev->dev, "Double Isoc Bandwidth not supported by xhci\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * Get values to fill the endpoint context, mostly from ep descriptor.
 	 * The average TRB buffer lengt for bulk endpoints is unclear as we
@@ -1456,8 +1495,8 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 		}
 	}
 
-	mult = xhci_get_endpoint_mult(udev, ep);
-	max_packet = usb_endpoint_maxp(&ep->desc);
+	mult = xhci_get_endpoint_mult(xhci, udev, ep);
+	max_packet = xhci_usb_endpoint_maxp(udev, ep);
 	max_burst = xhci_get_endpoint_max_burst(udev, ep);
 	avg_trb_len = max_esit_payload;
 
@@ -1478,9 +1517,6 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 	/* xHCI 1.0 and 1.1 indicates that ctrl ep avg TRB Length should be 8 */
 	if (usb_endpoint_xfer_control(&ep->desc) && xhci->hci_version >= 0x100)
 		avg_trb_len = 8;
-	/* xhci 1.1 with LEC support doesn't use mult field, use RsvdZ */
-	if ((xhci->hci_version > 0x100) && HCC2_LEC(xhci->hcc_params2))
-		mult = 0;
 
 	/* Set up the endpoint ring */
 	virt_dev->eps[ep_index].new_ring =
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index eff6b84dc915..f94626d8bcce 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3549,7 +3549,7 @@ static u32 xhci_td_remainder(struct xhci_hcd *xhci, int transferred,
 	if ((xhci->quirks & XHCI_MTK_HOST) && (xhci->hci_version < 0x100))
 		trb_buff_len = 0;
 
-	maxp = usb_endpoint_maxp(&urb->ep->desc);
+	maxp = xhci_usb_endpoint_maxp(urb->dev, urb->ep);
 	total_packet_count = DIV_ROUND_UP(td_total_len, maxp);
 
 	/* Queueing functions don't count the current TRB into transferred */
@@ -3566,7 +3566,7 @@ static int xhci_align_td(struct xhci_hcd *xhci, struct urb *urb, u32 enqd_len,
 	u32 new_buff_len;
 	size_t len;
 
-	max_pkt = usb_endpoint_maxp(&urb->ep->desc);
+	max_pkt = xhci_usb_endpoint_maxp(urb->dev, urb->ep);
 	unalign = (enqd_len + *trb_buff_len) % max_pkt;
 
 	/* we got lucky, last normal TRB data on segment is packet aligned */
@@ -4137,7 +4137,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		addr = start_addr + urb->iso_frame_desc[i].offset;
 		td_len = urb->iso_frame_desc[i].length;
 		td_remain_len = td_len;
-		max_pkt = usb_endpoint_maxp(&urb->ep->desc);
+		max_pkt = xhci_usb_endpoint_maxp(urb->dev, urb->ep);
 		total_pkt_count = DIV_ROUND_UP(td_len, max_pkt);
 
 		/* A zero-length transfer still involves at least one packet. */
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 9769c68b2e9f..2ac383929b1c 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1353,7 +1353,7 @@ static bool xhci_urb_temp_buffer_required(struct usb_hcd *hcd,
 	struct scatterlist *tail_sg;
 
 	tail_sg = urb->sg;
-	max_pkt = usb_endpoint_maxp(&urb->ep->desc);
+	max_pkt = xhci_usb_endpoint_maxp(urb->dev, urb->ep);
 
 	if (!urb->num_sgs)
 		return ret;
@@ -2940,6 +2940,21 @@ int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep, int
 }
 EXPORT_SYMBOL_GPL(xhci_stop_endpoint_sync);
 
+/*
+ * xhci_usb_endpoint_maxp - get endpoint max packet size
+ * @host_ep: USB host endpoint to be checked
+ *
+ * Returns max packet from the correct descriptor
+ */
+
+int xhci_usb_endpoint_maxp(struct usb_device *udev,
+			   struct usb_host_endpoint *host_ep)
+{
+	if (xhci_eusb2_is_isoc_bw_double(udev, host_ep))
+		return le16_to_cpu(host_ep->eusb2_isoc_ep_comp.wMaxPacketSize);
+	return usb_endpoint_maxp(&host_ep->desc);
+}
+
 /* Issue a configure endpoint command or evaluate context command
  * and wait for it to finish.
  */
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 49887a303e43..e0c5238c9327 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1735,6 +1735,23 @@ static inline bool xhci_has_one_roothub(struct xhci_hcd *xhci)
 	       (!xhci->usb2_rhub.num_ports || !xhci->usb3_rhub.num_ports);
 }
 
+/*
+ * USB 2.0 specification, chapter 5.6.4 Isochronous Transfer Bus Access
+ * Constraint. A high speed endpoint can move up to 3072 bytes per microframe
+ * (or 192Mb/s).
+ */
+#define MAX_ISOC_XFER_SIZE_HS  3072
+
+static inline bool xhci_eusb2_is_isoc_bw_double(struct usb_device *udev,
+						struct usb_host_endpoint *ep)
+{
+	return le16_to_cpu(udev->descriptor.bcdUSB) == 0x220 &&
+		usb_endpoint_xfer_isoc(&ep->desc) &&
+		le16_to_cpu(ep->desc.wMaxPacketSize) == 0 &&
+		le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval) >
+		MAX_ISOC_XFER_SIZE_HS;
+}
+
 #define xhci_dbg(xhci, fmt, args...) \
 	dev_dbg(xhci_to_hcd(xhci)->self.controller , fmt , ## args)
 #define xhci_err(xhci, fmt, args...) \
@@ -1958,6 +1975,8 @@ void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 			      struct xhci_interrupter *ir,
 			      bool clear_ehb);
 void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num);
+int xhci_usb_endpoint_maxp(struct usb_device *udev,
+			   struct usb_host_endpoint *host_ep);
 
 /* xHCI roothub code */
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
-- 
2.43.0


