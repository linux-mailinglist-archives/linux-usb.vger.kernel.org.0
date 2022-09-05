Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFA15AD204
	for <lists+linux-usb@lfdr.de>; Mon,  5 Sep 2022 14:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236985AbiIEMCP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 08:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236787AbiIEMCA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 08:02:00 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E385D0D0
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 05:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662379317; x=1693915317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9ed6YQBSm6olQgRBi9oyUNLTAOel2VBtBR/wTG3Lai0=;
  b=Hb0yWUM3U8KjlqbgmHQp33mDiw+UbQvxIdSSkpkF9hco3+8900OsIvuq
   ZIBIfN+4gC/cSD/4gS9YwJ2WDY00uEcOizyUYtOyXkZJkKG8ahFKep2Hz
   2NX0QH2M0wryyhBvWnTku0TrBgL8MIYVxvolVtPBPXVVU/odDQ36n+cW/
   cHI1kepaT+WpY8l6rMjqMuCf3aNkEa8lzl8m1TevfR4rhANmP0rUJT9t4
   De9g1ZjSWEZ4xoUY3Xaw1bmfOEEPYiaseLOYY/JZ7wIbJYByODEcQh/it
   w81qjkaORETvwHaXnGTPE6lYNnS1jbWbfbjWh8wo32330sBrNMvCx0IOz
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="279390044"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="279390044"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 05:01:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="717324067"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 05 Sep 2022 05:01:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 4E5C11F6; Mon,  5 Sep 2022 15:02:06 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Szuying Chen <Chloe_Chen@asmedia.com.tw>
Cc:     gregkh@linuxfoundation.org, mario.limonciello@amd.com,
        andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Yd_Tseng@asmedia.com.tw,
        Richard_Hsu@asmedia.com.tw, Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v9 5/6] thunderbolt: Move vendor specific NVM handling into nvm.c
Date:   Mon,  5 Sep 2022 15:02:04 +0300
Message-Id: <20220905120205.23025-6-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220905120205.23025-1-mika.westerberg@linux.intel.com>
References: <20220905120205.23025-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Szuying Chen <Chloe_Chen@asmedia.com.tw>

As there will be more USB4 devices that support NVM firmware upgrade from
various vendors, it makes sense to split out the Intel specific NVM
image handling from the generic code. This moves the Intel specific NVM
handling into a new structure that will be matched by the device type
and the vendor ID. Do this for both routers and retimers.

This makes it easier to extend the NVM support to cover new vendors and
NVM image formats in the future.

Signed-off-by: Szuying Chen <Chloe_Chen@asmedia.com.tw>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nvm.c     | 348 +++++++++++++++++++++++++++++++++-
 drivers/thunderbolt/retimer.c |  81 +++-----
 drivers/thunderbolt/switch.c  | 126 ++++--------
 drivers/thunderbolt/tb.h      |  22 ++-
 4 files changed, 410 insertions(+), 167 deletions(-)

diff --git a/drivers/thunderbolt/nvm.c b/drivers/thunderbolt/nvm.c
index b3f310389378..2e9b132af321 100644
--- a/drivers/thunderbolt/nvm.c
+++ b/drivers/thunderbolt/nvm.c
@@ -12,19 +12,278 @@
 
 #include "tb.h"
 
+/* Intel specific NVM offsets */
+#define INTEL_NVM_DEVID			0x05
+#define INTEL_NVM_VERSION		0x08
+#define INTEL_NVM_CSS			0x10
+#define INTEL_NVM_FLASH_SIZE		0x45
+
 static DEFINE_IDA(nvm_ida);
 
+/**
+ * struct tb_nvm_vendor_ops - Vendor specific NVM operations
+ * @read_version: Reads out NVM version from the flash
+ * @validate: Validates the NVM image before update (optional)
+ * @write_headers: Writes headers before the rest of the image (optional)
+ */
+struct tb_nvm_vendor_ops {
+	int (*read_version)(struct tb_nvm *nvm);
+	int (*validate)(struct tb_nvm *nvm);
+	int (*write_headers)(struct tb_nvm *nvm);
+};
+
+/**
+ * struct tb_nvm_vendor - Vendor to &struct tb_nvm_vendor_ops mapping
+ * @vendor: Vendor ID
+ * @vops: Vendor specific NVM operations
+ *
+ * Maps vendor ID to NVM vendor operations. If there is no mapping then
+ * NVM firmware upgrade is disabled for the device.
+ */
+struct tb_nvm_vendor {
+	u16 vendor;
+	const struct tb_nvm_vendor_ops *vops;
+};
+
+static int intel_switch_nvm_version(struct tb_nvm *nvm)
+{
+	struct tb_switch *sw = tb_to_switch(nvm->dev);
+	u32 val, nvm_size, hdr_size;
+	int ret;
+
+	/*
+	 * If the switch is in safe-mode the only accessible portion of
+	 * the NVM is the non-active one where userspace is expected to
+	 * write new functional NVM.
+	 */
+	if (sw->safe_mode)
+		return 0;
+
+	ret = tb_switch_nvm_read(sw, INTEL_NVM_FLASH_SIZE, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	hdr_size = sw->generation < 3 ? SZ_8K : SZ_16K;
+	nvm_size = (SZ_1M << (val & 7)) / 8;
+	nvm_size = (nvm_size - hdr_size) / 2;
+
+	ret = tb_switch_nvm_read(sw, INTEL_NVM_VERSION, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	nvm->major = (val >> 16) & 0xff;
+	nvm->minor = (val >> 8) & 0xff;
+	nvm->active_size = nvm_size;
+
+	return 0;
+}
+
+static int intel_switch_nvm_validate(struct tb_nvm *nvm)
+{
+	struct tb_switch *sw = tb_to_switch(nvm->dev);
+	unsigned int image_size, hdr_size;
+	u16 ds_size, device_id;
+	u8 *buf = nvm->buf;
+
+	image_size = nvm->buf_data_size;
+
+	/*
+	 * FARB pointer must point inside the image and must at least
+	 * contain parts of the digital section we will be reading here.
+	 */
+	hdr_size = (*(u32 *)buf) & 0xffffff;
+	if (hdr_size + INTEL_NVM_DEVID + 2 >= image_size)
+		return -EINVAL;
+
+	/* Digital section start should be aligned to 4k page */
+	if (!IS_ALIGNED(hdr_size, SZ_4K))
+		return -EINVAL;
+
+	/*
+	 * Read digital section size and check that it also fits inside
+	 * the image.
+	 */
+	ds_size = *(u16 *)(buf + hdr_size);
+	if (ds_size >= image_size)
+		return -EINVAL;
+
+	if (sw->safe_mode)
+		return 0;
+
+	/*
+	 * Make sure the device ID in the image matches the one
+	 * we read from the switch config space.
+	 */
+	device_id = *(u16 *)(buf + hdr_size + INTEL_NVM_DEVID);
+	if (device_id != sw->config.device_id)
+		return -EINVAL;
+
+	/* Skip headers in the image */
+	nvm->buf_data_start = buf + hdr_size;
+	nvm->buf_data_size = image_size - hdr_size;
+
+	return 0;
+}
+
+static int intel_switch_nvm_write_headers(struct tb_nvm *nvm)
+{
+	struct tb_switch *sw = tb_to_switch(nvm->dev);
+
+	if (sw->generation < 3) {
+		int ret;
+
+		/* Write CSS headers first */
+		ret = dma_port_flash_write(sw->dma_port,
+			DMA_PORT_CSS_ADDRESS, nvm->buf + INTEL_NVM_CSS,
+			DMA_PORT_CSS_MAX_SIZE);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct tb_nvm_vendor_ops intel_switch_nvm_ops = {
+	.read_version = intel_switch_nvm_version,
+	.validate = intel_switch_nvm_validate,
+	.write_headers = intel_switch_nvm_write_headers,
+};
+
+/* Router vendor NVM support table */
+static const struct tb_nvm_vendor switch_nvm_vendors[] = {
+	{ PCI_VENDOR_ID_INTEL, &intel_switch_nvm_ops },
+	{ 0x8087, &intel_switch_nvm_ops },
+};
+
+static int intel_retimer_nvm_version(struct tb_nvm *nvm)
+{
+	struct tb_retimer *rt = tb_to_retimer(nvm->dev);
+	u32 val, nvm_size;
+	int ret;
+
+	ret = tb_retimer_nvm_read(rt, INTEL_NVM_VERSION, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	nvm->major = (val >> 16) & 0xff;
+	nvm->minor = (val >> 8) & 0xff;
+
+	ret = tb_retimer_nvm_read(rt, INTEL_NVM_FLASH_SIZE, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	nvm_size = (SZ_1M << (val & 7)) / 8;
+	nvm_size = (nvm_size - SZ_16K) / 2;
+	nvm->active_size = nvm_size;
+
+	return 0;
+}
+
+static int intel_retimer_nvm_validate(struct tb_nvm *nvm)
+{
+	struct tb_retimer *rt = tb_to_retimer(nvm->dev);
+	unsigned int image_size, hdr_size;
+	u8 *buf = nvm->buf;
+	u16 ds_size, device;
+
+	image_size = nvm->buf_data_size;
+
+	/*
+	 * FARB pointer must point inside the image and must at least
+	 * contain parts of the digital section we will be reading here.
+	 */
+	hdr_size = (*(u32 *)buf) & 0xffffff;
+	if (hdr_size + INTEL_NVM_DEVID + 2 >= image_size)
+		return -EINVAL;
+
+	/* Digital section start should be aligned to 4k page */
+	if (!IS_ALIGNED(hdr_size, SZ_4K))
+		return -EINVAL;
+
+	/*
+	 * Read digital section size and check that it also fits inside
+	 * the image.
+	 */
+	ds_size = *(u16 *)(buf + hdr_size);
+	if (ds_size >= image_size)
+		return -EINVAL;
+
+	/*
+	 * Make sure the device ID in the image matches the retimer
+	 * hardware.
+	 */
+	device = *(u16 *)(buf + hdr_size + INTEL_NVM_DEVID);
+	if (device != rt->device)
+		return -EINVAL;
+
+	/* Skip headers in the image */
+	nvm->buf_data_start = buf + hdr_size;
+	nvm->buf_data_size = image_size - hdr_size;
+
+	return 0;
+}
+
+static const struct tb_nvm_vendor_ops intel_retimer_nvm_ops = {
+	.read_version = intel_retimer_nvm_version,
+	.validate = intel_retimer_nvm_validate,
+};
+
+/* Retimer vendor NVM support table */
+static const struct tb_nvm_vendor retimer_nvm_vendors[] = {
+	{ 0x8087, &intel_retimer_nvm_ops },
+};
+
 /**
  * tb_nvm_alloc() - Allocate new NVM structure
  * @dev: Device owning the NVM
  *
  * Allocates new NVM structure with unique @id and returns it. In case
- * of error returns ERR_PTR().
+ * of error returns ERR_PTR(). Specifically returns %-EOPNOTSUPP if the
+ * NVM format of the @dev is not known by the kernel.
  */
 struct tb_nvm *tb_nvm_alloc(struct device *dev)
 {
+	const struct tb_nvm_vendor_ops *vops = NULL;
 	struct tb_nvm *nvm;
-	int ret;
+	int ret, i;
+
+	if (tb_is_switch(dev)) {
+		const struct tb_switch *sw = tb_to_switch(dev);
+
+		for (i = 0; i < ARRAY_SIZE(switch_nvm_vendors); i++) {
+			const struct tb_nvm_vendor *v = &switch_nvm_vendors[i];
+
+			if (v->vendor == sw->config.vendor_id) {
+				vops = v->vops;
+				break;
+			}
+		}
+
+		if (!vops) {
+			tb_sw_dbg(sw, "router NVM format of vendor %#x unknown\n",
+				  sw->config.vendor_id);
+			return ERR_PTR(-EOPNOTSUPP);
+		}
+	} else if (tb_is_retimer(dev)) {
+		const struct tb_retimer *rt = tb_to_retimer(dev);
+
+		for (i = 0; i < ARRAY_SIZE(retimer_nvm_vendors); i++) {
+			const struct tb_nvm_vendor *v = &retimer_nvm_vendors[i];
+
+			if (v->vendor == rt->vendor) {
+				vops = v->vops;
+				break;
+			}
+		}
+
+		if (!vops) {
+			dev_dbg(dev, "retimer NVM format of vendor %#x unknown\n",
+				rt->vendor);
+			return ERR_PTR(-EOPNOTSUPP);
+		}
+	} else {
+		return ERR_PTR(-EOPNOTSUPP);
+	}
 
 	nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
 	if (!nvm)
@@ -38,14 +297,85 @@ struct tb_nvm *tb_nvm_alloc(struct device *dev)
 
 	nvm->id = ret;
 	nvm->dev = dev;
+	nvm->vops = vops;
 
 	return nvm;
 }
 
+/**
+ * tb_nvm_read_version() - Read and populate NVM version
+ * @nvm: NVM structure
+ *
+ * Uses vendor specific means to read out and fill in the existing
+ * active NVM version. Returns %0 in case of success and negative errno
+ * otherwise.
+ */
+int tb_nvm_read_version(struct tb_nvm *nvm)
+{
+	const struct tb_nvm_vendor_ops *vops = nvm->vops;
+
+	if (vops && vops->read_version)
+		return vops->read_version(nvm);
+
+	return -EOPNOTSUPP;
+}
+
+/**
+ * tb_nvm_validate() - Validate new NVM image
+ * @nvm: NVM structure
+ *
+ * Runs vendor specific validation over the new NVM image and if all
+ * checks pass returns %0. As side effect updates @nvm->buf_data_start
+ * and @nvm->buf_data_size fields to match the actual data to be written
+ * to the NVM.
+ *
+ * If the validation does not pass then returns negative errno.
+ */
+int tb_nvm_validate(struct tb_nvm *nvm)
+{
+	const struct tb_nvm_vendor_ops *vops = nvm->vops;
+	unsigned int image_size;
+	u8 *buf = nvm->buf;
+
+	if (!buf)
+		return -EINVAL;
+	if (!vops)
+		return -EOPNOTSUPP;
+
+	/* Just do basic image size checks */
+	image_size = nvm->buf_data_size;
+	if (image_size < NVM_MIN_SIZE || image_size > NVM_MAX_SIZE)
+		return -EINVAL;
+
+	/*
+	 * Set the default data start in the buffer. The validate method
+	 * below can change this if needed.
+	 */
+	nvm->buf_data_start = buf;
+
+	return vops->validate ? vops->validate(nvm) : 0;
+}
+
+/**
+ * tb_nvm_write_header() - Write headers before the rest of the image
+ * @nvm: NVM structure
+ *
+ * If the vendor NVM format requires writing headers before the rest of
+ * the image, this function does that. Can be called even if the device
+ * does not need this.
+ *
+ * Returns %0 in case of success and negative errno otherwise.
+ */
+int tb_nvm_write_headers(struct tb_nvm *nvm)
+{
+	const struct tb_nvm_vendor_ops *vops = nvm->vops;
+
+	return vops->write_headers ? vops->write_headers(nvm) : 0;
+}
+
 /**
  * tb_nvm_add_active() - Adds active NVMem device to NVM
  * @nvm: NVM structure
- * @size: Size of the active NVM in bytes
  * @reg_read: Pointer to the function to read the NVM (passed directly to the
  *	      NVMem device)
  *
@@ -54,7 +384,7 @@ struct tb_nvm *tb_nvm_alloc(struct device *dev)
  * needed. The first parameter passed to @reg_read is @nvm structure.
  * Returns %0 in success and negative errno otherwise.
  */
-int tb_nvm_add_active(struct tb_nvm *nvm, size_t size, nvmem_reg_read_t reg_read)
+int tb_nvm_add_active(struct tb_nvm *nvm, nvmem_reg_read_t reg_read)
 {
 	struct nvmem_config config;
 	struct nvmem_device *nvmem;
@@ -67,7 +397,7 @@ int tb_nvm_add_active(struct tb_nvm *nvm, size_t size, nvmem_reg_read_t reg_read
 	config.id = nvm->id;
 	config.stride = 4;
 	config.word_size = 4;
-	config.size = size;
+	config.size = nvm->active_size;
 	config.dev = nvm->dev;
 	config.owner = THIS_MODULE;
 	config.priv = nvm;
@@ -109,17 +439,17 @@ int tb_nvm_write_buf(struct tb_nvm *nvm, unsigned int offset, void *val,
 /**
  * tb_nvm_add_non_active() - Adds non-active NVMem device to NVM
  * @nvm: NVM structure
- * @size: Size of the non-active NVM in bytes
  * @reg_write: Pointer to the function to write the NVM (passed directly
  *	       to the NVMem device)
  *
  * Registers new non-active NVmem device for @nvm. The @reg_write is called
  * directly from NVMem so it must handle possible concurrent access if
  * needed. The first parameter passed to @reg_write is @nvm structure.
+ * The size of the NVMem device is set to %NVM_MAX_SIZE.
+ *
  * Returns %0 in success and negative errno otherwise.
  */
-int tb_nvm_add_non_active(struct tb_nvm *nvm, size_t size,
-			  nvmem_reg_write_t reg_write)
+int tb_nvm_add_non_active(struct tb_nvm *nvm, nvmem_reg_write_t reg_write)
 {
 	struct nvmem_config config;
 	struct nvmem_device *nvmem;
@@ -132,7 +462,7 @@ int tb_nvm_add_non_active(struct tb_nvm *nvm, size_t size,
 	config.id = nvm->id;
 	config.stride = 4;
 	config.word_size = 4;
-	config.size = size;
+	config.size = NVM_MAX_SIZE;
 	config.dev = nvm->dev;
 	config.owner = THIS_MODULE;
 	config.priv = nvm;
diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index bec02ad4cb3b..dd8f033b1690 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -73,34 +73,23 @@ static int nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
 static int tb_retimer_nvm_add(struct tb_retimer *rt)
 {
 	struct tb_nvm *nvm;
-	u32 val, nvm_size;
 	int ret;
 
 	nvm = tb_nvm_alloc(&rt->dev);
-	if (IS_ERR(nvm))
-		return PTR_ERR(nvm);
-
-	ret = usb4_port_retimer_nvm_read(rt->port, rt->index, NVM_VERSION, &val,
-					 sizeof(val));
-	if (ret)
+	if (IS_ERR(nvm)) {
+		ret = PTR_ERR(nvm) == -EOPNOTSUPP ? 0 : PTR_ERR(nvm);
 		goto err_nvm;
+	}
 
-	nvm->major = (val >> 16) & 0xff;
-	nvm->minor = (val >> 8) & 0xff;
-
-	ret = usb4_port_retimer_nvm_read(rt->port, rt->index, NVM_FLASH_SIZE,
-					 &val, sizeof(val));
+	ret = tb_nvm_read_version(nvm);
 	if (ret)
 		goto err_nvm;
 
-	nvm_size = (SZ_1M << (val & 7)) / 8;
-	nvm_size = (nvm_size - SZ_16K) / 2;
-
-	ret = tb_nvm_add_active(nvm, nvm_size, nvm_read);
+	ret = tb_nvm_add_active(nvm, nvm_read);
 	if (ret)
 		goto err_nvm;
 
-	ret = tb_nvm_add_non_active(nvm, NVM_MAX_SIZE, nvm_write);
+	ret = tb_nvm_add_non_active(nvm, nvm_write);
 	if (ret)
 		goto err_nvm;
 
@@ -108,59 +97,33 @@ static int tb_retimer_nvm_add(struct tb_retimer *rt)
 	return 0;
 
 err_nvm:
-	tb_nvm_free(nvm);
+	dev_dbg(&rt->dev, "NVM upgrade disabled\n");
+	if (!IS_ERR(nvm))
+		tb_nvm_free(nvm);
+
 	return ret;
 }
 
 static int tb_retimer_nvm_validate_and_write(struct tb_retimer *rt)
 {
-	unsigned int image_size, hdr_size;
-	const u8 *buf = rt->nvm->buf;
-	u16 ds_size, device;
+	unsigned int image_size;
+	const u8 *buf;
 	int ret;
 
-	image_size = rt->nvm->buf_data_size;
-	if (image_size < NVM_MIN_SIZE || image_size > NVM_MAX_SIZE)
-		return -EINVAL;
-
-	/*
-	 * FARB pointer must point inside the image and must at least
-	 * contain parts of the digital section we will be reading here.
-	 */
-	hdr_size = (*(u32 *)buf) & 0xffffff;
-	if (hdr_size + NVM_DEVID + 2 >= image_size)
-		return -EINVAL;
-
-	/* Digital section start should be aligned to 4k page */
-	if (!IS_ALIGNED(hdr_size, SZ_4K))
-		return -EINVAL;
-
-	/*
-	 * Read digital section size and check that it also fits inside
-	 * the image.
-	 */
-	ds_size = *(u16 *)(buf + hdr_size);
-	if (ds_size >= image_size)
-		return -EINVAL;
-
-	/*
-	 * Make sure the device ID in the image matches the retimer
-	 * hardware.
-	 */
-	device = *(u16 *)(buf + hdr_size + NVM_DEVID);
-	if (device != rt->device)
-		return -EINVAL;
+	ret = tb_nvm_validate(rt->nvm);
+	if (ret)
+		return ret;
 
-	/* Skip headers in the image */
-	buf += hdr_size;
-	image_size -= hdr_size;
+	buf = rt->nvm->buf_data_start;
+	image_size = rt->nvm->buf_data_size;
 
 	ret = usb4_port_retimer_nvm_write(rt->port, rt->index, 0, buf,
 					 image_size);
-	if (!ret)
-		rt->nvm->flushed = true;
+	if (ret)
+		return ret;
 
-	return ret;
+	rt->nvm->flushed = true;
+	return 0;
 }
 
 static int tb_retimer_nvm_authenticate(struct tb_retimer *rt, bool auth_only)
@@ -214,6 +177,8 @@ static ssize_t nvm_authenticate_show(struct device *dev,
 
 	if (!rt->nvm)
 		ret = -EAGAIN;
+	else if (rt->no_nvm_upgrade)
+		ret = -EOPNOTSUPP;
 	else
 		ret = sprintf(buf, "%#x\n", rt->auth_status);
 
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index a073a702c381..2bcb6753d569 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -19,8 +19,6 @@
 
 /* Switch NVM support */
 
-#define NVM_CSS			0x10
-
 struct nvm_auth_status {
 	struct list_head list;
 	uuid_t uuid;
@@ -102,70 +100,30 @@ static void nvm_clear_auth_status(const struct tb_switch *sw)
 
 static int nvm_validate_and_write(struct tb_switch *sw)
 {
-	unsigned int image_size, hdr_size;
-	const u8 *buf = sw->nvm->buf;
-	u16 ds_size;
+	unsigned int image_size;
+	const u8 *buf;
 	int ret;
 
-	if (!buf)
-		return -EINVAL;
-
-	image_size = sw->nvm->buf_data_size;
-	if (image_size < NVM_MIN_SIZE || image_size > NVM_MAX_SIZE)
-		return -EINVAL;
-
-	/*
-	 * FARB pointer must point inside the image and must at least
-	 * contain parts of the digital section we will be reading here.
-	 */
-	hdr_size = (*(u32 *)buf) & 0xffffff;
-	if (hdr_size + NVM_DEVID + 2 >= image_size)
-		return -EINVAL;
-
-	/* Digital section start should be aligned to 4k page */
-	if (!IS_ALIGNED(hdr_size, SZ_4K))
-		return -EINVAL;
-
-	/*
-	 * Read digital section size and check that it also fits inside
-	 * the image.
-	 */
-	ds_size = *(u16 *)(buf + hdr_size);
-	if (ds_size >= image_size)
-		return -EINVAL;
-
-	if (!sw->safe_mode) {
-		u16 device_id;
+	ret = tb_nvm_validate(sw->nvm);
+	if (ret)
+		return ret;
 
-		/*
-		 * Make sure the device ID in the image matches the one
-		 * we read from the switch config space.
-		 */
-		device_id = *(u16 *)(buf + hdr_size + NVM_DEVID);
-		if (device_id != sw->config.device_id)
-			return -EINVAL;
-
-		if (sw->generation < 3) {
-			/* Write CSS headers first */
-			ret = dma_port_flash_write(sw->dma_port,
-				DMA_PORT_CSS_ADDRESS, buf + NVM_CSS,
-				DMA_PORT_CSS_MAX_SIZE);
-			if (ret)
-				return ret;
-		}
+	ret = tb_nvm_write_headers(sw->nvm);
+	if (ret)
+		return ret;
 
-		/* Skip headers in the image */
-		buf += hdr_size;
-		image_size -= hdr_size;
-	}
+	buf = sw->nvm->buf_data_start;
+	image_size = sw->nvm->buf_data_size;
 
 	if (tb_switch_is_usb4(sw))
 		ret = usb4_switch_nvm_write(sw, 0, buf, image_size);
 	else
 		ret = dma_port_flash_write(sw->dma_port, 0, buf, image_size);
-	if (!ret)
-		sw->nvm->flushed = true;
-	return ret;
+	if (ret)
+		return ret;
+
+	sw->nvm->flushed = true;
+	return 0;
 }
 
 static int nvm_authenticate_host_dma_port(struct tb_switch *sw)
@@ -393,28 +351,20 @@ static int nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
 static int tb_switch_nvm_add(struct tb_switch *sw)
 {
 	struct tb_nvm *nvm;
-	u32 val;
 	int ret;
 
 	if (!nvm_readable(sw))
 		return 0;
 
-	/*
-	 * The NVM format of non-Intel hardware is not known so
-	 * currently restrict NVM upgrade for Intel hardware. We may
-	 * relax this in the future when we learn other NVM formats.
-	 */
-	if (sw->config.vendor_id != PCI_VENDOR_ID_INTEL &&
-	    sw->config.vendor_id != 0x8087) {
-		dev_info(&sw->dev,
-			 "NVM format of vendor %#x is not known, disabling NVM upgrade\n",
-			 sw->config.vendor_id);
-		return 0;
+	nvm = tb_nvm_alloc(&sw->dev);
+	if (IS_ERR(nvm)) {
+		ret = PTR_ERR(nvm) == -EOPNOTSUPP ? 0 : PTR_ERR(nvm);
+		goto err_nvm;
 	}
 
-	nvm = tb_nvm_alloc(&sw->dev);
-	if (IS_ERR(nvm))
-		return PTR_ERR(nvm);
+	ret = tb_nvm_read_version(nvm);
+	if (ret)
+		goto err_nvm;
 
 	/*
 	 * If the switch is in safe-mode the only accessible portion of
@@ -422,30 +372,13 @@ static int tb_switch_nvm_add(struct tb_switch *sw)
 	 * write new functional NVM.
 	 */
 	if (!sw->safe_mode) {
-		u32 nvm_size, hdr_size;
-
-		ret = tb_switch_nvm_read(sw, NVM_FLASH_SIZE, &val, sizeof(val));
-		if (ret)
-			goto err_nvm;
-
-		hdr_size = sw->generation < 3 ? SZ_8K : SZ_16K;
-		nvm_size = (SZ_1M << (val & 7)) / 8;
-		nvm_size = (nvm_size - hdr_size) / 2;
-
-		ret = tb_switch_nvm_read(sw, NVM_VERSION, &val, sizeof(val));
-		if (ret)
-			goto err_nvm;
-
-		nvm->major = (val >> 16) & 0xff;
-		nvm->minor = (val >> 8) & 0xff;
-
-		ret = tb_nvm_add_active(nvm, nvm_size, nvm_read);
+		ret = tb_nvm_add_active(nvm, nvm_read);
 		if (ret)
 			goto err_nvm;
 	}
 
 	if (!sw->no_nvm_upgrade) {
-		ret = tb_nvm_add_non_active(nvm, NVM_MAX_SIZE, nvm_write);
+		ret = tb_nvm_add_non_active(nvm, nvm_write);
 		if (ret)
 			goto err_nvm;
 	}
@@ -454,7 +387,11 @@ static int tb_switch_nvm_add(struct tb_switch *sw)
 	return 0;
 
 err_nvm:
-	tb_nvm_free(nvm);
+	tb_sw_dbg(sw, "NVM upgrade disabled\n");
+	sw->no_nvm_upgrade = true;
+	if (!IS_ERR(nvm))
+		tb_nvm_free(nvm);
+
 	return ret;
 }
 
@@ -2003,6 +1940,11 @@ static ssize_t nvm_authenticate_sysfs(struct device *dev, const char *buf,
 		goto exit_rpm;
 	}
 
+	if (sw->no_nvm_upgrade) {
+		ret = -EOPNOTSUPP;
+		goto exit_unlock;
+	}
+
 	/* If NVMem devices are not yet added */
 	if (!sw->nvm) {
 		ret = -EAGAIN;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 5a4aface19e7..bba4f6b29ee4 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -23,11 +23,6 @@
 #define NVM_MAX_SIZE		SZ_512K
 #define NVM_DATA_DWORDS		16
 
-/* Intel specific NVM offsets */
-#define NVM_DEVID		0x05
-#define NVM_VERSION		0x08
-#define NVM_FLASH_SIZE		0x45
-
 /**
  * struct tb_nvm - Structure holding NVM information
  * @dev: Owner of the NVM
@@ -35,13 +30,17 @@
  * @minor: Minor version number of the active NVM portion
  * @id: Identifier used with both NVM portions
  * @active: Active portion NVMem device
+ * @active_size: Size in bytes of the active NVM
  * @non_active: Non-active portion NVMem device
  * @buf: Buffer where the NVM image is stored before it is written to
  *	 the actual NVM flash device
+ * @buf_data_start: Where the actual image starts after skipping
+ *		    possible headers
  * @buf_data_size: Number of bytes actually consumed by the new NVM
  *		   image
  * @authenticating: The device is authenticating the new NVM
  * @flushed: The image has been flushed to the storage area
+ * @vops: Router vendor specific NVM operations (optional)
  *
  * The user of this structure needs to handle serialization of possible
  * concurrent access.
@@ -52,11 +51,14 @@ struct tb_nvm {
 	u32 minor;
 	int id;
 	struct nvmem_device *active;
+	size_t active_size;
 	struct nvmem_device *non_active;
 	void *buf;
+	void *buf_data_start;
 	size_t buf_data_size;
 	bool authenticating;
 	bool flushed;
+	const struct tb_nvm_vendor_ops *vops;
 };
 
 enum tb_nvm_write_ops {
@@ -300,6 +302,7 @@ struct usb4_port {
  * @device: Device ID of the retimer
  * @port: Pointer to the lane 0 adapter
  * @nvm: Pointer to the NVM if the retimer has one (%NULL otherwise)
+ * @no_nvm_upgrade: Prevent NVM upgrade of this retimer
  * @auth_status: Status of last NVM authentication
  */
 struct tb_retimer {
@@ -310,6 +313,7 @@ struct tb_retimer {
 	u32 device;
 	struct tb_port *port;
 	struct tb_nvm *nvm;
+	bool no_nvm_upgrade;
 	u32 auth_status;
 };
 
@@ -741,11 +745,13 @@ static inline void tb_domain_put(struct tb *tb)
 }
 
 struct tb_nvm *tb_nvm_alloc(struct device *dev);
-int tb_nvm_add_active(struct tb_nvm *nvm, size_t size, nvmem_reg_read_t reg_read);
+int tb_nvm_read_version(struct tb_nvm *nvm);
+int tb_nvm_validate(struct tb_nvm *nvm);
+int tb_nvm_write_headers(struct tb_nvm *nvm);
+int tb_nvm_add_active(struct tb_nvm *nvm, nvmem_reg_read_t reg_read);
 int tb_nvm_write_buf(struct tb_nvm *nvm, unsigned int offset, void *val,
 		     size_t bytes);
-int tb_nvm_add_non_active(struct tb_nvm *nvm, size_t size,
-			  nvmem_reg_write_t reg_write);
+int tb_nvm_add_non_active(struct tb_nvm *nvm, nvmem_reg_write_t reg_write);
 void tb_nvm_free(struct tb_nvm *nvm);
 void tb_nvm_exit(void);
 
-- 
2.35.1

