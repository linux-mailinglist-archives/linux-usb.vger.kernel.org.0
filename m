Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF86B382B9F
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 13:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236879AbhEQMAF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 08:00:05 -0400
Received: from mga14.intel.com ([192.55.52.115]:49310 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236841AbhEQMAE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 May 2021 08:00:04 -0400
IronPort-SDR: BGaWsHagIR3qJ+1UwFYqdKLYZ53esahJe0/IeLI+TI5o6Z2ITrDacxXKtOX5ukZR9RZArzTlQZ
 fCusB0YECXgA==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="200135388"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="200135388"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 04:58:48 -0700
IronPort-SDR: c7YC/gOOM2q3Y+6RowMEkegOxJYKn4Ij+OE+pdLWVuCt4JM16r3pj9NBZi2+G/3OifKtERs5Jh
 f/awWI3f3obw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="629964380"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 17 May 2021 04:58:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 7C0C3752; Mon, 17 May 2021 14:59:07 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 4/4] thunderbolt: Use generic tb_nvm_[read|write]_data() for Thunderbolt 2/3 devices
Date:   Mon, 17 May 2021 14:59:07 +0300
Message-Id: <20210517115907.52503-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210517115907.52503-1-mika.westerberg@linux.intel.com>
References: <20210517115907.52503-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Now that we have generic functionality available in nvm.c make the DMA
port code call it instead of duplicating the functionality.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/dma_port.c | 94 ++++++----------------------------
 1 file changed, 15 insertions(+), 79 deletions(-)

diff --git a/drivers/thunderbolt/dma_port.c b/drivers/thunderbolt/dma_port.c
index 5631319f7b20..9f20c7bbf0ce 100644
--- a/drivers/thunderbolt/dma_port.c
+++ b/drivers/thunderbolt/dma_port.c
@@ -299,15 +299,13 @@ static int dma_port_request(struct tb_dma_port *dma, u32 in,
 	return status_to_errno(out);
 }
 
-static int dma_port_flash_read_block(struct tb_dma_port *dma, u32 address,
-				     void *buf, u32 size)
+static int dma_port_flash_read_block(void *data, unsigned int dwaddress,
+				     void *buf, size_t dwords)
 {
+	struct tb_dma_port *dma = data;
 	struct tb_switch *sw = dma->sw;
-	u32 in, dwaddress, dwords;
 	int ret;
-
-	dwaddress = address / 4;
-	dwords = size / 4;
+	u32 in;
 
 	in = MAIL_IN_CMD_FLASH_READ << MAIL_IN_CMD_SHIFT;
 	if (dwords < MAIL_DATA_DWORDS)
@@ -323,14 +321,13 @@ static int dma_port_flash_read_block(struct tb_dma_port *dma, u32 address,
 			     dma->base + MAIL_DATA, dwords, DMA_PORT_TIMEOUT);
 }
 
-static int dma_port_flash_write_block(struct tb_dma_port *dma, u32 address,
-				      const void *buf, u32 size)
+static int dma_port_flash_write_block(void *data, unsigned int dwaddress,
+				      const void *buf, size_t dwords)
 {
+	struct tb_dma_port *dma = data;
 	struct tb_switch *sw = dma->sw;
-	u32 in, dwaddress, dwords;
 	int ret;
-
-	dwords = size / 4;
+	u32 in;
 
 	/* Write the block to MAIL_DATA registers */
 	ret = dma_port_write(sw->tb->ctl, buf, tb_route(sw), dma->port,
@@ -341,12 +338,8 @@ static int dma_port_flash_write_block(struct tb_dma_port *dma, u32 address,
 	in = MAIL_IN_CMD_FLASH_WRITE << MAIL_IN_CMD_SHIFT;
 
 	/* CSS header write is always done to the same magic address */
-	if (address >= DMA_PORT_CSS_ADDRESS) {
-		dwaddress = DMA_PORT_CSS_ADDRESS;
+	if (dwaddress >= DMA_PORT_CSS_ADDRESS)
 		in |= MAIL_IN_CSS;
-	} else {
-		dwaddress = address / 4;
-	}
 
 	in |= ((dwords - 1) << MAIL_IN_DWORDS_SHIFT) & MAIL_IN_DWORDS_MASK;
 	in |= (dwaddress << MAIL_IN_ADDRESS_SHIFT) & MAIL_IN_ADDRESS_MASK;
@@ -365,36 +358,8 @@ static int dma_port_flash_write_block(struct tb_dma_port *dma, u32 address,
 int dma_port_flash_read(struct tb_dma_port *dma, unsigned int address,
 			void *buf, size_t size)
 {
-	unsigned int retries = DMA_PORT_RETRIES;
-
-	do {
-		unsigned int offset;
-		size_t nbytes;
-		int ret;
-
-		offset = address & 3;
-		nbytes = min_t(size_t, size + offset, MAIL_DATA_DWORDS * 4);
-
-		ret = dma_port_flash_read_block(dma, address, dma->buf,
-						ALIGN(nbytes, 4));
-		if (ret) {
-			if (ret == -ETIMEDOUT) {
-				if (retries--)
-					continue;
-				ret = -EIO;
-			}
-			return ret;
-		}
-
-		nbytes -= offset;
-		memcpy(buf, dma->buf + offset, nbytes);
-
-		size -= nbytes;
-		address += nbytes;
-		buf += nbytes;
-	} while (size > 0);
-
-	return 0;
+	return tb_nvm_read_data(address, buf, size, DMA_PORT_RETRIES,
+				dma_port_flash_read_block, dma);
 }
 
 /**
@@ -411,40 +376,11 @@ int dma_port_flash_read(struct tb_dma_port *dma, unsigned int address,
 int dma_port_flash_write(struct tb_dma_port *dma, unsigned int address,
 			 const void *buf, size_t size)
 {
-	unsigned int retries = DMA_PORT_RETRIES;
-	unsigned int offset;
-
-	if (address >= DMA_PORT_CSS_ADDRESS) {
-		offset = 0;
-		if (size > DMA_PORT_CSS_MAX_SIZE)
-			return -E2BIG;
-	} else {
-		offset = address & 3;
-		address = address & ~3;
-	}
-
-	do {
-		u32 nbytes = min_t(u32, size, MAIL_DATA_DWORDS * 4);
-		int ret;
+	if (address >= DMA_PORT_CSS_ADDRESS && size > DMA_PORT_CSS_MAX_SIZE)
+		return -E2BIG;
 
-		memcpy(dma->buf + offset, buf, nbytes);
-
-		ret = dma_port_flash_write_block(dma, address, buf, nbytes);
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
+	return tb_nvm_write_data(address, buf, size, DMA_PORT_RETRIES,
+				 dma_port_flash_write_block, dma);
 }
 
 /**
-- 
2.30.2

