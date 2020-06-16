Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411711FB311
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jun 2020 15:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728869AbgFPN6w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jun 2020 09:58:52 -0400
Received: from mga14.intel.com ([192.55.52.115]:36502 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726606AbgFPN6w (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Jun 2020 09:58:52 -0400
IronPort-SDR: aQRfo4m+9Rb8aFITVybexRgAKU03vvlexfw6lkSCaflM1SOTrYIh6AR8mmJyiA0QDrlNTm20Vi
 Ji1eK2sRfJvw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 06:56:25 -0700
IronPort-SDR: ufyo5RXoY36EtWNGcdU+yl64i9cynnGzP5kxE8y6GiPSUk+qyJ6bcYWIJQuWipw7KMD6XTw8Ab
 xlm6lucLxZkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; 
   d="scan'208";a="420769364"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 16 Jun 2020 06:56:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 4DC58913; Tue, 16 Jun 2020 16:56:18 +0300 (EEST)
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
Subject: [PATCH 5/6] thunderbolt: Implement USB4 port sideband operations for retimer access
Date:   Tue, 16 Jun 2020 16:56:16 +0300
Message-Id: <20200616135617.85752-6-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200616135617.85752-1-mika.westerberg@linux.intel.com>
References: <20200616135617.85752-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Rajmohan Mani <rajmohan.mani@intel.com>

USB4 spec specifies standard set of sideband operations that are send
over the low speed link to access either retimers on the link or the
link parter (the other router). The USB4 retimer spec extends these and
adds operations for retimer NVM upgrade.

This implements the retimer access and NVM upgrade USB4 port sideband
operations which we need for retimer support in the patch that follows.

Signed-off-by: Rajmohan Mani <rajmohan.mani@intel.com>
Co-developed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/sb_regs.h |  31 +++
 drivers/thunderbolt/tb.h      |  16 ++
 drivers/thunderbolt/tb_regs.h |  10 +
 drivers/thunderbolt/usb4.c    | 459 ++++++++++++++++++++++++++++++++++
 4 files changed, 516 insertions(+)
 create mode 100644 drivers/thunderbolt/sb_regs.h

diff --git a/drivers/thunderbolt/sb_regs.h b/drivers/thunderbolt/sb_regs.h
new file mode 100644
index 000000000000..0e587b7b9200
--- /dev/null
+++ b/drivers/thunderbolt/sb_regs.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * USB4 port sideband registers found on routers and retimers
+ *
+ * Copyright (C) 2020, Intel Corporation
+ * Authors: Mika Westerberg <mika.westerberg@linux.intel.com>
+ *	    Rajmohan Mani <rajmohan.mani@intel.com>
+ */
+
+#ifndef _SB_REGS
+#define _SB_REGS
+
+#define USB4_SB_OPCODE				0x08
+
+enum usb4_sb_opcode {
+	USB4_SB_OPCODE_ERR = 0x20525245,			/* "ERR " */
+	USB4_SB_OPCODE_ONS = 0x444d4321,			/* "!CMD" */
+	USB4_SB_OPCODE_ENUMERATE_RETIMERS = 0x4d554e45,		/* "ENUM" */
+	USB4_SB_OPCODE_QUERY_LAST_RETIMER = 0x5453414c,		/* "LAST" */
+	USB4_SB_OPCODE_GET_NVM_SECTOR_SIZE = 0x53534e47,	/* "GNSS" */
+	USB4_SB_OPCODE_NVM_SET_OFFSET = 0x53504f42,		/* "BOPS" */
+	USB4_SB_OPCODE_NVM_BLOCK_WRITE = 0x574b4c42,		/* "BLKW" */
+	USB4_SB_OPCODE_NVM_AUTH_WRITE = 0x48545541,		/* "AUTH" */
+	USB4_SB_OPCODE_NVM_READ = 0x52524641,			/* "AFRR" */
+};
+
+#define USB4_SB_METADATA			0x09
+#define USB4_SB_METADATA_NVM_AUTH_WRITE_MASK	GENMASK(5, 0)
+#define USB4_SB_DATA				0x12
+
+#endif
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 3d54f36f8805..8f840148378a 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -876,6 +876,22 @@ struct tb_port *usb4_switch_map_usb3_down(struct tb_switch *sw,
 					  const struct tb_port *port);
 
 int usb4_port_unlock(struct tb_port *port);
+int usb4_port_enumerate_retimers(struct tb_port *port);
+
+int usb4_port_retimer_read(struct tb_port *port, u8 index, u8 reg, void *buf,
+			   u8 size);
+int usb4_port_retimer_write(struct tb_port *port, u8 index, u8 reg,
+			    const void *buf, u8 size);
+int usb4_port_retimer_is_last(struct tb_port *port, u8 index);
+int usb4_port_retimer_nvm_sector_size(struct tb_port *port, u8 index);
+int usb4_port_retimer_nvm_write(struct tb_port *port, u8 index,
+				unsigned int address, const void *buf,
+				size_t size);
+int usb4_port_retimer_nvm_authenticate(struct tb_port *port, u8 index);
+int usb4_port_retimer_nvm_authenticate_status(struct tb_port *port, u8 index,
+					      u32 *status);
+int usb4_port_retimer_nvm_read(struct tb_port *port, u8 index,
+			       unsigned int address, void *buf, size_t size);
 
 int usb4_usb3_port_max_link_rate(struct tb_port *port);
 int usb4_usb3_port_actual_link_rate(struct tb_port *port);
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 4fc561347b7c..2ac6af8e0c13 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -288,6 +288,16 @@ struct tb_regs_port_header {
 #define LANE_ADP_CS_1_CURRENT_WIDTH_SHIFT	20
 
 /* USB4 port registers */
+#define PORT_CS_1				0x01
+#define PORT_CS_1_LENGTH_SHIFT			8
+#define PORT_CS_1_TARGET_MASK			GENMASK(18, 16)
+#define PORT_CS_1_TARGET_SHIFT			16
+#define PORT_CS_1_RETIMER_INDEX_SHIFT		20
+#define PORT_CS_1_WNR_WRITE			BIT(24)
+#define PORT_CS_1_NR				BIT(25)
+#define PORT_CS_1_RC				BIT(26)
+#define PORT_CS_1_PND				BIT(31)
+#define PORT_CS_2				0x02
 #define PORT_CS_18				0x12
 #define PORT_CS_18_BE				BIT(8)
 #define PORT_CS_18_TCM				BIT(9)
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 142c7244bdb1..966f334b4010 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/ktime.h>
 
+#include "sb_regs.h"
 #include "tb.h"
 
 #define USB4_DATA_DWORDS		16
@@ -27,6 +28,12 @@ enum usb4_switch_op {
 	USB4_SWITCH_OP_NVM_SECTOR_SIZE = 0x25,
 };
 
+enum usb4_sb_target {
+	USB4_SB_TARGET_ROUTER,
+	USB4_SB_TARGET_PARTNER,
+	USB4_SB_TARGET_RETIMER,
+};
+
 #define USB4_NVM_READ_OFFSET_MASK	GENMASK(23, 2)
 #define USB4_NVM_READ_OFFSET_SHIFT	2
 #define USB4_NVM_READ_LENGTH_MASK	GENMASK(27, 24)
@@ -810,6 +817,458 @@ static int usb4_port_wait_for_bit(struct tb_port *port, u32 offset, u32 bit,
 	return -ETIMEDOUT;
 }
 
+static int usb4_port_read_data(struct tb_port *port, void *data, size_t dwords)
+{
+	if (dwords > USB4_DATA_DWORDS)
+		return -EINVAL;
+
+	return tb_port_read(port, data, TB_CFG_PORT, port->cap_usb4 + PORT_CS_2,
+			    dwords);
+}
+
+static int usb4_port_write_data(struct tb_port *port, const void *data,
+				size_t dwords)
+{
+	if (dwords > USB4_DATA_DWORDS)
+		return -EINVAL;
+
+	return tb_port_write(port, data, TB_CFG_PORT, port->cap_usb4 + PORT_CS_2,
+			     dwords);
+}
+
+static int usb4_port_sb_read(struct tb_port *port, enum usb4_sb_target target,
+			     u8 index, u8 reg, void *buf, u8 size)
+{
+	size_t dwords = DIV_ROUND_UP(size, 4);
+	int ret;
+	u32 val;
+
+	if (!port->cap_usb4)
+		return -EINVAL;
+
+	val = reg;
+	val |= size << PORT_CS_1_LENGTH_SHIFT;
+	val |= (target << PORT_CS_1_TARGET_SHIFT) & PORT_CS_1_TARGET_MASK;
+	if (target == USB4_SB_TARGET_RETIMER)
+		val |= (index << PORT_CS_1_RETIMER_INDEX_SHIFT);
+	val |= PORT_CS_1_PND;
+
+	ret = tb_port_write(port, &val, TB_CFG_PORT,
+			    port->cap_usb4 + PORT_CS_1, 1);
+	if (ret)
+		return ret;
+
+	ret = usb4_port_wait_for_bit(port, port->cap_usb4 + PORT_CS_1,
+				     PORT_CS_1_PND, 0, 500);
+	if (ret)
+		return ret;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			    port->cap_usb4 + PORT_CS_1, 1);
+	if (ret)
+		return ret;
+
+	if (val & PORT_CS_1_NR)
+		return -ENODEV;
+	if (val & PORT_CS_1_RC)
+		return -EIO;
+
+	return buf ? usb4_port_read_data(port, buf, dwords) : 0;
+}
+
+static int usb4_port_sb_write(struct tb_port *port, enum usb4_sb_target target,
+			      u8 index, u8 reg, const void *buf, u8 size)
+{
+	size_t dwords = DIV_ROUND_UP(size, 4);
+	int ret;
+	u32 val;
+
+	if (!port->cap_usb4)
+		return -EINVAL;
+
+	if (buf) {
+		ret = usb4_port_write_data(port, buf, dwords);
+		if (ret)
+			return ret;
+	}
+
+	val = reg;
+	val |= size << PORT_CS_1_LENGTH_SHIFT;
+	val |= PORT_CS_1_WNR_WRITE;
+	val |= (target << PORT_CS_1_TARGET_SHIFT) & PORT_CS_1_TARGET_MASK;
+	if (target == USB4_SB_TARGET_RETIMER)
+		val |= (index << PORT_CS_1_RETIMER_INDEX_SHIFT);
+	val |= PORT_CS_1_PND;
+
+	ret = tb_port_write(port, &val, TB_CFG_PORT,
+			    port->cap_usb4 + PORT_CS_1, 1);
+	if (ret)
+		return ret;
+
+	ret = usb4_port_wait_for_bit(port, port->cap_usb4 + PORT_CS_1,
+				     PORT_CS_1_PND, 0, 500);
+	if (ret)
+		return ret;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			    port->cap_usb4 + PORT_CS_1, 1);
+	if (ret)
+		return ret;
+
+	if (val & PORT_CS_1_NR)
+		return -ENODEV;
+	if (val & PORT_CS_1_RC)
+		return -EIO;
+
+	return 0;
+}
+
+static int usb4_port_sb_op(struct tb_port *port, enum usb4_sb_target target,
+			   u8 index, enum usb4_sb_opcode opcode, int timeout_msec)
+{
+	ktime_t timeout;
+	u32 val;
+	int ret;
+
+	val = opcode;
+	ret = usb4_port_sb_write(port, target, index, USB4_SB_OPCODE, &val,
+				 sizeof(val));
+	if (ret)
+		return ret;
+
+	timeout = ktime_add_ms(ktime_get(), timeout_msec);
+
+	do {
+		/* Check results */
+		ret = usb4_port_sb_read(port, target, index, USB4_SB_OPCODE,
+					&val, sizeof(val));
+		if (ret)
+			return ret;
+
+		switch (val) {
+		case 0:
+			return 0;
+
+		case USB4_SB_OPCODE_ERR:
+			return -EAGAIN;
+
+		case USB4_SB_OPCODE_ONS:
+			return -EOPNOTSUPP;
+
+		default:
+			if (val != opcode)
+				return -EIO;
+			break;
+		}
+	} while (ktime_before(ktime_get(), timeout));
+
+	return -ETIMEDOUT;
+}
+
+/**
+ * usb4_port_enumerate_retimers() - Send RT broadcast transaction
+ * @port: USB4 port
+ *
+ * This forces the USB4 port to send broadcast RT transaction which
+ * makes the retimers on the link to assign index to themselves. Returns
+ * %0 in case of success and negative errno if there was an error.
+ */
+int usb4_port_enumerate_retimers(struct tb_port *port)
+{
+	u32 val;
+
+	val = USB4_SB_OPCODE_ENUMERATE_RETIMERS;
+	return usb4_port_sb_write(port, USB4_SB_TARGET_ROUTER, 0,
+				  USB4_SB_OPCODE, &val, sizeof(val));
+}
+
+static inline int usb4_port_retimer_op(struct tb_port *port, u8 index,
+				       enum usb4_sb_opcode opcode,
+				       int timeout_msec)
+{
+	return usb4_port_sb_op(port, USB4_SB_TARGET_RETIMER, index, opcode,
+			       timeout_msec);
+}
+
+/**
+ * usb4_port_retimer_read() - Read from retimer sideband registers
+ * @port: USB4 port
+ * @index: Retimer index
+ * @reg: Sideband register to read
+ * @buf: Data from @reg is stored here
+ * @size: Number of bytes to read
+ *
+ * Function reads retimer sideband registers starting from @reg. The
+ * retimer is connected to @port at @index. Returns %0 in case of
+ * success, and read data is copied to @buf. If there is no retimer
+ * present at given @index returns %-ENODEV. In any other failure
+ * returns negative errno.
+ */
+int usb4_port_retimer_read(struct tb_port *port, u8 index, u8 reg, void *buf,
+			   u8 size)
+{
+	return usb4_port_sb_read(port, USB4_SB_TARGET_RETIMER, index, reg, buf,
+				 size);
+}
+
+/**
+ * usb4_port_retimer_write() - Write to retimer sideband registers
+ * @port: USB4 port
+ * @index: Retimer index
+ * @reg: Sideband register to write
+ * @buf: Data that is written starting from @reg
+ * @size: Number of bytes to write
+ *
+ * Writes retimer sideband registers starting from @reg. The retimer is
+ * connected to @port at @index. Returns %0 in case of success. If there
+ * is no retimer present at given @index returns %-ENODEV. In any other
+ * failure returns negative errno.
+ */
+int usb4_port_retimer_write(struct tb_port *port, u8 index, u8 reg,
+			    const void *buf, u8 size)
+{
+	return usb4_port_sb_write(port, USB4_SB_TARGET_RETIMER, index, reg, buf,
+				  size);
+}
+
+/**
+ * usb4_port_retimer_is_last() - Is the retimer last on-board retimer
+ * @port: USB4 port
+ * @index: Retimer index
+ *
+ * If the retimer at @index is last one (connected directly to the
+ * Type-C port) this function returns %1. If it is not returns %0. If
+ * the retimer is not present returns %-ENODEV. Otherwise returns
+ * negative errno.
+ */
+int usb4_port_retimer_is_last(struct tb_port *port, u8 index)
+{
+	u32 metadata;
+	int ret;
+
+	ret = usb4_port_retimer_op(port, index, USB4_SB_OPCODE_QUERY_LAST_RETIMER,
+				   500);
+	if (ret)
+		return ret;
+
+	ret = usb4_port_retimer_read(port, index, USB4_SB_METADATA, &metadata,
+				     sizeof(metadata));
+	return ret ? ret : metadata & 1;
+}
+
+/**
+ * usb4_port_retimer_nvm_sector_size() - Read retimer NVM sector size
+ * @port: USB4 port
+ * @index: Retimer index
+ *
+ * Reads NVM sector size (in bytes) of a retimer at @index. This
+ * operation can be used to determine whether the retimer supports NVM
+ * upgrade for example. Returns sector size in bytes or negative errno
+ * in case of error. Specifically returns %-ENODEV if there is no
+ * retimer at @index.
+ */
+int usb4_port_retimer_nvm_sector_size(struct tb_port *port, u8 index)
+{
+	u32 metadata;
+	int ret;
+
+	ret = usb4_port_retimer_op(port, index, USB4_SB_OPCODE_GET_NVM_SECTOR_SIZE,
+				   500);
+	if (ret)
+		return ret;
+
+	ret = usb4_port_retimer_read(port, index, USB4_SB_METADATA, &metadata,
+				     sizeof(metadata));
+	return ret ? ret : metadata & USB4_NVM_SECTOR_SIZE_MASK;
+}
+
+static int usb4_port_retimer_nvm_set_offset(struct tb_port *port, u8 index,
+					    unsigned int address)
+{
+	u32 metadata, dwaddress;
+	int ret;
+
+	dwaddress = address / 4;
+	metadata = (dwaddress << USB4_NVM_SET_OFFSET_SHIFT) &
+		  USB4_NVM_SET_OFFSET_MASK;
+
+	ret = usb4_port_retimer_write(port, index, USB4_SB_METADATA, &metadata,
+				      sizeof(metadata));
+	if (ret)
+		return ret;
+
+	return usb4_port_retimer_op(port, index, USB4_SB_OPCODE_NVM_SET_OFFSET,
+				    500);
+}
+
+struct retimer_info {
+	struct tb_port *port;
+	u8 index;
+};
+
+static int usb4_port_retimer_nvm_write_next_block(void *data, const void *buf,
+						  size_t dwords)
+
+{
+	const struct retimer_info *info = data;
+	struct tb_port *port = info->port;
+	u8 index = info->index;
+	int ret;
+
+	ret = usb4_port_retimer_write(port, index, USB4_SB_DATA,
+				      buf, dwords * 4);
+	if (ret)
+		return ret;
+
+	return usb4_port_retimer_op(port, index,
+			USB4_SB_OPCODE_NVM_BLOCK_WRITE, 1000);
+}
+
+/**
+ * usb4_port_retimer_nvm_write() - Write to retimer NVM
+ * @port: USB4 port
+ * @index: Retimer index
+ * @address: Byte address where to start the write
+ * @buf: Data to write
+ * @size: Size in bytes how much to write
+ *
+ * Writes @size bytes from @buf to the retimer NVM. Used for NVM
+ * upgrade. Returns %0 if the data was written successfully and negative
+ * errno in case of failure. Specifically returns %-ENODEV if there is
+ * no retimer at @index.
+ */
+int usb4_port_retimer_nvm_write(struct tb_port *port, u8 index, unsigned int address,
+				const void *buf, size_t size)
+{
+	struct retimer_info info = { .port = port, .index = index };
+	int ret;
+
+	ret = usb4_port_retimer_nvm_set_offset(port, index, address);
+	if (ret)
+		return ret;
+
+	return usb4_do_write_data(address, buf, size,
+			usb4_port_retimer_nvm_write_next_block, &info);
+}
+
+/**
+ * usb4_port_retimer_nvm_authenticate() - Start retimer NVM upgrade
+ * @port: USB4 port
+ * @index: Retimer index
+ *
+ * After the new NVM image has been written via usb4_port_retimer_nvm_write()
+ * this function can be used to trigger the NVM upgrade process. If
+ * successful the retimer restarts with the new NVM and may not have the
+ * index set so one needs to call usb4_port_enumerate_retimers() to
+ * force index to be assigned.
+ */
+int usb4_port_retimer_nvm_authenticate(struct tb_port *port, u8 index)
+{
+	u32 val;
+
+	/*
+	 * We need to use the raw operation here because once the
+	 * authentication completes the retimer index is not set anymore
+	 * so we do not get back the status now.
+	 */
+	val = USB4_SB_OPCODE_NVM_AUTH_WRITE;
+	return usb4_port_sb_write(port, USB4_SB_TARGET_RETIMER, index,
+				  USB4_SB_OPCODE, &val, sizeof(val));
+}
+
+/**
+ * usb4_port_retimer_nvm_authenticate_status() - Read status of NVM upgrade
+ * @port: USB4 port
+ * @index: Retimer index
+ * @status: Raw status code read from metadata
+ *
+ * This can be called after usb4_port_retimer_nvm_authenticate() and
+ * usb4_port_enumerate_retimers() to fetch status of the NVM upgrade.
+ *
+ * Returns %0 if the authentication status was successfully read. The
+ * completion metadata (the result) is then stored into @status. If
+ * reading the status fails, returns negative errno.
+ */
+int usb4_port_retimer_nvm_authenticate_status(struct tb_port *port, u8 index,
+					      u32 *status)
+{
+	u32 metadata, val;
+	int ret;
+
+	ret = usb4_port_retimer_read(port, index, USB4_SB_OPCODE, &val,
+				     sizeof(val));
+	if (ret)
+		return ret;
+
+	switch (val) {
+	case 0:
+		*status = 0;
+		return 0;
+
+	case USB4_SB_OPCODE_ERR:
+		ret = usb4_port_retimer_read(port, index, USB4_SB_METADATA,
+					     &metadata, sizeof(metadata));
+		if (ret)
+			return ret;
+
+		*status = metadata & USB4_SB_METADATA_NVM_AUTH_WRITE_MASK;
+		return 0;
+
+	case USB4_SB_OPCODE_ONS:
+		return -EOPNOTSUPP;
+
+	default:
+		return -EIO;
+	}
+}
+
+static int usb4_port_retimer_nvm_read_block(void *data, unsigned int dwaddress,
+					    void *buf, size_t dwords)
+{
+	const struct retimer_info *info = data;
+	struct tb_port *port = info->port;
+	u8 index = info->index;
+	u32 metadata;
+	int ret;
+
+	metadata = dwaddress << USB4_NVM_READ_OFFSET_SHIFT;
+	if (dwords < USB4_DATA_DWORDS)
+		metadata |= dwords << USB4_NVM_READ_LENGTH_SHIFT;
+
+	ret = usb4_port_retimer_write(port, index, USB4_SB_METADATA, &metadata,
+				      sizeof(metadata));
+	if (ret)
+		return ret;
+
+	ret = usb4_port_retimer_op(port, index, USB4_SB_OPCODE_NVM_READ, 500);
+	if (ret)
+		return ret;
+
+	return usb4_port_retimer_read(port, index, USB4_SB_DATA, buf,
+				      dwords * 4);
+}
+
+/**
+ * usb4_port_retimer_nvm_read() - Read contents of retimer NVM
+ * @port: USB4 port
+ * @index: Retimer index
+ * @address: NVM address (in bytes) to start reading
+ * @buf: Data read from NVM is stored here
+ * @size: Number of bytes to read
+ *
+ * Reads retimer NVM and copies the contents to @buf. Returns %0 if the
+ * read was successful and negative errno in case of failure.
+ * Specifically returns %-ENODEV if there is no retimer at @index.
+ */
+int usb4_port_retimer_nvm_read(struct tb_port *port, u8 index,
+			       unsigned int address, void *buf, size_t size)
+{
+	struct retimer_info info = { .port = port, .index = index };
+
+	return usb4_do_read_data(address, buf, size,
+			usb4_port_retimer_nvm_read_block, &info);
+}
+
 /**
  * usb4_usb3_port_max_link_rate() - Maximum support USB3 link rate
  * @port: USB3 adapter port
-- 
2.27.0.rc2

