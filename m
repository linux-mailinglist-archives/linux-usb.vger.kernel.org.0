Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 903E34781F7
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 02:10:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbhLQBKo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Dec 2021 20:10:44 -0500
Received: from mga09.intel.com ([134.134.136.24]:64461 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231706AbhLQBKk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Dec 2021 20:10:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639703440; x=1671239440;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yEJ9D81A0QlzOv4F07yvUkRphfg1gzxTAFQpIg8qiVk=;
  b=T0YsoIZk/BZjAbYRUX0m7yolTJS0hNtyT/igblT3A3JH+rakrEf9GoT7
   2SPkP2oIMXfLL1/KNlKrFwSc/3pJyLc5GOdFZcgG9CBPmlaZ04gymS/Ht
   jGzQNXb/hDulJauDgVrq6iWPjnEaXrHw8ifFfprvkyMSi1my8Yu1o679F
   9JFA5saqALfCGqgM/5ZCmxTC5urs25CQDkE4KlTHkdc+1MbJWW8ZyU9Y1
   vq9X1fPoGvinDnZ7Kg5n87qD1QCTilXN4uRp+oHlhJ+AMRQAemaGHgdOY
   qX9PQB1JFR37ObemgXHnQEjgvdfRTAq6JzWBkpaGbxrToUnCNUUf0g9Qw
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239460940"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="239460940"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 17:10:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="605733793"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Dec 2021 17:10:28 -0800
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v2 7/7] thunderbolt: Add kernel param for CLx disabling
Date:   Fri, 17 Dec 2021 03:16:44 +0200
Message-Id: <20211217011644.21634-8-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211217011644.21634-1-gil.fine@intel.com>
References: <20211217011644.21634-1-gil.fine@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a module parameter that allows user to completely disable CLx
functionality in case problems are found.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/switch.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index cd6d16417a80..7224b9aa75ed 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -13,6 +13,7 @@
 #include <linux/sched/signal.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
+#include <linux/module.h>
 
 #include "tb.h"
 
@@ -26,6 +27,10 @@ struct nvm_auth_status {
 	u32 status;
 };
 
+static bool clx_enabled = true;
+module_param_named(clx, clx_enabled, bool, 0444);
+MODULE_PARM_DESC(clx, "allow CLx on the High-Speed link (default: true)");
+
 /*
  * Hold NVM authentication failure status per switch This information
  * needs to stay around even when the switch gets power cycled so we
@@ -3482,6 +3487,9 @@ int tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx)
 {
 	struct tb_switch *root_sw = sw->tb->root_switch;
 
+	if (!clx_enabled)
+		return 0;
+
 	/* CLx is not enabled and validated on USB4 platforms before ADL */
 	if (root_sw->generation < 4 ||
 	    tb_switch_is_tiger_lake(root_sw))
@@ -3541,6 +3549,9 @@ static int tb_switch_disable_cl0s(struct tb_switch *sw)
  */
 int tb_switch_disable_clx(struct tb_switch *sw, enum tb_clx clx)
 {
+	if (!clx_enabled)
+		return 0;
+
 	switch (clx) {
 	case TB_CL0S:
 		return tb_switch_disable_cl0s(sw);
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

