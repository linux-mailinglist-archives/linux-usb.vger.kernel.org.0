Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D65AD23459A
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jul 2020 14:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732985AbgGaMVE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jul 2020 08:21:04 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:51454 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732842AbgGaMVE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jul 2020 08:21:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1596198063; x=1627734063;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=cDNn5Pt2cvBTjI3feen1vNEeXzc+hlnJwACYVaaQluM=;
  b=Cuqa7kbcmhIq4yXq54mggH0jtNvVzjSQZ/luE+MdTTJejHH5x0Cn8Pet
   6RL8LyopYROQ6wPfySdDoZOV/h5kSeo+7vHDUn6VPDy1QbFNOueqp9Sr8
   /I2MFqcXjRIcHu078lHzOCLRakhF8qQ8GPXT7LEZvc7a+Oiz2yuvipE+h
   EffFQz+ZOyuR4W6sP7XfbpzLxu3wikQWk3GetE7W05PC6LK+gFL/wVKGT
   4ISAeyhZWJ8IE1KkVjD7IsGzcwHFGfRf522eUt+n1Nk+f2trCdY4d4VWQ
   CReBP8kIXMnPD1kPrsn5wIT2zF+Uap7SxRmc8Zz9zCOJxntr4W7XZ2Axs
   Q==;
IronPort-SDR: 5uCtydXQXBF/8gIe/f+KCO4huaguvl+tzo8PE3ybjA0jhBBomxUAg9KjpgNZ4oEmgpf6CVDT6T
 i3LE/R5lC/k5uQJc1rR8H4NQfxoU9/tYF/fPUNGvLxa+V9lxPV/62wcBNCC7+/MVBvjwTX6YRR
 4wg92ZomXkgt9OTta7jYNlVGRstVaobw1nq4QI53F/t28gCUfRMujYU7i0A1AASAH8LEWvW3I5
 6v/A4DWuv3grnithyQ458vcpViSm1UZVm7znViaSDooW9tyPdg9hfSHPHiBBmOXF8jhnH47JDH
 ZVI=
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; 
   d="scan'208";a="83930404"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Jul 2020 05:21:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 31 Jul 2020 05:21:01 -0700
Received: from kar-sv-agl01.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 31 Jul 2020 05:21:00 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH v7] drivers: most: add USB adapter driver
Date:   Fri, 31 Jul 2020 14:20:58 +0200
Message-ID: <1596198058-26541-1-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds the USB driver source file most_usb.c and
modifies the Makefile and Kconfig accordingly.

Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
---
v2:
Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
        - don't remove usb driver from staging area
        - don't touch staging/most/Kconfig
        - remove subdirectory for USB driver and put source file into
          drivers/most
v3:
        - submitted fixes found during code audit to staging version
          first to be able to resend single patch that adds the driver
v4:
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

        submitted patch set that fixes issues found during code audit
        to staging version first to be able to resend single patch that
        adds the driver. The patch series included:

        - use function sysfs_streq
        - add missing put_device calls
        - use correct error codes
        - replace code to calculate array index
        - don't use error path to exit function on success
        - move allocation of URB out of critical section
        - return 0 instead of variable
        - change return value of function drci_rd_reg
        - don't use expressions that might fail in a declaration
        - change order of function parameters

v5:
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

        submitted patch set that fixes issues found during code audit
        to staging version first to be able to resend single patch that
        adds the driver. The patch series included:

        - init return value in default path of switch/case expression

v6:
Reported-by: Randy Dunlap <rdunlap@infradead.org>

	remove dependency to NET in Kconfig file

v7:
Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

	created patch with 'git format-patch -M' to show that this is
	a move only.
 
 drivers/most/Kconfig                                | 11 +++++++++++
 drivers/most/Makefile                               |  2 ++
 drivers/{staging/most/usb/usb.c => most/most_usb.c} |  0
 drivers/staging/most/Kconfig                        |  2 --
 drivers/staging/most/usb/Kconfig                    | 13 -------------
 drivers/staging/most/usb/Makefile                   |  4 ----
 6 files changed, 13 insertions(+), 19 deletions(-)
 rename drivers/{staging/most/usb/usb.c => most/most_usb.c} (100%)
 delete mode 100644 drivers/staging/most/usb/Kconfig
 delete mode 100644 drivers/staging/most/usb/Makefile

diff --git a/drivers/most/Kconfig b/drivers/most/Kconfig
index 58d7999..60fc082 100644
--- a/drivers/most/Kconfig
+++ b/drivers/most/Kconfig
@@ -13,3 +13,14 @@ menuconfig MOST
 	  module will be called most_core.
 
 	  If in doubt, say N here.
+
+if MOST
+config MOST_USB_HDM
+	tristate "USB"
+	depends on USB
+	help
+	  Say Y here if you want to connect via USB to network transceiver.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called most_usb.
+endif
diff --git a/drivers/most/Makefile b/drivers/most/Makefile
index e810cd3..6a3cb90 100644
--- a/drivers/most/Makefile
+++ b/drivers/most/Makefile
@@ -2,3 +2,5 @@
 obj-$(CONFIG_MOST) += most_core.o
 most_core-y :=	core.o \
 		configfs.o
+
+obj-$(CONFIG_MOST_USB_HDM) += most_usb.o
diff --git a/drivers/staging/most/usb/usb.c b/drivers/most/most_usb.c
similarity index 100%
rename from drivers/staging/most/usb/usb.c
rename to drivers/most/most_usb.c
diff --git a/drivers/staging/most/Kconfig b/drivers/staging/most/Kconfig
index c5a99f7..c35fb34f 100644
--- a/drivers/staging/most/Kconfig
+++ b/drivers/staging/most/Kconfig
@@ -30,6 +30,4 @@ source "drivers/staging/most/dim2/Kconfig"
 
 source "drivers/staging/most/i2c/Kconfig"
 
-source "drivers/staging/most/usb/Kconfig"
-
 endif
diff --git a/drivers/staging/most/usb/Kconfig b/drivers/staging/most/usb/Kconfig
deleted file mode 100644
index a47a973..0000000
--- a/drivers/staging/most/usb/Kconfig
+++ /dev/null
@@ -1,13 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# MOST USB configuration
-#
-
-config MOST_USB
-	tristate "USB"
-	depends on USB
-	help
-	  Say Y here if you want to connect via USB to network transceiver.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called most_usb.
diff --git a/drivers/staging/most/usb/Makefile b/drivers/staging/most/usb/Makefile
deleted file mode 100644
index c2b2073..0000000
--- a/drivers/staging/most/usb/Makefile
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_MOST_USB) += most_usb.o
-
-most_usb-objs := usb.o
-- 
2.7.4

