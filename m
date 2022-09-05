Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A78785AD202
	for <lists+linux-usb@lfdr.de>; Mon,  5 Sep 2022 14:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236720AbiIEMCR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 08:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236832AbiIEMCA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 08:02:00 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C76757E03
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 05:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662379318; x=1693915318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=faW4CsHzIIJ/763i7/5zlOy4v4vRxbE0KLLC3CY4mqU=;
  b=NhIJzrNhudSV+bkfTYHBsGXnMjnh5KytTAsGcfTubYK2TRkU0mh5MtuP
   lMBSJ+Zt0HSZ8oP9zUbeJrZza3WMi9VBZjZniYicF8rv2YjK9fPZKpbju
   +7ciDWuFJCqRgDfLtGFyE8s7pXjiGzkUhghcI/f/5TIF2tS0yrTy97KeQ
   /DICvXlUTHWGVkqSJCjE3GH9GWZ1AQASjWMefiRXy6va7OXETudKssl4T
   X+gFMEy/qGHMzLu+UwyH8EJawkb00iK+uNIus9BaWKxV/EBjBarBZv/SJ
   b+L0Y8I7Eceij5tfZL142Sbh+7qXMnKiCeLRKFrYlRJk922we0ubN93vh
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="322543271"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="322543271"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 05:01:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="609657974"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 05 Sep 2022 05:01:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 587224F1; Mon,  5 Sep 2022 15:02:06 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Szuying Chen <Chloe_Chen@asmedia.com.tw>
Cc:     gregkh@linuxfoundation.org, mario.limonciello@amd.com,
        andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Yd_Tseng@asmedia.com.tw,
        Richard_Hsu@asmedia.com.tw, Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v9 6/6] thunderbolt: Add support for ASMedia NVM image format
Date:   Mon,  5 Sep 2022 15:02:05 +0300
Message-Id: <20220905120205.23025-7-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220905120205.23025-1-mika.westerberg@linux.intel.com>
References: <20220905120205.23025-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Szuying Chen <Chloe_Chen@asmedia.com.tw>

Add support for ASMedia specific NVM image format. This makes it
possible to upgrade the NVM firmware of ASMedia routers in addition to
Intel ones.

Signed-off-by: Szuying Chen <Chloe_Chen@asmedia.com.tw>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nvm.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/thunderbolt/nvm.c b/drivers/thunderbolt/nvm.c
index 2e9b132af321..710536de12f3 100644
--- a/drivers/thunderbolt/nvm.c
+++ b/drivers/thunderbolt/nvm.c
@@ -18,6 +18,10 @@
 #define INTEL_NVM_CSS			0x10
 #define INTEL_NVM_FLASH_SIZE		0x45
 
+/* ASMedia specific NVM offsets */
+#define ASMEDIA_NVM_DATE		0x1c
+#define ASMEDIA_NVM_VERSION		0x28
+
 static DEFINE_IDA(nvm_ida);
 
 /**
@@ -149,8 +153,41 @@ static const struct tb_nvm_vendor_ops intel_switch_nvm_ops = {
 	.write_headers = intel_switch_nvm_write_headers,
 };
 
+static int asmedia_switch_nvm_version(struct tb_nvm *nvm)
+{
+	struct tb_switch *sw = tb_to_switch(nvm->dev);
+	u32 val;
+	int ret;
+
+	ret = tb_switch_nvm_read(sw, ASMEDIA_NVM_VERSION, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	nvm->major = (val << 16) & 0xff0000;
+	nvm->minor |= val & 0x00ff00;
+	nvm->major |= (val >> 16) & 0x0000ff;
+
+	ret = tb_switch_nvm_read(sw, ASMEDIA_NVM_DATE, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	nvm->minor = (val << 16) & 0xff0000;
+	nvm->minor |= val & 0x00ff00;
+	nvm->minor |= (val >> 16) & 0x0000ff;
+
+	/* ASMedia NVM size is fixed to 512k */
+	nvm->active_size = SZ_512K;
+
+	return 0;
+}
+
+static const struct tb_nvm_vendor_ops asmedia_switch_nvm_ops = {
+	.read_version = asmedia_switch_nvm_version,
+};
+
 /* Router vendor NVM support table */
 static const struct tb_nvm_vendor switch_nvm_vendors[] = {
+	{ 0x174c, &asmedia_switch_nvm_ops },
 	{ PCI_VENDOR_ID_INTEL, &intel_switch_nvm_ops },
 	{ 0x8087, &intel_switch_nvm_ops },
 };
-- 
2.35.1

