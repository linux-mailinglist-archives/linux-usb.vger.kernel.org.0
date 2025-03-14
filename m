Return-Path: <linux-usb+bounces-21778-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEAEA61384
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 15:19:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F98416F970
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 14:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9F120103B;
	Fri, 14 Mar 2025 14:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KycdjEwD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D45201027
	for <linux-usb@vger.kernel.org>; Fri, 14 Mar 2025 14:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741961954; cv=none; b=eIlt25dz/n6b6FtjHILkPXLFlLgjkOs3Cjj17/XrL7vzIswmYADZ5W7vsWYGakzWmRccG87DZq5aDu7Sq0GDEC9F9BISYlvJy6IOETMMy3pUPeqN/0JRMAd7F0J4raR4SGBJJuKy9eYtwo2GhHKlYmXOR6hx4Y+1KktyK5vjfHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741961954; c=relaxed/simple;
	bh=qdZZ0iXnfuZAs12kkSgk+SsR/XyfaLDoZgkIwpNx5ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XGWsV3KljgDzMW3+MNZKYV2jzDK5bDXFSn3lir+t+Pf0K6V+3uCsxoRS5YPAQJATMRFTVk/Vg9Q8iInF/lwXXiiwRTW3sr8iFnzWD2W+pfCsS0+vTY3hRy7MlOrly85KB8T+2qz7GpftxrbC0suPbbLUHXXcFx+TOB4CEUAI6/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KycdjEwD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741961952; x=1773497952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qdZZ0iXnfuZAs12kkSgk+SsR/XyfaLDoZgkIwpNx5ak=;
  b=KycdjEwD1y5Wkx4XU9ZG759KFkE800nArao/r+ML0vVeEDS0FdjXIHHU
   Y5hw3pJDJWvH/pk1znLQlJ0dNRLlAH96tY2cYUuPGPnYw6GD0GCOJqu6c
   F2pdIf2xA1R4rg1U6hdiv17V9IZiF/1ICEQCviWZGo+jI6k6iybBNNnty
   2r8ajlBPfKW0Bt7FPFTCUJLra6DAqM6VJgKL4ELBA7KJTZ1UO+552kWkd
   vE57ziwJf3jz63IswLmVoYfxHzFMU9s7mQusHl2+Zwyu3nFH3/6O5w7lq
   3qiIfU7Kf4uanmlo9P2V8WagMbnjAeg3UrH5NhedLjrH/U1ucSBpHd6Ge
   w==;
X-CSE-ConnectionGUID: OFFkHvd9QvOt26YV0+NkQA==
X-CSE-MsgGUID: cE+tY3fUQjqg4Z6T3GFvVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="54110161"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="54110161"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 07:19:12 -0700
X-CSE-ConnectionGUID: BlS6wycWRRS17otlZmXe0Q==
X-CSE-MsgGUID: j/p4c4VFTUqroC6K1PcLTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126166611"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa003.jf.intel.com with ESMTP; 14 Mar 2025 07:19:11 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	<stern@rowland.harvard.edu>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 4/5] usb: hub: reorder USB3 link power management enable requests
Date: Fri, 14 Mar 2025 16:19:59 +0200
Message-ID: <20250314142000.93090-5-mathias.nyman@linux.intel.com>
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

Several usb requests are needed to allow a USB3 link to enter U1/U2
hardware link power management LPM states. Reorder these requests
and send the more significant and likely to succeed first.
This is similar to the change done for disabling LPM

Enable LPM by first sending requests to the upstream hub of the device
SetPortFeature(U1_TIMEOUT)
SetPortFeature(U2_TIMEOUT)

These are more likely to succeed due to the shorter path, and LPM can
be considered enabled as link may go to U1/U2 LPM states after those.

Send the requests to the device after this, they allow the device
to initialte U1/U2 link transitions. Hub can already initiate U1/U2
SetFeature(U1_ENABLE)
SetFeature(U2_ENABLE)

Fail fast and bail out if a requests to the device fails.

This changes device initated LPM policy a bit. Device is no longer
able to initiate U2 if it failed or is not allowed to initiate
U1.

Enabling and disabling Link power management is done as part of
hub work. Avoid trying to send additional USB requests to a device
when there are known issues. It just causes hub work to block for
even longer.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/core/hub.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index ccf21bb49038..d534d7b4606c 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -4160,7 +4160,7 @@ static int usb_set_device_initiated_lpm(struct usb_device *udev,
 				"for unconfigured device.\n",
 				__func__, str_enable_disable(enable),
 				usb3_lpm_names[state]);
-		return 0;
+		return -EINVAL;
 	}
 
 	if (enable) {
@@ -4341,13 +4341,6 @@ static void usb_enable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
 		return;
 	}
 
-	/*
-	 * Enable device initiated U1/U2 with a SetFeature(U1/U2_ENABLE) request
-	 * if system exit latency is short enough and device is configured
-	 */
-	if (usb_device_may_initiate_lpm(udev, state))
-		usb_set_device_initiated_lpm(udev, state, true);
-
 	if (state == USB3_LPM_U1)
 		udev->usb3_lpm_u1_enabled = 1;
 	else if (state == USB3_LPM_U2)
@@ -4508,6 +4501,18 @@ void usb_enable_lpm(struct usb_device *udev)
 
 	if (port_dev->usb3_lpm_u2_permit)
 		usb_enable_link_state(hcd, udev, USB3_LPM_U2);
+
+	/*
+	 * Enable device initiated U1/U2 with a SetFeature(U1/U2_ENABLE) request
+	 * if system exit latency is short enough and device is configured
+	 */
+	if (usb_device_may_initiate_lpm(udev, USB3_LPM_U1)) {
+		if (usb_set_device_initiated_lpm(udev, USB3_LPM_U1, true))
+			return;
+
+		if (usb_device_may_initiate_lpm(udev, USB3_LPM_U2))
+			usb_set_device_initiated_lpm(udev, USB3_LPM_U2, true);
+	}
 }
 EXPORT_SYMBOL_GPL(usb_enable_lpm);
 
-- 
2.43.0


