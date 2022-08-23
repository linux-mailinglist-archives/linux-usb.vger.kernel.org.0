Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97E8B59E4AE
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 15:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240939AbiHWNuy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 09:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242104AbiHWNu3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 09:50:29 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D2A0145161
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 03:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661252177; x=1692788177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rSVaBVACvAILW4h1IjW0Uav8IckdnD0mOvX6HGsdWQo=;
  b=l2Ev2l45yR2FiFDF+mg68gkqAArfJZUlGS1R+x+PahcLFWfxdxPX+eW4
   CyC0d6efwxdJamjQxHH4U9g7yrHtwZ4MAvsuhI7aZnJBh0EcQOquyPcLJ
   MuCUerrqfC4TVKHooQMuMfMbN2qz6FKvIPB25gZab3VbU0XK0uaouUwJH
   aHKEj3O4d2YHnwioDm+NTV5dllKp7yUgckwbnTZib308Aaa2sDunQNDOX
   8x1qzxh5a3ODvUGm66/YXoB1bX5x6R90fWc8xoziAG2cr/BZRrNQt9rQ7
   Y/zHXCHF4PUO0fBZ/m/3F1w4NcvJvhDlAqF9BD1jZvLyA/BTFB9EJnN65
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="357633601"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="357633601"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 03:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="677578565"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 23 Aug 2022 03:53:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 2DFAD2E7; Tue, 23 Aug 2022 13:53:53 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/4] thunderbolt: Add helpers to check if CL states are enabled on port
Date:   Tue, 23 Aug 2022 13:53:51 +0300
Message-Id: <20220823105352.56306-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220823105352.56306-1-mika.westerberg@linux.intel.com>
References: <20220823105352.56306-1-mika.westerberg@linux.intel.com>
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

We will need these when enabling lane margining support.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 23 +++++++++++++++++++++++
 drivers/thunderbolt/tb.h     |  7 +++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index deefc92c7c60..6b90bacb622e 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1335,6 +1335,29 @@ static int tb_port_clx_enable(struct tb_port *port, enum tb_clx clx)
 	return __tb_port_clx_set(port, clx, true);
 }
 
+/**
+ * tb_port_is_clx_enabled() - Is given CL state enabled
+ * @port: USB4 port to check
+ * @clx: CL state to check
+ *
+ * Returns true if given CL state is enabled for @port.
+ */
+bool tb_port_is_clx_enabled(struct tb_port *port, enum tb_clx clx)
+{
+	u32 phy, mask = LANE_ADP_CS_1_CL0S_ENABLE | LANE_ADP_CS_1_CL1_ENABLE;
+	int ret;
+
+	if (!tb_port_clx_supported(port, clx))
+		return false;
+
+	ret = tb_port_read(port, &phy, TB_CFG_PORT,
+			   port->cap_phy + LANE_ADP_CS_1, 1);
+	if (ret)
+		return false;
+
+	return (phy & mask) == mask;
+}
+
 static int tb_port_start_lane_initialization(struct tb_port *port)
 {
 	int ret;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 8291cabd2e92..2154b59c39ec 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1035,6 +1035,13 @@ void tb_port_lane_bonding_disable(struct tb_port *port);
 int tb_port_wait_for_link_width(struct tb_port *port, int width,
 				int timeout_msec);
 int tb_port_update_credits(struct tb_port *port);
+bool tb_port_is_clx_enabled(struct tb_port *port, enum tb_clx clx);
+
+static inline bool tb_port_are_clx_enabled(struct tb_port *port)
+{
+	return tb_port_is_clx_enabled(port, TB_CL1) ||
+	       tb_port_is_clx_enabled(port, TB_CL2);
+}
 
 int tb_switch_find_vse_cap(struct tb_switch *sw, enum tb_switch_vse_cap vsec);
 int tb_switch_find_cap(struct tb_switch *sw, enum tb_switch_cap cap);
-- 
2.35.1

