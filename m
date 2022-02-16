Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD0254B84ED
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 10:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232506AbiBPJvU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 04:51:20 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:48352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232458AbiBPJvT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 04:51:19 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3122B3ADE
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 01:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645005058; x=1676541058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rvCCsufddA+kAOKlClpMx59Cz9OFvn49q/s6jaaq37A=;
  b=dkQeb/a5kZHudmujGcd0btAbWHvhQ/T1Z1Xunr3ebrU9eL3HE9CX4O4E
   6xOvcSZLQ0ntM9Da2Gje1esik4WVxvc0Jd3GcvoBj8Tjr2O1Is4M2Q2d2
   nDwG00uuGpAToBI8WrXy9AwfgYYuaOl1Nv7zBvokLqsFV0i5f6+L54K0v
   jeGi3Kw9KhNe4vxo2o+w6/5b1SMTyW8Aw0KluU5bE6zWSXA7+9w2NAYRi
   07xqsbAw+5b94roHSDQ7AWL1noKYupS2m2zP4r9V1bvmBSot0Zk4yX8yf
   m/vocni5eXFdQMBiCds1WM40Nn3zP0syycKZIv0nDUGbUsAJSZGhFTUaL
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="249396965"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="249396965"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 01:50:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="636410353"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 16 Feb 2022 01:50:29 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 6/9] xhci: Allocate separate command structures for each LPM command
Date:   Wed, 16 Feb 2022 11:51:50 +0200
Message-Id: <20220216095153.1303105-7-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216095153.1303105-1-mathias.nyman@linux.intel.com>
References: <20220216095153.1303105-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Every lpm commmand, both for USB 2 and USB 3 devies used the same
xhci->lpm_command structure to change max exit latency.

xhci->lpm_command is only protected by a hcd->bandwidth mutex, which is
not enoungh as USB 2 and USB 3 devices are behind separate HCDs.

Simplify code and avoid unnecessary locking risks by allocating
separate command structures for each lpm command, just like with
all other commands.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c |  7 -------
 drivers/usb/host/xhci.c     | 21 ++++++++-------------
 drivers/usb/host/xhci.h     |  2 --
 3 files changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 0e312066c5c6..7a2dce730e9a 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1846,9 +1846,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci->event_ring = NULL;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed event ring");
 
-	if (xhci->lpm_command)
-		xhci_free_command(xhci, xhci->lpm_command);
-	xhci->lpm_command = NULL;
 	if (xhci->cmd_ring)
 		xhci_ring_free(xhci, xhci->cmd_ring);
 	xhci->cmd_ring = NULL;
@@ -2488,10 +2485,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 			"// Setting command ring address to 0x%016llx", val_64);
 	xhci_write_64(xhci, val_64, &xhci->op_regs->cmd_ring);
 
-	xhci->lpm_command = xhci_alloc_command_with_ctx(xhci, true, flags);
-	if (!xhci->lpm_command)
-		goto fail;
-
 	/* Reserve one command ring TRB for disabling LPM.
 	 * Since the USB core grabs the shared usb_bus bandwidth mutex before
 	 * disabling LPM, we only need to reserve one TRB for all devices.
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 17a561abfab7..2a58677d9b7a 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4344,6 +4344,10 @@ static int __maybe_unused xhci_change_max_exit_latency(struct xhci_hcd *xhci,
 	unsigned long flags;
 	int ret;
 
+	command = xhci_alloc_command_with_ctx(xhci, true, GFP_KERNEL);
+	if (!command)
+		return -ENOMEM;
+
 	spin_lock_irqsave(&xhci->lock, flags);
 
 	virt_dev = xhci->devs[udev->slot_id];
@@ -4360,10 +4364,10 @@ static int __maybe_unused xhci_change_max_exit_latency(struct xhci_hcd *xhci,
 	}
 
 	/* Attempt to issue an Evaluate Context command to change the MEL. */
-	command = xhci->lpm_command;
 	ctrl_ctx = xhci_get_input_control_ctx(command->in_ctx);
 	if (!ctrl_ctx) {
 		spin_unlock_irqrestore(&xhci->lock, flags);
+		xhci_free_command(xhci, command);
 		xhci_warn(xhci, "%s: Could not get input context, bad type.\n",
 				__func__);
 		return -ENOMEM;
@@ -4390,6 +4394,9 @@ static int __maybe_unused xhci_change_max_exit_latency(struct xhci_hcd *xhci,
 		virt_dev->current_mel = max_exit_latency;
 		spin_unlock_irqrestore(&xhci->lock, flags);
 	}
+
+	xhci_free_command(xhci, command);
+
 	return ret;
 }
 
@@ -4510,18 +4517,8 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 			exit_latency = xhci_besl_encoding[hird];
 			spin_unlock_irqrestore(&xhci->lock, flags);
 
-			/* USB 3.0 code dedicate one xhci->lpm_command->in_ctx
-			 * input context for link powermanagement evaluate
-			 * context commands. It is protected by hcd->bandwidth
-			 * mutex and is shared by all devices. We need to set
-			 * the max ext latency in USB 2 BESL LPM as well, so
-			 * use the same mutex and xhci_change_max_exit_latency()
-			 */
-			mutex_lock(hcd->bandwidth_mutex);
 			ret = xhci_change_max_exit_latency(xhci, udev,
 							   exit_latency);
-			mutex_unlock(hcd->bandwidth_mutex);
-
 			if (ret < 0)
 				return ret;
 			spin_lock_irqsave(&xhci->lock, flags);
@@ -4549,9 +4546,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 		readl(pm_addr);
 		if (udev->usb2_hw_lpm_besl_capable) {
 			spin_unlock_irqrestore(&xhci->lock, flags);
-			mutex_lock(hcd->bandwidth_mutex);
 			xhci_change_max_exit_latency(xhci, udev, 0);
-			mutex_unlock(hcd->bandwidth_mutex);
 			readl_poll_timeout(ports[port_num]->addr, pm_val,
 					   (pm_val & PORT_PLS_MASK) == XDEV_U0,
 					   100, 10000);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 5a75fe563123..8a0026ee9524 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1812,8 +1812,6 @@ struct xhci_hcd {
 	/* slot enabling and address device helpers */
 	/* these are not thread safe so use mutex */
 	struct mutex mutex;
-	/* For USB 3.0 LPM enable/disable. */
-	struct xhci_command		*lpm_command;
 	/* Internal mirror of the HW's dcbaa */
 	struct xhci_virt_device	*devs[MAX_HC_SLOTS];
 	/* For keeping track of bandwidth domains per roothub. */
-- 
2.25.1

