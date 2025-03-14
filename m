Return-Path: <linux-usb+bounces-21776-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90694A61383
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 15:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACD834637FA
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 14:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF3B1FDE0E;
	Fri, 14 Mar 2025 14:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+GTUbpx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90BC1FF614
	for <linux-usb@vger.kernel.org>; Fri, 14 Mar 2025 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741961950; cv=none; b=lzNataofMTkcxMhC5gwaY8MT+a1P3XExCDO6L3/SMF23CJdTnN0YQotw1LUTP8hjygn962/EQM5zXK+RBXdbkaaukVHSKpMl2EUNNw0gVRuoAWbYjm5YXWjCO+v3YalMRwC8KBA2trPEpXeIikqVDVFnDc4zvugFuyLiOEkHHyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741961950; c=relaxed/simple;
	bh=vMVtQLokhItnd46Va42rAPOljM3qfa9Cd+5cvihC9Vw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T+VTVm8JodRURq1/sJotNbe79lux0tFtXUpeZE6CSygzCmEMnpCWMmwvS9BFFdoXXkEnFMP+3gVH933EuoxKxv9Y3l87qrxTFFZFMHl2gkW+C2aiE+EHiz3TtQa5za9SdZRg3XTyPL4EOLeypvOqFGGWaUEi/qD0ZFVsyAw4y5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+GTUbpx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741961949; x=1773497949;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vMVtQLokhItnd46Va42rAPOljM3qfa9Cd+5cvihC9Vw=;
  b=I+GTUbpxjZUvJfI5AP0NudMk+j6VXpQUGVyVMaSDiKSE3ypcYpUvXcNz
   P52vJ/o0lxpAsERh97KmoE8Ra+VkNqZiYs16kYaRwo1udgESv8fCYSlQz
   ovktyVfieJdnJTyxAVG5bp3IE2CarJx5aFCFRumRXtnftoXz5lTNWERqZ
   549CENKLZnTR+Hho2y6mThmMl0QymR5y+3+9Mjqwx1kxE7YNuXbB83Vo+
   6JCTHWpE2riowjEyExODpmV/cZDLmGQp+g/6oHUt82FvySH/uZrqhtGNP
   BtR6TY954kI+1viEQQMeFZn1OTRbBNdzYpzXCJcwFIzGphU47VdefAo+b
   A==;
X-CSE-ConnectionGUID: jOrpKahNSr2MyIdKPb4OuQ==
X-CSE-MsgGUID: NaKT8tA/QECDr19nzmQ56g==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="54110147"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="54110147"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 07:19:09 -0700
X-CSE-ConnectionGUID: wt4raNPMSWuva8a/K0YCSA==
X-CSE-MsgGUID: FzNDiK5JSAK3Wa4v2bo7FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126166606"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa003.jf.intel.com with ESMTP; 14 Mar 2025 07:19:08 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	<stern@rowland.harvard.edu>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/5] usb: hub: verify device is configured in usb_device_may_initiate_lpm()
Date: Fri, 14 Mar 2025 16:19:57 +0200
Message-ID: <20250314142000.93090-3-mathias.nyman@linux.intel.com>
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

Move device configured check into usb_device_may_initiate_lpm() instead
of calling it before the function.

No functional changes, helps rework to fail faster during link power
management (LPM) enabling.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/core/hub.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index a901d1b55856..10ef9f51fcfd 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -4234,9 +4234,9 @@ static int usb_set_lpm_timeout(struct usb_device *udev,
 }
 
 /*
- * Don't allow device intiated U1/U2 if the system exit latency + one bus
- * interval is greater than the minimum service interval of any active
- * periodic endpoint. See USB 3.2 section 9.4.9
+ * Don't allow device intiated U1/U2 if device isn't in the configured state,
+ * or the system exit latency + one bus interval is greater than the minimum
+ * service interval of any active periodic endpoint. See USB 3.2 section 9.4.9
  */
 static bool usb_device_may_initiate_lpm(struct usb_device *udev,
 					enum usb3_link_state state)
@@ -4244,7 +4244,7 @@ static bool usb_device_may_initiate_lpm(struct usb_device *udev,
 	unsigned int sel;		/* us */
 	int i, j;
 
-	if (!udev->lpm_devinit_allow)
+	if (!udev->lpm_devinit_allow || !udev->actconfig)
 		return false;
 
 	if (state == USB3_LPM_U1)
@@ -4341,11 +4341,11 @@ static void usb_enable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
 		return;
 	}
 
-	/* Only a configured device will accept the Set Feature
-	 * U1/U2_ENABLE
+	/*
+	 * Enable device initiated U1/U2 with a SetFeature(U1/U2_ENABLE) request
+	 * if system exit latency is short enough and device is configured
 	 */
-	if (udev->actconfig &&
-	    usb_device_may_initiate_lpm(udev, state)) {
+	if (usb_device_may_initiate_lpm(udev, state)) {
 		if (usb_set_device_initiated_lpm(udev, state, true)) {
 			/*
 			 * Request to enable device initiated U1/U2 failed,
-- 
2.43.0


