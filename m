Return-Path: <linux-usb+bounces-18834-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 974919FD4F5
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 14:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 392A6163773
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 13:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5251F2388;
	Fri, 27 Dec 2024 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FM7y58Pq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E54C18870C
	for <linux-usb@vger.kernel.org>; Fri, 27 Dec 2024 13:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735306236; cv=none; b=V3tjAMHhf2HHMUW86SwNCHzwBSIIoRYzi3BU5O0HuUbvrlvk6dKrN9mVZKiDdwMdWGs0nMEKTL6tRWMO/DJ6S6Fl7jVJDMWcW+rTMjy+56DocgfaCDYrG/FSs92fK/bVo+RLtetA+vllISg5ifCIzkHDd2Z7L22C0q2OPhrcbLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735306236; c=relaxed/simple;
	bh=RVn4MrdDcfCJGwuD4UopptcQQUPTHeB/EEcmWVLof9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tDbeNyaaIjuzdjazpEjJHgUeCKu/hdk/GZ1F86Q1YcHUWpKArDfoFzKXSfJcmviIq/GlUtJxABTF/cr6gcGoQVRHKW1aGqcjImjobP8PikI2d/BkfIHVBycGIjKfDxvTB8u1AXn9NLJDKQcTE/omRKlVo93pEcuMOv2BzhOigTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FM7y58Pq; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735306234; x=1766842234;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RVn4MrdDcfCJGwuD4UopptcQQUPTHeB/EEcmWVLof9I=;
  b=FM7y58Pq0KM5L6Q4ilfvZbWS5R6PVsuI9b7E+IU309Aggl+Y6QdgwnBO
   RiYLbGW7hmOajQJhMkaM+v3UOwR4ItKh3+mJISlUszkPESuree6zV/8n7
   FZqZi/t3PRac31z76iFKlL0n6zbjO0FtigbaVbvtmlrnC2b/E9Nx2dS6M
   ZBk+la9CDqMyroKD1txU7Utu73HC3q7qVvMiX9Ivj0/Lu/4jPzipiFzLT
   EY14B7aSCeTlogtKe2Hx69jFxAzYHbS+G3Rbx5+uyS60y6DC/Vje3RAay
   N6PEppW/evHenzTwuy7wwLZ7K2D24YxwF9UpZkWURikChMyfsZ12k+sid
   A==;
X-CSE-ConnectionGUID: 2pEjQ8uaRvmixCOrJgLVdA==
X-CSE-MsgGUID: wGe0WkGGT0u3WWyy1MAbWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="61085738"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="61085738"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 05:30:33 -0800
X-CSE-ConnectionGUID: 5JnLavBdQMa5gmz39RKCqA==
X-CSE-MsgGUID: p3wlZL6/Qd2WMctqQPOk0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="100530938"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 27 Dec 2024 05:30:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 6D624A9; Fri, 27 Dec 2024 15:30:30 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Expose router DROM through debugfs
Date: Fri, 27 Dec 2024 15:30:30 +0200
Message-ID: <20241227133030.3401991-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Router DROM contains information that might be usable for development
and debugging purposes. For example when new entries are added to the
USB4 spec it is useful to be able to look for them without need to
change the kernel.

For this reason expose the DROM through debugfs.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c |  2 +
 drivers/thunderbolt/eeprom.c  | 78 ++++++++++++++++++++---------------
 drivers/thunderbolt/tb.h      |  5 +++
 3 files changed, 51 insertions(+), 34 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index fa61127b2c47..f8328ca7e22e 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -2413,6 +2413,8 @@ void tb_switch_debugfs_init(struct tb_switch *sw)
 	sw->debugfs_dir = debugfs_dir;
 	debugfs_create_file("regs", DEBUGFS_MODE, debugfs_dir, sw,
 			    &switch_regs_fops);
+	if (sw->drom)
+		debugfs_create_blob("drom", 0400, debugfs_dir, &sw->drom_blob);
 
 	tb_switch_for_each_port(sw, port) {
 		struct dentry *debugfs_dir;
diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
index eb241b270f79..9c1d65d26553 100644
--- a/drivers/thunderbolt/eeprom.c
+++ b/drivers/thunderbolt/eeprom.c
@@ -435,6 +435,29 @@ static int tb_drom_parse_entries(struct tb_switch *sw, size_t header_size)
 	return 0;
 }
 
+static int tb_switch_drom_alloc(struct tb_switch *sw, size_t size)
+{
+	sw->drom = kzalloc(size, GFP_KERNEL);
+	if (!sw->drom)
+		return -ENOMEM;
+
+#ifdef CONFIG_DEBUG_FS
+	sw->drom_blob.data = sw->drom;
+	sw->drom_blob.size = size;
+#endif
+	return 0;
+}
+
+static void tb_switch_drom_free(struct tb_switch *sw)
+{
+#ifdef CONFIG_DEBUG_FS
+	sw->drom_blob.data = NULL;
+	sw->drom_blob.size = 0;
+#endif
+	kfree(sw->drom);
+	sw->drom = NULL;
+}
+
 /*
  * tb_drom_copy_efi - copy drom supplied by EFI to sw->drom if present
  */
@@ -447,9 +470,9 @@ static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
 	if (len < 0 || len < sizeof(struct tb_drom_header))
 		return -EINVAL;
 
-	sw->drom = kmalloc(len, GFP_KERNEL);
-	if (!sw->drom)
-		return -ENOMEM;
+	res = tb_switch_drom_alloc(sw, len);
+	if (res)
+		return res;
 
 	res = device_property_read_u8_array(dev, "ThunderboltDROM", sw->drom,
 									len);
@@ -464,8 +487,7 @@ static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
 	return 0;
 
 err:
-	kfree(sw->drom);
-	sw->drom = NULL;
+	tb_switch_drom_free(sw);
 	return -EINVAL;
 }
 
@@ -491,13 +513,15 @@ static int tb_drom_copy_nvm(struct tb_switch *sw, u16 *size)
 
 	/* Size includes CRC8 + UID + CRC32 */
 	*size += 1 + 8 + 4;
-	sw->drom = kzalloc(*size, GFP_KERNEL);
-	if (!sw->drom)
-		return -ENOMEM;
+	ret = tb_switch_drom_alloc(sw, *size);
+	if (ret)
+		return ret;
 
 	ret = dma_port_flash_read(sw->dma_port, drom_offset, sw->drom, *size);
-	if (ret)
-		goto err_free;
+	if (ret) {
+		tb_switch_drom_free(sw);
+		return ret;
+	}
 
 	/*
 	 * Read UID from the minimal DROM because the one in NVM is just
@@ -505,11 +529,6 @@ static int tb_drom_copy_nvm(struct tb_switch *sw, u16 *size)
 	 */
 	tb_drom_read_uid_only(sw, &sw->uid);
 	return 0;
-
-err_free:
-	kfree(sw->drom);
-	sw->drom = NULL;
-	return ret;
 }
 
 static int usb4_copy_drom(struct tb_switch *sw, u16 *size)
@@ -522,15 +541,13 @@ static int usb4_copy_drom(struct tb_switch *sw, u16 *size)
 
 	/* Size includes CRC8 + UID + CRC32 */
 	*size += 1 + 8 + 4;
-	sw->drom = kzalloc(*size, GFP_KERNEL);
-	if (!sw->drom)
-		return -ENOMEM;
+	ret = tb_switch_drom_alloc(sw, *size);
+	if (ret)
+		return ret;
 
 	ret = usb4_switch_drom_read(sw, 0, sw->drom, *size);
-	if (ret) {
-		kfree(sw->drom);
-		sw->drom = NULL;
-	}
+	if (ret)
+		tb_switch_drom_free(sw);
 
 	return ret;
 }
@@ -552,19 +569,14 @@ static int tb_drom_bit_bang(struct tb_switch *sw, u16 *size)
 		return -EIO;
 	}
 
-	sw->drom = kzalloc(*size, GFP_KERNEL);
-	if (!sw->drom)
-		return -ENOMEM;
+	ret = tb_switch_drom_alloc(sw, *size);
+	if (ret)
+		return ret;
 
 	ret = tb_eeprom_read_n(sw, 0, sw->drom, *size);
 	if (ret)
-		goto err;
-
-	return 0;
+		tb_switch_drom_free(sw);
 
-err:
-	kfree(sw->drom);
-	sw->drom = NULL;
 	return ret;
 }
 
@@ -646,9 +658,7 @@ static int tb_drom_parse(struct tb_switch *sw, u16 size)
 	return 0;
 
 err:
-	kfree(sw->drom);
-	sw->drom = NULL;
-
+	tb_switch_drom_free(sw);
 	return ret;
 }
 
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index ddbf0cd78377..b54147a1ba87 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -9,6 +9,7 @@
 #ifndef TB_H_
 #define TB_H_
 
+#include <linux/debugfs.h>
 #include <linux/nvmem-provider.h>
 #include <linux/pci.h>
 #include <linux/thunderbolt.h>
@@ -160,6 +161,7 @@ struct tb_switch_tmu {
  * @max_pcie_credits: Router preferred number of buffers for PCIe
  * @max_dma_credits: Router preferred number of buffers for DMA/P2P
  * @clx: CLx states on the upstream link of the router
+ * @drom_blob: DROM debugfs blob wrapper
  *
  * When the switch is being added or removed to the domain (other
  * switches) you need to have domain lock held.
@@ -212,6 +214,9 @@ struct tb_switch {
 	unsigned int max_pcie_credits;
 	unsigned int max_dma_credits;
 	unsigned int clx;
+#ifdef CONFIG_DEBUG_FS
+	struct debugfs_blob_wrapper drom_blob;
+#endif
 };
 
 /**
-- 
2.45.2


