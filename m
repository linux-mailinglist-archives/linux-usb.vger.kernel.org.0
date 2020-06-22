Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1C1203967
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jun 2020 16:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729371AbgFVO01 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jun 2020 10:26:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:46110 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729362AbgFVO00 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jun 2020 10:26:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 79952C1A8;
        Mon, 22 Jun 2020 14:26:23 +0000 (UTC)
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     f.fainelli@gmail.com, gregkh@linuxfoundation.org, robh@kernel.org,
        wahrenst@gmx.net, p.zabel@pengutronix.de
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, tim.gover@raspberrypi.org,
        linux-pci@vger.kernel.org, helgaas@kernel.org,
        andy.shevchenko@gmail.com, mathias.nyman@linux.intel.com,
        lorenzo.pieralisi@arm.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH v4 5/9] usb: xhci-pci: Add support for reset controllers
Date:   Mon, 22 Jun 2020 12:38:14 +0200
Message-Id: <20200622103817.476-6-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622103817.476-1-nsaenzjulienne@suse.de>
References: <20200622103817.476-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some atypical users of xhci-pci might need to manually reset their xHCI
controller before starting the HCD setup. Check if a reset controller
device is available to the PCI bus and trigger a reset.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

---

Changes since v3:
 - Now that DT is fixed we can use the actual xHCI device to get reset
   controller, we previously used the bus device (not altering the
   reviewed-bys as it doesn't really affect the integration with
   xhci-pci).

Changes since v2:
 - Also reset on resume

Changes since v1:
 - Use proper reset API
 - Make code simpler

 drivers/usb/host/xhci-pci.c | 10 ++++++++++
 drivers/usb/host/xhci.h     |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index ef513c2fb843..f8b171825dfc 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/acpi.h>
+#include <linux/reset.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -339,6 +340,7 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	struct xhci_hcd *xhci;
 	struct usb_hcd *hcd;
 	struct xhci_driver_data *driver_data;
+	struct reset_control *reset;
 
 	driver_data = (struct xhci_driver_data *)id->driver_data;
 	if (driver_data && driver_data->quirks & XHCI_RENESAS_FW_QUIRK) {
@@ -347,6 +349,11 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 			return retval;
 	}
 
+	reset = devm_reset_control_get_optional_exclusive(&dev->dev, NULL);
+	if (IS_ERR(reset))
+		return PTR_ERR(reset);
+	reset_control_reset(reset);
+
 	/* Prevent runtime suspending between USB-2 and USB-3 initialization */
 	pm_runtime_get_noresume(&dev->dev);
 
@@ -364,6 +371,7 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	/* USB 2.0 roothub is stored in the PCI device now. */
 	hcd = dev_get_drvdata(&dev->dev);
 	xhci = hcd_to_xhci(hcd);
+	xhci->reset = reset;
 	xhci->shared_hcd = usb_create_shared_hcd(&xhci_pci_hc_driver, &dev->dev,
 						 pci_name(dev), hcd);
 	if (!xhci->shared_hcd) {
@@ -515,6 +523,8 @@ static int xhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
 	struct pci_dev		*pdev = to_pci_dev(hcd->self.controller);
 	int			retval = 0;
 
+	reset_control_reset(xhci->reset);
+
 	/* The BIOS on systems with the Intel Panther Point chipset may or may
 	 * not support xHCI natively.  That means that during system resume, it
 	 * may switch the ports back to EHCI so that users can use their
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 2c6c4f8d1ee1..379ffa24877d 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1770,6 +1770,8 @@ struct xhci_hcd {
 	/* optional clocks */
 	struct clk		*clk;
 	struct clk		*reg_clk;
+	/* optional reset controller */
+	struct reset_control *reset;
 	/* data structures */
 	struct xhci_device_context_array *dcbaa;
 	struct xhci_ring	*cmd_ring;
-- 
2.27.0

