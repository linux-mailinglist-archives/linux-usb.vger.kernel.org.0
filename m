Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 010B56D751A
	for <lists+linux-usb@lfdr.de>; Wed,  5 Apr 2023 09:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236824AbjDEHSH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 03:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236800AbjDEHSG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 03:18:06 -0400
X-Greylist: delayed 894 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 05 Apr 2023 00:18:05 PDT
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1116.securemx.jp [210.130.202.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A5C3AA5
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 00:18:04 -0700 (PDT)
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1116) id 33573D7t026777; Wed, 5 Apr 2023 16:03:13 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 335732la004521; Wed, 5 Apr 2023 16:03:02 +0900
X-Iguazu-Qid: 2wHHaIQr9PPApZoZsX
X-Iguazu-QSIG: v=2; s=0; t=1680678182; q=2wHHaIQr9PPApZoZsX; m=nXIw80IafNLfv6w3ed9ylicdmkllq2tJ/ZeUfbOvYdI=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
        by relay.securemx.jp (mx-mr1110) id 335731DD001166
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 5 Apr 2023 16:03:01 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH] usb: host: xhci-plat: Use dev_is_pci() helper
Date:   Wed,  5 Apr 2023 16:01:41 +0900
X-TSB-HOP2: ON
Message-Id: <20230405070141.2028455-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use common dev_is_pci() helper for checking PCI devices.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 drivers/usb/host/xhci-plat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index b9f9625467d61e..2c95189424fa6e 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -363,7 +363,7 @@ static int xhci_generic_plat_probe(struct platform_device *pdev)
 			is_acpi_device_node(sysdev->fwnode))
 			break;
 #ifdef CONFIG_PCI
-		else if (sysdev->bus == &pci_bus_type)
+		else if (dev_is_pci(sysdev))
 			break;
 #endif
 	}
-- 
2.36.1


