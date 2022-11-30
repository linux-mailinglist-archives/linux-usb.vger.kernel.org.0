Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7997563D198
	for <lists+linux-usb@lfdr.de>; Wed, 30 Nov 2022 10:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbiK3JS3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Nov 2022 04:18:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232501AbiK3JSV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Nov 2022 04:18:21 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90BE4B77C
        for <linux-usb@vger.kernel.org>; Wed, 30 Nov 2022 01:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669799900; x=1701335900;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=frSVE+iACOC1RfYR2rDUnAzSLdjVBe63L+IPgPZaCm4=;
  b=knJTRRCxCpweyqU73ibx7EBMQjkiELY5aEXG4h9iKugbtXS5FwoD4NWp
   J4Y03I1TFBXtz6jsST26FsiAoM9pf9QnKPoxP/gJmKAgC1diRSCJGTuX7
   KSVnM3qqL6LyyR+wWPtF4eBFV+aExtIQJn9Zoha9gSzzKCYXFxU/bIuB6
   +r60kKC99hXOJnxB48lN4jNQtdUYegpXaTU2t+bOu4S32c0anGnZinbgO
   0MpmGeuTOOs44gV5Sbj+jQR4fdfvB6XIuV0IVXR0ODoq0rHDkiBNeQjh1
   AgRAoE66vyINZjWlLrWTqSc4o4hzme871YtCSiY/OvBnC48YvODn9/6Ht
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="295711289"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; 
   d="scan'208";a="295711289"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 01:18:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="674962711"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; 
   d="scan'208";a="674962711"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga008.jf.intel.com with ESMTP; 30 Nov 2022 01:18:19 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 4/6] xhci: disable U3 suspended ports in S4 hibernate poweroff_late stage
Date:   Wed, 30 Nov 2022 11:19:42 +0200
Message-Id: <20221130091944.2171610-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130091944.2171610-1-mathias.nyman@linux.intel.com>
References: <20221130091944.2171610-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Disable U3 suspended ports in hibernate S4 poweroff_late for systems
with XHCI_RESET_TO_DEFAULT quirk, if wakeup is not enabled.

This reduces the number of self-powered usb devices from surviving in
U3 suspended state into next reboot.

Bootloader/firmware on these systems can't handle usb ports in U3, and
will timeout, causing extra delay during reboot/restore from S4.

Add pci_poweroff_late() callback to struct usb_hcd to get this done at
the correct stage in hibernate.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/core/hcd-pci.c  | 13 ++++++++++
 drivers/usb/host/xhci-pci.c | 52 +++++++++++++++++++++++++++++++++++++
 include/linux/usb/hcd.h     |  3 +++
 3 files changed, 68 insertions(+)

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index 9b77f49b3560..ab2f3737764e 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -558,6 +558,17 @@ static int hcd_pci_suspend_noirq(struct device *dev)
 	return retval;
 }
 
+static int hcd_pci_poweroff_late(struct device *dev)
+{
+	struct pci_dev		*pci_dev = to_pci_dev(dev);
+	struct usb_hcd		*hcd = pci_get_drvdata(pci_dev);
+
+	if (hcd->driver->pci_poweroff_late && !HCD_DEAD(hcd))
+		return hcd->driver->pci_poweroff_late(hcd, device_may_wakeup(dev));
+
+	return 0;
+}
+
 static int hcd_pci_resume_noirq(struct device *dev)
 {
 	powermac_set_asic(to_pci_dev(dev), 1);
@@ -578,6 +589,7 @@ static int hcd_pci_restore(struct device *dev)
 
 #define hcd_pci_suspend		NULL
 #define hcd_pci_suspend_noirq	NULL
+#define hcd_pci_poweroff_late	NULL
 #define hcd_pci_resume_noirq	NULL
 #define hcd_pci_resume		NULL
 #define hcd_pci_restore		NULL
@@ -615,6 +627,7 @@ const struct dev_pm_ops usb_hcd_pci_pm_ops = {
 	.thaw_noirq	= NULL,
 	.thaw		= hcd_pci_resume,
 	.poweroff	= hcd_pci_suspend,
+	.poweroff_late	= hcd_pci_poweroff_late,
 	.poweroff_noirq	= hcd_pci_suspend_noirq,
 	.restore_noirq	= hcd_pci_resume_noirq,
 	.restore	= hcd_pci_restore,
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index f98cf30a3c1a..7548b26510da 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -622,6 +622,57 @@ static int xhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
 	return retval;
 }
 
+static int xhci_pci_poweroff_late(struct usb_hcd *hcd, bool do_wakeup)
+{
+	struct xhci_hcd		*xhci = hcd_to_xhci(hcd);
+	struct xhci_port	*port;
+	struct usb_device	*udev;
+	unsigned int		slot_id;
+	u32			portsc;
+	int			i;
+
+	/*
+	 * Systems with XHCI_RESET_TO_DEFAULT quirk have boot firmware that
+	 * cause significant boot delay if usb ports are in suspended U3 state
+	 * during boot. Some USB devices survive in U3 state over S4 hibernate
+	 *
+	 * Disable ports that are in U3 if remote wake is not enabled for either
+	 * host controller or connected device
+	 */
+
+	if (!(xhci->quirks & XHCI_RESET_TO_DEFAULT))
+		return 0;
+
+	for (i = 0; i < HCS_MAX_PORTS(xhci->hcs_params1); i++) {
+		port = &xhci->hw_ports[i];
+		portsc = readl(port->addr);
+
+		if ((portsc & PORT_PLS_MASK) != XDEV_U3)
+			continue;
+
+		slot_id = xhci_find_slot_id_by_port(port->rhub->hcd, xhci,
+						    port->hcd_portnum + 1);
+		if (!slot_id || !xhci->devs[slot_id]) {
+			xhci_err(xhci, "No dev for slot_id %d for port %d-%d in U3\n",
+				 slot_id, port->rhub->hcd->self.busnum, port->hcd_portnum + 1);
+			continue;
+		}
+
+		udev = xhci->devs[slot_id]->udev;
+
+		/* if wakeup is enabled then don't disable the port */
+		if (udev->do_remote_wakeup && do_wakeup)
+			continue;
+
+		xhci_dbg(xhci, "port %d-%d in U3 without wakeup, disable it\n",
+			 port->rhub->hcd->self.busnum, port->hcd_portnum + 1);
+		portsc = xhci_port_state_to_neutral(portsc);
+		writel(portsc | PORT_PE, port->addr);
+	}
+
+	return 0;
+}
+
 static void xhci_pci_shutdown(struct usb_hcd *hcd)
 {
 	struct xhci_hcd		*xhci = hcd_to_xhci(hcd);
@@ -688,6 +739,7 @@ static int __init xhci_pci_init(void)
 #ifdef CONFIG_PM
 	xhci_pci_hc_driver.pci_suspend = xhci_pci_suspend;
 	xhci_pci_hc_driver.pci_resume = xhci_pci_resume;
+	xhci_pci_hc_driver.pci_poweroff_late = xhci_pci_poweroff_late;
 	xhci_pci_hc_driver.shutdown = xhci_pci_shutdown;
 #endif
 	return pci_register_driver(&xhci_pci_driver);
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 78cd566ee238..b51c07111729 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -269,6 +269,9 @@ struct hc_driver {
 	/* called after entering D0 (etc), before resuming the hub */
 	int	(*pci_resume)(struct usb_hcd *hcd, bool hibernated);
 
+	/* called just before hibernate final D3 state, allows host to poweroff parts */
+	int	(*pci_poweroff_late)(struct usb_hcd *hcd, bool do_wakeup);
+
 	/* cleanly make HCD stop writing memory and doing I/O */
 	void	(*stop) (struct usb_hcd *hcd);
 
-- 
2.25.1

