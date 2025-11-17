Return-Path: <linux-usb+bounces-30564-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EEEC63E7C
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 12:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DDED74EDC2F
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 11:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09D632B997;
	Mon, 17 Nov 2025 11:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EKAdZkoU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7D032AABA
	for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379822; cv=none; b=BZbPpULbFmSDQntgT30jexqpc5XtbuVHdJqwFVkA8RQv3ztOzh7Bp0JZch41U3ZnJ4wBiMAH347aD8UajF2iTBriEGD1/2nj4EsSShOQPD6hNXiKiTENXb7W0uio/p7z7hPZyJm+1bnAW9akMT59qsZ1VKLCLzHS/cn1gid2apo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379822; c=relaxed/simple;
	bh=uKFbDl3C/ZNYZvzPyuYDO1NSeJlm/BaDzzetFh/03Gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aU3qhBS8LjHUIGM/46Pvu7s44OzT9jN6hXxyuYcNbqZG6wJap5S6haLS948gvf/NYGohA8lNOza4GYNTkOMYUGznRGMw2yVQHOph2X4+PxG0G9X2774zCE3JmNm4Qg0uhbKXptY1BcYWYMyhV/8xhHJXCue5J7n/pnML5iCbfgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EKAdZkoU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763379821; x=1794915821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uKFbDl3C/ZNYZvzPyuYDO1NSeJlm/BaDzzetFh/03Gs=;
  b=EKAdZkoU038mn8dDzxJnkGHLQTwns8rDyrgtov/t3s1kJYsRJYLXkWI8
   SNhl08HLCyyPXY2nXVVQT3nDB8wPsvM7ZeGotKlcPW/3FdggXqSXiAZox
   MgGnBrXaTeB9DfbkI68SQUsz1fuGPwCUVNtQyS19K0L/yx7UeyIaxVbTW
   PGskwZENMNFTDrG9ubMiwYDr5fF7NCrWNaeE2utC3rJRT6TUswli/Tpgq
   Gfba3ar9Cnd/Osz07x3SALyGRsRY/ODxBnRNmOAvVWRWv4hLhTPeQj4uH
   G7og+vGio8bih+wYJlfEpU0x7AUb/Z0EPM6H3JLdz4BxcgmSqELSFgXqC
   g==;
X-CSE-ConnectionGUID: 3CAppgLuRj6EhYlImepZqQ==
X-CSE-MsgGUID: 3S7/JCfeSLuPraTNx+tC+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82763832"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="82763832"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 03:43:41 -0800
X-CSE-ConnectionGUID: keYOElHmSniIhQWO+RpNHg==
X-CSE-MsgGUID: rOPw3e7HSFKH5gn3QfzocA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="191218374"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 17 Nov 2025 03:43:39 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id D678A98; Mon, 17 Nov 2025 12:43:38 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH 6/9] usb: xhci: move roothub port limit validation
Date: Mon, 17 Nov 2025 12:42:38 +0100
Message-ID: <20251117114242.3507856-7-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251117114242.3507856-1-niklas.neronin@linux.intel.com>
References: <20251117114242.3507856-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function xhci_setup_port_arrays() limits the number of roothub ports
for both USB 2 and 3, this causes code repetition.

Solve this by moving roothub port limits validation to
xhci_create_rhub_port_array().

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/usb/host/xhci-mem.c | 45 +++++++++++++++----------------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 6e5b6057de79..e52b1f8985c2 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2151,15 +2151,28 @@ static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
 	/* FIXME: Should we disable ports not in the Extended Capabilities? */
 }
 
-static void xhci_create_rhub_port_array(struct xhci_hcd *xhci,
-					struct xhci_hub *rhub, gfp_t flags)
+static void xhci_create_rhub_port_array(struct xhci_hcd *xhci, struct xhci_hub *rhub,
+					unsigned int max_ports, gfp_t flags)
 {
 	int port_index = 0;
 	int i;
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 
-	if (!rhub->num_ports)
+	if (!rhub->num_ports) {
+		xhci_info(xhci, "USB%u root hub has no ports\n", rhub->maj_rev);
 		return;
+	}
+
+	/*
+	 * Place limits on the number of roothub ports so that the hub
+	 * descriptors aren't longer than the USB core will allocate.
+	 */
+	if (rhub->num_ports > max_ports) {
+		xhci->usb3_rhub.num_ports = max_ports;
+		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Limiting USB%u root hub ports to %u",
+			       rhub->maj_rev, max_ports);
+	}
+
 	rhub->ports = kcalloc_node(rhub->num_ports, sizeof(*rhub->ports),
 			flags, dev_to_node(dev));
 	if (!rhub->ports)
@@ -2260,30 +2273,8 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 		       "Found %u USB 2.0 ports and %u USB 3.0 ports.",
 		       xhci->usb2_rhub.num_ports, xhci->usb3_rhub.num_ports);
 
-	/* Place limits on the number of roothub ports so that the hub
-	 * descriptors aren't longer than the USB core will allocate.
-	 */
-	if (xhci->usb3_rhub.num_ports > USB_SS_MAXPORTS) {
-		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-				"Limiting USB 3.0 roothub ports to %u.",
-				USB_SS_MAXPORTS);
-		xhci->usb3_rhub.num_ports = USB_SS_MAXPORTS;
-	}
-	if (xhci->usb2_rhub.num_ports > USB_MAXCHILDREN) {
-		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-				"Limiting USB 2.0 roothub ports to %u.",
-				USB_MAXCHILDREN);
-		xhci->usb2_rhub.num_ports = USB_MAXCHILDREN;
-	}
-
-	if (!xhci->usb2_rhub.num_ports)
-		xhci_info(xhci, "USB2 root hub has no ports\n");
-
-	if (!xhci->usb3_rhub.num_ports)
-		xhci_info(xhci, "USB3 root hub has no ports\n");
-
-	xhci_create_rhub_port_array(xhci, &xhci->usb2_rhub, flags);
-	xhci_create_rhub_port_array(xhci, &xhci->usb3_rhub, flags);
+	xhci_create_rhub_port_array(xhci, &xhci->usb2_rhub, USB_MAXCHILDREN, flags);
+	xhci_create_rhub_port_array(xhci, &xhci->usb3_rhub, USB_SS_MAXPORTS, flags);
 
 	return 0;
 }
-- 
2.50.1


