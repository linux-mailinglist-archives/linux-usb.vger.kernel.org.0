Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85AF11F1FBE
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jun 2020 21:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgFHT1m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Jun 2020 15:27:42 -0400
Received: from mx2.suse.de ([195.135.220.15]:39790 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726617AbgFHT1l (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Jun 2020 15:27:41 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 7652DAEBF;
        Mon,  8 Jun 2020 19:27:42 +0000 (UTC)
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     f.fainelli@gmail.com, gregkh@linuxfoundation.org, wahrenst@gmx.net,
        robh@kernel.org, mathias.nyman@linux.intel.com,
        Eric Anholt <eric@anholt.net>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-usb@vger.kernel.org,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-kernel@vger.kernel.org, tim.gover@raspberrypi.org,
        helgaas@kernel.org, lorenzo.pieralisi@arm.com
Subject: [PATCH 8/9] Revert "firmware: raspberrypi: Introduce vl805 init routine"
Date:   Mon,  8 Jun 2020 21:27:00 +0200
Message-Id: <20200608192701.18355-9-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608192701.18355-1-nsaenzjulienne@suse.de>
References: <20200608192701.18355-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit fbbc5ff3f7f9f4cad562e530ae2cf5d8964fe6d3.

The vl805 routine has moved to drivers/reset/reset-raspberrypi-usb.c

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 drivers/firmware/raspberrypi.c             | 61 ----------------------
 include/soc/bcm2835/raspberrypi-firmware.h |  7 ---
 2 files changed, 68 deletions(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index ef8098856a47..a3e85186f8e6 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -12,8 +12,6 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/pci.h>
-#include <linux/delay.h>
 #include <soc/bcm2835/raspberrypi-firmware.h>
 
 #define MBOX_MSG(chan, data28)		(((data28) & ~0xf) | ((chan) & 0xf))
@@ -21,8 +19,6 @@
 #define MBOX_DATA28(msg)		((msg) & ~0xf)
 #define MBOX_CHAN_PROPERTY		8
 
-#define VL805_PCI_CONFIG_VERSION_OFFSET		0x50
-
 static struct platform_device *rpi_hwmon;
 static struct platform_device *rpi_clk;
 
@@ -284,63 +280,6 @@ struct rpi_firmware *rpi_firmware_get(struct device_node *firmware_node)
 }
 EXPORT_SYMBOL_GPL(rpi_firmware_get);
 
-/*
- * The Raspberry Pi 4 gets its USB functionality from VL805, a PCIe chip that
- * implements xHCI. After a PCI reset, VL805's firmware may either be loaded
- * directly from an EEPROM or, if not present, by the SoC's co-processor,
- * VideoCore. RPi4's VideoCore OS contains both the non public firmware load
- * logic and the VL805 firmware blob. This function triggers the aforementioned
- * process.
- */
-int rpi_firmware_init_vl805(struct pci_dev *pdev)
-{
-	struct device_node *fw_np;
-	struct rpi_firmware *fw;
-	u32 dev_addr, version;
-	int ret;
-
-	fw_np = of_find_compatible_node(NULL, NULL,
-					"raspberrypi,bcm2835-firmware");
-	if (!fw_np)
-		return 0;
-
-	fw = rpi_firmware_get(fw_np);
-	of_node_put(fw_np);
-	if (!fw)
-		return -ENODEV;
-
-	/*
-	 * Make sure we don't trigger a firmware load unnecessarily.
-	 *
-	 * If something went wrong with PCI, this whole exercise would be
-	 * futile as VideoCore expects from us a configured PCI bus. Just take
-	 * the faulty version (likely ~0) and let xHCI's registration fail
-	 * further down the line.
-	 */
-	pci_read_config_dword(pdev, VL805_PCI_CONFIG_VERSION_OFFSET, &version);
-	if (version)
-		goto exit;
-
-	dev_addr = pdev->bus->number << 20 | PCI_SLOT(pdev->devfn) << 15 |
-		   PCI_FUNC(pdev->devfn) << 12;
-
-	ret = rpi_firmware_property(fw, RPI_FIRMWARE_NOTIFY_XHCI_RESET,
-				    &dev_addr, sizeof(dev_addr));
-	if (ret)
-		return ret;
-
-	/* Wait for vl805 to startup */
-	usleep_range(200, 1000);
-
-	pci_read_config_dword(pdev, VL805_PCI_CONFIG_VERSION_OFFSET,
-			      &version);
-exit:
-	pci_info(pdev, "VL805 firmware version %08x\n", version);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(rpi_firmware_init_vl805);
-
 static const struct of_device_id rpi_firmware_of_match[] = {
 	{ .compatible = "raspberrypi,bcm2835-firmware", },
 	{},
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 3025aca3c358..cc9cdbc66403 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -10,7 +10,6 @@
 #include <linux/of_device.h>
 
 struct rpi_firmware;
-struct pci_dev;
 
 enum rpi_firmware_property_status {
 	RPI_FIRMWARE_STATUS_REQUEST = 0,
@@ -142,7 +141,6 @@ int rpi_firmware_property(struct rpi_firmware *fw,
 int rpi_firmware_property_list(struct rpi_firmware *fw,
 			       void *data, size_t tag_size);
 struct rpi_firmware *rpi_firmware_get(struct device_node *firmware_node);
-int rpi_firmware_init_vl805(struct pci_dev *pdev);
 #else
 static inline int rpi_firmware_property(struct rpi_firmware *fw, u32 tag,
 					void *data, size_t len)
@@ -160,11 +158,6 @@ static inline struct rpi_firmware *rpi_firmware_get(struct device_node *firmware
 {
 	return NULL;
 }
-
-static inline int rpi_firmware_init_vl805(struct pci_dev *pdev)
-{
-	return 0;
-}
 #endif
 
 #endif /* __SOC_RASPBERRY_FIRMWARE_H__ */
-- 
2.26.2

