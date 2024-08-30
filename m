Return-Path: <linux-usb+bounces-14399-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FE296654A
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 17:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BECA285365
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 15:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B461B5813;
	Fri, 30 Aug 2024 15:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RSCClhAb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A541B4C56
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 15:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725031478; cv=none; b=sIfD3QxqMCNs6Zt1p/H/aXFJenI1sPUZyDeH0rtcD3ekl6Rfihnut/gJ8nPbwlZp83u5patbevZVe/YGuFBOkgTYFE3FE24A5/zRkdRw6H52jEVRXUvibLtCrAOr4kZq0nImPhienIJgsUr54q2dXqhcOYZe47mBftFZv8qCe1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725031478; c=relaxed/simple;
	bh=h/PLgWcN6IRMNVOWqjexSynCBkmGyQjtubfjbqcBiMw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y+0VvI0v7MxaPAAeINkRL4TLR+uYpFprN1+xL3oCLiT2QmdCpUnqSgQaZJr9X8dm5oBtkK0Tf8X8XzfFi/2myVTnhiV+Dq8ErLUyNiQ7DdiGeYKdUQ8oAq5evXARx7G8udnisEGf/tv8lqHx/ZalXEqstuOAKupNRB31WMA3e0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RSCClhAb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725031477; x=1756567477;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h/PLgWcN6IRMNVOWqjexSynCBkmGyQjtubfjbqcBiMw=;
  b=RSCClhAb4svXjX4xhEzmX5yaUWJo1iZ5aM8zO1YqrKILd102iQqeRfoF
   flNZ8Fl0VVD6zKAMad/7+uUJNMvYB8rZD/5+ETuXvemZ/tTBLCZzS1xPg
   M86x1AR+/f8fPQg9/za6o2hoHAJktl9aR6I30FXY/9HBbrnoRIOy/+ut1
   gvMRr/8emHk7DBO6wTU3CYK55GM7NSzgaRL8rih1vcszYVijw4ta3GsHc
   oEciGNbwE5M2zRXpSbBKwf4/dztX1Y2/7uZufgcC8xXU2jXLTvHnaenNT
   ROKVkXBhWRx05EBwREt/xRd/hFVC+CsXtTvpVQI8IqOBjSjw3MpL6Qpwc
   w==;
X-CSE-ConnectionGUID: jWQMLTjQSpyqSMnJSLe8EQ==
X-CSE-MsgGUID: zFeuLl6eRtKbaPpJ7AL7Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23861950"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="23861950"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 08:24:36 -0700
X-CSE-ConnectionGUID: z4F53FYZQAKr0vyySO2jww==
X-CSE-MsgGUID: 8vz6qIJ3QRKCt9fbPG8sPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="63981647"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 30 Aug 2024 08:24:35 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	mika.westerberg@linux.intel.com,
	mario.limonciello@amd.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 2/4] usb: Add tunnel_mode parameter to usb device structure
Date: Fri, 30 Aug 2024 18:26:28 +0300
Message-Id: <20240830152630.3943215-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240830152630.3943215-1-mathias.nyman@linux.intel.com>
References: <20240830152630.3943215-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add 'tunnel_mode' enum to usb device structure to describe if a USB3
link is tunneled over USB4, or connected directly using native USB2/USB3
protocols.

Tunneled devices depend on USB4 NHI host to maintain the tunnel.
Knowledge about tunneled devices is important to ensure correct
suspend and resume order between USB4 hosts and tunneled devices.
i.e. make sure tunnel is up before the USB device using it resumes.

USB hosts such as xHCI may have vendor specific ways to detect tunneled
connections. This 'tunnel_mode' parameter can be set by USB3 host driver
during hcd->driver->update_device(hcd, udev) callback.

tunnel_mode can be set to:
USB_LINK_UNKNOWN = 0
USB_LINK_NATIVE
USB_LINK_TUNNELED

USB_LINK_UNKNOWN is used in case host is not capable of detecting
tunneled links.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
v2:
 Add and use a 3 state enum to describe and store tunnel mode instead
 of bool.

 drivers/usb/host/xhci-hub.c | 13 +++++++++----
 drivers/usb/host/xhci.c     |  7 +++++--
 drivers/usb/host/xhci.h     |  4 ++--
 include/linux/usb.h         |  8 ++++++++
 4 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 4ba910eadd3f..d27c30ac17fd 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -763,9 +763,12 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
  *
  * A USB3 device must be connected to the port to detect the tunnel.
  *
- * Return: true if USB3 connection is tunneled over USB4
+ * Return: link tunnel mode enum, USB_LINK_UNKNOWN if host is incapable of
+ * detecting USB3 over USB4 tunnels. USB_LINK_NATIVE or USB_LINK_TUNNELED
+ * otherwise.
  */
-bool xhci_port_is_tunneled(struct xhci_hcd *xhci, struct xhci_port *port)
+enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
+						struct xhci_port *port)
 {
 	void __iomem *base;
 	u32 offset;
@@ -777,10 +780,12 @@ bool xhci_port_is_tunneled(struct xhci_hcd *xhci, struct xhci_port *port)
 		offset = XHCI_INTEL_SPR_ESS_PORT_OFFSET + port->hcd_portnum * 0x20;
 
 		if (readl(base + offset) & XHCI_INTEL_SPR_TUNEN)
-			return true;
+			return USB_LINK_TUNNELED;
+		else
+			return USB_LINK_NATIVE;
 	}
 
-	return false;
+	return USB_LINK_UNKNOWN;
 }
 
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 1ea2c91106b7..a69245074395 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4529,9 +4529,12 @@ static int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
 	if (hcd->speed >= HCD_USB3 && !udev->parent->parent) {
 		port = xhci->usb3_rhub.ports[udev->portnum - 1];
 
-		if (xhci_port_is_tunneled(xhci, port))
+		udev->tunnel_mode = xhci_port_is_tunneled(xhci, port);
+		if (udev->tunnel_mode == USB_LINK_UNKNOWN)
+			dev_dbg(&udev->dev, "link tunnel state unknown\n");
+		else if (udev->tunnel_mode == USB_LINK_TUNNELED)
 			dev_dbg(&udev->dev, "tunneled over USB4 link\n");
-		else
+		else if (udev->tunnel_mode == USB_LINK_NATIVE)
 			dev_dbg(&udev->dev, "native USB 3.x link\n");
 		return 0;
 	}
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index aa1062a595b6..0a9d663cdfff 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1929,8 +1929,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
 int xhci_hub_status_data(struct usb_hcd *hcd, char *buf);
 int xhci_find_raw_port_number(struct usb_hcd *hcd, int port1);
 struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd);
-bool xhci_port_is_tunneled(struct xhci_hcd *xhci, struct xhci_port *port);
-
+enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
+						struct xhci_port *port);
 void xhci_hc_died(struct xhci_hcd *xhci);
 
 #ifdef CONFIG_PM
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 832997a9da0a..672d8fc2abdb 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -495,6 +495,12 @@ struct usb_dev_state;
 
 struct usb_tt;
 
+enum usb_link_tunnel_mode {
+	USB_LINK_UNKNOWN = 0,
+	USB_LINK_NATIVE,
+	USB_LINK_TUNNELED,
+};
+
 enum usb_port_connect_type {
 	USB_PORT_CONNECT_TYPE_UNKNOWN = 0,
 	USB_PORT_CONNECT_TYPE_HOT_PLUG,
@@ -605,6 +611,7 @@ struct usb3_lpm_parameters {
  *	WUSB devices are not, until we authorize them from user space.
  *	FIXME -- complete doc
  * @authenticated: Crypto authentication passed
+ * @tunnel_mode: Connection native or tunneled over USB4
  * @lpm_capable: device supports LPM
  * @lpm_devinit_allow: Allow USB3 device initiated LPM, exit latency is in range
  * @usb2_hw_lpm_capable: device can perform USB2 hardware LPM
@@ -714,6 +721,7 @@ struct usb_device {
 	unsigned do_remote_wakeup:1;
 	unsigned reset_resume:1;
 	unsigned port_is_suspended:1;
+	enum usb_link_tunnel_mode tunnel_mode;
 
 	int slot_id;
 	struct usb2_lpm_parameters l1_params;
-- 
2.25.1


