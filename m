Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C81C133916
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 03:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgAHCYF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jan 2020 21:24:05 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44408 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbgAHCYF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jan 2020 21:24:05 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0082O3DX050123;
        Tue, 7 Jan 2020 20:24:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578450243;
        bh=qOCATyhJgjSifdZz4D8QGpWJEaB/JxXHEotxf/GrBYA=;
        h=From:To:CC:Subject:Date;
        b=taaV/f8ZC/TZro0SNEiDF1MGqoV29Q1vbaWvg/5cYDMC1x/bhikpwlKCQpObjdKGY
         4tBjYMqRVzskdis6Y2XUMwYCt43kluec104F5qz9WnJjQq4DwkZsqV06esuJX33k2/
         9HAUr+E9tz+2frzqyVnHSiuAmOq3Exb82d6d3DQ0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0082O32P117688
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 Jan 2020 20:24:03 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 7 Jan
 2020 20:24:02 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 7 Jan 2020 20:24:02 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0082O26M084221;
        Tue, 7 Jan 2020 20:24:02 -0600
From:   Bin Liu <b-liu@ti.com>
To:     <linux-usb@vger.kernel.org>
CC:     Tony Lindgren <tony@atomide.com>, Bin Liu <b-liu@ti.com>
Subject: [PATCH] usb: musb: remove dummy driver musb_am335x.c
Date:   Tue, 7 Jan 2020 20:28:06 -0600
Message-ID: <20200108022806.32061-1-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since commit 0782e8572ce4 ("ARM: dts: Probe am335x musb with ti-sysc"),
the dummy driver musb_am335x.c is no longer needed, let's drop it.

Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/Kconfig       |  4 ----
 drivers/usb/musb/Makefile      |  3 ---
 drivers/usb/musb/musb_am335x.c | 44 ----------------------------------
 3 files changed, 51 deletions(-)
 delete mode 100644 drivers/usb/musb/musb_am335x.c

diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
index 63376d494f0f..eb2ded1026ee 100644
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -101,7 +101,6 @@ config USB_MUSB_AM35X
 
 config USB_MUSB_DSPS
 	tristate "TI DSPS platforms"
-	select USB_MUSB_AM335X_CHILD
 	depends on ARCH_OMAP2PLUS || COMPILE_TEST
 	depends on OF_IRQ
 
@@ -122,9 +121,6 @@ config USB_MUSB_MEDIATEK
 	depends on GENERIC_PHY
 	select USB_ROLE_SWITCH
 
-config USB_MUSB_AM335X_CHILD
-	tristate
-
 comment "MUSB DMA mode"
 
 config MUSB_PIO_ONLY
diff --git a/drivers/usb/musb/Makefile b/drivers/usb/musb/Makefile
index 63d82d0fab67..932247360a9f 100644
--- a/drivers/usb/musb/Makefile
+++ b/drivers/usb/musb/Makefile
@@ -26,9 +26,6 @@ obj-$(CONFIG_USB_MUSB_JZ4740)			+= jz4740.o
 obj-$(CONFIG_USB_MUSB_SUNXI)			+= sunxi.o
 obj-$(CONFIG_USB_MUSB_MEDIATEK)      		+= mediatek.o
 
-
-obj-$(CONFIG_USB_MUSB_AM335X_CHILD)		+= musb_am335x.o
-
 # the kconfig must guarantee that only one of the
 # possible I/O schemes will be enabled at a time ...
 # PIO only, or DMA (several potential schemes).
diff --git a/drivers/usb/musb/musb_am335x.c b/drivers/usb/musb/musb_am335x.c
deleted file mode 100644
index 5f04f8e3a640..000000000000
-- 
2.17.1

