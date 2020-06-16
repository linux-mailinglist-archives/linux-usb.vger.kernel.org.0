Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7B11FB2EF
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jun 2020 15:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbgFPN4W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jun 2020 09:56:22 -0400
Received: from mga01.intel.com ([192.55.52.88]:35320 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726306AbgFPN4V (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Jun 2020 09:56:21 -0400
IronPort-SDR: vZELSGqaylEUuHdWcjbMdAJKhSXLp33zDwtZnAy1FG/SdOE5iAe2LT7MKrel4OGBATovPkFSMU
 UZgrO0k+wAfQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 06:56:21 -0700
IronPort-SDR: Omny9yRFdHWcsuFY2NQl5vPUVrcGyyz4Zat0iVXrbY9Z7XKN1rDBFG4/ErAeEsO8RIhJQqw7VR
 tVnV13H4GBmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; 
   d="scan'208";a="382876302"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2020 06:56:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 379938CA; Tue, 16 Jun 2020 16:56:18 +0300 (EEST)
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
Subject: [PATCH 3/6] thunderbolt: Generalize usb4_switch_do_[read|write]_data()
Date:   Tue, 16 Jun 2020 16:56:14 +0300
Message-Id: <20200616135617.85752-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200616135617.85752-1-mika.westerberg@linux.intel.com>
References: <20200616135617.85752-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently these functions operate on struct tb_switch but we are going
to need the same functionality with retimers as well so make the two
functions work with an arbitrary object that gets passed as parameter to
the callbacks.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/usb4.c | 39 ++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index d1a554fd09ae..8a83857573df 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -42,8 +42,8 @@ enum usb4_switch_op {
 
 #define USB4_NVM_SECTOR_SIZE_MASK	GENMASK(23, 0)
 
-typedef int (*read_block_fn)(struct tb_switch *, unsigned int, void *, size_t);
-typedef int (*write_block_fn)(struct tb_switch *, const void *, size_t);
+typedef int (*read_block_fn)(void *, unsigned int, void *, size_t);
+typedef int (*write_block_fn)(void *, const void *, size_t);
 
 static int usb4_switch_wait_for_bit(struct tb_switch *sw, u32 offset, u32 bit,
 				    u32 value, int timeout_msec)
@@ -95,8 +95,8 @@ static int usb4_switch_op_write_metadata(struct tb_switch *sw, u32 metadata)
 	return tb_sw_write(sw, &metadata, TB_CFG_SWITCH, ROUTER_CS_25, 1);
 }
 
-static int usb4_switch_do_read_data(struct tb_switch *sw, u16 address,
-	void *buf, size_t size, read_block_fn read_block)
+static int usb4_do_read_data(u16 address, void *buf, size_t size,
+			     read_block_fn read_block, void *read_block_data)
 {
 	unsigned int retries = USB4_DATA_RETRIES;
 	unsigned int offset;
@@ -113,7 +113,7 @@ static int usb4_switch_do_read_data(struct tb_switch *sw, u16 address,
 		dwaddress = address / 4;
 		dwords = ALIGN(nbytes, 4) / 4;
 
-		ret = read_block(sw, dwaddress, data, dwords);
+		ret = read_block(read_block_data, dwaddress, data, dwords);
 		if (ret) {
 			if (ret == -ETIMEDOUT) {
 				if (retries--)
@@ -133,8 +133,8 @@ static int usb4_switch_do_read_data(struct tb_switch *sw, u16 address,
 	return 0;
 }
 
-static int usb4_switch_do_write_data(struct tb_switch *sw, u16 address,
-	const void *buf, size_t size, write_block_fn write_next_block)
+static int usb4_do_write_data(unsigned int address, const void *buf, size_t size,
+	write_block_fn write_next_block, void *write_block_data)
 {
 	unsigned int retries = USB4_DATA_RETRIES;
 	unsigned int offset;
@@ -149,7 +149,7 @@ static int usb4_switch_do_write_data(struct tb_switch *sw, u16 address,
 
 		memcpy(data + offset, buf, nbytes);
 
-		ret = write_next_block(sw, data, nbytes / 4);
+		ret = write_next_block(write_block_data, data, nbytes / 4);
 		if (ret) {
 			if (ret == -ETIMEDOUT) {
 				if (retries--)
@@ -289,10 +289,11 @@ int usb4_switch_read_uid(struct tb_switch *sw, u64 *uid)
 	return tb_sw_read(sw, uid, TB_CFG_SWITCH, ROUTER_CS_7, 2);
 }
 
-static int usb4_switch_drom_read_block(struct tb_switch *sw,
+static int usb4_switch_drom_read_block(void *data,
 				       unsigned int dwaddress, void *buf,
 				       size_t dwords)
 {
+	struct tb_switch *sw = data;
 	u8 status = 0;
 	u32 metadata;
 	int ret;
@@ -329,8 +330,8 @@ static int usb4_switch_drom_read_block(struct tb_switch *sw,
 int usb4_switch_drom_read(struct tb_switch *sw, unsigned int address, void *buf,
 			  size_t size)
 {
-	return usb4_switch_do_read_data(sw, address, buf, size,
-					usb4_switch_drom_read_block);
+	return usb4_do_read_data(address, buf, size,
+				 usb4_switch_drom_read_block, sw);
 }
 
 static int usb4_set_port_configured(struct tb_port *port, bool configured)
@@ -463,9 +464,10 @@ int usb4_switch_nvm_sector_size(struct tb_switch *sw)
 	return metadata & USB4_NVM_SECTOR_SIZE_MASK;
 }
 
-static int usb4_switch_nvm_read_block(struct tb_switch *sw,
+static int usb4_switch_nvm_read_block(void *data,
 	unsigned int dwaddress, void *buf, size_t dwords)
 {
+	struct tb_switch *sw = data;
 	u8 status = 0;
 	u32 metadata;
 	int ret;
@@ -502,8 +504,8 @@ static int usb4_switch_nvm_read_block(struct tb_switch *sw,
 int usb4_switch_nvm_read(struct tb_switch *sw, unsigned int address, void *buf,
 			 size_t size)
 {
-	return usb4_switch_do_read_data(sw, address, buf, size,
-					usb4_switch_nvm_read_block);
+	return usb4_do_read_data(address, buf, size,
+				 usb4_switch_nvm_read_block, sw);
 }
 
 static int usb4_switch_nvm_set_offset(struct tb_switch *sw,
@@ -528,9 +530,10 @@ static int usb4_switch_nvm_set_offset(struct tb_switch *sw,
 	return status ? -EIO : 0;
 }
 
-static int usb4_switch_nvm_write_next_block(struct tb_switch *sw,
-					    const void *buf, size_t dwords)
+static int usb4_switch_nvm_write_next_block(void *data, const void *buf,
+					    size_t dwords)
 {
+	struct tb_switch *sw = data;
 	u8 status;
 	int ret;
 
@@ -564,8 +567,8 @@ int usb4_switch_nvm_write(struct tb_switch *sw, unsigned int address,
 	if (ret)
 		return ret;
 
-	return usb4_switch_do_write_data(sw, address, buf, size,
-					 usb4_switch_nvm_write_next_block);
+	return usb4_do_write_data(address, buf, size,
+				  usb4_switch_nvm_write_next_block, sw);
 }
 
 /**
-- 
2.27.0.rc2

