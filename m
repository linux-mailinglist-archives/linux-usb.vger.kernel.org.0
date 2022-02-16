Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 693D44B839D
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 10:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbiBPJIe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 04:08:34 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:51440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231868AbiBPJIc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 04:08:32 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF01F1A82C
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 01:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645002489; x=1676538489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Apfz2nzKbjJvi9ro1g+ZhOWJw6oVKwC+F1K6hz+UGYo=;
  b=Ij+q5CBXX1qK2mXZgIesJqObhgwg4vtYDVbAsI8kG+r4lxAZDMZ5DIX8
   5Ipcon0ni46i4LGqx8bGc3ElZSysFrycGOGVlZg6rrJTLIHFMJEsZYMhA
   1rbqvtCcuF6Plrf/9oi9CKvpIWlynjl/jwrfCt+vXsOgEod1SkHbxAT35
   m2eqNywNj6mhik9S18lm+EyrBkp3AFO0da6TJ9G3p2fR1YRuKd/qOlZSp
   ky8jHTPC6iugplzU19Q5LKhC+cJIeblEySmZRlzC47ezzyqAOcGdCPmIK
   qZW/A50m06NJJHAv8BQE1qdNMy00lezkU7eFrVuBa8jsbrVTjDwtlv4RK
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="275138017"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="275138017"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 01:08:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="571190300"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 16 Feb 2022 01:08:07 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/9] xhci: dbc: refactor xhci_dbc_init()
Date:   Wed, 16 Feb 2022 11:09:30 +0200
Message-Id: <20220216090938.1260899-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216090938.1260899-1-mathias.nyman@linux.intel.com>
References: <20220216090938.1260899-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Refactor xhci_dbc_init(), splitting it into logical
parts closer to the Linux device model.

- Create the fake dbc device, depends on xhci strucure
- Allocate a dbc structure, xhci agnostic
- Call xhci_dbc_tty_probe(), similar to actual probe.

Adjustments to xhci_dbc_exit and xhci_dbc_remove are also needed
as a result to the xhci_dbc_init() changes

Mostly non-functional changes, except for creating the dbc sysfs
entry earlier, together with the dbc structure.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 124 ++++++++++++++++++---------------
 1 file changed, 66 insertions(+), 58 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index ccb0156fcebe..6a437862b498 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -924,49 +924,6 @@ static void xhci_do_dbc_exit(struct xhci_hcd *xhci)
 	spin_unlock_irqrestore(&xhci->lock, flags);
 }
 
-static int xhci_do_dbc_init(struct xhci_hcd *xhci)
-{
-	u32			reg;
-	struct xhci_dbc		*dbc;
-	unsigned long		flags;
-	void __iomem		*base;
-	int			dbc_cap_offs;
-
-	base = &xhci->cap_regs->hc_capbase;
-	dbc_cap_offs = xhci_find_next_ext_cap(base, 0, XHCI_EXT_CAPS_DEBUG);
-	if (!dbc_cap_offs)
-		return -ENODEV;
-
-	dbc = kzalloc(sizeof(*dbc), GFP_KERNEL);
-	if (!dbc)
-		return -ENOMEM;
-
-	dbc->regs = base + dbc_cap_offs;
-
-	/* We will avoid using DbC in xhci driver if it's in use. */
-	reg = readl(&dbc->regs->control);
-	if (reg & DBC_CTRL_DBC_ENABLE) {
-		kfree(dbc);
-		return -EBUSY;
-	}
-
-	spin_lock_irqsave(&xhci->lock, flags);
-	if (xhci->dbc) {
-		spin_unlock_irqrestore(&xhci->lock, flags);
-		kfree(dbc);
-		return -EBUSY;
-	}
-	xhci->dbc = dbc;
-	spin_unlock_irqrestore(&xhci->lock, flags);
-
-	dbc->xhci = xhci;
-	dbc->dev = xhci_to_hcd(xhci)->self.sysdev;
-	INIT_DELAYED_WORK(&dbc->event_work, xhci_dbc_handle_events);
-	spin_lock_init(&dbc->lock);
-
-	return 0;
-}
-
 static ssize_t dbc_show(struct device *dev,
 			struct device_attribute *attr,
 			char *buf)
@@ -1026,44 +983,95 @@ static ssize_t dbc_store(struct device *dev,
 
 static DEVICE_ATTR_RW(dbc);
 
-int xhci_dbc_init(struct xhci_hcd *xhci)
+struct xhci_dbc *
+xhci_alloc_dbc(struct device *dev, void __iomem *base)
 {
+	struct xhci_dbc		*dbc;
 	int			ret;
-	struct device		*dev = xhci_to_hcd(xhci)->self.controller;
 
-	ret = xhci_do_dbc_init(xhci);
+	dbc = kzalloc(sizeof(*dbc), GFP_KERNEL);
+	if (!dbc)
+		return NULL;
+
+	dbc->regs = base;
+	dbc->dev = dev;
+
+	if (readl(&dbc->regs->control) & DBC_CTRL_DBC_ENABLE)
+		return NULL;
+
+	INIT_DELAYED_WORK(&dbc->event_work, xhci_dbc_handle_events);
+	spin_lock_init(&dbc->lock);
+
+	ret = device_create_file(dev, &dev_attr_dbc);
 	if (ret)
-		goto init_err3;
+		goto err;
+
+	return dbc;
+err:
+	kfree(dbc);
+	return NULL;
+}
+
+/* undo what xhci_alloc_dbc() did */
+void xhci_dbc_remove(struct xhci_dbc *dbc)
+{
+	if (!dbc)
+		return;
+	/* stop hw, stop wq and call dbc->ops->stop() */
+	xhci_dbc_stop(dbc);
+
+	/* remove sysfs files */
+	device_remove_file(dbc->dev, &dev_attr_dbc);
+
+	kfree(dbc);
+}
+
+int xhci_dbc_init(struct xhci_hcd *xhci)
+{
+	struct device		*dev;
+	void __iomem		*base;
+	int			ret;
+	int			dbc_cap_offs;
+
+	/* create all parameters needed resembling a dbc device */
+	dev = xhci_to_hcd(xhci)->self.controller;
+	base = &xhci->cap_regs->hc_capbase;
+
+	dbc_cap_offs = xhci_find_next_ext_cap(base, 0, XHCI_EXT_CAPS_DEBUG);
+	if (!dbc_cap_offs)
+		return -ENODEV;
+
+	/* already allocated and in use */
+	if (xhci->dbc)
+		return -EBUSY;
+
+	xhci->dbc = xhci_alloc_dbc(dev, base);
+	if (!xhci->dbc)
+		return -ENOMEM;
 
 	ret = xhci_dbc_tty_probe(xhci);
 	if (ret)
 		goto init_err2;
 
-	ret = device_create_file(dev, &dev_attr_dbc);
-	if (ret)
-		goto init_err1;
-
 	return 0;
 
-init_err1:
-	xhci_dbc_tty_remove(xhci->dbc);
 init_err2:
 	xhci_do_dbc_exit(xhci);
-init_err3:
 	return ret;
 }
 
 void xhci_dbc_exit(struct xhci_hcd *xhci)
 {
-	struct device		*dev = xhci_to_hcd(xhci)->self.controller;
+	unsigned long		flags;
 
 	if (!xhci->dbc)
 		return;
 
-	device_remove_file(dev, &dev_attr_dbc);
 	xhci_dbc_tty_remove(xhci->dbc);
-	xhci_dbc_stop(xhci->dbc);
-	xhci_do_dbc_exit(xhci);
+	xhci_dbc_remove(xhci->dbc);
+	spin_lock_irqsave(&xhci->lock, flags);
+	xhci->dbc = NULL;
+	spin_unlock_irqrestore(&xhci->lock, flags);
 }
 
 #ifdef CONFIG_PM
-- 
2.25.1

