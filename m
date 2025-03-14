Return-Path: <linux-usb+bounces-21779-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F2EA61385
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 15:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FBDA8839D2
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 14:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58AEC20103D;
	Fri, 14 Mar 2025 14:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wziae2mN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1D7201012
	for <linux-usb@vger.kernel.org>; Fri, 14 Mar 2025 14:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741961955; cv=none; b=U5j1IBnhVp82ES/CUlHm06JdwKyG3NpOXhF7VLRXSgtcgN2n5c3MaKSmR91YVTCCB2cVrOy6l2PXbUPAfAJ8jco4PUwNKjdxt2qjF8Q1nRzi6kWegERflpWxzcIX8FwTXt/+kYDcCdwr+QAwg+mfAfBamvg58xFg88iPYqqvPAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741961955; c=relaxed/simple;
	bh=EBxWfDPGME7JNusn1Pq7fGvc0FFQ2l2q9ggDTHVFElE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXAWoFzbNdkUjMtzSiZ1iqKvILaSuRbxa2QGZTiPEekiFfqn0UWjjb+e32nrQfaO71s3E8c4vupjODl/yBhXKhAbv2CO+l6v0NVoB6pDotmIf2Y3NQe6ZGtvd0PSfB8Hv9z5bGmEJYCbgoIXjnnGQA0wczwDXYVew3Ryn5q7Btg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wziae2mN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741961954; x=1773497954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EBxWfDPGME7JNusn1Pq7fGvc0FFQ2l2q9ggDTHVFElE=;
  b=Wziae2mNsufb+hE3+fu/eYYKCPxv1j7+qo5ixMrj4Q5yQ9nCzZuR8nhC
   bwAQZulDBTpmVE3YvAtCE/0vSQkzaVP3Mx92L15JHGFld3V2J31bQJBl4
   GxQS5Jonj4fqRmVKUVQ30hfFaW/bK12aRUjxripRkcQpsn/hrcOrDoGu/
   PxxCk+i6ucoQOR2Vkxux+TnFS4SbQQki0M2FfisAFYGMaHZhKrwy8c8Qx
   mRclrU8NKTAsJ90Tl4yoTkiCZ/mJFLv9vSqXsfCBjmyur60kK0q9BaJZP
   QYlY3IabULNISyMZVHfcKAOpuhm+AlAObns03FcBf+9imHIcbQ5sN9eNQ
   Q==;
X-CSE-ConnectionGUID: 5DKdku1QSeCv+dcUlvptfA==
X-CSE-MsgGUID: 46vsXpO5RE6IOQ1D1eRd8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="54110165"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="54110165"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 07:19:14 -0700
X-CSE-ConnectionGUID: wrJPNVapQGeX/AL0CXonAQ==
X-CSE-MsgGUID: AN7AnobqRF6hh7n9EUUG4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126166613"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa003.jf.intel.com with ESMTP; 14 Mar 2025 07:19:13 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	<stern@rowland.harvard.edu>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 5/5] usb: hub: Fail fast in USB3 link power management enable path
Date: Fri, 14 Mar 2025 16:20:00 +0200
Message-ID: <20250314142000.93090-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250314142000.93090-1-mathias.nyman@linux.intel.com>
References: <20250314142000.93090-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling LPM is done in hub workqueue, often in paths handling possible
link issues. So fail immediately on USB3 LPM issues and avoid hub wq
from unnecessary blocking, thus allowing it to handle other port events
faster.

Detect errors when enabling U1/U2 link states, and return immediately
if there is an issue.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/core/hub.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index d534d7b4606c..fe8271f46c35 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -4292,7 +4292,7 @@ static bool usb_device_may_initiate_lpm(struct usb_device *udev,
  * driver know about it.  If that call fails, it should be harmless, and just
  * take up more slightly more bus bandwidth for unnecessary U1/U2 exit latency.
  */
-static void usb_enable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
+static int usb_enable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
 		enum usb3_link_state state)
 {
 	int timeout;
@@ -4301,7 +4301,7 @@ static void usb_enable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
 
 	/* Skip if the device BOS descriptor couldn't be read */
 	if (!udev->bos)
-		return;
+		return -EINVAL;
 
 	u1_mel = udev->bos->ss_cap->bU1devExitLat;
 	u2_mel = udev->bos->ss_cap->bU2DevExitLat;
@@ -4312,7 +4312,7 @@ static void usb_enable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
 	 */
 	if ((state == USB3_LPM_U1 && u1_mel == 0) ||
 			(state == USB3_LPM_U2 && u2_mel == 0))
-		return;
+		return -EINVAL;
 
 	/* We allow the host controller to set the U1/U2 timeout internally
 	 * first, so that it can change its schedule to account for the
@@ -4323,13 +4323,13 @@ static void usb_enable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
 
 	/* xHCI host controller doesn't want to enable this LPM state. */
 	if (timeout == 0)
-		return;
+		return -EINVAL;
 
 	if (timeout < 0) {
 		dev_warn(&udev->dev, "Could not enable %s link state, "
 				"xHCI error %i.\n", usb3_lpm_names[state],
 				timeout);
-		return;
+		return timeout;
 	}
 
 	if (usb_set_lpm_timeout(udev, state, timeout)) {
@@ -4338,13 +4338,15 @@ static void usb_enable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
 		 * host know that this link state won't be enabled.
 		 */
 		hcd->driver->disable_usb3_lpm_timeout(hcd, udev, state);
-		return;
+		return -EBUSY;
 	}
 
 	if (state == USB3_LPM_U1)
 		udev->usb3_lpm_u1_enabled = 1;
 	else if (state == USB3_LPM_U2)
 		udev->usb3_lpm_u2_enabled = 1;
+
+	return 0;
 }
 /*
  * Disable the hub-initiated U1/U2 idle timeouts, and disable device-initiated
@@ -4497,10 +4499,12 @@ void usb_enable_lpm(struct usb_device *udev)
 	port_dev = hub->ports[udev->portnum - 1];
 
 	if (port_dev->usb3_lpm_u1_permit)
-		usb_enable_link_state(hcd, udev, USB3_LPM_U1);
+		if (usb_enable_link_state(hcd, udev, USB3_LPM_U1))
+			return;
 
 	if (port_dev->usb3_lpm_u2_permit)
-		usb_enable_link_state(hcd, udev, USB3_LPM_U2);
+		if (usb_enable_link_state(hcd, udev, USB3_LPM_U2))
+			return;
 
 	/*
 	 * Enable device initiated U1/U2 with a SetFeature(U1/U2_ENABLE) request
-- 
2.43.0


