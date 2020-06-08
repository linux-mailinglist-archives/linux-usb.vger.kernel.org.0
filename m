Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD3C1F1FC7
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jun 2020 21:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgFHT1o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Jun 2020 15:27:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:39732 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726628AbgFHT1m (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Jun 2020 15:27:42 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 86AA3AFFB;
        Mon,  8 Jun 2020 19:27:43 +0000 (UTC)
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     f.fainelli@gmail.com, gregkh@linuxfoundation.org, wahrenst@gmx.net,
        robh@kernel.org, mathias.nyman@linux.intel.com,
        Eric Anholt <eric@anholt.net>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-usb@vger.kernel.org,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     linux-kernel@vger.kernel.org, tim.gover@raspberrypi.org,
        helgaas@kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 9/9] Revert "PCI: brcmstb: Wait for Raspberry Pi's firmware when present"
Date:   Mon,  8 Jun 2020 21:27:01 +0200
Message-Id: <20200608192701.18355-10-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608192701.18355-1-nsaenzjulienne@suse.de>
References: <20200608192701.18355-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit 44331189f9082c7e659697bbac1747db3def73e7.

Now that the VL805 init routine is run through a reset controller driver
the dependencies are being taken care of by the device core. No need to
do it manually here.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 drivers/pci/controller/pcie-brcmstb.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 7730ea845ff2..752f5b331579 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -28,8 +28,6 @@
 #include <linux/string.h>
 #include <linux/types.h>
 
-#include <soc/bcm2835/raspberrypi-firmware.h>
-
 #include "../pci.h"
 
 /* BRCM_PCIE_CAP_REGS - Offset for the mandatory capability config regs */
@@ -931,26 +929,11 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node, *msi_np;
 	struct pci_host_bridge *bridge;
-	struct device_node *fw_np;
 	struct brcm_pcie *pcie;
 	struct pci_bus *child;
 	struct resource *res;
 	int ret;
 
-	/*
-	 * We have to wait for Raspberry Pi's firmware interface to be up as a
-	 * PCI fixup, rpi_firmware_init_vl805(), depends on it. This driver's
-	 * probe can race with the firmware interface's (see
-	 * drivers/firmware/raspberrypi.c) and potentially break the PCI fixup.
-	 */
-	fw_np = of_find_compatible_node(NULL, NULL,
-					"raspberrypi,bcm2835-firmware");
-	if (fw_np && !rpi_firmware_get(fw_np)) {
-		of_node_put(fw_np);
-		return -EPROBE_DEFER;
-	}
-	of_node_put(fw_np);
-
 	bridge = devm_pci_alloc_host_bridge(&pdev->dev, sizeof(*pcie));
 	if (!bridge)
 		return -ENOMEM;
-- 
2.26.2

