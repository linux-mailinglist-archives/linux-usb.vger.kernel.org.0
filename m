Return-Path: <linux-usb+bounces-37249-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MU7HzqvAWrXiAEAu9opvQ
	(envelope-from <linux-usb+bounces-37249-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 12:28:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A5450BE14
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 12:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 465D4300D4EE
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 10:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514B63D7D65;
	Mon, 11 May 2026 10:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kw2EACBb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F723D75D4
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 10:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495277; cv=none; b=pprjXaVEM5d4OH8mmImhYrhb8rw3Lc/x0Vb0cB8sAl5Ltcer0fWhaL0J/ZG4R7ezsIukxkZlB3vA7c5trsrTuv9kbD9rcYv9kvOShE7hAzHqazlCCERyvGBED7DvqkZsXgtqhE34pfOKaytHn8VKqtPdQGick/R7ZoRCaZl01Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495277; c=relaxed/simple;
	bh=yAUBc6B9439M+/6PIE7fdawFKqo3QdWNQgxsH0GyJ6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oBd2+ZNTLIyQf/6+1IRmL6kqtQDaDsLr1NenlZpfN4eZkjUD3GJk7UdAlh+lAMtP+FWUx7FIfdGnQKBsZ43S6ofcCpDwZySVCg/QXquYteRdSLzNbezcpdrYBf9YiRMtXb2g6dI3JZG0BtFhoanLxvsJ6M4CanJ8hK1MUHvJ3mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kw2EACBb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778495277; x=1810031277;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yAUBc6B9439M+/6PIE7fdawFKqo3QdWNQgxsH0GyJ6g=;
  b=kw2EACBbJJvmzeM4goRZ4HSq74Su1aGZ32Fq6oa4BleG6e8C9XYAzoZU
   qyqDYk1W0XfFnoZ6PxWGmORz1fXmjMcPweU7bgcBrhufBwox2FDJ9qSkk
   1dBrMsxuGTM4PV3FoWpQfFoCVWsWK+UJHULL9PFFUd2xMOVM3ch3tVZsx
   g17sjfSzSDIxU6BLqnINM9gTDPuYZRplQtqxE/8uIvXFTe4UNKliYRgw4
   Sf8o4mjEruyG4OEfeeRXYO8o//+5ImBA5xSQjdYEuf6YN0fj0N4dwv258
   e62qb9EnjMOyf/5TuB4WN4CkBKPj92T1TAaVX2PNzKnFd6G5xCrvS8v1E
   g==;
X-CSE-ConnectionGUID: Ob9EU1OrRD+2UBTnZao/Ew==
X-CSE-MsgGUID: x+AWcLACTLCWoFQPnW/HPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79099681"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79099681"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 03:27:52 -0700
X-CSE-ConnectionGUID: 4YdbydoIQxu7HVOyOW2+Jw==
X-CSE-MsgGUID: o61jdKKoRxS5aSCusEoXGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="234752254"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 11 May 2026 03:27:49 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A543BA4; Mon, 11 May 2026 12:27:44 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 08/10] thunderbolt: Add support for ConfigFS
Date: Mon, 11 May 2026 12:27:42 +0200
Message-ID: <20260511102744.1867485-9-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260511102744.1867485-1-mika.westerberg@linux.intel.com>
References: <20260511102744.1867485-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 23A5450BE14
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com,lunn.ch,lwn.net,linuxfoundation.org,davemloft.net,google.com,kernel.org,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37249-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This adds ConfigFS support to USB4/Thunderbolt bus. By itself this just
creates the subsystem but it exposes functions that can be used to
register groups under it.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/Kconfig    |  4 +++
 drivers/thunderbolt/Makefile   |  1 +
 drivers/thunderbolt/configfs.c | 61 ++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/domain.c   |  2 ++
 drivers/thunderbolt/tb.h       |  8 +++++
 include/linux/thunderbolt.h    |  6 ++++
 6 files changed, 82 insertions(+)
 create mode 100644 drivers/thunderbolt/configfs.c

diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
index db3b0bef48f4..9b4aaa456e32 100644
--- a/drivers/thunderbolt/Kconfig
+++ b/drivers/thunderbolt/Kconfig
@@ -18,6 +18,10 @@ menuconfig USB4
 
 if USB4
 
+config USB4_CONFIGFS
+	def_tristate USB4
+	depends on CONFIGFS_FS && !(USB4=y && CONFIGFS_FS=m)
+
 config USB4_DEBUGFS_WRITE
 	bool "Enable write by debugfs to configuration spaces (DANGEROUS)"
 	help
diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
index b44b32dcb832..d5b367dfda1e 100644
--- a/drivers/thunderbolt/Makefile
+++ b/drivers/thunderbolt/Makefile
@@ -7,6 +7,7 @@ thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o
 
 thunderbolt-${CONFIG_ACPI} += acpi.o
 thunderbolt-$(CONFIG_DEBUG_FS) += debugfs.o
+thunderbolt-$(CONFIG_USB4_CONFIGFS) += configfs.o
 thunderbolt-${CONFIG_USB4_KUNIT_TEST} += test.o
 CFLAGS_test.o += $(DISABLE_STRUCTLEAK_PLUGIN)
 
diff --git a/drivers/thunderbolt/configfs.c b/drivers/thunderbolt/configfs.c
new file mode 100644
index 000000000000..dc6bc363dfe8
--- /dev/null
+++ b/drivers/thunderbolt/configfs.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ConfigFS support
+ *
+ * Copyright (C) 2026, Intel Corporation
+ * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
+ */
+
+#include <linux/configfs.h>
+#include <linux/export.h>
+
+#include "tb.h"
+
+static const struct config_item_type tb_root_group_type = {
+	.ct_owner = THIS_MODULE,
+};
+
+static struct configfs_subsystem tb_configfs = {
+	.su_group = {
+		.cg_item = {
+			.ci_namebuf = "thunderbolt",
+			.ci_type = &tb_root_group_type,
+		},
+	},
+};
+
+/**
+ * tb_configfs_register_group() - Register Thunderbolt ConfigFS group
+ * @group: Group to register.
+ *
+ * Registers the new @group under Thunderbolt subsystem ConfigFS.
+ *
+ * Return: 0% in case of success, negative errno otherwise.
+ */
+int tb_configfs_register_group(struct config_group *group)
+{
+	return configfs_register_group(&tb_configfs.su_group, group);
+}
+EXPORT_SYMBOL_GPL(tb_configfs_register_group);
+
+/**
+ * tb_configfs_unregister_group() - Unregister previously registered group
+ * @group: Group to unregister.
+ */
+void tb_configfs_unregister_group(struct config_group *group)
+{
+	configfs_unregister_group(group);
+}
+EXPORT_SYMBOL_GPL(tb_configfs_unregister_group);
+
+int tb_configfs_init(void)
+{
+	config_group_init(&tb_configfs.su_group);
+	mutex_init(&tb_configfs.su_mutex);
+	return configfs_register_subsystem(&tb_configfs);
+}
+
+void tb_configfs_exit(void)
+{
+	configfs_unregister_subsystem(&tb_configfs);
+}
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index d83719a37b4c..b381f184340e 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -887,6 +887,7 @@ int tb_domain_init(void)
 {
 	int ret;
 
+	tb_configfs_init();
 	tb_debugfs_init();
 	tb_acpi_init();
 
@@ -916,4 +917,5 @@ void tb_domain_exit(void)
 	tb_xdomain_exit();
 	tb_acpi_exit();
 	tb_debugfs_exit();
+	tb_configfs_exit();
 }
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 229b9e7961fb..e60f1bc3764e 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1558,4 +1558,12 @@ static inline void tb_retimer_debugfs_init(struct tb_retimer *rt) { }
 static inline void tb_retimer_debugfs_remove(struct tb_retimer *rt) { }
 #endif
 
+#if IS_REACHABLE(CONFIG_CONFIGFS_FS)
+int tb_configfs_init(void);
+void tb_configfs_exit(void);
+#else
+static inline int tb_configfs_init(void) { return 0; }
+static inline void tb_configfs_exit(void) { }
+#endif
+
 #endif
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 9c5cb5e4f23d..0be9b298e692 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -13,6 +13,7 @@
 
 #include <linux/types.h>
 
+struct config_group;
 struct fwnode_handle;
 struct device;
 
@@ -727,6 +728,11 @@ static inline struct device *tb_ring_dma_device(struct tb_ring *ring)
 bool usb4_usb3_port_match(struct device *usb4_port_dev,
 			  const struct fwnode_handle *usb3_port_fwnode);
 
+#if IS_REACHABLE(CONFIG_CONFIGFS_FS)
+int tb_configfs_register_group(struct config_group *group);
+void tb_configfs_unregister_group(struct config_group *group);
+#endif
+
 #else /* CONFIG_USB4 */
 static inline bool usb4_usb3_port_match(struct device *usb4_port_dev,
 					const struct fwnode_handle *usb3_port_fwnode)
-- 
2.50.1


