Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9905E1FB2F3
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jun 2020 15:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729104AbgFPN4Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jun 2020 09:56:25 -0400
Received: from mga18.intel.com ([134.134.136.126]:55684 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728908AbgFPN4W (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Jun 2020 09:56:22 -0400
IronPort-SDR: vB65qlksK3h9z66FTvX4pgqhEm6R71kGyrPZq39iVAAR9MGLSSKPp0Gtz4KzoCZjAMF/DkJ0FF
 IpvyDbL+SAvg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 06:56:21 -0700
IronPort-SDR: Jv/6cJPnkfd6Qq83HY2nAfkBqfo1xz+DAMDu3+SXcenyOVZy3luUab5+wQWQCDJClhzEkIdsTG
 +kBS0Ni2dyDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; 
   d="scan'208";a="351735220"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 16 Jun 2020 06:56:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 283542AA; Tue, 16 Jun 2020 16:56:18 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Kranthi Kuntala <kranthi.kuntala@intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Mario.Limonciello@dell.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 2/6] thunderbolt: Split common NVM functionality into a separate file
Date:   Tue, 16 Jun 2020 16:56:13 +0300
Message-Id: <20200616135617.85752-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200616135617.85752-1-mika.westerberg@linux.intel.com>
References: <20200616135617.85752-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We are going to reuse some of this functionality to implement retimer
NVM upgrade so move common NVM functionality into its own file. We also
rename the structure from tb_switch_nvm to tb_nvm to make it clear that
it is not just for switches.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/Makefile |   1 +
 drivers/thunderbolt/domain.c |   2 +-
 drivers/thunderbolt/nvm.c    | 169 +++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/switch.c | 116 +++++-------------------
 drivers/thunderbolt/tb.h     |  31 +++++--
 5 files changed, 220 insertions(+), 99 deletions(-)
 create mode 100644 drivers/thunderbolt/nvm.c

diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
index 68f7a19690d8..7ee257cee7ff 100644
--- a/drivers/thunderbolt/Makefile
+++ b/drivers/thunderbolt/Makefile
@@ -2,5 +2,6 @@
 obj-${CONFIG_USB4} := thunderbolt.o
 thunderbolt-objs := nhi.o nhi_ops.o ctl.o tb.o switch.o cap.o path.o tunnel.o eeprom.o
 thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o tmu.o usb4.o
+thunderbolt-objs += nvm.o
 
 obj-${CONFIG_USB4_KUNIT_TEST} += test.o
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 68c1b93ac5d9..bba4cbfa9759 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -812,6 +812,6 @@ void tb_domain_exit(void)
 {
 	bus_unregister(&tb_bus_type);
 	ida_destroy(&tb_domain_ida);
-	tb_switch_exit();
+	tb_nvm_exit();
 	tb_xdomain_exit();
 }
diff --git a/drivers/thunderbolt/nvm.c b/drivers/thunderbolt/nvm.c
new file mode 100644
index 000000000000..4c6aa06ab3d5
--- /dev/null
+++ b/drivers/thunderbolt/nvm.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * NVM helpers
+ *
+ * Copyright (C) 2020, Intel Corporation
+ * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
+ */
+
+#include <linux/idr.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+
+#include "tb.h"
+
+static DEFINE_IDA(nvm_ida);
+
+/**
+ * tb_nvm_alloc() - Allocate new NVM structure
+ * @dev: Device owning the NVM
+ *
+ * Allocates new NVM structure with unique @id and returns it. In case
+ * of error returns ERR_PTR().
+ */
+struct tb_nvm *tb_nvm_alloc(struct device *dev)
+{
+	struct tb_nvm *nvm;
+	int ret;
+
+	nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
+	if (!nvm)
+		return ERR_PTR(-ENOMEM);
+
+	ret = ida_simple_get(&nvm_ida, 0, 0, GFP_KERNEL);
+	if (ret < 0) {
+		kfree(nvm);
+		return ERR_PTR(ret);
+	}
+
+	nvm->id = ret;
+	nvm->dev = dev;
+
+	return nvm;
+}
+
+/**
+ * tb_nvm_add_active() - Adds active NVMem device to NVM
+ * @nvm: NVM structure
+ * @size: Size of the active NVM in bytes
+ * @reg_read: Pointer to the function to read the NVM (passed directly to the
+ *	      NVMem device)
+ *
+ * Registers new active NVmem device for @nvm. The @reg_read is called
+ * directly from NVMem so it must handle possible concurrent access if
+ * needed. The first parameter passed to @reg_read is @nvm structure.
+ * Returns %0 in success and negative errno otherwise.
+ */
+int tb_nvm_add_active(struct tb_nvm *nvm, size_t size, nvmem_reg_read_t reg_read)
+{
+	struct nvmem_config config;
+	struct nvmem_device *nvmem;
+
+	memset(&config, 0, sizeof(config));
+
+	config.name = "nvm_active";
+	config.reg_read = reg_read;
+	config.read_only = true;
+	config.id = nvm->id;
+	config.stride = 4;
+	config.word_size = 4;
+	config.size = size;
+	config.dev = nvm->dev;
+	config.owner = THIS_MODULE;
+	config.priv = nvm;
+
+	nvmem = nvmem_register(&config);
+	if (IS_ERR(nvmem))
+		return PTR_ERR(nvmem);
+
+	nvm->active = nvmem;
+	return 0;
+}
+
+/**
+ * tb_nvm_write_buf() - Write data to @nvm buffer
+ * @nvm: NVM structure
+ * @offset: Offset where to write the data
+ * @val: Data buffer to write
+ * @bytes: Number of bytes to write
+ *
+ * Helper function to cache the new NVM image before it is actually
+ * written to the flash. Copies @bytes from @val to @nvm->buf starting
+ * from @offset.
+ */
+int tb_nvm_write_buf(struct tb_nvm *nvm, unsigned int offset, void *val,
+		     size_t bytes)
+{
+	if (!nvm->buf) {
+		nvm->buf = vmalloc(NVM_MAX_SIZE);
+		if (!nvm->buf)
+			return -ENOMEM;
+	}
+
+	nvm->buf_data_size = offset + bytes;
+	memcpy(nvm->buf + offset, val, bytes);
+	return 0;
+}
+
+/**
+ * tb_nvm_add_non_active() - Adds non-active NVMem device to NVM
+ * @nvm: NVM structure
+ * @size: Size of the non-active NVM in bytes
+ * @reg_write: Pointer to the function to write the NVM (passed directly
+ *	       to the NVMem device)
+ *
+ * Registers new non-active NVmem device for @nvm. The @reg_write is called
+ * directly from NVMem so it must handle possible concurrent access if
+ * needed. The first parameter passed to @reg_write is @nvm structure.
+ * Returns %0 in success and negative errno otherwise.
+ */
+int tb_nvm_add_non_active(struct tb_nvm *nvm, size_t size,
+			  nvmem_reg_write_t reg_write)
+{
+	struct nvmem_config config;
+	struct nvmem_device *nvmem;
+
+	memset(&config, 0, sizeof(config));
+
+	config.name = "nvm_non_active";
+	config.reg_write = reg_write;
+	config.root_only = true;
+	config.id = nvm->id;
+	config.stride = 4;
+	config.word_size = 4;
+	config.size = size;
+	config.dev = nvm->dev;
+	config.owner = THIS_MODULE;
+	config.priv = nvm;
+
+	nvmem = nvmem_register(&config);
+	if (IS_ERR(nvmem))
+		return PTR_ERR(nvmem);
+
+	nvm->non_active = nvmem;
+	return 0;
+}
+
+/**
+ * tb_nvm_free() - Release NVM and its resources
+ * @nvm: NVM structure to release
+ *
+ * Releases NVM and the NVMem devices if they were registered.
+ */
+void tb_nvm_free(struct tb_nvm *nvm)
+{
+	if (nvm) {
+		if (nvm->non_active)
+			nvmem_unregister(nvm->non_active);
+		if (nvm->active)
+			nvmem_unregister(nvm->active);
+		vfree(nvm->buf);
+		ida_simple_remove(&nvm_ida, nvm->id);
+	}
+	kfree(nvm);
+}
+
+void tb_nvm_exit(void)
+{
+	ida_destroy(&nvm_ida);
+}
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 6659b2b0663d..c8ed614f14e6 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -13,21 +13,12 @@
 #include <linux/sched/signal.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
-#include <linux/vmalloc.h>
 
 #include "tb.h"
 
 /* Switch NVM support */
 
-#define NVM_DEVID		0x05
-#define NVM_VERSION		0x08
 #define NVM_CSS			0x10
-#define NVM_FLASH_SIZE		0x45
-
-#define NVM_MIN_SIZE		SZ_32K
-#define NVM_MAX_SIZE		SZ_512K
-
-static DEFINE_IDA(nvm_ida);
 
 struct nvm_auth_status {
 	struct list_head list;
@@ -328,7 +319,8 @@ static int nvm_authenticate(struct tb_switch *sw)
 static int tb_switch_nvm_read(void *priv, unsigned int offset, void *val,
 			      size_t bytes)
 {
-	struct tb_switch *sw = priv;
+	struct tb_nvm *nvm = priv;
+	struct tb_switch *sw = tb_to_switch(nvm->dev);
 	int ret;
 
 	pm_runtime_get_sync(&sw->dev);
@@ -351,8 +343,9 @@ static int tb_switch_nvm_read(void *priv, unsigned int offset, void *val,
 static int tb_switch_nvm_write(void *priv, unsigned int offset, void *val,
 			       size_t bytes)
 {
-	struct tb_switch *sw = priv;
-	int ret = 0;
+	struct tb_nvm *nvm = priv;
+	struct tb_switch *sw = tb_to_switch(nvm->dev);
+	int ret;
 
 	if (!mutex_trylock(&sw->tb->lock))
 		return restart_syscall();
@@ -363,55 +356,15 @@ static int tb_switch_nvm_write(void *priv, unsigned int offset, void *val,
 	 * locally here and handle the special cases when the user asks
 	 * us to authenticate the image.
 	 */
-	if (!sw->nvm->buf) {
-		sw->nvm->buf = vmalloc(NVM_MAX_SIZE);
-		if (!sw->nvm->buf) {
-			ret = -ENOMEM;
-			goto unlock;
-		}
-	}
-
-	sw->nvm->buf_data_size = offset + bytes;
-	memcpy(sw->nvm->buf + offset, val, bytes);
-
-unlock:
+	ret = tb_nvm_write_buf(nvm, offset, val, bytes);
 	mutex_unlock(&sw->tb->lock);
 
 	return ret;
 }
 
-static struct nvmem_device *register_nvmem(struct tb_switch *sw, int id,
-					   size_t size, bool active)
-{
-	struct nvmem_config config;
-
-	memset(&config, 0, sizeof(config));
-
-	if (active) {
-		config.name = "nvm_active";
-		config.reg_read = tb_switch_nvm_read;
-		config.read_only = true;
-	} else {
-		config.name = "nvm_non_active";
-		config.reg_write = tb_switch_nvm_write;
-		config.root_only = true;
-	}
-
-	config.id = id;
-	config.stride = 4;
-	config.word_size = 4;
-	config.size = size;
-	config.dev = &sw->dev;
-	config.owner = THIS_MODULE;
-	config.priv = sw;
-
-	return nvmem_register(&config);
-}
-
 static int tb_switch_nvm_add(struct tb_switch *sw)
 {
-	struct nvmem_device *nvm_dev;
-	struct tb_switch_nvm *nvm;
+	struct tb_nvm *nvm;
 	u32 val;
 	int ret;
 
@@ -431,11 +384,9 @@ static int tb_switch_nvm_add(struct tb_switch *sw)
 		return 0;
 	}
 
-	nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
-	if (!nvm)
-		return -ENOMEM;
-
-	nvm->id = ida_simple_get(&nvm_ida, 0, 0, GFP_KERNEL);
+	nvm = tb_nvm_alloc(&sw->dev);
+	if (IS_ERR(nvm))
+		return PTR_ERR(nvm);
 
 	/*
 	 * If the switch is in safe-mode the only accessible portion of
@@ -447,7 +398,7 @@ static int tb_switch_nvm_add(struct tb_switch *sw)
 
 		ret = nvm_read(sw, NVM_FLASH_SIZE, &val, sizeof(val));
 		if (ret)
-			goto err_ida;
+			goto err_nvm;
 
 		hdr_size = sw->generation < 3 ? SZ_8K : SZ_16K;
 		nvm_size = (SZ_1M << (val & 7)) / 8;
@@ -455,44 +406,34 @@ static int tb_switch_nvm_add(struct tb_switch *sw)
 
 		ret = nvm_read(sw, NVM_VERSION, &val, sizeof(val));
 		if (ret)
-			goto err_ida;
+			goto err_nvm;
 
 		nvm->major = val >> 16;
 		nvm->minor = val >> 8;
 
-		nvm_dev = register_nvmem(sw, nvm->id, nvm_size, true);
-		if (IS_ERR(nvm_dev)) {
-			ret = PTR_ERR(nvm_dev);
-			goto err_ida;
-		}
-		nvm->active = nvm_dev;
+		ret = tb_nvm_add_active(nvm, nvm_size, tb_switch_nvm_read);
+		if (ret)
+			goto err_nvm;
 	}
 
 	if (!sw->no_nvm_upgrade) {
-		nvm_dev = register_nvmem(sw, nvm->id, NVM_MAX_SIZE, false);
-		if (IS_ERR(nvm_dev)) {
-			ret = PTR_ERR(nvm_dev);
-			goto err_nvm_active;
-		}
-		nvm->non_active = nvm_dev;
+		ret = tb_nvm_add_non_active(nvm, NVM_MAX_SIZE,
+					    tb_switch_nvm_write);
+		if (ret)
+			goto err_nvm;
 	}
 
 	sw->nvm = nvm;
 	return 0;
 
-err_nvm_active:
-	if (nvm->active)
-		nvmem_unregister(nvm->active);
-err_ida:
-	ida_simple_remove(&nvm_ida, nvm->id);
-	kfree(nvm);
-
+err_nvm:
+	tb_nvm_free(nvm);
 	return ret;
 }
 
 static void tb_switch_nvm_remove(struct tb_switch *sw)
 {
-	struct tb_switch_nvm *nvm;
+	struct tb_nvm *nvm;
 
 	nvm = sw->nvm;
 	sw->nvm = NULL;
@@ -504,13 +445,7 @@ static void tb_switch_nvm_remove(struct tb_switch *sw)
 	if (!nvm->authenticating)
 		nvm_clear_auth_status(sw);
 
-	if (nvm->non_active)
-		nvmem_unregister(nvm->non_active);
-	if (nvm->active)
-		nvmem_unregister(nvm->active);
-	ida_simple_remove(&nvm_ida, nvm->id);
-	vfree(nvm->buf);
-	kfree(nvm);
+	tb_nvm_free(nvm);
 }
 
 /* port utility functions */
@@ -2772,8 +2707,3 @@ struct tb_port *tb_switch_find_port(struct tb_switch *sw,
 
 	return NULL;
 }
-
-void tb_switch_exit(void)
-{
-	ida_destroy(&nvm_ida);
-}
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index a62db231f07b..3d54f36f8805 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -18,8 +18,17 @@
 #include "ctl.h"
 #include "dma_port.h"
 
+#define NVM_MIN_SIZE		SZ_32K
+#define NVM_MAX_SIZE		SZ_512K
+
+/* Intel specific NVM offsets */
+#define NVM_DEVID		0x05
+#define NVM_VERSION		0x08
+#define NVM_FLASH_SIZE		0x45
+
 /**
- * struct tb_switch_nvm - Structure holding switch NVM information
+ * struct tb_nvm - Structure holding NVM information
+ * @dev: Owner of the NVM
  * @major: Major version number of the active NVM portion
  * @minor: Minor version number of the active NVM portion
  * @id: Identifier used with both NVM portions
@@ -29,9 +38,13 @@
  *	 the actual NVM flash device
  * @buf_data_size: Number of bytes actually consumed by the new NVM
  *		   image
- * @authenticating: The switch is authenticating the new NVM
+ * @authenticating: The device is authenticating the new NVM
+ *
+ * The user of this structure needs to handle serialization of possible
+ * concurrent access.
  */
-struct tb_switch_nvm {
+struct tb_nvm {
+	struct device *dev;
 	u8 major;
 	u8 minor;
 	int id;
@@ -143,7 +156,7 @@ struct tb_switch {
 	int cap_lc;
 	bool is_unplugged;
 	u8 *drom;
-	struct tb_switch_nvm *nvm;
+	struct tb_nvm *nvm;
 	bool no_nvm_upgrade;
 	bool safe_mode;
 	bool boot;
@@ -544,7 +557,6 @@ extern struct device_type tb_switch_type;
 
 int tb_domain_init(void);
 void tb_domain_exit(void);
-void tb_switch_exit(void);
 int tb_xdomain_init(void);
 void tb_xdomain_exit(void);
 
@@ -577,6 +589,15 @@ static inline void tb_domain_put(struct tb *tb)
 	put_device(&tb->dev);
 }
 
+struct tb_nvm *tb_nvm_alloc(struct device *dev);
+int tb_nvm_add_active(struct tb_nvm *nvm, size_t size, nvmem_reg_read_t reg_read);
+int tb_nvm_write_buf(struct tb_nvm *nvm, unsigned int offset, void *val,
+		     size_t bytes);
+int tb_nvm_add_non_active(struct tb_nvm *nvm, size_t size,
+			  nvmem_reg_write_t reg_write);
+void tb_nvm_free(struct tb_nvm *nvm);
+void tb_nvm_exit(void);
+
 struct tb_switch *tb_switch_alloc(struct tb *tb, struct device *parent,
 				  u64 route);
 struct tb_switch *tb_switch_alloc_safe_mode(struct tb *tb,
-- 
2.27.0.rc2

