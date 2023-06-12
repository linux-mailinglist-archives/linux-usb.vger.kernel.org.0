Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADFC572BB4C
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jun 2023 10:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233970AbjFLIxj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jun 2023 04:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233433AbjFLIxF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 04:53:05 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3AD1FDE
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 01:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686559944; x=1718095944;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+lygcNog0E1gtsHEKLUH1uvBAx15FjTLhg8o0SZeANw=;
  b=Cn4UczsNGune9h0ZHvfV5FGYwG/B99KtcbNRZCRCQlJ0I4763y8zhLv2
   gb7Q1TRf1YSWaBtsIfgaSlcs8uy0k2o02oSJXMVmY8aRwGacUxLDzN7me
   HUlY822LzYd8wTQAT4I55cPtC2E/plAhNy04IaNFvqE6NvD9gc160NEsp
   5cCIin7DLy7+YW9yswkd4W2L42kS0N5FUBbjuF6Yjnu2O3iewNdH8otNG
   uq2uRLU7p6rawiWbD897GxEK1Fj2Jcpyr5tBOfiV6yKIiklX3kWxhbKy5
   X9PmVh0XH8IIglIncv1jdfJRmPyHE9RqrdKMo4KioI79xdZeHoZjF/kY0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347627278"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347627278"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 01:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="744247750"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="744247750"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 01:21:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id E29759B9; Mon, 12 Jun 2023 11:21:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Gil Fine <gil.fine@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 14/20] thunderbolt: Move constants related to NVM into nvm.c
Date:   Mon, 12 Jun 2023 11:21:39 +0300
Message-Id: <20230612082145.62218-15-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612082145.62218-1-mika.westerberg@linux.intel.com>
References: <20230612082145.62218-1-mika.westerberg@linux.intel.com>
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

From: Gil Fine <gil.fine@linux.intel.com>

Move constants related to NVM into nvm.c to make the code cleaner. Use a
separate constant for USB4_DATA_DWORDS in usb4.c.

No functional changes.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nvm.c  |  4 ++++
 drivers/thunderbolt/tb.h   |  4 ----
 drivers/thunderbolt/usb4.c | 11 ++++++-----
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/thunderbolt/nvm.c b/drivers/thunderbolt/nvm.c
index 3dd5f81bd629..b004f29ad2b6 100644
--- a/drivers/thunderbolt/nvm.c
+++ b/drivers/thunderbolt/nvm.c
@@ -12,6 +12,10 @@
 
 #include "tb.h"
 
+#define NVM_MIN_SIZE		SZ_32K
+#define NVM_MAX_SIZE		SZ_512K
+#define NVM_DATA_DWORDS		16
+
 /* Intel specific NVM offsets */
 #define INTEL_NVM_DEVID			0x05
 #define INTEL_NVM_VERSION		0x08
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 002e0426a82c..088033726648 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -19,10 +19,6 @@
 #include "ctl.h"
 #include "dma_port.h"
 
-#define NVM_MIN_SIZE		SZ_32K
-#define NVM_MAX_SIZE		SZ_512K
-#define NVM_DATA_DWORDS		16
-
 /* Keep link controller awake during update */
 #define QUIRK_FORCE_POWER_LINK_CONTROLLER		BIT(0)
 /* Disable CLx if not supported */
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index b80972cb5b9d..2da43b5fc840 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -15,6 +15,7 @@
 #include "tb.h"
 
 #define USB4_DATA_RETRIES		3
+#define USB4_DATA_DWORDS		16
 
 enum usb4_sb_target {
 	USB4_SB_TARGET_ROUTER,
@@ -112,7 +113,7 @@ static int __usb4_switch_op(struct tb_switch *sw, u16 opcode, u32 *metadata,
 {
 	const struct tb_cm_ops *cm_ops = sw->tb->cm_ops;
 
-	if (tx_dwords > NVM_DATA_DWORDS || rx_dwords > NVM_DATA_DWORDS)
+	if (tx_dwords > USB4_DATA_DWORDS || rx_dwords > USB4_DATA_DWORDS)
 		return -EINVAL;
 
 	/*
@@ -702,7 +703,7 @@ int usb4_switch_credits_init(struct tb_switch *sw)
 	int max_usb3, min_dp_aux, min_dp_main, max_pcie, max_dma;
 	int ret, length, i, nports;
 	const struct tb_port *port;
-	u32 data[NVM_DATA_DWORDS];
+	u32 data[USB4_DATA_DWORDS];
 	u32 metadata = 0;
 	u8 status = 0;
 
@@ -1198,7 +1199,7 @@ static int usb4_port_wait_for_bit(struct tb_port *port, u32 offset, u32 bit,
 
 static int usb4_port_read_data(struct tb_port *port, void *data, size_t dwords)
 {
-	if (dwords > NVM_DATA_DWORDS)
+	if (dwords > USB4_DATA_DWORDS)
 		return -EINVAL;
 
 	return tb_port_read(port, data, TB_CFG_PORT, port->cap_usb4 + PORT_CS_2,
@@ -1208,7 +1209,7 @@ static int usb4_port_read_data(struct tb_port *port, void *data, size_t dwords)
 static int usb4_port_write_data(struct tb_port *port, const void *data,
 				size_t dwords)
 {
-	if (dwords > NVM_DATA_DWORDS)
+	if (dwords > USB4_DATA_DWORDS)
 		return -EINVAL;
 
 	return tb_port_write(port, data, TB_CFG_PORT, port->cap_usb4 + PORT_CS_2,
@@ -1844,7 +1845,7 @@ static int usb4_port_retimer_nvm_read_block(void *data, unsigned int dwaddress,
 	int ret;
 
 	metadata = dwaddress << USB4_NVM_READ_OFFSET_SHIFT;
-	if (dwords < NVM_DATA_DWORDS)
+	if (dwords < USB4_DATA_DWORDS)
 		metadata |= dwords << USB4_NVM_READ_LENGTH_SHIFT;
 
 	ret = usb4_port_retimer_write(port, index, USB4_SB_METADATA, &metadata,
-- 
2.39.2

