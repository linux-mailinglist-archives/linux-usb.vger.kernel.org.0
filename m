Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7618A60940F
	for <lists+linux-usb@lfdr.de>; Sun, 23 Oct 2022 16:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbiJWOtQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Oct 2022 10:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbiJWOtP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Oct 2022 10:49:15 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52127696C7
        for <linux-usb@vger.kernel.org>; Sun, 23 Oct 2022 07:49:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id j4so13061121lfk.0
        for <linux-usb@vger.kernel.org>; Sun, 23 Oct 2022 07:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JAH5HS0pGBlrd7ub7HyMFySzSvIvr/OcQFK7BcniIas=;
        b=ixBRbFlRBIfiexN4vQ71tf1TsnA9nBhotEjWQs5LHeNcrw87hJ5NJBOvSGqrKzGOBf
         wpEif7WU5A/8XrKSf7HmAq1tpiOy4UDQJsWZfvGskVkxiXkDnFpOWmQyKOXRT2E3Di/5
         lIwCmQRRgDsi/KOIBSB9Ve26tlsL8m9Moig1wFobg4Il0r2HfD94xkyrMx3bKMrlnwU7
         IWSyEfYYo6BmVWe39g9g4bleCQzcjxDkA45ifqInah1X9akSvi7eaa2CkVZt1fqLScXW
         zx4JtI1W5Fw4pL6Elj8C1fKEID++gsq1J2HYNospIRroInal5eLW9p3vdElJDSBTt/eY
         4Cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAH5HS0pGBlrd7ub7HyMFySzSvIvr/OcQFK7BcniIas=;
        b=xNYN5eED1P30mWGvQ/tl4RNa8eBgmG8k5IGpIKYahjIGnf11usOIIMeJsTIyTKFxjZ
         EddqshzLN7pHmQxiw+VUcZ0FLG+Lqpv+AFDaIBdarXCV0/I6281Y9e1n0e/lcMlfDYEi
         pHfoVT4U59uc3OLMeX3mVZNDGuSlR0qT/+xst3nHfI4E0hzWx38lywgGlZXCrQhRs9lZ
         QHqA7Tyc/a+1ZRzChgmxYecLBWLd7Qcw1mDoIstiNw0XpiiJUVcetN9vPREBqkwpI4LN
         l4k4j/Ayn0MDhbxatiJBx7Vn+E+L5Ckhf15kefzXmnnm7NzKX4+ZYS78Arvdh3T8/zFR
         rLQA==
X-Gm-Message-State: ACrzQf1cCOVQvxgUGBRu2581d1htA1Ksdf817idwQVc89l0r4O01q8on
        MRk+meVCvp5tWjI/9s7HYQ+Z7w==
X-Google-Smtp-Source: AMsMyM6mvX2TnKxxPCs7xlQMIs2ihMX8FiC+p3brHV4q8JE0S0Du3LvnYbzAurIhXDieMcLw/+q6yA==
X-Received: by 2002:a05:6512:1320:b0:488:8fcc:e196 with SMTP id x32-20020a056512132000b004888fcce196mr10044924lfu.602.1666536551557;
        Sun, 23 Oct 2022 07:49:11 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id bx13-20020a05651c198d00b002770909be0asm263127ljb.1.2022.10.23.07.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Oct 2022 07:49:10 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Fabian Vogt <fabian@ritter-vogt.de>,
        Yuan-Hsin Chen <yhchen@faraday-tech.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 1/3 v1] usb: fotg210: Collect pieces of dual mode controller
Date:   Sun, 23 Oct 2022 16:47:06 +0200
Message-Id: <20221023144708.3596563-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Faraday FOTG210 is a dual-mode OTG USB controller that can
act as host, peripheral or both. To be able to probe from one
hardware description and to follow the pattern of other dual-
mode controllers such as MUSB or MTU3 we need to collect the
two, currently completely separate drivers in the same
directory.

After this, users need to select the main symbol USB_FOTG210
and then each respective subdriver. We pave the road to
compile both drivers into the same kernel and select the
one we want to use at probe() time, and possibly add OTG
support in the end.

This patch doesn't do much more than create the new symbol
and collect the drivers in one place. We also add a comment
for the section of dual-mode controllers in the Kconfig
file so people can see what these selections are about.

Also add myself as maintainer as there has been little
response on my patches to these drivers.

Cc: Fabian Vogt <fabian@ritter-vogt.de>
Cc: Yuan-Hsin Chen <yhchen@faraday-tech.com>
Cc: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 MAINTAINERS                                   |  6 ++++
 drivers/usb/Kconfig                           |  4 +++
 drivers/usb/Makefile                          |  2 ++
 drivers/usb/fotg210/Kconfig                   | 36 +++++++++++++++++++
 drivers/usb/fotg210/Makefile                  |  3 ++
 drivers/usb/{host => fotg210}/fotg210-hcd.c   |  2 +-
 .../{host/fotg210.h => fotg210/fotg210-hcd.h} |  0
 .../usb/{gadget/udc => fotg210}/fotg210-udc.c |  2 +-
 .../udc/fotg210.h => fotg210/fotg210-udc.h}   |  0
 drivers/usb/gadget/udc/Kconfig                | 11 ------
 drivers/usb/gadget/udc/Makefile               |  1 -
 drivers/usb/host/Kconfig                      | 11 ------
 drivers/usb/host/Makefile                     |  1 -
 13 files changed, 53 insertions(+), 26 deletions(-)
 create mode 100644 drivers/usb/fotg210/Kconfig
 create mode 100644 drivers/usb/fotg210/Makefile
 rename drivers/usb/{host => fotg210}/fotg210-hcd.c (99%)
 rename drivers/usb/{host/fotg210.h => fotg210/fotg210-hcd.h} (100%)
 rename drivers/usb/{gadget/udc => fotg210}/fotg210-udc.c (99%)
 rename drivers/usb/{gadget/udc/fotg210.h => fotg210/fotg210-udc.h} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf0f18502372..7bb19a676ff9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7866,6 +7866,12 @@ F:	fs/notify/fanotify/
 F:	include/linux/fanotify.h
 F:	include/uapi/linux/fanotify.h
 
+FARADAY FOTG210 USB2 DUAL-ROLE CONTROLLER
+M:	Linus Walleij <linus.walleij@linaro.org>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	drivers/usb/fotg210/
+
 FARSYNC SYNCHRONOUS DRIVER
 M:	Kevin Curtis <kevin.curtis@farsite.co.uk>
 S:	Supported
diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
index 578a439e71b5..a871a988829d 100644
--- a/drivers/usb/Kconfig
+++ b/drivers/usb/Kconfig
@@ -111,8 +111,12 @@ source "drivers/usb/usbip/Kconfig"
 
 endif
 
+comment "USB dual-mode controller drivers"
+
 source "drivers/usb/cdns3/Kconfig"
 
+source "drivers/usb/fotg210/Kconfig"
+
 source "drivers/usb/mtu3/Kconfig"
 
 source "drivers/usb/musb/Kconfig"
diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
index 643edf5fe18c..a81e6ef293af 100644
--- a/drivers/usb/Makefile
+++ b/drivers/usb/Makefile
@@ -17,6 +17,8 @@ obj-$(CONFIG_USB_CDNS_SUPPORT)	+= cdns3/
 obj-$(CONFIG_USB_CDNS3)		+= cdns3/
 obj-$(CONFIG_USB_CDNSP_PCI)	+= cdns3/
 
+obj-$(CONFIG_USB_FOTG210)	+= fotg210/
+
 obj-$(CONFIG_USB_MON)		+= mon/
 obj-$(CONFIG_USB_MTU3)		+= mtu3/
 
diff --git a/drivers/usb/fotg210/Kconfig b/drivers/usb/fotg210/Kconfig
new file mode 100644
index 000000000000..e7a106785f5d
--- /dev/null
+++ b/drivers/usb/fotg210/Kconfig
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config USB_FOTG210
+	tristate "Faraday FOTG210 USB2 Dual Role controller"
+	depends on USB || USB_GADGET
+	depends on HAS_DMA && HAS_IOMEM
+	default ARCH_GEMINI
+	help
+	  Faraday FOTG210 is a dual-mode USB controller that can act
+	  in both host controller and peripheral controller mode.
+
+if USB_FOTG210
+
+config USB_FOTG210_HCD
+	tristate "Faraday FOTG210 USB Host Controller support"
+	depends on USB
+	help
+	  Faraday FOTG210 is an OTG controller which can be configured as
+	  an USB2.0 host. It is designed to meet USB2.0 EHCI specification
+	  with minor modification.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called fotg210-hcd.
+
+config USB_FOTG210_UDC
+	depends on USB_GADGET
+	tristate "Faraday FOTG210 USB Peripheral Controller support"
+	help
+	   Faraday USB2.0 OTG controller which can be configured as
+	   high speed or full speed USB device. This driver suppports
+	   Bulk Transfer so far.
+
+	   Say "y" to link the driver statically, or "m" to build a
+	   dynamically linked module called "fotg210-udc".
+
+endif
diff --git a/drivers/usb/fotg210/Makefile b/drivers/usb/fotg210/Makefile
new file mode 100644
index 000000000000..f4a26ca0e563
--- /dev/null
+++ b/drivers/usb/fotg210/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_USB_FOTG210_HCD)	+= fotg210-hcd.o
+obj-$(CONFIG_USB_FOTG210_UDC)	+= fotg210-udc.o
diff --git a/drivers/usb/host/fotg210-hcd.c b/drivers/usb/fotg210/fotg210-hcd.c
similarity index 99%
rename from drivers/usb/host/fotg210-hcd.c
rename to drivers/usb/fotg210/fotg210-hcd.c
index 3d1dbcf4c073..8fbf63e76d7d 100644
--- a/drivers/usb/host/fotg210-hcd.c
+++ b/drivers/usb/fotg210/fotg210-hcd.c
@@ -77,7 +77,7 @@ MODULE_PARM_DESC(hird, "host initiated resume duration, +1 for each 75us");
 
 #define INTR_MASK (STS_IAA | STS_FATAL | STS_PCD | STS_ERR | STS_INT)
 
-#include "fotg210.h"
+#include "fotg210-hcd.h"
 
 #define fotg210_dbg(fotg210, fmt, args...) \
 	dev_dbg(fotg210_to_hcd(fotg210)->self.controller, fmt, ## args)
diff --git a/drivers/usb/host/fotg210.h b/drivers/usb/fotg210/fotg210-hcd.h
similarity index 100%
rename from drivers/usb/host/fotg210.h
rename to drivers/usb/fotg210/fotg210-hcd.h
diff --git a/drivers/usb/gadget/udc/fotg210-udc.c b/drivers/usb/fotg210/fotg210-udc.c
similarity index 99%
rename from drivers/usb/gadget/udc/fotg210-udc.c
rename to drivers/usb/fotg210/fotg210-udc.c
index fdca28e72a3b..01a4509775b2 100644
--- a/drivers/usb/gadget/udc/fotg210-udc.c
+++ b/drivers/usb/fotg210/fotg210-udc.c
@@ -16,7 +16,7 @@
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
 
-#include "fotg210.h"
+#include "fotg210-udc.h"
 
 #define	DRIVER_DESC	"FOTG210 USB Device Controller Driver"
 #define	DRIVER_VERSION	"30-April-2013"
diff --git a/drivers/usb/gadget/udc/fotg210.h b/drivers/usb/fotg210/fotg210-udc.h
similarity index 100%
rename from drivers/usb/gadget/udc/fotg210.h
rename to drivers/usb/fotg210/fotg210-udc.h
diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 5756acb07b8d..16243964b1cd 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -108,17 +108,6 @@ config USB_FUSB300
 	help
 	   Faraday usb device controller FUSB300 driver
 
-config USB_FOTG210_UDC
-	depends on HAS_DMA
-	tristate "Faraday FOTG210 USB Peripheral Controller"
-	help
-	   Faraday USB2.0 OTG controller which can be configured as
-	   high speed or full speed USB device. This driver supppors
-	   Bulk Transfer so far.
-
-	   Say "y" to link the driver statically, or "m" to build a
-	   dynamically linked module called "fotg210_udc".
-
 config USB_GR_UDC
 	tristate "Aeroflex Gaisler GRUSBDC USB Peripheral Controller Driver"
 	depends on HAS_DMA
diff --git a/drivers/usb/gadget/udc/Makefile b/drivers/usb/gadget/udc/Makefile
index 12f9e4c9eb0c..39daf36a2baa 100644
--- a/drivers/usb/gadget/udc/Makefile
+++ b/drivers/usb/gadget/udc/Makefile
@@ -34,7 +34,6 @@ obj-$(CONFIG_USB_EG20T)		+= pch_udc.o
 obj-$(CONFIG_USB_MV_UDC)	+= mv_udc.o
 mv_udc-y			:= mv_udc_core.o
 obj-$(CONFIG_USB_FUSB300)	+= fusb300_udc.o
-obj-$(CONFIG_USB_FOTG210_UDC)	+= fotg210-udc.o
 obj-$(CONFIG_USB_MV_U3D)	+= mv_u3d_core.o
 obj-$(CONFIG_USB_GR_UDC)	+= gr_udc.o
 obj-$(CONFIG_USB_GADGET_XILINX)	+= udc-xilinx.o
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 247568bc17a2..7cebf03d4226 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -389,17 +389,6 @@ config USB_ISP1362_HCD
 	  To compile this driver as a module, choose M here: the
 	  module will be called isp1362-hcd.
 
-config USB_FOTG210_HCD
-	tristate "FOTG210 HCD support"
-	depends on USB && HAS_DMA && HAS_IOMEM
-	help
-	  Faraday FOTG210 is an OTG controller which can be configured as
-	  an USB2.0 host. It is designed to meet USB2.0 EHCI specification
-	  with minor modification.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called fotg210-hcd.
-
 config USB_MAX3421_HCD
 	tristate "MAX3421 HCD (USB-over-SPI) support"
 	depends on USB && SPI
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index 2c8a61be7e46..6d8ee264c9b2 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -84,6 +84,5 @@ obj-$(CONFIG_USB_EHCI_FSL)	+= ehci-fsl.o
 obj-$(CONFIG_USB_EHCI_MV)	+= ehci-mv.o
 obj-$(CONFIG_USB_HCD_BCMA)	+= bcma-hcd.o
 obj-$(CONFIG_USB_HCD_SSB)	+= ssb-hcd.o
-obj-$(CONFIG_USB_FOTG210_HCD)	+= fotg210-hcd.o
 obj-$(CONFIG_USB_MAX3421_HCD)	+= max3421-hcd.o
 obj-$(CONFIG_USB_XEN_HCD)	+= xen-hcd.o
-- 
2.37.3

