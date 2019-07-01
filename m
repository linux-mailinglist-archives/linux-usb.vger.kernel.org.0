Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4E85265B5
	for <lists+linux-usb@lfdr.de>; Wed, 22 May 2019 16:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729528AbfEVO2N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 May 2019 10:28:13 -0400
Received: from inva020.nxp.com ([92.121.34.13]:42302 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728491AbfEVO14 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 May 2019 10:27:56 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 544671A000F;
        Wed, 22 May 2019 16:27:54 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 47F8D1A01D8;
        Wed, 22 May 2019 16:27:54 +0200 (CEST)
Received: from fsr-ub1864-101.ea.freescale.net (fsr-ub1864-101.ea.freescale.net [10.171.82.13])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id BC475205ED;
        Wed, 22 May 2019 16:27:53 +0200 (CEST)
From:   laurentiu.tudor@nxp.com
To:     hch@lst.de, stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, marex@denx.de
Cc:     leoyang.li@nxp.com, linux-kernel@vger.kernel.org,
        robin.murphy@arm.com, noring@nocrew.org, JuergenUrban@gmx.de,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: [PATCH v6 4/5] usb: host: ohci-tmio: init genalloc for local memory
Date:   Wed, 22 May 2019 17:27:47 +0300
Message-Id: <20190522142748.10078-5-laurentiu.tudor@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522142748.10078-1-laurentiu.tudor@nxp.com>
References: <20190522142748.10078-1-laurentiu.tudor@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

In preparation for dropping the existing "coherent" dma mem declaration
APIs, replace the current dma_declare_coherent_memory() based mechanism
with the creation of a genalloc pool that will be used in the OHCI
subsystem as replacement for the DMA APIs.

For context, see thread here: https://lkml.org/lkml/2019/4/22/357

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
 drivers/usb/host/ohci-tmio.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/ohci-tmio.c b/drivers/usb/host/ohci-tmio.c
index f88a0370659f..3b84ce0c3f29 100644
--- a/drivers/usb/host/ohci-tmio.c
+++ b/drivers/usb/host/ohci-tmio.c
@@ -224,11 +224,6 @@ static int ohci_hcd_tmio_drv_probe(struct platform_device *dev)
 		goto err_ioremap_regs;
 	}
 
-	ret = dma_declare_coherent_memory(&dev->dev, sram->start, sram->start,
-				resource_size(sram));
-	if (ret)
-		goto err_dma_declare;
-
 	if (cell->enable) {
 		ret = cell->enable(dev);
 		if (ret)
@@ -239,6 +234,11 @@ static int ohci_hcd_tmio_drv_probe(struct platform_device *dev)
 	ohci = hcd_to_ohci(hcd);
 	ohci_hcd_init(ohci);
 
+	ret = usb_hcd_setup_local_mem(hcd, sram->start, sram->start,
+				      resource_size(sram));
+	if (ret < 0)
+		goto err_enable;
+
 	ret = usb_add_hcd(hcd, irq, 0);
 	if (ret)
 		goto err_add_hcd;
@@ -254,8 +254,6 @@ static int ohci_hcd_tmio_drv_probe(struct platform_device *dev)
 	if (cell->disable)
 		cell->disable(dev);
 err_enable:
-	dma_release_declared_memory(&dev->dev);
-err_dma_declare:
 	iounmap(hcd->regs);
 err_ioremap_regs:
 	iounmap(tmio->ccr);
@@ -276,7 +274,6 @@ static int ohci_hcd_tmio_drv_remove(struct platform_device *dev)
 	tmio_stop_hc(dev);
 	if (cell->disable)
 		cell->disable(dev);
-	dma_release_declared_memory(&dev->dev);
 	iounmap(hcd->regs);
 	iounmap(tmio->ccr);
 	usb_put_hcd(hcd);
-- 
2.17.1

