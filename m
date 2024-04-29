Return-Path: <linux-usb+bounces-9895-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CA78B5AB2
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A92B028702C
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 14:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11100762DA;
	Mon, 29 Apr 2024 14:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebb7gUeG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0785274C09
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 14:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399261; cv=none; b=HkM9iUNL7UxgZ6jUnSUUCSM8O0L7sodAzxHFduqZpPyUozcyJA697V4v6n/YnGBHsOnM0LqRHoYLzhiY7n4Q68H1UE7GsFGVcNWGVSR5lUC+OLsOLRCD5IfF/9UrSXazVcNFrd10uW4iY+mJk7X4jgmioucGgyXWcmcJtW9Dz4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399261; c=relaxed/simple;
	bh=1p91F6Dt9s+w7EmMhhZPUClWa7pKpEUcU9Iem6I32Vw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R0UiPtTMvX+AF1peRc2SG3Q18B/7U3UKmbeEzJ1KoyBPfIMtrOYDwqTkRHqOt178h2nZZzvTSB8CNd/R9qjFC4VYE822XQ/48SaXS77ANq0KBuWz+9bZXN4yGU8V5AcobrelKYJlL9ZFhHi3q6VbMw0gEuBGzFPrmPY023crGLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebb7gUeG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399260; x=1745935260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1p91F6Dt9s+w7EmMhhZPUClWa7pKpEUcU9Iem6I32Vw=;
  b=ebb7gUeGhV9kV6zMNzvelAVbiXJ5wr/mNR6CvYfd9HlpGFlcdlzrMvzC
   3N/E9ggxKix2fygqGKPWjblbkdXGytYXbUoELU+r6Aace9ZEF7ZT783GS
   GC87TZMcjBpx344/HvzaK2K93qs2tJ8XdyvMcAoS+ky6vB+LGbzNLkjWI
   iRrvR0ot23HQ+z0RfjZmv1t8PJj75wQzld6gOtaqBQ5/1UD6aFcc7gLv7
   NyYilWQ3ncMxs20T0wWL6H3l0Je6Hzt12Pg8ILmimrT9g1MkfikkUOK7f
   fJ2nIdg4EfqAO9S1b6ttombLJxfcHpHDEC2LeGH+nkRSHlCcm7VHOWUT/
   g==;
X-CSE-ConnectionGUID: 58m1W6dUShOKGbOHfTYoHg==
X-CSE-MsgGUID: igYOAaOURby7wTi7GxTGKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9911389"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9911389"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:01:00 -0700
X-CSE-ConnectionGUID: CI+c7lx5Trmaa+R6WSCtAA==
X-CSE-MsgGUID: wbq8t7AwT1+S3bXs1NfeZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26521669"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 07:00:58 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 02/18] xhci: remove xhci_check_usb2_port_capability helper
Date: Mon, 29 Apr 2024 17:02:29 +0300
Message-Id: <20240429140245.3955523-3-mathias.nyman@linux.intel.com>
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

This helper was only called from one function.
Removing it both reduces lines of code and made it more readable.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 7f07672d4110..37eb37b0affa 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4507,26 +4507,13 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 	return 0;
 }
 
-/* check if a usb2 port supports a given extened capability protocol
- * only USB2 ports extended protocol capability values are cached.
- * Return 1 if capability is supported
- */
-static bool xhci_check_usb2_port_capability(struct xhci_hcd *xhci, int portnum,
-					   unsigned capability)
-{
-	struct xhci_port *port;
-
-	port = xhci->usb2_rhub.ports[portnum];
-
-	return !!(port->port_cap->protocol_caps & capability);
-}
-
 static int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
 {
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
-	int		portnum = udev->portnum - 1;
+	struct xhci_port *port;
+	u32 capability;
 
-	if (hcd->speed >= HCD_USB3 || !udev->lpm_capable)
+	if (hcd->speed >= HCD_USB3 || !udev->lpm_capable || !xhci->hw_lpm_support)
 		return 0;
 
 	/* we only support lpm for non-hub device connected to root hub yet */
@@ -4534,14 +4521,14 @@ static int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
 			udev->descriptor.bDeviceClass == USB_CLASS_HUB)
 		return 0;
 
-	if (xhci->hw_lpm_support == 1 &&
-			xhci_check_usb2_port_capability(
-				xhci, portnum, XHCI_HLC)) {
+	port = xhci->usb2_rhub.ports[udev->portnum - 1];
+	capability = port->port_cap->protocol_caps;
+
+	if (capability & XHCI_HLC) {
 		udev->usb2_hw_lpm_capable = 1;
 		udev->l1_params.timeout = XHCI_L1_TIMEOUT;
 		udev->l1_params.besl = XHCI_DEFAULT_BESL;
-		if (xhci_check_usb2_port_capability(xhci, portnum,
-					XHCI_BLC))
+		if (capability & XHCI_BLC)
 			udev->usb2_hw_lpm_besl_capable = 1;
 	}
 
-- 
2.25.1


