Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74AD6523FE5
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 00:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348491AbiEKWDw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 18:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348462AbiEKWDu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 18:03:50 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1598B19C2D
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 15:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652306630; x=1683842630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EN9gmAL1uzE9wzMkMJkqUto04AKi/AUcI0B9kmVfeRo=;
  b=ZjG6O8hgS40tI7491gSOpcWzUUzWipJYITVSmY9gA6fMU6jvHm5pNrzc
   5kA87ejlykulJp9vC+gdoYVfpf8NT0he5w+PXhvJD+m2hxIHC4Aq/1AB8
   66PqkzLtp3H1DSVCwOrB5xACWSnukGNyOswOe01bXs1+s62LjZvveO/Kx
   Y11lDZdOtHxwX8JZZO8369rZXyvpncJPQzWYM2OUOVsxCJJ1O4IhVpWjn
   P1FYr8Z5B42RLPUVM25kFSjOAqvKdF/FGeIiAZxIlDRPICrbCeFXGwuKV
   jT5BcyMsIkHweos7BV6wCFlmQZi4rEqUUt/kDVw2iNi6Jj0PfIIdOUMXN
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="330427463"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="330427463"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 15:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="542496249"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 11 May 2022 15:03:48 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 7/9] xhci: prevent U2 link power state if Intel tier policy prevented U1
Date:   Thu, 12 May 2022 01:04:48 +0300
Message-Id: <20220511220450.85367-8-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511220450.85367-1-mathias.nyman@linux.intel.com>
References: <20220511220450.85367-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Don't enable U1 or U2 Link powermanagenet (LPM) states for USB3
devices connected to tier 2 or further hubs.

For unknown reasons we previously only prevented U1.
Be consistent, and prevent both U1/U2 states if tier policy doesn't
allow LPM.

Also check the tier policy a bit earlier, and return if U1/U2 is
not allowed. This avoids unnecessary xhci MEL commands.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 19363f542d19..18306e28e7f8 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4886,9 +4886,6 @@ static int xhci_check_intel_tier_policy(struct usb_device *udev,
 	struct usb_device *parent;
 	unsigned int num_hubs;
 
-	if (state == USB3_LPM_U2)
-		return 0;
-
 	/* Don't enable U1 if the device is on a 2nd tier hub or lower. */
 	for (parent = udev->parent, num_hubs = 0; parent->parent;
 			parent = parent->parent)
@@ -4897,7 +4894,7 @@ static int xhci_check_intel_tier_policy(struct usb_device *udev,
 	if (num_hubs < 2)
 		return 0;
 
-	dev_dbg(&udev->dev, "Disabling U1 link state for device"
+	dev_dbg(&udev->dev, "Disabling U1/U2 link state for device"
 			" below second-tier hub.\n");
 	dev_dbg(&udev->dev, "Plug device into first-tier hub "
 			"to decrease power consumption.\n");
@@ -4938,9 +4935,6 @@ static u16 xhci_calculate_lpm_timeout(struct usb_hcd *hcd,
 		return timeout;
 	}
 
-	if (xhci_check_tier_policy(xhci, udev, state) < 0)
-		return timeout;
-
 	/* Gather some information about the currently installed configuration
 	 * and alternate interface settings.
 	 */
@@ -5047,6 +5041,9 @@ static int xhci_enable_usb3_lpm_timeout(struct usb_hcd *hcd,
 			!xhci->devs[udev->slot_id])
 		return USB3_LPM_DISABLED;
 
+	if (xhci_check_tier_policy(xhci, udev, state) < 0)
+		return USB3_LPM_DISABLED;
+
 	hub_encoded_timeout = xhci_calculate_lpm_timeout(hcd, udev, state);
 	mel = calculate_max_exit_latency(udev, state, hub_encoded_timeout);
 	if (mel < 0) {
-- 
2.25.1

