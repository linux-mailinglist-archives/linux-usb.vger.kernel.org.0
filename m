Return-Path: <linux-usb+bounces-30724-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C01C6F596
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 811A734CBF0
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C8736C0BC;
	Wed, 19 Nov 2025 14:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyaoYEsO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFD536C0B1
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562313; cv=none; b=rXcvvJLtKJoauZDQDvorTPfG4X8H+BI03+U3Pr8OLDqaB3Rs5pEyRT7EsByrS3RgIwLUTBQhbri6NjL/5uKaBaI7vJqN03EOvmUZ41NYJ/zSK0CI7ZwsuIcpo9ecL2/YlLUhLmer+b3zUN7BhX9lTD10df9VSR2LwiiiOU/KLBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562313; c=relaxed/simple;
	bh=tfrhjcMjCiLjTN9Czqr9AkCP4PWmC35K+qaSUVTfftY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mEZ/Mon18qVjayAWZ3aX5zuZ3ZMjJIFOWoQzmYoiWgaHdXo5nKW4wzkgGFuzu+xlb58B5SFFa42ZR3OXH6BL1aIsFJMzSVAfRNpEL76TeKIKUee2HHpIjR7NOOIJb0Rq8I0ZvJa4NhMcZtdZulg4WbefapcxadecunUl0ypVi8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyaoYEsO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562312; x=1795098312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tfrhjcMjCiLjTN9Czqr9AkCP4PWmC35K+qaSUVTfftY=;
  b=kyaoYEsO6qo/TJprea8hHEO0OWXQMC/p9mcSWVnmbGHXiryshJItXySY
   Nm+rSUYv1Y7OhKKN25dGIjfMS6ED0FgEDbLIou1BrczViAqHL8fAl0396
   q94KCKpw9TsmU4fvE5UMghurO6omJruOjdksDWkW1o5uIglvB/kZeaysk
   I6ki/Gz5EVyZZUq/dFBS77uIGJEosExgB3lo3uJ6ExEvfgx+OCtQTsVMP
   k+Ulwsjw1QaNM36s82W0qFrbuawNKAJYU7GSqR0u6i0EmylYb4LcT+cya
   87X4j4wwotEewzOzsGQ04A/obii2ec/vAuxdXM61VCA+D0bGW1lzUx9C9
   Q==;
X-CSE-ConnectionGUID: kef6/Hc3RMCvV1l7Ecvp0A==
X-CSE-MsgGUID: qrNLQ9KLTs6f4ZCFt0bzqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645609"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645609"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:25:11 -0800
X-CSE-ConnectionGUID: ahMsj/NSRKaY/0CVslig9w==
X-CSE-MsgGUID: m41u/wp2TJCLrfYo286XOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221992268"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:25:09 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	"Rai, Amardeep" <amardeep.rai@intel.com>, Rai@web.codeaurora.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 23/23] usb: xhci: Add debugfs support for xHCI Port Link Info (PORTLI) register.
Date: Wed, 19 Nov 2025 16:24:17 +0200
Message-ID: <20251119142417.2820519-24-mathias.nyman@linux.intel.com>
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

From: "Rai, Amardeep" <amardeep.rai@intel.com>

Each xHCI roothub port has a Port Link Info (PORTLI) register that is
used by USB3 and eUSB2V2 ports.

USB3 ports show link error count, rx lane count, and tx lane count.

eUSB2V2 ports show Rx Data Rate (RDR) and Tx Data Rate (TDR).

Rx/Tx Data Rate is a multiple of USB2 2.0 HS 480 Mb/s data rates,
and is only valid if a eUSB2V2 device is connected (CCS=1).

0 = "USB 2.0 HS" normal HS 480 Mb/s, no eUSB2V2 in use
1 = "HS1" Assymetric eUSB2V2 where this direction runs normal 480Mb/s
2 = "HS2" 960Mb/s
...
10 = "HS10" 4.8 Gb/s, max eUSB2V2 rate

PORTLI is Reserved and preserve "RsvdP" for normal USB2 ports

Sample output of USB3 port PORTLI:
cat /sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port14/portli
0x00000000 LEC=0 RLC=0 TLC=0

Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
Co-developed-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-caps.h    |  4 +++-
 drivers/usb/host/xhci-debugfs.c | 34 +++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-port.h    |  5 +++++
 3 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index 52153c4a43a8..2f59b6ab1e45 100644
--- a/drivers/usb/host/xhci-caps.h
+++ b/drivers/usb/host/xhci-caps.h
@@ -115,4 +115,6 @@
 /* bit 10 - Rsvd */
 /* bit 11 - HC support Double BW on a eUSB2 HS ISOC EP */
 #define HCC2_EUSB2_DIC		BIT(11)
-/* bits 31:12 - Rsvd */
+/* bit 12 - HC support eUSB2V2 capability */
+#define HCC2_E2V2C		BIT(12)
+/* bits 31:13 - Rsvd */
diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 5322911576eb..c1eb1036ede9 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -383,6 +383,39 @@ static const struct file_operations port_fops = {
 	.release		= single_release,
 };
 
+static int xhci_portli_show(struct seq_file *s, void *unused)
+{
+	struct xhci_port	*port = s->private;
+	struct xhci_hcd		*xhci = hcd_to_xhci(port->rhub->hcd);
+	u32			portli;
+
+	portli = readl(&port->port_reg->portli);
+
+	/* PORTLI fields are valid if port is a USB3 or eUSB2V2 port */
+	if (port->rhub == &xhci->usb3_rhub)
+		seq_printf(s, "0x%08x LEC=%u RLC=%u TLC=%u\n", portli,
+			   PORT_LEC(portli), PORT_RX_LANES(portli), PORT_TX_LANES(portli));
+	else if (xhci->hcc_params2 & HCC2_E2V2C)
+		seq_printf(s, "0x%08x RDR=%u TDR=%u\n", portli,
+			   PORTLI_RDR(portli), PORTLI_TDR(portli));
+	else
+		seq_printf(s, "0x%08x RsvdP\n", portli);
+
+	return 0;
+}
+
+static int xhci_portli_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, xhci_portli_show, inode->i_private);
+}
+
+static const struct file_operations portli_fops = {
+	.open			= xhci_portli_open,
+	.read			= seq_read,
+	.llseek			= seq_lseek,
+	.release		= single_release,
+};
+
 static void xhci_debugfs_create_files(struct xhci_hcd *xhci,
 				      struct xhci_file_map *files,
 				      size_t nentries, void *data,
@@ -624,6 +657,7 @@ static void xhci_debugfs_create_ports(struct xhci_hcd *xhci,
 		dir = debugfs_create_dir(port_name, parent);
 		port = &xhci->hw_ports[i];
 		debugfs_create_file("portsc", 0644, dir, port, &port_fops);
+		debugfs_create_file("portli", 0444, dir, port, &portli_fops);
 	}
 }
 
diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index f19efb966d18..889b5fb0fcd8 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -144,9 +144,14 @@
 #define PORT_TEST_MODE_SHIFT	28
 
 /* USB3 Protocol PORTLI  Port Link Information */
+#define PORT_LEC(p)		((p) & 0xffff)
 #define PORT_RX_LANES(p)	(((p) >> 16) & 0xf)
 #define PORT_TX_LANES(p)	(((p) >> 20) & 0xf)
 
+/* eUSB2v2 protocol PORTLI Port Link information, RsvdP for normal USB2 */
+#define PORTLI_RDR(p)		((p) & 0xf)
+#define PORTLI_TDR(p)		(((p) >> 4) & 0xf)
+
 /* USB2 Protocol PORTHLPMC */
 #define PORT_HIRDM(p)((p) & 3)
 #define PORT_L1_TIMEOUT(p)(((p) & 0xff) << 2)
-- 
2.43.0


