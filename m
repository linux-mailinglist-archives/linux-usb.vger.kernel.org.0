Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9D5333A90
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 11:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232548AbhCJKql (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 05:46:41 -0500
Received: from mga05.intel.com ([192.55.52.43]:7693 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232479AbhCJKqY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Mar 2021 05:46:24 -0500
IronPort-SDR: ll5occjZCgfP0SfP2S8egqtCuxI7m+TZqs96F2+YQgu1wqi9w2RLHTTtiUKxESIHXMfkmrZnOt
 Q7+PGlugrz9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="273475515"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="273475515"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 02:46:22 -0800
IronPort-SDR: HED9vh6w4cbmKlzQ7FW161o/QwLYWx+iHKz3hbKx4nN5I5eYwDi07deKu9sSVEm4LAwoNSJK4G
 cy8zhtLluUEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="509624568"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 10 Mar 2021 02:46:20 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 2/3] usb: typec: tps6598x: Move the driver under its own subdirectory
Date:   Wed, 10 Mar 2021 13:46:29 +0300
Message-Id: <20210310104630.77945-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210310104630.77945-1-heikki.krogerus@linux.intel.com>
References: <20210310104630.77945-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver consist of multiple files. Grouping all of them
under a separate directory drivers/usb/typec/tipd/.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/Kconfig                     | 15 ++-------------
 drivers/usb/typec/Makefile                    |  5 +----
 drivers/usb/typec/tipd/Kconfig                | 12 ++++++++++++
 drivers/usb/typec/tipd/Makefile               |  4 ++++
 drivers/usb/typec/{ => tipd}/tps6598x.c       |  0
 drivers/usb/typec/{ => tipd}/tps6598x.h       |  0
 drivers/usb/typec/{ => tipd}/tps6598x_trace.h |  0
 7 files changed, 19 insertions(+), 17 deletions(-)
 create mode 100644 drivers/usb/typec/tipd/Kconfig
 create mode 100644 drivers/usb/typec/tipd/Makefile
 rename drivers/usb/typec/{ => tipd}/tps6598x.c (100%)
 rename drivers/usb/typec/{ => tipd}/tps6598x.h (100%)
 rename drivers/usb/typec/{ => tipd}/tps6598x_trace.h (100%)

diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index 270e81c087e92..a0418f23b4aae 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -50,6 +50,8 @@ source "drivers/usb/typec/tcpm/Kconfig"
 
 source "drivers/usb/typec/ucsi/Kconfig"
 
+source "drivers/usb/typec/tipd/Kconfig"
+
 config TYPEC_HD3SS3220
 	tristate "TI HD3SS3220 Type-C DRP Port controller driver"
 	depends on I2C
@@ -61,19 +63,6 @@ config TYPEC_HD3SS3220
 	  If you choose to build this driver as a dynamically linked module, the
 	  module will be called hd3ss3220.ko.
 
-config TYPEC_TPS6598X
-	tristate "TI TPS6598x USB Power Delivery controller driver"
-	depends on I2C
-	select POWER_SUPPLY
-	select REGMAP_I2C
-	select USB_ROLE_SWITCH
-	help
-	  Say Y or M here if your system has TI TPS65982 or TPS65983 USB Power
-	  Delivery controller.
-
-	  If you choose to build this driver as a dynamically linked module, the
-	  module will be called tps6598x.ko.
-
 config TYPEC_STUSB160X
 	tristate "STMicroelectronics STUSB160x Type-C controller driver"
 	depends on I2C
diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 27aa121291907..1fb8b6668b1ba 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -1,14 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
-# define_trace.h needs to know how to find our header
-CFLAGS_tps6598x.o		:= -I$(src)
-
 obj-$(CONFIG_TYPEC)		+= typec.o
 typec-y				:= class.o mux.o bus.o
 obj-$(CONFIG_TYPEC)		+= altmodes/
 obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
 obj-$(CONFIG_TYPEC_UCSI)	+= ucsi/
+obj-$(CONFIG_TYPEC_TPS6598X)	+= tipd/
 obj-$(CONFIG_TYPEC_HD3SS3220)	+= hd3ss3220.o
-obj-$(CONFIG_TYPEC_TPS6598X)	+= tps6598x.o
 obj-$(CONFIG_TYPEC_QCOM_PMIC)	+= qcom-pmic-typec.o
 obj-$(CONFIG_TYPEC_STUSB160X) 	+= stusb160x.o
 obj-$(CONFIG_TYPEC)		+= mux/
diff --git a/drivers/usb/typec/tipd/Kconfig b/drivers/usb/typec/tipd/Kconfig
new file mode 100644
index 0000000000000..b827152930728
--- /dev/null
+++ b/drivers/usb/typec/tipd/Kconfig
@@ -0,0 +1,12 @@
+config TYPEC_TPS6598X
+	tristate "TI TPS6598x USB Power Delivery controller driver"
+	depends on I2C
+	select POWER_SUPPLY
+	select REGMAP_I2C
+	select USB_ROLE_SWITCH
+	help
+	  Say Y or M here if your system has TI TPS65982 or TPS65983 USB Power
+	  Delivery controller.
+
+	  If you choose to build this driver as a dynamically linked module, the
+	  module will be called tps6598x.ko.
diff --git a/drivers/usb/typec/tipd/Makefile b/drivers/usb/typec/tipd/Makefile
new file mode 100644
index 0000000000000..4c19eadb5f466
--- /dev/null
+++ b/drivers/usb/typec/tipd/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+CFLAGS_tps6598x.o		:= -I$(src)
+
+obj-$(CONFIG_TYPEC_TPS6598X)	+= tps6598x.o
diff --git a/drivers/usb/typec/tps6598x.c b/drivers/usb/typec/tipd/tps6598x.c
similarity index 100%
rename from drivers/usb/typec/tps6598x.c
rename to drivers/usb/typec/tipd/tps6598x.c
diff --git a/drivers/usb/typec/tps6598x.h b/drivers/usb/typec/tipd/tps6598x.h
similarity index 100%
rename from drivers/usb/typec/tps6598x.h
rename to drivers/usb/typec/tipd/tps6598x.h
diff --git a/drivers/usb/typec/tps6598x_trace.h b/drivers/usb/typec/tipd/tps6598x_trace.h
similarity index 100%
rename from drivers/usb/typec/tps6598x_trace.h
rename to drivers/usb/typec/tipd/tps6598x_trace.h
-- 
2.30.1

