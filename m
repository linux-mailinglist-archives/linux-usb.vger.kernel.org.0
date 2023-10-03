Return-Path: <linux-usb+bounces-1014-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B352D7B65A9
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 11:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id C58AD1C20A84
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 09:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5126D1F934;
	Tue,  3 Oct 2023 09:40:18 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CA6101D0
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 09:40:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F8E1AC
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 02:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696326013; x=1727862013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HEL0m2dWBurodwM41+UOBc7R3d5i/8usNLtN4ekxlHY=;
  b=k1m1KWonVRXUOa8TzEcTGv75LAMEVxoEFrdpcmo4MLUrm+d1Bt3sLIbE
   51pwTfHHN0JMfO8FS38xTcsDbRWaxgFuT4rSEZ5xUIr8S8kWQ9miOTuri
   7zDNoujmjH7Xl8HBsc5HIWX5+w/3NoftLm6/eyy0ukxpqrNZEkb/ICQfa
   Sb3SqGbKdYGXncqY4ApzGHScmAZiD5r69yS0GaEMmXDf7MMaG1FDQ8/j7
   mSR1XmHlMzwAcD7ki166I+GuBP2vk6XXDsp8kVE4AZoLkLICMbWJtBSvx
   sI970Jg3rG4qWps+FBAZXXrbC9ZhmjsWhlhBAdYj+D68enxonqWFjWoo9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1424892"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1424892"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 02:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="997945477"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="997945477"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 03 Oct 2023 02:40:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id B35ED1A77; Tue,  3 Oct 2023 12:40:05 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 07/13] thunderbolt: Fix typo of HPD bit for Hot Plug Detect
Date: Tue,  3 Oct 2023 12:39:59 +0300
Message-Id: <20231003094005.2676823-8-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003094005.2676823-1-mika.westerberg@linux.intel.com>
References: <20231003094005.2676823-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Gil Fine <gil.fine@linux.intel.com>

Fix typo of HPD bit stands for Hot Plug Detect.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c  | 8 ++++----
 drivers/thunderbolt/tb_regs.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index bd5815f8f23b..7d3c7e73a020 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1332,7 +1332,7 @@ int tb_pci_port_enable(struct tb_port *port, bool enable)
  * tb_dp_port_hpd_is_active() - Is HPD already active
  * @port: DP out port to check
  *
- * Checks if the DP OUT adapter port has HDP bit already set.
+ * Checks if the DP OUT adapter port has HPD bit already set.
  */
 int tb_dp_port_hpd_is_active(struct tb_port *port)
 {
@@ -1344,14 +1344,14 @@ int tb_dp_port_hpd_is_active(struct tb_port *port)
 	if (ret)
 		return ret;
 
-	return !!(data & ADP_DP_CS_2_HDP);
+	return !!(data & ADP_DP_CS_2_HPD);
 }
 
 /**
  * tb_dp_port_hpd_clear() - Clear HPD from DP IN port
  * @port: Port to clear HPD
  *
- * If the DP IN port has HDP set, this function can be used to clear it.
+ * If the DP IN port has HPD set, this function can be used to clear it.
  */
 int tb_dp_port_hpd_clear(struct tb_port *port)
 {
@@ -1363,7 +1363,7 @@ int tb_dp_port_hpd_clear(struct tb_port *port)
 	if (ret)
 		return ret;
 
-	data |= ADP_DP_CS_3_HDPC;
+	data |= ADP_DP_CS_3_HPDC;
 	return tb_port_write(port, &data, TB_CFG_PORT,
 			     port->cap_adap + ADP_DP_CS_3, 1);
 }
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index b6893a5093a5..32839315948b 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -400,7 +400,7 @@ struct tb_regs_port_header {
 #define ADP_DP_CS_1_AUX_RX_HOPID_SHIFT		11
 #define ADP_DP_CS_2				0x02
 #define ADP_DP_CS_2_NRD_MLC_MASK		GENMASK(2, 0)
-#define ADP_DP_CS_2_HDP				BIT(6)
+#define ADP_DP_CS_2_HPD				BIT(6)
 #define ADP_DP_CS_2_NRD_MLR_MASK		GENMASK(9, 7)
 #define ADP_DP_CS_2_NRD_MLR_SHIFT		7
 #define ADP_DP_CS_2_CA				BIT(10)
@@ -417,7 +417,7 @@ struct tb_regs_port_header {
 #define ADP_DP_CS_2_ESTIMATED_BW_MASK		GENMASK(31, 24)
 #define ADP_DP_CS_2_ESTIMATED_BW_SHIFT		24
 #define ADP_DP_CS_3				0x03
-#define ADP_DP_CS_3_HDPC			BIT(9)
+#define ADP_DP_CS_3_HPDC			BIT(9)
 #define DP_LOCAL_CAP				0x04
 #define DP_REMOTE_CAP				0x05
 /* For DP IN adapter */
-- 
2.40.1


