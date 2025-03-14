Return-Path: <linux-usb+bounces-21775-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AABA61381
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 15:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAD443B48BC
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 14:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E011C20100E;
	Fri, 14 Mar 2025 14:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TE4QJm/r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28C5200BB4
	for <linux-usb@vger.kernel.org>; Fri, 14 Mar 2025 14:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741961949; cv=none; b=olAfzqEH0bSV9HBRXF92mvWBcOaGk4nJooYSvSiNIjo9gYrHdjT0uv1JocwQxebQKD2a2MD+7K1ov5DmMVEFhc/VHOE73rx1BxHqzVBHvnKgV4KjqxUzjx4M6IG98oF2hIv5C5hg/iFfjYdhK3z+eXFLU56+drTg0n4j8fVVILw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741961949; c=relaxed/simple;
	bh=NjjW5EwZ660z+fPfGwHw1nEvTxWFsgchgPxMSZ3mVAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iGrlY9A0D1LurJBDi0gyG2PEYqnlovOLjP0K+KqW4nDAlal5KC+I9j1hlsRNvlAiK5ApwBS4uH9FZjuxC0+GJKcNXttop7SInJiAAziWWoPQVtTR1T6QFF2FtmdJ4aobfwXctqwMnMelZiQEdZsC0SyxlCXTU6BmCBzxxy0nDmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TE4QJm/r; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741961947; x=1773497947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NjjW5EwZ660z+fPfGwHw1nEvTxWFsgchgPxMSZ3mVAw=;
  b=TE4QJm/rgC9stipTrjYhbqxokrvUoNHvLSLm1ZTlyddrO3K6p47ddutq
   j13xw0Utl9uQ4F15ydfZxIb2T7uMg4MtPw4NICfj7nNihQNfhvuPzt+rT
   5W7YpCcInBTmh/zmGAn3yva47tumYxm8Cw07NhhCtU9O3u0Ci6QZHRHKY
   Zr1oIVMt21V7iMj4Q5q+PPHc9BIRrPN2IomcDH6uXt2P5hf7MDl/SOa95
   KrEbrYhR6fpIX2faOs1uIF5gDyDDw/Xfbnw8QdW4GVhq30KV3kBGCU8TM
   CyTaqmr9hUiRLwM2KbE+aNf03KlBqt14gDv5I8QjnnGRrNGn806GgC+CC
   w==;
X-CSE-ConnectionGUID: 6wU1psy6QEivQhYg74fWpg==
X-CSE-MsgGUID: GYuhOsHhQwq77P8ov9eRBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="54110142"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="54110142"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 07:19:07 -0700
X-CSE-ConnectionGUID: nOJkkT7DTjmLJlf9NHUT7w==
X-CSE-MsgGUID: fvj4MEu5S3yO6ahK/YKOkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126166605"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa003.jf.intel.com with ESMTP; 14 Mar 2025 07:19:06 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	<stern@rowland.harvard.edu>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/5] usb: hub: Block less in USB3 link power management LPM disable path
Date: Fri, 14 Mar 2025 16:19:56 +0200
Message-ID: <20250314142000.93090-2-mathias.nyman@linux.intel.com>
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

Several usb requests are needed to allow or forbid a USB3 link from
going into U1 or U2 hardware link power management (LPM) states.

Fail fast on issues in LPM disabling path. LPM disabling is done in hub
workqueue paths that are often already handling possible link issues.

Enabling and disabling LPM involves four usb requests.
Two requests sent to the upstream hub of the connected device:
SetPortFeature(U1_TIMEOUT)
SetPortFeature(U2_TIMEOUT)

And two to the device itself:
SetFeature(U1_ENABLE)
SetFeature(U2_ENABLE)

The requests to the hub sets the inactivity timeout used by the hub to
know when to initiate U1 and U2 LPM link state transitions.
These requests are also used prevent U1/U2 LPM transitions completely
by passing zero timeout value.

The requsts sent to the device only controls if device is allowed to
initiate U1/U2 transitions. If not enabled then only hub initiates U1/U2
transitions. Hub may block these device initiated attempts.

Reorder and send the hub requests first, these are more likely to succeed
due to shorter path, and we can consider LPM disabled if these succeed
as U1/U2 link state can not be entered after that.

Fail immediately if a request fails, and don't try to enable back LPM
after a failed request, that will just send more LPM requests over a
bad link.

If a device request controlling device initiateed LPM fails then exit
immediately, but consider LPM disabled at this stage.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/core/hub.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 8c7f9cc785bb..a901d1b55856 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -4393,8 +4393,6 @@ static int usb_disable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
 	if (usb_set_lpm_timeout(udev, state, 0))
 		return -EBUSY;
 
-	usb_set_device_initiated_lpm(udev, state, false);
-
 	if (hcd->driver->disable_usb3_lpm_timeout(hcd, udev, state))
 		dev_warn(&udev->dev, "Could not disable xHCI %s timeout, "
 				"bus schedule bandwidth may be impacted.\n",
@@ -4424,6 +4422,7 @@ static int usb_disable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
 int usb_disable_lpm(struct usb_device *udev)
 {
 	struct usb_hcd *hcd;
+	int err;
 
 	if (!udev || !udev->parent ||
 			udev->speed < USB_SPEED_SUPER ||
@@ -4441,14 +4440,19 @@ int usb_disable_lpm(struct usb_device *udev)
 
 	/* If LPM is enabled, attempt to disable it. */
 	if (usb_disable_link_state(hcd, udev, USB3_LPM_U1))
-		goto enable_lpm;
+		goto disable_failed;
 	if (usb_disable_link_state(hcd, udev, USB3_LPM_U2))
-		goto enable_lpm;
+		goto disable_failed;
+
+	err = usb_set_device_initiated_lpm(udev, USB3_LPM_U1, false);
+	if (!err)
+		usb_set_device_initiated_lpm(udev, USB3_LPM_U2, false);
 
 	return 0;
 
-enable_lpm:
-	usb_enable_lpm(udev);
+disable_failed:
+	udev->lpm_disable_count--;
+
 	return -EBUSY;
 }
 EXPORT_SYMBOL_GPL(usb_disable_lpm);
-- 
2.43.0


