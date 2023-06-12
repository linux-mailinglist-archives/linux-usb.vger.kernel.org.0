Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA3BB72BB43
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jun 2023 10:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234071AbjFLIxb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jun 2023 04:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbjFLIw7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 04:52:59 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A64E10B
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 01:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686559942; x=1718095942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cHqRPfmmnmHmtQBYQCniLv3+OUQKlWU/ZtwzlQLFucE=;
  b=LEjbGGQRDDzwFErgFfGijywhbSFAjxuHlRNLicKAMjPTn/aJr2Nv9ZLt
   lDgXWfslFwZ0iWSj1Cs0XyiN4SfZD79kGSb+eFzcg6WEBs1n04QDe9h0K
   8riEcBT0sFyxBJRpG4zYoRSnD+w6hFwXOUQ/CzPzBfHbZMucT2miaMHKk
   5qYtJtpDeuIZxECDA5Bp9KYPJPvv7jv5v8lzGQiz/SkteDHTy9D1CV3OT
   XXPMY53xy/J4rIeKrQRxuBRrK56YsfkO6qoxQb87EfumQ5e6drtRymGqp
   fKaQT26fLQbp5gg9Ky2CONaaYncE6Cbzex8rmPw/L7yFLskcOWFWlQgPZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347627239"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347627239"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 01:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="744247716"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="744247716"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 01:21:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 6E97C3BC; Mon, 12 Jun 2023 11:21:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Gil Fine <gil.fine@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 03/20] thunderbolt: Identify USB4 v2 routers
Date:   Mon, 12 Jun 2023 11:21:28 +0300
Message-Id: <20230612082145.62218-4-mika.westerberg@linux.intel.com>
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

From: Gil Fine <gil.fine@intel.com>

Add a new function usb4_switch_version() that can be used to figure out
the spec version of the router and make tb_switch_is_usb4() to use it as
well. Update the uevent accordingly.

Signed-off-by: Gil Fine <gil.fine@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c  |  5 +++--
 drivers/thunderbolt/tb.h      | 34 +++++++++++++++++++++++-----------
 drivers/thunderbolt/tb_regs.h |  4 ++--
 3 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 47961afdcc73..3a1fc3e053f6 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2056,8 +2056,9 @@ static int tb_switch_uevent(const struct device *dev, struct kobj_uevent_env *en
 	const struct tb_switch *sw = tb_to_switch(dev);
 	const char *type;
 
-	if (sw->config.thunderbolt_version == USB4_VERSION_1_0) {
-		if (add_uevent_var(env, "USB4_VERSION=1.0"))
+	if (tb_switch_is_usb4(sw)) {
+		if (add_uevent_var(env, "USB4_VERSION=%u.0",
+				   usb4_switch_version(sw)))
 			return -ENOMEM;
 	}
 
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 58df106aaa5e..bc91fcf5f430 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -947,17 +947,6 @@ static inline bool tb_switch_is_tiger_lake(const struct tb_switch *sw)
 	return false;
 }
 
-/**
- * tb_switch_is_usb4() - Is the switch USB4 compliant
- * @sw: Switch to check
- *
- * Returns true if the @sw is USB4 compliant router, false otherwise.
- */
-static inline bool tb_switch_is_usb4(const struct tb_switch *sw)
-{
-	return sw->config.thunderbolt_version == USB4_VERSION_1_0;
-}
-
 /**
  * tb_switch_is_icm() - Is the switch handled by ICM firmware
  * @sw: Switch to check
@@ -1198,6 +1187,29 @@ static inline struct tb_retimer *tb_to_retimer(struct device *dev)
 	return NULL;
 }
 
+/**
+ * usb4_switch_version() - Returns USB4 version of the router
+ * @sw: Router to check
+ *
+ * Returns major version of USB4 router (%1 for v1, %2 for v2 and so
+ * on). Can be called to pre-USB4 router too and in that case returns %0.
+ */
+static inline unsigned int usb4_switch_version(const struct tb_switch *sw)
+{
+	return FIELD_GET(USB4_VERSION_MAJOR_MASK, sw->config.thunderbolt_version);
+}
+
+/**
+ * tb_switch_is_usb4() - Is the switch USB4 compliant
+ * @sw: Switch to check
+ *
+ * Returns true if the @sw is USB4 compliant router, false otherwise.
+ */
+static inline bool tb_switch_is_usb4(const struct tb_switch *sw)
+{
+	return usb4_switch_version(sw) > 0;
+}
+
 int usb4_switch_setup(struct tb_switch *sw);
 int usb4_switch_read_uid(struct tb_switch *sw, u64 *uid);
 int usb4_switch_drom_read(struct tb_switch *sw, unsigned int address, void *buf,
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 2636423748cd..0716d6b7701a 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -190,8 +190,8 @@ struct tb_regs_switch_header {
 	u32 thunderbolt_version:8;
 } __packed;
 
-/* USB4 version 1.0 */
-#define USB4_VERSION_1_0			0x20
+/* Used with the router thunderbolt_version */
+#define USB4_VERSION_MAJOR_MASK			GENMASK(7, 5)
 
 #define ROUTER_CS_1				0x01
 #define ROUTER_CS_4				0x04
-- 
2.39.2

