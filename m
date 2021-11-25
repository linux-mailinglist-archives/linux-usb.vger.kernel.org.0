Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3D6F45DC7C
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 15:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355487AbhKYOlh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 09:41:37 -0500
Received: from mga09.intel.com ([134.134.136.24]:2371 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355690AbhKYOjg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 09:39:36 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="235345424"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="235345424"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 06:32:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="741301397"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2021 06:32:38 -0800
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH 7/7] thunderbolt: Add kernel param for CLx disabling
Date:   Thu, 25 Nov 2021 16:38:21 +0200
Message-Id: <20211125143821.16558-8-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211125143821.16558-1-gil.fine@intel.com>
References: <20211125143821.16558-1-gil.fine@intel.com>
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
index 945672b8fa25..89868632932d 100644
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
@@ -3478,6 +3483,9 @@ int tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx)
 {
 	struct tb_switch *root_sw = sw->tb->root_switch;
 
+	if (!clx_enabled)
+		return 0;
+
 	/* CLx is not enabled and validated on USB4 platforms before ADL */
 	if (root_sw->generation < 4 ||
 	    tb_switch_is_tiger_lake(root_sw))
@@ -3538,6 +3546,9 @@ static int tb_switch_disable_cl0s(struct tb_switch *sw)
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

