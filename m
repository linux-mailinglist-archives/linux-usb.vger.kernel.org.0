Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C235759D2FC
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 10:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240756AbiHWH7l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 03:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241482AbiHWH7h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 03:59:37 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B27465565;
        Tue, 23 Aug 2022 00:59:36 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id f21so13323709pjt.2;
        Tue, 23 Aug 2022 00:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=/oDuZqe0b2KjmBgPCKjFHhbxfD08Jpj3NvKcdX1qC3E=;
        b=qx1Rog2HTMt6AiZwL1P9PDU8yPgw+s8if4IvRERQVJuYnp2Fwc/A4AEphZu1b9ZzGr
         b5wT6javCf88QT7XX9YOa1F9mYdIE3Zo7n0PdVeF3PERcAJjv4uJPCrkIHPHH5xvtDR0
         oWwotEdU7vtBeEfYPOyBM5ZcQYlYydcayb764nYsTvPgnghVHopTBoxmp7G4Lg5h/hEv
         ZfYG5533pFUR9fiCLCjmN6tiq5FaMLbedjnsp4+YORNZyjg/uHLtoCXECN81UiUbbbHO
         cZEazgZjgWVgRC+knfpnQAv/ukWKvQQuZOyFnhvChzfDMQd8UZU3MbpTj9V+CujWhsR+
         30xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=/oDuZqe0b2KjmBgPCKjFHhbxfD08Jpj3NvKcdX1qC3E=;
        b=bC9YWdxEgJpYqnayBzGVF2ngCH9fjlRw6SDSYUh4Qew/5Hq+vwtGI1623FfgNP+Hkk
         x2njQjOw+1+flGT3z/4t+9afEg3pkBQ584DQhR/aKMnBHNoHtkRxcgz8adX5pFjZHWr9
         6xtCs61Bn8RNpsfy1J5eAFSbwwcrKCjPY2lJXkLGEnozIt+xfnKv6Jv8wjhqExOPaNff
         ip9P4+T8pl868WMc54WRBZz6LhJZmOVK2w/SJmQ772fWGp2BnodFYjOELPf5BJjmvPIn
         iUqMYgOmshaeuaaAnRm1v4n5bCL3krnAZ8F1FtLdC+Rz+FPBHMh+QVnr8t14KHcf0LDD
         7A2A==
X-Gm-Message-State: ACgBeo2RpCddWLGETksT+Hz3cblYKxPzVDseD2BvslttQuAwfPxv/Iq2
        /HrLIIUiqFMlMa59zm/gp/8=
X-Google-Smtp-Source: AA6agR6+ysAJggz1uJGzttDYSF7Y4LPQ8Q/plePz05mwNcxsIhEpO2FwWtPhN5+UxpgsruY+fpuurQ==
X-Received: by 2002:a17:90b:1b11:b0:1fb:65ea:59a2 with SMTP id nu17-20020a17090b1b1100b001fb65ea59a2mr1374915pjb.79.1661241575585;
        Tue, 23 Aug 2022 00:59:35 -0700 (PDT)
Received: from sw.. (220-128-98-63.hinet-ip.hinet.net. [220.128.98.63])
        by smtp.gmail.com with ESMTPSA id u18-20020a170902e81200b0016edd557412sm5792448plg.201.2022.08.23.00.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 00:59:35 -0700 (PDT)
From:   Szuying Chen <chensiying21@gmail.com>
To:     gregkh@linuxfoundation.org, mario.limonciello@amd.com,
        mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Yd_Tseng@asmedia.com.tw, Chloe_Chen@asmedia.com.tw,
        Richard_Hsu@asmedia.com.tw
Subject: [PATCH 1/2] thunderbolt: thunderbolt: Add vendor's specific operations of NVM
Date:   Tue, 23 Aug 2022 15:59:21 +0800
Message-Id: <20220823075921.18366-1-chensiying21@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Szuying Chen <Chloe_Chen@asmedia.com.tw>

The patch add tb_switch_nvm_alloc() contain an array that has functions
pointers to vendor_ops that vendor to define.
And moved vendor:intel part of the code to make all the vendors
(includes Intel) support it in nvm.c.

Signed-off-by: Szuying Chen <Chloe_Chen@asmedia.com.tw>
---
 drivers/thunderbolt/nvm.c    | 162 +++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/switch.c |  97 ++++-----------------
 drivers/thunderbolt/tb.h     |  17 +++-
 3 files changed, 195 insertions(+), 81 deletions(-)

diff --git a/drivers/thunderbolt/nvm.c b/drivers/thunderbolt/nvm.c
index b3f310389378..5c7c2a284497 100644
--- a/drivers/thunderbolt/nvm.c
+++ b/drivers/thunderbolt/nvm.c
@@ -12,8 +12,170 @@

 #include "tb.h"

+/* Switch NVM support */
+#define NVM_CSS		0x10
+
 static DEFINE_IDA(nvm_ida);

+static inline int nvm_read(struct tb_switch *sw, unsigned int address,
+			   void *buf, size_t size)
+{
+	if (tb_switch_is_usb4(sw))
+		return usb4_switch_nvm_read(sw, address, buf, size);
+	return dma_port_flash_read(sw->dma_port, address, buf, size);
+}
+
+static int intel_nvm_version(struct tb_switch *sw)
+{
+	struct tb_nvm *nvm = sw->nvm;
+	u32 val;
+	int ret;
+
+	/*
+	 * If the switch is in safe-mode the only accessible portion of
+	 * the NVM is the non-active one where userspace is expected to
+	 * write new functional NVM.
+	 */
+	if (!sw->safe_mode) {
+		u32 nvm_size, hdr_size;
+
+		ret = nvm_read(sw, NVM_FLASH_SIZE, &val, sizeof(val));
+		if (ret)
+			return ret;
+
+		hdr_size = sw->generation < 3 ? SZ_8K : SZ_16K;
+		nvm_size = (SZ_1M << (val & 7)) / 8;
+		nvm_size = (nvm_size - hdr_size) / 2;
+
+		ret = nvm_read(sw, NVM_VERSION, &val, sizeof(val));
+		if (ret)
+			return ret;
+
+		nvm->major = val >> 16;
+		nvm->minor = val >> 8;
+		nvm->nvm_size = nvm_size;
+	}
+	return 0;
+}
+
+static int intel_nvm_validate(struct tb_switch *sw)
+{
+	unsigned int image_size, hdr_size;
+	const u8 *buf = sw->nvm->buf;
+	u16 ds_size;
+	int ret;
+
+	image_size = sw->nvm->buf_data_size;
+	if (image_size < NVM_MIN_SIZE || image_size > NVM_MAX_SIZE)
+		return -EINVAL;
+
+	/*
+	 * FARB pointer must point inside the image and must at least
+	 * contain parts of the digital section we will be reading here.
+	 */
+	hdr_size = (*(u32 *)buf) & 0xffffff;
+	if (hdr_size + NVM_DEVID + 2 >= image_size)
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
+	if (!sw->safe_mode) {
+		u16 device_id;
+
+		/*
+		 * Make sure the device ID in the image matches the one
+		 * we read from the switch config space.
+		 */
+		device_id = *(u16 *)(buf + hdr_size + NVM_DEVID);
+		if (device_id != sw->config.device_id)
+			return -EINVAL;
+
+		if (sw->generation < 3) {
+			/* Write CSS headers first */
+			ret = dma_port_flash_write(sw->dma_port,
+				DMA_PORT_CSS_ADDRESS, buf + NVM_CSS,
+				DMA_PORT_CSS_MAX_SIZE);
+			if (ret)
+				return ret;
+		}
+
+		/* Skip headers in the image */
+		buf += hdr_size;
+		image_size -= hdr_size;
+	}
+	return image_size;
+}
+
+struct tb_nvm_vendor_ops intel_switch_nvm_ops = {
+	.version = intel_nvm_version,
+	.validate = intel_nvm_validate,
+};
+
+struct switch_nvm_vendor {
+	u16 vendor;
+	const struct tb_nvm_vendor_ops *vops;
+};
+
+static const struct switch_nvm_vendor switch_nvm_vendors[] = {
+	{ 0x8086, &intel_switch_nvm_ops },
+	{ 0x8087, &intel_switch_nvm_ops },
+};
+
+/**
+ * tb_switch_nvm_alloc() - alloc nvm and set nvm->vops to point
+ * the vendor specific operations.
+ * @sw: thunderbolt switch
+ */
+struct tb_nvm *tb_switch_nvm_alloc(struct tb_switch *sw)
+{
+	const struct tb_nvm_vendor_ops *vops = NULL;
+	struct tb_nvm *nvm;
+	int i;
+	int ret;
+
+	/*
+	 * If the vendor matches on the array then set nvm->vops to
+	 * point the vendor specific operations.
+	 */
+	for (i = 0; i < ARRAY_SIZE(switch_nvm_vendors); i++) {
+		const struct switch_nvm_vendor *v = &switch_nvm_vendors[i];
+
+		if (v->vendor == sw->config.vendor_id) {
+			vops = v->vops;
+			break;
+		}
+	}
+
+	if (!vops)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	nvm = tb_nvm_alloc(&sw->dev);
+	if (IS_ERR(nvm))
+		return nvm;
+
+	nvm->vops = vops;
+	sw->nvm = nvm;
+	ret = vops->version(sw);
+	if (ret)
+		goto err_nvm;
+
+	return nvm;
+
+err_nvm:
+	tb_nvm_free(nvm);
+	return ERR_PTR(ret);
+}
+
 /**
  * tb_nvm_alloc() - Allocate new NVM structure
  * @dev: Device owning the NVM
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 244f8cd38b25..d257219cb66e 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -102,10 +102,10 @@ static void nvm_clear_auth_status(const struct tb_switch *sw)

 static int nvm_validate_and_write(struct tb_switch *sw)
 {
-	unsigned int image_size, hdr_size;
+	unsigned int image_size;
 	const u8 *buf = sw->nvm->buf;
-	u16 ds_size;
 	int ret;
+	const struct tb_nvm_vendor_ops *vops = sw->nvm->vops;

 	if (!buf)
 		return -EINVAL;
@@ -114,49 +114,12 @@ static int nvm_validate_and_write(struct tb_switch *sw)
 	if (image_size < NVM_MIN_SIZE || image_size > NVM_MAX_SIZE)
 		return -EINVAL;

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
-
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
-
-		/* Skip headers in the image */
-		buf += hdr_size;
-		image_size -= hdr_size;
+	/* Vendors to validate before write to router NVM */
+	if (vops->validate) {
+		ret = vops->validate(sw);
+		if (ret < 0)
+			return ret;
+		image_size = ret;
 	}

 	if (tb_switch_is_usb4(sw))
@@ -384,28 +347,21 @@ static int tb_switch_nvm_write(void *priv, unsigned int offset, void *val,
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
-	}
-
-	nvm = tb_nvm_alloc(&sw->dev);
-	if (IS_ERR(nvm))
+	nvm = tb_switch_nvm_alloc(sw);
+	if (IS_ERR(nvm)) {
+		if (PTR_ERR(nvm) == -EOPNOTSUPP) {
+			dev_info(&sw->dev,
+				"NVM format of vendor %#x is not known, disabling NVM upgrade\n",
+				sw->config.vendor_id);
+			return 0;
+		}
 		return PTR_ERR(nvm);
+	}

 	/*
 	 * If the switch is in safe-mode the only accessible portion of
@@ -413,24 +369,7 @@ static int tb_switch_nvm_add(struct tb_switch *sw)
 	 * write new functional NVM.
 	 */
 	if (!sw->safe_mode) {
-		u32 nvm_size, hdr_size;
-
-		ret = nvm_read(sw, NVM_FLASH_SIZE, &val, sizeof(val));
-		if (ret)
-			goto err_nvm;
-
-		hdr_size = sw->generation < 3 ? SZ_8K : SZ_16K;
-		nvm_size = (SZ_1M << (val & 7)) / 8;
-		nvm_size = (nvm_size - hdr_size) / 2;
-
-		ret = nvm_read(sw, NVM_VERSION, &val, sizeof(val));
-		if (ret)
-			goto err_nvm;
-
-		nvm->major = val >> 16;
-		nvm->minor = val >> 8;
-
-		ret = tb_nvm_add_active(nvm, nvm_size, tb_switch_nvm_read);
+		ret = tb_nvm_add_active(nvm, nvm->nvm_size, tb_switch_nvm_read);
 		if (ret)
 			goto err_nvm;
 	}
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 5db76de40cc1..73ae2e093a92 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -48,8 +48,8 @@
  */
 struct tb_nvm {
 	struct device *dev;
-	u8 major;
-	u8 minor;
+	u32 major;
+	u32 minor;
 	int id;
 	struct nvmem_device *active;
 	struct nvmem_device *non_active;
@@ -57,6 +57,8 @@ struct tb_nvm {
 	size_t buf_data_size;
 	bool authenticating;
 	bool flushed;
+	u32 nvm_size;
+	const struct tb_nvm_vendor_ops *vops;
 };

 enum tb_nvm_write_ops {
@@ -65,6 +67,16 @@ enum tb_nvm_write_ops {
 	AUTHENTICATE_ONLY = 3,
 };

+/**
+ * struct tb_nvm_vendor_ops - vendor NVM specific operations
+ * @version: Used NVM read get Firmware version.
+ * @validate: Vendors have their validate method before NVM write.
+ */
+struct tb_nvm_vendor_ops {
+	int (*version)(struct tb_switch *sw);
+	int (*validate)(struct tb_switch *sw);
+};
+
 #define TB_SWITCH_KEY_SIZE		32
 #define TB_SWITCH_MAX_DEPTH		6
 #define USB4_SWITCH_MAX_DEPTH		5
@@ -736,6 +748,7 @@ static inline void tb_domain_put(struct tb *tb)
 	put_device(&tb->dev);
 }

+struct tb_nvm *tb_switch_nvm_alloc(struct tb_switch *sw);
 struct tb_nvm *tb_nvm_alloc(struct device *dev);
 int tb_nvm_add_active(struct tb_nvm *nvm, size_t size, nvmem_reg_read_t reg_read);
 int tb_nvm_write_buf(struct tb_nvm *nvm, unsigned int offset, void *val,
--
2.34.1

