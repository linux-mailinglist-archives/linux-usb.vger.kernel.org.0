Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC79382BA2
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 13:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236887AbhEQMAI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 08:00:08 -0400
Received: from mga18.intel.com ([134.134.136.126]:10218 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236862AbhEQMAH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 May 2021 08:00:07 -0400
IronPort-SDR: NY0kDOJi2Z0nT8upEw7nqjaqFWHvSm4tLvrmvDaxItYXXS6JGSd8q25ngqoHTaqZ3j+KdBM5yE
 Bcec8KGJp1xQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="187850435"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="187850435"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 04:58:51 -0700
IronPort-SDR: 5H3BvOlHgYqylQdhQCsCy+DAIoaFfheSEcMGjogk4eKq2CZiNlkVQdQd5PYxnm0erzOQk/iD6O
 y37qI2NQPlZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="611552410"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 17 May 2021 04:58:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 5F185103; Mon, 17 May 2021 14:59:07 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/4] thunderbolt: dma_port: Fix NVM read buffer bounds and offset issue
Date:   Mon, 17 May 2021 14:59:04 +0300
Message-Id: <20210517115907.52503-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210517115907.52503-1-mika.westerberg@linux.intel.com>
References: <20210517115907.52503-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Mathias Nyman <mathias.nyman@linux.intel.com>

Up to 64 bytes of data can be read from NVM in one go. Read address
must be dword aligned. Data is read into a local buffer.

If caller asks to read data starting at an unaligned address then full
dword is anyway read from NVM into a local buffer. Data is then copied
from the local buffer starting at the unaligned offset to the caller
buffer.

In cases where asked data length + unaligned offset is over 64 bytes
we need to make sure we don't read past the 64 bytes in the local
buffer when copying to caller buffer, and make sure that we don't
skip copying unaligned offset bytes from local buffer anymore after
the first round of 64 byte NVM data read.

Fixes: 3e13676862f9 ("thunderbolt: Add support for DMA configuration based mailbox")
Cc: stable@vger.kernel.org
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/dma_port.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/dma_port.c b/drivers/thunderbolt/dma_port.c
index 7288aaf01ae6..5631319f7b20 100644
--- a/drivers/thunderbolt/dma_port.c
+++ b/drivers/thunderbolt/dma_port.c
@@ -366,15 +366,15 @@ int dma_port_flash_read(struct tb_dma_port *dma, unsigned int address,
 			void *buf, size_t size)
 {
 	unsigned int retries = DMA_PORT_RETRIES;
-	unsigned int offset;
-
-	offset = address & 3;
-	address = address & ~3;
 
 	do {
-		u32 nbytes = min_t(u32, size, MAIL_DATA_DWORDS * 4);
+		unsigned int offset;
+		size_t nbytes;
 		int ret;
 
+		offset = address & 3;
+		nbytes = min_t(size_t, size + offset, MAIL_DATA_DWORDS * 4);
+
 		ret = dma_port_flash_read_block(dma, address, dma->buf,
 						ALIGN(nbytes, 4));
 		if (ret) {
@@ -386,6 +386,7 @@ int dma_port_flash_read(struct tb_dma_port *dma, unsigned int address,
 			return ret;
 		}
 
+		nbytes -= offset;
 		memcpy(buf, dma->buf + offset, nbytes);
 
 		size -= nbytes;
-- 
2.30.2

