Return-Path: <linux-usb+bounces-21777-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D352CA61387
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 15:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B981619C479A
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 14:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88126201035;
	Fri, 14 Mar 2025 14:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqgWAuFH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A479B20101F
	for <linux-usb@vger.kernel.org>; Fri, 14 Mar 2025 14:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741961952; cv=none; b=BdiMeMPJcixBlzbjTmJaJNPjXKrWPULTbb18r2wS9VAWEB81qM+ek4alcomDOGpw2L28sdANm1DqbOC3PxdyMDrYVsJ5+y5S7lM7dtU+RxOJNqRitaNZRJA3PI/qAd+qP1s9R4eW+Gn2y1Cv05UCt5vZJ7NiA4R7PnlwdzSYNYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741961952; c=relaxed/simple;
	bh=AZnpE+rtQRbfFA3eATrG8KPBkaBWYrXwOyqcHFg/2CE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jb5EmYyGe+1w1ZK7G5kqbt4VI7u+LTcsqgAcyxZVmDUP0WeHBiq3KxJT9v4zOV3GPTyS+oFsgOYiq0zT9EHA1koL+eeFVGjMGbhKTPS+a4fewFdqvYnMZp/HuWkTAd3elyKvr6YHdlhmMR3sgxvsjwRARy5pKxsZ0RoiwS07aZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqgWAuFH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741961950; x=1773497950;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AZnpE+rtQRbfFA3eATrG8KPBkaBWYrXwOyqcHFg/2CE=;
  b=bqgWAuFHRpDd8tsROd0RcbnyeGqLc2tKC9JD9tfOrceRExmy2shN/rmi
   bNYuitMo+SeOrmoj4G7yfMtDFyrdVS4uUWMKSb8C/GFoAswspjEQyzjYx
   81DOxC8j1O2f7pPNMQSZNpdrLsT+SYTCscFPKZ450Sq/u+nI83ENawVCm
   SRWPXYzLdDozeJ1pOLj4o9QkT/N0zYrnAi53nvFyQFkRsnEf4jo0xDEkI
   EnPYGB/eMxUwZylc81aBYrFI8yYxiTjqeW/62L6fcUhDe02D4NkSXtfm7
   jqZPrcPsz6PwRLLspjMZMXD9wILQubO30N5Z3ppQV12XNhVxM6Ni9Iqup
   Q==;
X-CSE-ConnectionGUID: FrhKfpTET5Gs/rpay6t8zw==
X-CSE-MsgGUID: Gc9L/JhnTpua6w9CzZYE/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="54110156"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="54110156"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 07:19:10 -0700
X-CSE-ConnectionGUID: femo6hhrSsSEm+KWAJdofQ==
X-CSE-MsgGUID: Y5BdotXbT7GfLbOKAetlEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126166608"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa003.jf.intel.com with ESMTP; 14 Mar 2025 07:19:09 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	<stern@rowland.harvard.edu>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/5] usb: hub: Don't disable LPM completely if device initiated LPM fails
Date: Fri, 14 Mar 2025 16:19:58 +0200
Message-ID: <20250314142000.93090-4-mathias.nyman@linux.intel.com>
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

Enabling device initiated USB3 link power management (LPM) may fail for
various reasons such as too long system exit latency, or link issues.

These are not good reason to disable hub initiated LPM U1/U2
states, especially as it requires sending more requests over a
possibly broken link, causing the hub work to block for even longer.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/core/hub.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 10ef9f51fcfd..ccf21bb49038 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -4345,17 +4345,8 @@ static void usb_enable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
 	 * Enable device initiated U1/U2 with a SetFeature(U1/U2_ENABLE) request
 	 * if system exit latency is short enough and device is configured
 	 */
-	if (usb_device_may_initiate_lpm(udev, state)) {
-		if (usb_set_device_initiated_lpm(udev, state, true)) {
-			/*
-			 * Request to enable device initiated U1/U2 failed,
-			 * better to turn off lpm in this case.
-			 */
-			usb_set_lpm_timeout(udev, state, 0);
-			hcd->driver->disable_usb3_lpm_timeout(hcd, udev, state);
-			return;
-		}
-	}
+	if (usb_device_may_initiate_lpm(udev, state))
+		usb_set_device_initiated_lpm(udev, state, true);
 
 	if (state == USB3_LPM_U1)
 		udev->usb3_lpm_u1_enabled = 1;
-- 
2.43.0


