Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0773717B3D
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 11:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235311AbjEaJHk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 05:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235310AbjEaJHZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 05:07:25 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA9D1BE
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 02:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685524031; x=1717060031;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5R/PimgGjI9n3Xb1mKdZWc2F0yx9PxCNvv8p+CjD85k=;
  b=JS8TMIh4UUYIgbYUq5/6nyTLXuEUpDZFyO5T/P4ihEczsVoZv7Nz72WX
   skLPzllVOBt8ScfqAVK0BFObv9YTQ+nCvA1yYdmMNfRBH3JGzYVMgXvqV
   wT+R7hAZ12OHIbOSs8BMQzwfKozRbQi0iNA/UMsxuFrRikDOs2KFNBApc
   0SRE9Ic97HmaoPiEMqHShf0c+VAsWrWR3ao46nZbs0HjfjcUfxioVKQrc
   Ej3YhcyFpIGy5lOZOyKglIJZrfb8eW6Z7Rm5xyYysqflKJho5ND9mssmR
   WKpP4JaWRzsKhJOn4IEI3ujJ12T9p166XpyzzbGdkxi3fS78C2LdL/yMo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="354027642"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="354027642"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 02:06:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="657247243"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="657247243"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 31 May 2023 02:06:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1DB137A6; Wed, 31 May 2023 12:06:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Christian Kellner <ckellner@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 05/20] thunderbolt: Add the new USB4 v2 notification types
Date:   Wed, 31 May 2023 12:06:30 +0300
Message-Id: <20230531090645.5573-6-mika.westerberg@linux.intel.com>
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

