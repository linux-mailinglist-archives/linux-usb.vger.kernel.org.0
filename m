Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F4925AD20B
	for <lists+linux-usb@lfdr.de>; Mon,  5 Sep 2022 14:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236854AbiIEMCL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 08:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236754AbiIEMB5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 08:01:57 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951245C351
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 05:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662379314; x=1693915314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kjadbl1dKFlE7Aj8fIxa6mGp54dtaDy9UPlKIovYXWg=;
  b=YOIHJW8GaUTlVe377inyOID6iMMjilVpvB+38ote6Pm8NGaJxzeAv0Wc
   c7IGuI7qu1Kdb0iTPv/X+2lgUNRp7Tk22OIpZ5Nh1XjJe+1dKFoUf81sp
   KciaavWfYxuwXTxCHisnlfGEWJp8NqrMKpEmVSQSp5G8wBUZAj5Kb4Jr7
   5FbkOrtDcLFpBDNe90EpdXZkDwbKUSCJenVHoID5QhCq9JII3/Hjz1BzC
   l1RDXNfC+CTxS/RZrq6OIfyig0upSu86HDvaMi6N+lAjxs9giDXoH8B6x
   zbRaDf6NbTlNPKfWzByKBWt8UEMrlauLwtbMDFErsLT/AzzWPJZirlsxf
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="360328073"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="360328073"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 05:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="675266643"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 05 Sep 2022 05:01:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 4401F14F; Mon,  5 Sep 2022 15:02:06 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Szuying Chen <Chloe_Chen@asmedia.com.tw>
Cc:     gregkh@linuxfoundation.org, mario.limonciello@amd.com,
        andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Yd_Tseng@asmedia.com.tw,
        Richard_Hsu@asmedia.com.tw, Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v9 4/6] thunderbolt: Provide tb_retimer_nvm_read() analogous to tb_switch_nvm_read()
Date:   Mon,  5 Sep 2022 15:02:03 +0300
Message-Id: <20220905120205.23025-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220905120205.23025-1-mika.westerberg@linux.intel.com>
References: <20220905120205.23025-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As we are moving the NVM vendor specifics into nvm.c we need to deal
witht he retimer NVM formats too. For this reason provide retimer
specific function that can be used to read the contents of the NVM and
rename the internal ones accordingly analogous to what we do with
routers.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/retimer.c | 28 +++++++++++++++++++++-------
 drivers/thunderbolt/tb.h      |  2 ++
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index dc0fc90e81cf..bec02ad4cb3b 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -16,8 +16,23 @@
 
 #define TB_MAX_RETIMER_INDEX	6
 
-static int tb_retimer_nvm_read(void *priv, unsigned int offset, void *val,
-			       size_t bytes)
+/**
+ * tb_retimer_nvm_read() - Read contents of retimer NVM
+ * @rt: Retimer device
+ * @address: NVM address (in bytes) to start reading
+ * @buf: Data read from NVM is stored here
+ * @size: Number of bytes to read
+ *
+ * Reads retimer NVM and copies the contents to @buf. Returns %0 if the
+ * read was successful and negative errno in case of failure.
+ */
+int tb_retimer_nvm_read(struct tb_retimer *rt, unsigned int address, void *buf,
+			size_t size)
+{
+	return usb4_port_retimer_nvm_read(rt->port, rt->index, address, buf, size);
+}
+
+static int nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct tb_nvm *nvm = priv;
 	struct tb_retimer *rt = tb_to_retimer(nvm->dev);
@@ -30,7 +45,7 @@ static int tb_retimer_nvm_read(void *priv, unsigned int offset, void *val,
 		goto out;
 	}
 
-	ret = usb4_port_retimer_nvm_read(rt->port, rt->index, offset, val, bytes);
+	ret = tb_retimer_nvm_read(rt, offset, val, bytes);
 	mutex_unlock(&rt->tb->lock);
 
 out:
@@ -40,8 +55,7 @@ static int tb_retimer_nvm_read(void *priv, unsigned int offset, void *val,
 	return ret;
 }
 
-static int tb_retimer_nvm_write(void *priv, unsigned int offset, void *val,
-				size_t bytes)
+static int nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct tb_nvm *nvm = priv;
 	struct tb_retimer *rt = tb_to_retimer(nvm->dev);
@@ -82,11 +96,11 @@ static int tb_retimer_nvm_add(struct tb_retimer *rt)
 	nvm_size = (SZ_1M << (val & 7)) / 8;
 	nvm_size = (nvm_size - SZ_16K) / 2;
 
-	ret = tb_nvm_add_active(nvm, nvm_size, tb_retimer_nvm_read);
+	ret = tb_nvm_add_active(nvm, nvm_size, nvm_read);
 	if (ret)
 		goto err_nvm;
 
-	ret = tb_nvm_add_non_active(nvm, NVM_MAX_SIZE, tb_retimer_nvm_write);
+	ret = tb_nvm_add_non_active(nvm, NVM_MAX_SIZE, nvm_write);
 	if (ret)
 		goto err_nvm;
 
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index f9b241ee109f..5a4aface19e7 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1144,6 +1144,8 @@ static inline struct tb_switch *tb_xdomain_parent(struct tb_xdomain *xd)
 	return tb_to_switch(xd->dev.parent);
 }
 
+int tb_retimer_nvm_read(struct tb_retimer *rt, unsigned int address, void *buf,
+			size_t size);
 int tb_retimer_scan(struct tb_port *port, bool add);
 void tb_retimer_remove_all(struct tb_port *port);
 
-- 
2.35.1

