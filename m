Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B82005AD205
	for <lists+linux-usb@lfdr.de>; Mon,  5 Sep 2022 14:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbiIEMCA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 08:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234228AbiIEMB5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 08:01:57 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E3957E03
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 05:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662379314; x=1693915314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/S8WiKjmYAhpqH+osEBpfozXJYT7V2OyEpiaVRL5fag=;
  b=CG7OfIbjb5CzYfm+XBPNn+LVPGan9FCzHyH6aLMLNO5uuoLrnrzRicv7
   MY72R8aIcxE3JvABEhepokCF2vLd9rWho4WMZ1HF27poS8MZU04/1ox/s
   TwHZMBz93223cvgG2C0rHFN+yomUNB3DRLhB8yCBXHCReDOEQVOJzn57q
   GUSbiLpu6PENl20QQY4Y8CSDeJx2m4UVdKjLXR9pvATmHWJ3/jNZIkRL7
   yW29H76t1lQSb6qZla1nfTBs01SwpbS0QPLQOb+B4RNGM1evyzsUydJVl
   mA/3BKuVc/P42wkpNFn5j/MgpKr+9gg7n9cuW1ywgUg18+ocL5QwtT3GW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="295113121"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="295113121"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 05:01:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="613760090"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 05 Sep 2022 05:01:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 35739193; Mon,  5 Sep 2022 15:02:06 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Szuying Chen <Chloe_Chen@asmedia.com.tw>
Cc:     gregkh@linuxfoundation.org, mario.limonciello@amd.com,
        andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Yd_Tseng@asmedia.com.tw,
        Richard_Hsu@asmedia.com.tw, Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v9 2/6] thunderbolt: Extend NVM version fields to 32-bits
Date:   Mon,  5 Sep 2022 15:02:01 +0300
Message-Id: <20220905120205.23025-3-mika.westerberg@linux.intel.com>
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

From: Szuying Chen <Chloe_Chen@asmedia.com.tw>

In order to support non-Intel NVM image formats extend the NVM major and
minor version to 32-bits to better accommondate different versioning
schemes.

No functional impact.

Signed-off-by: Szuying Chen <Chloe_Chen@asmedia.com.tw>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/retimer.c | 4 ++--
 drivers/thunderbolt/switch.c  | 4 ++--
 drivers/thunderbolt/tb.h      | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 8c29bd556ae0..dc0fc90e81cf 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -71,8 +71,8 @@ static int tb_retimer_nvm_add(struct tb_retimer *rt)
 	if (ret)
 		goto err_nvm;
 
-	nvm->major = val >> 16;
-	nvm->minor = val >> 8;
+	nvm->major = (val >> 16) & 0xff;
+	nvm->minor = (val >> 8) & 0xff;
 
 	ret = usb4_port_retimer_nvm_read(rt->port, rt->index, NVM_FLASH_SIZE,
 					 &val, sizeof(val));
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index bd815e2cc6ec..ac8d7145e9ff 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -427,8 +427,8 @@ static int tb_switch_nvm_add(struct tb_switch *sw)
 		if (ret)
 			goto err_nvm;
 
-		nvm->major = val >> 16;
-		nvm->minor = val >> 8;
+		nvm->major = (val >> 16) & 0xff;
+		nvm->minor = (val >> 8) & 0xff;
 
 		ret = tb_nvm_add_active(nvm, nvm_size, tb_switch_nvm_read);
 		if (ret)
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 6cca6b759c5f..610ed62b55f2 100644
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
-- 
2.35.1

