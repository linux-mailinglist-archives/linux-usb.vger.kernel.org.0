Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0581972BB45
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jun 2023 10:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233776AbjFLIxc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jun 2023 04:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233654AbjFLIxB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 04:53:01 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D0EE1FE4
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 01:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686559943; x=1718095943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5R/PimgGjI9n3Xb1mKdZWc2F0yx9PxCNvv8p+CjD85k=;
  b=nUcl/gZU+aB1RnnNdxDOdrp1TbbaQZWyjdP/Ey/Ni+7K4wAWPRekojyl
   i8DWuBoj4fKL7l5b6CBsvLh1AQUIcBBXLRFqwUj0POmNqGewglD9uB2F+
   XIrdeC/zgKnvN9Y8+JEZMhjnyHOUEts7OkDAyZ27Yfd96Fk1Fz5mZXWWY
   wEoG2M82dcBfKGfGj2/W3bmWpqACPtz/x7bTdK7VUmds+x+p9Iyx7uqws
   jaiD78sHu+8cNGoToR4kcilbOu1YtPjMDakb7R4svljHmtnSA0rLRbaw/
   jKVV7v2H0Nr8rpKuLeKu/yp8Cj3ohgHcxzKh82vfTyWwgc21Nslj0WsFW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347627264"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347627264"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 01:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="744247744"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="744247744"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 01:21:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 7E4573B6; Mon, 12 Jun 2023 11:21:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Gil Fine <gil.fine@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 05/20] thunderbolt: Add the new USB4 v2 notification types
Date:   Mon, 12 Jun 2023 11:21:30 +0300
Message-Id: <20230612082145.62218-6-mika.westerberg@linux.intel.com>
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

USB4 v2 spec adds a bunch of new notifications that the connection
manager can use instead of polling. While we do not use these yet we
need to ack the ones routers expect to be acked.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/ctl.c     | 28 ++++++++++++++++++++++++++++
 drivers/thunderbolt/tb.c      | 17 +++++++++++++----
 drivers/thunderbolt/tb_msgs.h |  7 +++++++
 3 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 3a213322ec7a..d997a4c545f7 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -409,6 +409,13 @@ static int tb_async_error(const struct ctl_pkg *pkg)
 	case TB_CFG_ERROR_HEC_ERROR_DETECTED:
 	case TB_CFG_ERROR_FLOW_CONTROL_ERROR:
 	case TB_CFG_ERROR_DP_BW:
+	case TB_CFG_ERROR_ROP_CMPLT:
+	case TB_CFG_ERROR_POP_CMPLT:
+	case TB_CFG_ERROR_PCIE_WAKE:
+	case TB_CFG_ERROR_DP_CON_CHANGE:
+	case TB_CFG_ERROR_DPTX_DISCOVERY:
+	case TB_CFG_ERROR_LINK_RECOVERY:
+	case TB_CFG_ERROR_ASYM_LINK:
 		return true;
 
 	default:
@@ -758,6 +765,27 @@ int tb_cfg_ack_notification(struct tb_ctl *ctl, u64 route,
 	case TB_CFG_ERROR_DP_BW:
 		name = "DP_BW";
 		break;
+	case TB_CFG_ERROR_ROP_CMPLT:
+		name = "router operation completion";
+		break;
+	case TB_CFG_ERROR_POP_CMPLT:
+		name = "port operation completion";
+		break;
+	case TB_CFG_ERROR_PCIE_WAKE:
+		name = "PCIe wake";
+		break;
+	case TB_CFG_ERROR_DP_CON_CHANGE:
+		name = "DP connector change";
+		break;
+	case TB_CFG_ERROR_DPTX_DISCOVERY:
+		name = "DPTX discovery";
+		break;
+	case TB_CFG_ERROR_LINK_RECOVERY:
+		name = "link recovery";
+		break;
+	case TB_CFG_ERROR_ASYM_LINK:
+		name = "asymmetric link";
+		break;
 	default:
 		name = "unknown";
 		break;
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 440693f561a4..f18cb5a52f0b 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1952,17 +1952,26 @@ static void tb_queue_dp_bandwidth_request(struct tb *tb, u64 route, u8 port)
 static void tb_handle_notification(struct tb *tb, u64 route,
 				   const struct cfg_error_pkg *error)
 {
-	if (tb_cfg_ack_notification(tb->ctl, route, error))
-		tb_warn(tb, "could not ack notification on %llx\n", route);
 
 	switch (error->error) {
+	case TB_CFG_ERROR_PCIE_WAKE:
+	case TB_CFG_ERROR_DP_CON_CHANGE:
+	case TB_CFG_ERROR_DPTX_DISCOVERY:
+		if (tb_cfg_ack_notification(tb->ctl, route, error))
+			tb_warn(tb, "could not ack notification on %llx\n",
+				route);
+		break;
+
 	case TB_CFG_ERROR_DP_BW:
+		if (tb_cfg_ack_notification(tb->ctl, route, error))
+			tb_warn(tb, "could not ack notification on %llx\n",
+				route);
 		tb_queue_dp_bandwidth_request(tb, route, error->port);
 		break;
 
 	default:
-		/* Ack is enough */
-		return;
+		/* Ignore for now */
+		break;
 	}
 }
 
diff --git a/drivers/thunderbolt/tb_msgs.h b/drivers/thunderbolt/tb_msgs.h
index 3234bff07899..cd750e4b3440 100644
--- a/drivers/thunderbolt/tb_msgs.h
+++ b/drivers/thunderbolt/tb_msgs.h
@@ -30,6 +30,13 @@ enum tb_cfg_error {
 	TB_CFG_ERROR_FLOW_CONTROL_ERROR = 13,
 	TB_CFG_ERROR_LOCK = 15,
 	TB_CFG_ERROR_DP_BW = 32,
+	TB_CFG_ERROR_ROP_CMPLT = 33,
+	TB_CFG_ERROR_POP_CMPLT = 34,
+	TB_CFG_ERROR_PCIE_WAKE = 35,
+	TB_CFG_ERROR_DP_CON_CHANGE = 36,
+	TB_CFG_ERROR_DPTX_DISCOVERY = 37,
+	TB_CFG_ERROR_LINK_RECOVERY = 38,
+	TB_CFG_ERROR_ASYM_LINK = 39,
 };
 
 /* common header */
-- 
2.39.2

