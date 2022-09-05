Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D66825AD20C
	for <lists+linux-usb@lfdr.de>; Mon,  5 Sep 2022 14:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236609AbiIEMCM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 08:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236751AbiIEMB5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 08:01:57 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1925C34D
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 05:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662379314; x=1693915314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qdaHVAEk2NuyqO0h8gjWmE8N1nUGXp37XCNSdOi2Nyc=;
  b=AXScR/EXIHKH0BpJyRvIwP91HCgd5l0//PpaGXIhy8S7dVMS0k3fZIHx
   6QBFH3nYqJwKnWQu7ZTAS8vp5XhbyB1729MbA78FmNcuqPGkvc6XDhbWu
   orHt2YwdMaDtVWP74E0052FkShPbCQg5B4hg/i7gJXMiJuUx4e9/UGteU
   g7TLhXks0yHaYWDw4TOqFdfeRwoiu2FaSs6saaPR3flph0+OiBe2epbDs
   J/mcRLMBImzPpBTUfCRkA5oOaGq0bjaXf6P6ZGtnB4sCiA7S24PgpfKjU
   RqV5phRpzBj8JYBb+TKghfg1ZbZoqRwU80Fo5g7ZKF1Mo6jhFwpwEH2dv
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="283368898"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="283368898"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 05:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="739573246"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 05 Sep 2022 05:01:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 3E4541E0; Mon,  5 Sep 2022 15:02:06 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Szuying Chen <Chloe_Chen@asmedia.com.tw>
Cc:     gregkh@linuxfoundation.org, mario.limonciello@amd.com,
        andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Yd_Tseng@asmedia.com.tw,
        Richard_Hsu@asmedia.com.tw, Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v9 3/6] thunderbolt: Rename and make nvm_read() available for other files
Date:   Mon,  5 Sep 2022 15:02:02 +0300
Message-Id: <20220905120205.23025-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220905120205.23025-1-mika.westerberg@linux.intel.com>
References: <20220905120205.23025-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Szuying Chen <Chloe_Chen@asmedia.com.tw>

In order to support non-Intel NVM formats the vendor specific NVM
validation code that will live in nvm.c needs to be able to read various
parts of the NVM so make the function available outside of switch.c and
rename it accordingly.

Signed-off-by: Szuying Chen <Chloe_Chen@asmedia.com.tw>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 44 +++++++++++++++++++++---------------
 drivers/thunderbolt/tb.h     |  2 ++
 2 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index ac8d7145e9ff..a073a702c381 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -300,14 +300,6 @@ static inline bool nvm_upgradeable(struct tb_switch *sw)
 	return nvm_readable(sw);
 }
 
-static inline int nvm_read(struct tb_switch *sw, unsigned int address,
-			   void *buf, size_t size)
-{
-	if (tb_switch_is_usb4(sw))
-		return usb4_switch_nvm_read(sw, address, buf, size);
-	return dma_port_flash_read(sw->dma_port, address, buf, size);
-}
-
 static int nvm_authenticate(struct tb_switch *sw, bool auth_only)
 {
 	int ret;
@@ -335,8 +327,26 @@ static int nvm_authenticate(struct tb_switch *sw, bool auth_only)
 	return ret;
 }
 
-static int tb_switch_nvm_read(void *priv, unsigned int offset, void *val,
-			      size_t bytes)
+/**
+ * tb_switch_nvm_read() - Read router NVM
+ * @sw: Router whose NVM to read
+ * @address: Start address on the NVM
+ * @buf: Buffer where the read data is copied
+ * @size: Size of the buffer in bytes
+ *
+ * Reads from router NVM and returns the requested data in @buf. Locking
+ * is up to the caller. Returns %0 in success and negative errno in case
+ * of failure.
+ */
+int tb_switch_nvm_read(struct tb_switch *sw, unsigned int address, void *buf,
+		       size_t size)
+{
+	if (tb_switch_is_usb4(sw))
+		return usb4_switch_nvm_read(sw, address, buf, size);
+	return dma_port_flash_read(sw->dma_port, address, buf, size);
+}
+
+static int nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct tb_nvm *nvm = priv;
 	struct tb_switch *sw = tb_to_switch(nvm->dev);
@@ -349,7 +359,7 @@ static int tb_switch_nvm_read(void *priv, unsigned int offset, void *val,
 		goto out;
 	}
 
-	ret = nvm_read(sw, offset, val, bytes);
+	ret = tb_switch_nvm_read(sw, offset, val, bytes);
 	mutex_unlock(&sw->tb->lock);
 
 out:
@@ -359,8 +369,7 @@ static int tb_switch_nvm_read(void *priv, unsigned int offset, void *val,
 	return ret;
 }
 
-static int tb_switch_nvm_write(void *priv, unsigned int offset, void *val,
-			       size_t bytes)
+static int nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct tb_nvm *nvm = priv;
 	struct tb_switch *sw = tb_to_switch(nvm->dev);
@@ -415,7 +424,7 @@ static int tb_switch_nvm_add(struct tb_switch *sw)
 	if (!sw->safe_mode) {
 		u32 nvm_size, hdr_size;
 
-		ret = nvm_read(sw, NVM_FLASH_SIZE, &val, sizeof(val));
+		ret = tb_switch_nvm_read(sw, NVM_FLASH_SIZE, &val, sizeof(val));
 		if (ret)
 			goto err_nvm;
 
@@ -423,21 +432,20 @@ static int tb_switch_nvm_add(struct tb_switch *sw)
 		nvm_size = (SZ_1M << (val & 7)) / 8;
 		nvm_size = (nvm_size - hdr_size) / 2;
 
-		ret = nvm_read(sw, NVM_VERSION, &val, sizeof(val));
+		ret = tb_switch_nvm_read(sw, NVM_VERSION, &val, sizeof(val));
 		if (ret)
 			goto err_nvm;
 
 		nvm->major = (val >> 16) & 0xff;
 		nvm->minor = (val >> 8) & 0xff;
 
-		ret = tb_nvm_add_active(nvm, nvm_size, tb_switch_nvm_read);
+		ret = tb_nvm_add_active(nvm, nvm_size, nvm_read);
 		if (ret)
 			goto err_nvm;
 	}
 
 	if (!sw->no_nvm_upgrade) {
-		ret = tb_nvm_add_non_active(nvm, NVM_MAX_SIZE,
-					    tb_switch_nvm_write);
+		ret = tb_nvm_add_non_active(nvm, NVM_MAX_SIZE, nvm_write);
 		if (ret)
 			goto err_nvm;
 	}
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 610ed62b55f2..f9b241ee109f 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -759,6 +759,8 @@ int tb_nvm_write_data(unsigned int address, const void *buf, size_t size,
 		      unsigned int retries, write_block_fn write_next_block,
 		      void *write_block_data);
 
+int tb_switch_nvm_read(struct tb_switch *sw, unsigned int address, void *buf,
+		       size_t size);
 struct tb_switch *tb_switch_alloc(struct tb *tb, struct device *parent,
 				  u64 route);
 struct tb_switch *tb_switch_alloc_safe_mode(struct tb *tb,
-- 
2.35.1

