Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72638717B38
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 11:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235371AbjEaJHb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 05:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235365AbjEaJHL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 05:07:11 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E3C811F
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 02:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685524007; x=1717060007;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c/JuZQvsOgu6fNUXzZIxfUlMVnOZgbAEkfTDL2JUfo4=;
  b=AXKkHG2iGCPntQfhpM4CJbBqp/fKhzpizTja+FgJapshomnKT6byy6G8
   a698Fg1zhZwUfBAMgRPvYknrm3IZdhNutg8hHIsu4sP4r6ORx/tiwRNzm
   SfrvLqBLP6laqHjE1bpinTBXwvDGBgIPqKSN5uzD9RZ+nmMbJnJvR65Uk
   9vu7cpVm2ITpvzaQ9eWEpAUldmrxYyQo0N31fikvNXxxhLcQ9QWadU6Ia
   0mH6vDTqTG2rEiNCHl+zOIzG77AXYvQjdgN/qSZevBIaIoOkQzIaIHq88
   psx2k8n7Vnr7v6U27+2n+P7iOl4VIlktrFsqmBKMktloS0Y+4B6ca1dQV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="354027619"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="354027619"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 02:06:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="657247206"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="657247206"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 31 May 2023 02:06:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 11ACC5E2; Wed, 31 May 2023 12:06:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Christian Kellner <ckellner@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 03/20] thunderbolt: Identify USB4 v2 routers
Date:   Wed, 31 May 2023 12:06:28 +0300
Message-Id: <20230531090645.5573-4-mika.westerberg@linux.intel.com>
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

From: Gil Fine <gil.fine@intel.com>

Update tb_switch_is_usb4() to support version 2 routers and add a new
function usb4_switch_version() that can be used to figure out the spec
version of the router. Update the uevent accordingly.

Signed-off-by: Gil Fine <gil.fine@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c  |  5 +++--
 drivers/thunderbolt/tb.h      | 15 ++++++++++++++-
 drivers/thunderbolt/tb_regs.h |  4 ++--
 3 files changed, 19 insertions(+), 5 deletions(-)

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
index 2bda2816ff47..e27fcdf50581 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -955,7 +955,8 @@ static inline bool tb_switch_is_tiger_lake(const struct tb_switch *sw)
  */
 static inline bool tb_switch_is_usb4(const struct tb_switch *sw)
 {
-	return sw->config.thunderbolt_version == USB4_VERSION_1_0;
+	return FIELD_GET(USB4_VERSION_MAJOR_MASK,
+			 sw->config.thunderbolt_version) > 0;
 }
 
 /**
@@ -1198,6 +1199,18 @@ static inline struct tb_retimer *tb_to_retimer(struct device *dev)
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

