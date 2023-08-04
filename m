Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5FB76FF92
	for <lists+linux-usb@lfdr.de>; Fri,  4 Aug 2023 13:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjHDLnO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Aug 2023 07:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjHDLnN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Aug 2023 07:43:13 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 311DBB1
        for <linux-usb@vger.kernel.org>; Fri,  4 Aug 2023 04:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691149392; x=1722685392;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lFT+9cmnnaoeCYy4iCsUJWVYI5kV6OfyFyQ9B7J/Rf4=;
  b=W05hwEFyQ/S9/hTPcZ37rR7G4sRq4eYQUKSUhho6oMCJd4XLIw4hrcbl
   /lDhs/xBQBS6A9cFQI8++df1pDvrfgd5YVHUtMwqhcRyPewI7NPVdGgcE
   YxaD9bqGT+wHmbrGDpUkz/vubYxPDnsQp66i0oxwBuf+C6xsbxDs//s2l
   WjqsjlMmU8yOyXgPEUD6V+Grmc6Xp0WKT7KHYEKfu3UhS6uGxvz14oKCY
   K7pvUt9KSTY+gg/F7KFhjz5cEc/G6Hdi9fI6ycMfZef51HAK7ndRfwfa2
   81T2UbN4NPHmV6Cfpw66srhbDS0R0wD0TEN79GYI/Rz3Vjbq9FFK5WbyJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="373785652"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="373785652"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 04:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="820108621"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="820108621"
Received: from senthil-nuc10i7fnh.iind.intel.com ([10.223.216.62])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Aug 2023 04:43:08 -0700
From:   Saranya Gopal <saranya.gopal@intel.com>
To:     linux-usb@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        Saranya Gopal <saranya.gopal@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rajaram Regupathy <rajaram.regupathy@intel.com>
Subject: [PATCH] usb: typec: ucsi: Add debugfs for ucsi commands
Date:   Fri,  4 Aug 2023 17:23:36 +0530
Message-Id: <20230804115336.399801-1-saranya.gopal@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for UCSI commands through the following debugfs:
  # /sys/kernel/debug/usb/ucsi/$UCSI_DEVICE/command
  # /sys/kernel/debug/usb/ucsi/$UCSI_DEVICE/response

Eg: To execute UCSI GetCapabilities:
  # echo 0x6 > /sys/kernel/debug/usb/ucsi/<ucsi device>/command
Then read the result,
  # cat /sys/kernel/debug/usb/ucsi/<ucsi device>/response
    0x02000320000000020000ff0400000445

UCSI command will be written into the command file and the
response for the command can be viewed under the response file.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
Co-developed-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
Signed-off-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
---
 drivers/usb/typec/ucsi/Kconfig   |   1 +
 drivers/usb/typec/ucsi/Makefile  |   2 +
 drivers/usb/typec/ucsi/debugfs.c | 102 +++++++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/debugfs.h |  47 ++++++++++++++
 drivers/usb/typec/ucsi/ucsi.c    |  15 +++++
 drivers/usb/typec/ucsi/ucsi.h    |   2 +
 6 files changed, 169 insertions(+)
 create mode 100644 drivers/usb/typec/ucsi/debugfs.c
 create mode 100644 drivers/usb/typec/ucsi/debugfs.h

diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index b3bb0191987e..bdcb1764cfae 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -4,6 +4,7 @@ config TYPEC_UCSI
 	tristate "USB Type-C Connector System Software Interface driver"
 	depends on !CPU_BIG_ENDIAN
 	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
+	select USB_COMMON if DEBUG_FS
 	help
 	  USB Type-C Connector System Software Interface (UCSI) is a
 	  specification for an interface that allows the operating system to
diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
index 77f09e136956..b4679f94696b 100644
--- a/drivers/usb/typec/ucsi/Makefile
+++ b/drivers/usb/typec/ucsi/Makefile
@@ -5,6 +5,8 @@ obj-$(CONFIG_TYPEC_UCSI)		+= typec_ucsi.o
 
 typec_ucsi-y				:= ucsi.o
 
+typec_ucsi-$(CONFIG_DEBUG_FS)		+= debugfs.o
+
 typec_ucsi-$(CONFIG_TRACING)		+= trace.o
 
 ifneq ($(CONFIG_POWER_SUPPLY),)
diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
new file mode 100644
index 000000000000..2bb74ff007fc
--- /dev/null
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * UCSI debugfs interface
+ *
+ * Copyright (C) 2023 Intel Corporation
+ *
+ * Authors: Rajaram Regupathy <rajaram.regupathy@intel.com>
+ *	    Gopal Saranya <saranya.gopal@intel.com>
+ */
+#include <linux/debugfs.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/usb.h>
+
+#include <asm/errno.h>
+
+#include "debugfs.h"
+#include "ucsi.h"
+
+static struct dentry *ucsi_debugfs_root;
+
+static int ucsi_cmd(void *data, u64 val)
+{
+	struct ucsi *ucsi = data;
+	int ret;
+
+	memset(&ucsi->debugfs->response, 0, sizeof(ucsi->debugfs->response));
+	ucsi->debugfs->status = 0;
+
+	switch (UCSI_COMMAND(val)) {
+	case UCSI_SET_UOM:
+	case UCSI_SET_UOR:
+	case UCSI_SET_PDR:
+	case UCSI_CONNECTOR_RESET:
+		ret = ucsi_send_command(ucsi, val, NULL, 0);
+		break;
+	case UCSI_GET_CAPABILITY:
+	case UCSI_GET_CONNECTOR_CAPABILITY:
+	case UCSI_GET_ALTERNATE_MODES:
+	case UCSI_GET_CURRENT_CAM:
+	case UCSI_GET_PDOS:
+	case UCSI_GET_CABLE_PROPERTY:
+	case UCSI_GET_CONNECTOR_STATUS:
+		ret = ucsi_send_command(ucsi, val,
+					&ucsi->debugfs->response,
+					sizeof(ucsi->debugfs->response));
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+	if (ret < 0) {
+		ucsi->debugfs->status = ret;
+		return ret;
+	}
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ucsi_cmd_fops, NULL, ucsi_cmd, "0x%llx\n");
+
+static int ucsi_resp_show(struct seq_file *s, void *not_used)
+{
+	struct ucsi *ucsi = s->private;
+
+	if (ucsi->debugfs->status)
+		return ucsi->debugfs->status;
+
+	seq_printf(s, "0x%016llx%016llx\n", ucsi->debugfs->response.high,
+		   ucsi->debugfs->response.low);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(ucsi_resp);
+
+int ucsi_debugfs_register(struct ucsi *ucsi)
+{
+	ucsi->debugfs = kzalloc(sizeof(*ucsi->debugfs), GFP_KERNEL);
+	if (!ucsi->debugfs)
+		return -ENOMEM;
+
+	ucsi->debugfs->dentry = debugfs_create_dir(dev_name(ucsi->dev), ucsi_debugfs_root);
+	debugfs_create_file("command", 0200, ucsi->debugfs->dentry, ucsi, &ucsi_cmd_fops);
+	debugfs_create_file("response", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_resp_fops);
+	return 0;
+}
+
+void ucsi_debugfs_unregister(struct ucsi *ucsi)
+{
+	debugfs_remove_recursive(ucsi->debugfs->dentry);
+	kfree(ucsi->debugfs);
+}
+
+int ucsi_debugfs_init(void)
+{
+	ucsi_debugfs_root = debugfs_create_dir("ucsi", usb_debug_root);
+	return 0;
+}
+
+void ucsi_debugfs_exit(void)
+{
+	debugfs_remove(ucsi_debugfs_root);
+}
diff --git a/drivers/usb/typec/ucsi/debugfs.h b/drivers/usb/typec/ucsi/debugfs.h
new file mode 100644
index 000000000000..bc8c967d7059
--- /dev/null
+++ b/drivers/usb/typec/ucsi/debugfs.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * UCSI debugfs interface
+ *
+ * Copyright (C) 2023 Intel Corporation
+ *
+ * Authors: Rajaram Regupathy <rajaram.regupathy@intel.com>
+ *	    Gopal Saranya <saranya.gopal@intel.com>
+ */
+
+#ifndef __LINUX_UCSI_DEBUGFS_H
+#define __LINUX_UCSI_DEBUGFS_H
+
+#include <linux/types.h>
+
+struct ucsi;
+struct dentry;
+
+struct ucsi_debugfs_entry {
+	u64 command;
+	struct ucsi_data {
+		u64 low;
+		u64 high;
+	} response;
+	u32 status;
+	struct dentry *dentry;
+};
+
+#ifdef CONFIG_DEBUG_FS
+
+int ucsi_debugfs_init(void);
+void ucsi_debugfs_exit(void);
+
+int ucsi_debugfs_register(struct ucsi *ucsi);
+void ucsi_debugfs_unregister(struct ucsi *ucsi);
+
+#else
+
+static inline int ucsi_debugfs_init(void) { return 0; }
+static inline void ucsi_debugfs_exit(void) { }
+
+int ucsi_debugfs_register(struct ucsi *ucsi) { return 0; }
+void ucsi_debugfs_unregister(struct ucsi *ucsi) { }
+
+#endif /* CONFIG_DEBUG_FS */
+
+#endif /* __LINUX_UCSI_DEBUGFS_H */
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index f6901319639d..95bd233fa154 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/usb/typec_dp.h>
 
+#include "debugfs.h"
 #include "ucsi.h"
 #include "trace.h"
 
@@ -1530,6 +1531,7 @@ EXPORT_SYMBOL_GPL(ucsi_create);
  */
 void ucsi_destroy(struct ucsi *ucsi)
 {
+	ucsi_debugfs_unregister(ucsi);
 	kfree(ucsi);
 }
 EXPORT_SYMBOL_GPL(ucsi_destroy);
@@ -1552,6 +1554,7 @@ int ucsi_register(struct ucsi *ucsi)
 
 	queue_delayed_work(system_long_wq, &ucsi->work, 0);
 
+	ucsi_debugfs_register(ucsi);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ucsi_register);
@@ -1611,6 +1614,18 @@ void ucsi_unregister(struct ucsi *ucsi)
 }
 EXPORT_SYMBOL_GPL(ucsi_unregister);
 
+static int __init ucsi_module_init(void)
+{
+	return ucsi_debugfs_init();
+}
+module_init(ucsi_module_init);
+
+static void __exit ucsi_module_exit(void)
+{
+	ucsi_debugfs_exit();
+}
+module_exit(ucsi_module_exit);
+
 MODULE_AUTHOR("Heikki Krogerus <heikki.krogerus@linux.intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("USB Type-C Connector System Software Interface driver");
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index c09af859f573..ba1f11f18758 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -15,6 +15,7 @@
 
 struct ucsi;
 struct ucsi_altmode;
+struct ucsi_debugfs_entry;
 
 /* UCSI offsets (Bytes) */
 #define UCSI_VERSION			0
@@ -286,6 +287,7 @@ struct ucsi {
 
 	struct ucsi_capability cap;
 	struct ucsi_connector *connector;
+	struct ucsi_debugfs_entry *debugfs;
 
 	struct work_struct resume_work;
 	struct delayed_work work;
-- 
2.25.1

