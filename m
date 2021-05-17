Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8089A382B9E
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 13:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236875AbhEQMAF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 08:00:05 -0400
Received: from mga05.intel.com ([192.55.52.43]:33438 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229772AbhEQMAE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 May 2021 08:00:04 -0400
IronPort-SDR: kvKHj+6mxGzHR4gagjnvLiGTsZ4i2wpTZn1sNLUs4TnemdCEWIuD+pX3SncsDrRIA3B0kkFGf8
 Js5QcH6gWUDg==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="285975904"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="285975904"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 04:58:48 -0700
IronPort-SDR: DZovTELC5wjl0V1yP0qUOPzK4lfUue+nQkUw0e7OYb88PPNghD5VDveWRQaYEkX8zokCiAKMMv
 JgjsyR3UouDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="626470893"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 17 May 2021 04:58:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 741EF662; Mon, 17 May 2021 14:59:07 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/4] thunderbolt: Split NVM read/write generic functions out from usb4.c
Date:   Mon, 17 May 2021 14:59:06 +0300
Message-Id: <20210517115907.52503-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210517115907.52503-1-mika.westerberg@linux.intel.com>
References: <20210517115907.52503-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We do this for Thunderbolt 2/3 devices through DMA port, USB4 devices
and retimers pretty much the same way. Only the actual block read/write
is different. For this reason split out the NVM read/write functions
from usb4.c to nvm.c and make USB4 device code call these when needed.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nvm.c  |  95 ++++++++++++++++++++++++++++++++
 drivers/thunderbolt/tb.h   |  11 ++++
 drivers/thunderbolt/usb4.c | 110 ++++++-------------------------------
 3 files changed, 124 insertions(+), 92 deletions(-)

diff --git a/drivers/thunderbolt/nvm.c b/drivers/thunderbolt/nvm.c
index 29de6d95c6e7..3a5336913cca 100644
--- a/drivers/thunderbolt/nvm.c
+++ b/drivers/thunderbolt/nvm.c
@@ -164,6 +164,101 @@ void tb_nvm_free(struct tb_nvm *nvm)
 	kfree(nvm);
 }
 
+/**
+ * tb_nvm_read_data() - Read data from NVM
+ * @address: Start address on the flash
+ * @buf: Buffer where the read data is copied
+ * @size: Size of the buffer in bytes
+ * @retries: Number of retries if block read fails
+ * @read_block: Function that reads block from the flash
+ * @read_block_data: Data passsed to @read_block
+ *
+ * This is a generic function that reads data from NVM or NVM like
+ * device.
+ *
+ * Returns %0 on success and negative errno otherwise.
+ */
+int tb_nvm_read_data(unsigned int address, void *buf, size_t size,
+		     unsigned int retries, read_block_fn read_block,
+		     void *read_block_data)
+{
+	do {
+		unsigned int dwaddress, dwords, offset;
+		u8 data[NVM_DATA_DWORDS * 4];
+		size_t nbytes;
+		int ret;
+
+		offset = address & 3;
+		nbytes = min_t(size_t, size + offset, NVM_DATA_DWORDS * 4);
+
+		dwaddress = address / 4;
+		dwords = ALIGN(nbytes, 4) / 4;
+
+		ret = read_block(read_block_data, dwaddress, data, dwords);
+		if (ret) {
+			if (ret != -ENODEV && retries--)
+				continue;
+			return ret;
+		}
+
+		nbytes -= offset;
+		memcpy(buf, data + offset, nbytes);
+
+		size -= nbytes;
+		address += nbytes;
+		buf += nbytes;
+	} while (size > 0);
+
+	return 0;
+}
+
+/**
+ * tb_nvm_write_data() - Write data to NVM
+ * @address: Start address on the flash
+ * @buf: Buffer where the data is copied from
+ * @size: Size of the buffer in bytes
+ * @retries: Number of retries if the block write fails
+ * @write_block: Function that writes block to the flash
+ * @write_block_data: Data passwd to @write_block
+ *
+ * This is generic function that writes data to NVM or NVM like device.
+ *
+ * Returns %0 on success and negative errno otherwise.
+ */
+int tb_nvm_write_data(unsigned int address, const void *buf, size_t size,
+		      unsigned int retries, write_block_fn write_block,
+		      void *write_block_data)
+{
+	do {
+		unsigned int offset, dwaddress;
+		u8 data[NVM_DATA_DWORDS * 4];
+		size_t nbytes;
+		int ret;
+
+		offset = address & 3;
+		nbytes = min_t(u32, size + offset, NVM_DATA_DWORDS * 4);
+
+		memcpy(data + offset, buf, nbytes);
+
+		dwaddress = address / 4;
+		ret = write_block(write_block_data, dwaddress, data, nbytes / 4);
+		if (ret) {
+			if (ret == -ETIMEDOUT) {
+				if (retries--)
+					continue;
+				ret = -EIO;
+			}
+			return ret;
+		}
+
+		size -= nbytes;
+		address += nbytes;
+		buf += nbytes;
+	} while (size > 0);
+
+	return 0;
+}
+
 void tb_nvm_exit(void)
 {
 	ida_destroy(&nvm_ida);
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 9790e9f13d2b..d9d1adc4cfd3 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -20,6 +20,7 @@
 
 #define NVM_MIN_SIZE		SZ_32K
 #define NVM_MAX_SIZE		SZ_512K
+#define NVM_DATA_DWORDS		16
 
 /* Intel specific NVM offsets */
 #define NVM_DEVID		0x05
@@ -674,6 +675,16 @@ int tb_nvm_add_non_active(struct tb_nvm *nvm, size_t size,
 void tb_nvm_free(struct tb_nvm *nvm);
 void tb_nvm_exit(void);
 
+typedef int (*read_block_fn)(void *, unsigned int, void *, size_t);
+typedef int (*write_block_fn)(void *, unsigned int, const void *, size_t);
+
+int tb_nvm_read_data(unsigned int address, void *buf, size_t size,
+		     unsigned int retries, read_block_fn read_block,
+		     void *read_block_data);
+int tb_nvm_write_data(unsigned int address, const void *buf, size_t size,
+		      unsigned int retries, write_block_fn write_next_block,
+		      void *write_block_data);
+
 struct tb_switch *tb_switch_alloc(struct tb *tb, struct device *parent,
 				  u64 route);
 struct tb_switch *tb_switch_alloc_safe_mode(struct tb *tb,
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 671d72af8ba1..c0a14bfa36d4 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -13,7 +13,6 @@
 #include "sb_regs.h"
 #include "tb.h"
 
-#define USB4_DATA_DWORDS		16
 #define USB4_DATA_RETRIES		3
 
 enum usb4_sb_target {
@@ -37,9 +36,6 @@ enum usb4_sb_target {
 
 #define USB4_NVM_SECTOR_SIZE_MASK	GENMASK(23, 0)
 
-typedef int (*read_block_fn)(void *, unsigned int, void *, size_t);
-typedef int (*write_block_fn)(void *, const void *, size_t);
-
 static int usb4_switch_wait_for_bit(struct tb_switch *sw, u32 offset, u32 bit,
 				    u32 value, int timeout_msec)
 {
@@ -62,76 +58,6 @@ static int usb4_switch_wait_for_bit(struct tb_switch *sw, u32 offset, u32 bit,
 	return -ETIMEDOUT;
 }
 
-static int usb4_do_read_data(u16 address, void *buf, size_t size,
-			     read_block_fn read_block, void *read_block_data)
-{
-	unsigned int retries = USB4_DATA_RETRIES;
-	unsigned int offset;
-
-	do {
-		unsigned int dwaddress, dwords;
-		u8 data[USB4_DATA_DWORDS * 4];
-		size_t nbytes;
-		int ret;
-
-		offset = address & 3;
-		nbytes = min_t(size_t, size + offset, USB4_DATA_DWORDS * 4);
-
-		dwaddress = address / 4;
-		dwords = ALIGN(nbytes, 4) / 4;
-
-		ret = read_block(read_block_data, dwaddress, data, dwords);
-		if (ret) {
-			if (ret != -ENODEV && retries--)
-				continue;
-			return ret;
-		}
-
-		nbytes -= offset;
-		memcpy(buf, data + offset, nbytes);
-
-		size -= nbytes;
-		address += nbytes;
-		buf += nbytes;
-	} while (size > 0);
-
-	return 0;
-}
-
-static int usb4_do_write_data(unsigned int address, const void *buf, size_t size,
-	write_block_fn write_next_block, void *write_block_data)
-{
-	unsigned int retries = USB4_DATA_RETRIES;
-	unsigned int offset;
-
-	offset = address & 3;
-	address = address & ~3;
-
-	do {
-		u32 nbytes = min_t(u32, size, USB4_DATA_DWORDS * 4);
-		u8 data[USB4_DATA_DWORDS * 4];
-		int ret;
-
-		memcpy(data + offset, buf, nbytes);
-
-		ret = write_next_block(write_block_data, data, nbytes / 4);
-		if (ret) {
-			if (ret == -ETIMEDOUT) {
-				if (retries--)
-					continue;
-				ret = -EIO;
-			}
-			return ret;
-		}
-
-		size -= nbytes;
-		address += nbytes;
-		buf += nbytes;
-	} while (size > 0);
-
-	return 0;
-}
-
 static int usb4_native_switch_op(struct tb_switch *sw, u16 opcode,
 				 u32 *metadata, u8 *status,
 				 const void *tx_data, size_t tx_dwords,
@@ -193,7 +119,7 @@ static int __usb4_switch_op(struct tb_switch *sw, u16 opcode, u32 *metadata,
 {
 	const struct tb_cm_ops *cm_ops = sw->tb->cm_ops;
 
-	if (tx_dwords > USB4_DATA_DWORDS || rx_dwords > USB4_DATA_DWORDS)
+	if (tx_dwords > NVM_DATA_DWORDS || rx_dwords > NVM_DATA_DWORDS)
 		return -EINVAL;
 
 	/*
@@ -414,8 +340,8 @@ static int usb4_switch_drom_read_block(void *data,
 int usb4_switch_drom_read(struct tb_switch *sw, unsigned int address, void *buf,
 			  size_t size)
 {
-	return usb4_do_read_data(address, buf, size,
-				 usb4_switch_drom_read_block, sw);
+	return tb_nvm_read_data(address, buf, size, USB4_DATA_RETRIES,
+				usb4_switch_drom_read_block, sw);
 }
 
 /**
@@ -595,8 +521,8 @@ static int usb4_switch_nvm_read_block(void *data,
 int usb4_switch_nvm_read(struct tb_switch *sw, unsigned int address, void *buf,
 			 size_t size)
 {
-	return usb4_do_read_data(address, buf, size,
-				 usb4_switch_nvm_read_block, sw);
+	return tb_nvm_read_data(address, buf, size, USB4_DATA_RETRIES,
+				usb4_switch_nvm_read_block, sw);
 }
 
 static int usb4_switch_nvm_set_offset(struct tb_switch *sw,
@@ -618,8 +544,8 @@ static int usb4_switch_nvm_set_offset(struct tb_switch *sw,
 	return status ? -EIO : 0;
 }
 
-static int usb4_switch_nvm_write_next_block(void *data, const void *buf,
-					    size_t dwords)
+static int usb4_switch_nvm_write_next_block(void *data, unsigned int dwaddress,
+					    const void *buf, size_t dwords)
 {
 	struct tb_switch *sw = data;
 	u8 status;
@@ -652,8 +578,8 @@ int usb4_switch_nvm_write(struct tb_switch *sw, unsigned int address,
 	if (ret)
 		return ret;
 
-	return usb4_do_write_data(address, buf, size,
-				  usb4_switch_nvm_write_next_block, sw);
+	return tb_nvm_write_data(address, buf, size, USB4_DATA_RETRIES,
+				 usb4_switch_nvm_write_next_block, sw);
 }
 
 /**
@@ -1029,7 +955,7 @@ static int usb4_port_wait_for_bit(struct tb_port *port, u32 offset, u32 bit,
 
 static int usb4_port_read_data(struct tb_port *port, void *data, size_t dwords)
 {
-	if (dwords > USB4_DATA_DWORDS)
+	if (dwords > NVM_DATA_DWORDS)
 		return -EINVAL;
 
 	return tb_port_read(port, data, TB_CFG_PORT, port->cap_usb4 + PORT_CS_2,
@@ -1039,7 +965,7 @@ static int usb4_port_read_data(struct tb_port *port, void *data, size_t dwords)
 static int usb4_port_write_data(struct tb_port *port, const void *data,
 				size_t dwords)
 {
-	if (dwords > USB4_DATA_DWORDS)
+	if (dwords > NVM_DATA_DWORDS)
 		return -EINVAL;
 
 	return tb_port_write(port, data, TB_CFG_PORT, port->cap_usb4 + PORT_CS_2,
@@ -1316,8 +1242,8 @@ struct retimer_info {
 	u8 index;
 };
 
-static int usb4_port_retimer_nvm_write_next_block(void *data, const void *buf,
-						  size_t dwords)
+static int usb4_port_retimer_nvm_write_next_block(void *data,
+	unsigned int dwaddress, const void *buf, size_t dwords)
 
 {
 	const struct retimer_info *info = data;
@@ -1357,8 +1283,8 @@ int usb4_port_retimer_nvm_write(struct tb_port *port, u8 index, unsigned int add
 	if (ret)
 		return ret;
 
-	return usb4_do_write_data(address, buf, size,
-			usb4_port_retimer_nvm_write_next_block, &info);
+	return tb_nvm_write_data(address, buf, size, USB4_DATA_RETRIES,
+				 usb4_port_retimer_nvm_write_next_block, &info);
 }
 
 /**
@@ -1442,7 +1368,7 @@ static int usb4_port_retimer_nvm_read_block(void *data, unsigned int dwaddress,
 	int ret;
 
 	metadata = dwaddress << USB4_NVM_READ_OFFSET_SHIFT;
-	if (dwords < USB4_DATA_DWORDS)
+	if (dwords < NVM_DATA_DWORDS)
 		metadata |= dwords << USB4_NVM_READ_LENGTH_SHIFT;
 
 	ret = usb4_port_retimer_write(port, index, USB4_SB_METADATA, &metadata,
@@ -1475,8 +1401,8 @@ int usb4_port_retimer_nvm_read(struct tb_port *port, u8 index,
 {
 	struct retimer_info info = { .port = port, .index = index };
 
-	return usb4_do_read_data(address, buf, size,
-			usb4_port_retimer_nvm_read_block, &info);
+	return tb_nvm_read_data(address, buf, size, USB4_DATA_RETRIES,
+				usb4_port_retimer_nvm_read_block, &info);
 }
 
 /**
-- 
2.30.2

