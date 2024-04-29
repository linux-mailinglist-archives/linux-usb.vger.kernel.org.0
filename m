Return-Path: <linux-usb+bounces-9894-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4068B5AB1
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDC2D1C21598
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 14:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34292757FF;
	Mon, 29 Apr 2024 14:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YnthhJx/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A08D745ED
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 14:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399260; cv=none; b=kVzXVwUHC9EqTNVtwyNqPAjVKKeCnHGZoMtytat4yjuuehLCMRUTEutxnVM8avEfxVSOqJ5DXMDWsgqi2A5pJlwRvh78WBwsr4n98u0xJX+ihG5PdhH9xtDWZN6N703aoh6yEIyNDTunUsbL4g0czLT8Sv96ectAfu16Yz8id60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399260; c=relaxed/simple;
	bh=uBHpdgfXYDHqqLUzjS9tEh9OLd8olCrWwN/k2zfznaw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IdLFHonUhX35At8YEZu2pYqNbZvcPARYb0cSrE+BBM3dgH7KmCdOOIznVL887S4F+m3J76nzxrqGYsWkg92d4Xx3YPVeXM7auxLaZCo38EqLJiYoj9tP5TCmiOHKMka1X8S3AafusjFLl9OXpGAwRg403D6sCZAEMea5DPsDtig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YnthhJx/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399259; x=1745935259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uBHpdgfXYDHqqLUzjS9tEh9OLd8olCrWwN/k2zfznaw=;
  b=YnthhJx/2h2ShfO61s3WFMnnFU6OILuoLP6vROxgyykG8ZRaB+z0x0dM
   /nsUzgYh074ZsW+vt+JroKeg6LWe98sMdbO6CleE8S2LZH0hfATMii0RV
   qdqKj5JW+0QXYZWB/LbiEHhHDIdWpMReT2v5CrchZVYWHDWK3IwLhyizH
   m44Ika/nfVE//fr6lw6ymlyOO9Fj8MbIcr6qT7StVczdUNAMlbGNRdCeI
   z9UAAN0fpmOA93KLAXOi08zxIQBWKJYz7IaIvj1/ugK10UNIM5CAizSaQ
   ufOSNyFohxjWUkR40guZCjhmP1DMV4zc7jr0vVXR2Yq/vMyckxz8/p8wM
   A==;
X-CSE-ConnectionGUID: AyKjQpmZRvyqdUfTDqVznQ==
X-CSE-MsgGUID: syCZyPiAS06nFwwrkA5s5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9911380"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9911380"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:00:58 -0700
X-CSE-ConnectionGUID: uh6h8/jCT+2pjww/ej8Dxg==
X-CSE-MsgGUID: 8/uECPFxROqrV5/8PyPpRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26521646"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 07:00:56 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 01/18] xhci: stored cached port capability values in one place
Date: Mon, 29 Apr 2024 17:02:28 +0300
Message-Id: <20240429140245.3955523-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
References: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Port capability flags for USB2 ports have been cached in an
u32 xhci->ext_caps[] array long before the driver had struct xhci_port
and struct xhci_port_cap structures.

Move these cached USB2 port capability values together with the other
port capability values into struct xhci_port_cap cability structure.

This also gets rid of the cumbersome way of mapping port to USB2
capability based on portnum as each port has a pointer to its capability
structure.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 12 +-----------
 drivers/usb/host/xhci.c     | 19 +++++--------------
 drivers/usb/host/xhci.h     |  4 +---
 3 files changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 69dd86669883..7ff2ff29b48e 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1950,7 +1950,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	kfree(xhci->usb3_rhub.ports);
 	kfree(xhci->hw_ports);
 	kfree(xhci->rh_bw);
-	kfree(xhci->ext_caps);
 	for (i = 0; i < xhci->num_port_caps; i++)
 		kfree(xhci->port_caps[i].psi);
 	kfree(xhci->port_caps);
@@ -1961,7 +1960,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci->usb3_rhub.ports = NULL;
 	xhci->hw_ports = NULL;
 	xhci->rh_bw = NULL;
-	xhci->ext_caps = NULL;
 	xhci->port_caps = NULL;
 	xhci->interrupters = NULL;
 
@@ -2089,10 +2087,7 @@ static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
 
 	port_cap->maj_rev = major_revision;
 	port_cap->min_rev = minor_revision;
-
-	/* cache usb2 port capabilities */
-	if (major_revision < 0x03 && xhci->num_ext_caps < max_caps)
-		xhci->ext_caps[xhci->num_ext_caps++] = temp;
+	port_cap->protocol_caps = temp;
 
 	if ((xhci->hci_version >= 0x100) && (major_revision != 0x03) &&
 		 (temp & XHCI_HLC)) {
@@ -2212,11 +2207,6 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 						      XHCI_EXT_CAPS_PROTOCOL);
 	}
 
-	xhci->ext_caps = kcalloc_node(cap_count, sizeof(*xhci->ext_caps),
-				flags, dev_to_node(dev));
-	if (!xhci->ext_caps)
-		return -ENOMEM;
-
 	xhci->port_caps = kcalloc_node(cap_count, sizeof(*xhci->port_caps),
 				flags, dev_to_node(dev));
 	if (!xhci->port_caps)
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 8579603edaff..7f07672d4110 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4511,23 +4511,14 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
  * only USB2 ports extended protocol capability values are cached.
  * Return 1 if capability is supported
  */
-static int xhci_check_usb2_port_capability(struct xhci_hcd *xhci, int port,
+static bool xhci_check_usb2_port_capability(struct xhci_hcd *xhci, int portnum,
 					   unsigned capability)
 {
-	u32 port_offset, port_count;
-	int i;
+	struct xhci_port *port;
 
-	for (i = 0; i < xhci->num_ext_caps; i++) {
-		if (xhci->ext_caps[i] & capability) {
-			/* port offsets starts at 1 */
-			port_offset = XHCI_EXT_PORT_OFF(xhci->ext_caps[i]) - 1;
-			port_count = XHCI_EXT_PORT_COUNT(xhci->ext_caps[i]);
-			if (port >= port_offset &&
-			    port < port_offset + port_count)
-				return 1;
-		}
-	}
-	return 0;
+	port = xhci->usb2_rhub.ports[portnum];
+
+	return !!(port->port_cap->protocol_caps & capability);
 }
 
 static int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 6f4bf98a6282..1c9519205330 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1451,6 +1451,7 @@ struct xhci_port_cap {
 	u8			psi_uid_count;
 	u8			maj_rev;
 	u8			min_rev;
+	u32			protocol_caps;
 };
 
 struct xhci_port {
@@ -1640,9 +1641,6 @@ struct xhci_hcd {
 	unsigned		broken_suspend:1;
 	/* Indicates that omitting hcd is supported if root hub has no ports */
 	unsigned		allow_single_roothub:1;
-	/* cached usb2 extened protocol capabilites */
-	u32                     *ext_caps;
-	unsigned int            num_ext_caps;
 	/* cached extended protocol port capabilities */
 	struct xhci_port_cap	*port_caps;
 	unsigned int		num_port_caps;
-- 
2.25.1


