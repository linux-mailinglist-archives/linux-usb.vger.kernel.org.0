Return-Path: <linux-usb+bounces-4205-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCE4814892
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 13:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 547D01F240AE
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 12:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E325A2D043;
	Fri, 15 Dec 2023 12:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EdSMI/Xj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1414D2C6BA
	for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 12:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702644950; x=1734180950;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j2WcQaRNA7RTUbr+0guW49uvxScMzX9WX4EdB7+FPmQ=;
  b=EdSMI/XjBB0RQgcZZ2fS3dTKY/x/QRPOJggb+TIIDrJS/ltjMmvwzcsD
   uIWdUQdlTH8j+YyepJCPe4YbxVjo3MEwFLoPqs/R6vuvw6UbknJtc7EaX
   tmx84DGFngMjbiefXu02z7nwKrDtCMjGr5/78xpSWrXpSg/wJ+GHmJqWQ
   E/sj2ZNS86gxtiZpWUJOOQEWPI0tCdIKJZ2UopQYbLe8OnDhNzkWBnaZk
   Pnwmq57Lz87G3vPuVkgv4/RpqxpEefoq7oRmiNRrL4qsNNMfJf6ITAQyd
   UU+S+2VoTSy7t9oBu0dqBQr4lMGdzavDbAQ0jNCFA25pIceVQyT8/vs0g
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="392449868"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="392449868"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 04:55:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="918434168"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="918434168"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2023 04:55:47 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Wendy Wang <wendy.wang@intel.com>
Subject: [PATCH 1/1] xhci: Fix null pointer dereference during S4 resume when resetting ep0
Date: Fri, 15 Dec 2023 14:57:07 +0200
Message-Id: <20231215125707.1732989-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231215125707.1732989-1-mathias.nyman@linux.intel.com>
References: <20231215125707.1732989-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During device enumeration usb core resets endpoint 0 if the max packet
size value differs from the one read from the device descriptor.

usb core will additionally reset endpoint 0 during S4 resume, before
re-enumerating the device, if the device has a reset-resume flag set.

In this case the xhci device representation vdev may be lost due to
xHC restore error and re-initialization during S4 resume.

Make sure slot_id and vdev are valid before trying to re-configure max
packet size during endpoint 0 reset.
max packet size will be re-configured later during re-enumeration.

This fixes commit e34900f46cd6 ("xhci: Reconfigure endpoint 0 max packet
size only during endpoint reset") which is currently in usb-next,
on its way to 6.7

Fixes: e34900f46cd6 ("xhci: Reconfigure endpoint 0 max packet size only during endpoint reset")
Tested-by: Wendy Wang <wendy.wang@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index f62b4b252192..ff38c8badbcc 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3133,6 +3133,9 @@ static void xhci_endpoint_disable(struct usb_hcd *hcd,
  * of an endpoint that isn't in the halted state this function will issue a
  * configure endpoint command with the Drop and Add bits set for the target
  * endpoint. Refer to the additional note in xhci spcification section 4.6.8.
+ *
+ * vdev may be lost due to xHC restore error and re-initialization during S3/S4
+ * resume. A new vdev will be allocated later by xhci_discover_or_reset_device()
  */
 
 static void xhci_endpoint_reset(struct usb_hcd *hcd,
@@ -3158,9 +3161,17 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 	 * mismatch. Reconfigure the xhci ep0 endpoint context here in that case
 	 */
 	if (usb_endpoint_xfer_control(&host_ep->desc) && ep_index == 0) {
+
 		udev = container_of(host_ep, struct usb_device, ep0);
-		if (udev->speed == USB_SPEED_FULL)
-			xhci_check_ep0_maxpacket(xhci, xhci->devs[udev->slot_id]);
+		if (udev->speed != USB_SPEED_FULL || !udev->slot_id)
+			return;
+
+		vdev = xhci->devs[udev->slot_id];
+		if (!vdev || vdev->udev != udev)
+			return;
+
+		xhci_check_ep0_maxpacket(xhci, vdev);
+
 		/* Nothing else should be done here for ep0 during ep reset */
 		return;
 	}
@@ -3171,11 +3182,6 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 	udev = (struct usb_device *) host_ep->hcpriv;
 	vdev = xhci->devs[udev->slot_id];
 
-	/*
-	 * vdev may be lost due to xHC restore error and re-initialization
-	 * during S3/S4 resume. A new vdev will be allocated later by
-	 * xhci_discover_or_reset_device()
-	 */
 	if (!udev->slot_id || !vdev)
 		return;
 
-- 
2.25.1


