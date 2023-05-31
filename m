Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1315717B46
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 11:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235396AbjEaJH5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 05:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235237AbjEaJHi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 05:07:38 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2A1E7E
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 02:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685524050; x=1717060050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FTgojwislhYqIFOns+k1zPHzaS+0zGJlH0EroEGI6Uw=;
  b=FJIruaiTo6/eUhviJrIxFbsd8tMcjjNBXn3VbgRGjOs2N1SKbB2zevje
   Gd8ytogBiXf7wO65C6kZT3SrCvKuGBq35L//K74bQJQbbsWPj6080HCHV
   L+rKqSqDTdlBF7KQb/LVODlFr29PVnmiqwYATpNzXtlDdLrxcAdq+FF3M
   FZSYDHyoXFznEhio3H6cVY9lqpFNW7MYSDbejUlGxX/oLqSMt0JRp6lsx
   Iv38znVutdd7ggBA6lwGb+DXkDcPsn+sY9gJAxbWM5kPZEWILn6RJnC0A
   yOhpxlVA9vFysPgJzWFIS6XPqhBHeqXKb1zut1X98ssTqExxBBLrCC9X7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="354027680"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="354027680"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 02:06:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="657247259"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="657247259"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 31 May 2023 02:06:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 6C41AD79; Wed, 31 May 2023 12:06:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Christian Kellner <ckellner@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 14/20] thunderbolt: Move constants related to NVM into nvm.c
Date:   Wed, 31 May 2023 12:06:39 +0300
Message-Id: <20230531090645.5573-15-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531090645.5573-1-mika.westerberg@linux.intel.com>
References: <20230531090645.5573-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
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
index e1f1ed7dd60c..516f9d3341c1 100644
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

