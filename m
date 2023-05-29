Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 070A67147A8
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbjE2KEi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbjE2KEe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:34 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32AF3A7
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354672; x=1716890672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kQc6YG/qIED9NqHZEoGGAm9SFSpB+fTbJkyPb98gsZE=;
  b=L3NZr7Y8+OC6XzzLIlByqkiUacOihSZke0WJzIW0XznT9WDyCbzqxY75
   EFDvFgouOzzZkXIPJfvxPtbPQzAeQDexV7Tn9RglRXIcP1YYk1QYQQM0S
   ZACylAGOJOxq5juYQywBaRyhEzty/n/WnhLwDJFmx6ynXkMbi3B/+zfcC
   L2ynTmuVv7cE5oSZqr1ICSzdeqaRn0Skenxf75NrL+/f5m4yMdWZvXXSX
   Bwup+xHkD/qjLsN9uhwmZFQ0XqAKRAIf0xNAasjwqThefsREnKkx5eidx
   LW0jW+RrNk3eOwYOymhrpvWzQvw0NkS3UutDECub61gr2IOISFiVRmgqL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684415"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684415"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518281"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518281"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id DE15F3B9; Mon, 29 May 2023 13:04:25 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 03/20] thunderbolt: Fix a couple of style issues in TMU code
Date:   Mon, 29 May 2023 13:04:08 +0300
Message-Id: <20230529100425.6125-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230529100425.6125-1-mika.westerberg@linux.intel.com>
References: <20230529100425.6125-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop extra empty line and get rid of the '__' in function names. No
functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tmu.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index a46203b33c5f..8614e154be5f 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -395,7 +395,6 @@ int tb_switch_tmu_disable(struct tb_switch *sw)
 	if (sw->tmu.rate == TB_SWITCH_TMU_RATE_OFF)
 		return 0;
 
-
 	if (tb_route(sw)) {
 		bool unidirectional = sw->tmu.unidirectional;
 		struct tb_port *down, *up;
@@ -439,7 +438,7 @@ int tb_switch_tmu_disable(struct tb_switch *sw)
 	return 0;
 }
 
-static void __tb_switch_tmu_off(struct tb_switch *sw, bool unidirectional)
+static void tb_switch_tmu_off(struct tb_switch *sw, bool unidirectional)
 {
 	struct tb_port *down, *up;
 
@@ -469,7 +468,7 @@ static void __tb_switch_tmu_off(struct tb_switch *sw, bool unidirectional)
  * This function is called when the previous TMU mode was
  * TB_SWITCH_TMU_RATE_OFF.
  */
-static int __tb_switch_tmu_enable_bidirectional(struct tb_switch *sw)
+static int tb_switch_tmu_enable_bidirectional(struct tb_switch *sw)
 {
 	struct tb_port *up, *down;
 	int ret;
@@ -500,7 +499,7 @@ static int __tb_switch_tmu_enable_bidirectional(struct tb_switch *sw)
 	return 0;
 
 out:
-	__tb_switch_tmu_off(sw, false);
+	tb_switch_tmu_off(sw, false);
 	return ret;
 }
 
@@ -533,7 +532,7 @@ static int tb_switch_tmu_unidirectional_enable(struct tb_switch *sw)
  * This function is called when the previous TMU mode was
  * TB_SWITCH_TMU_RATE_OFF.
  */
-static int __tb_switch_tmu_enable_unidirectional(struct tb_switch *sw)
+static int tb_switch_tmu_enable_unidirectional(struct tb_switch *sw)
 {
 	struct tb_port *up, *down;
 	int ret;
@@ -568,11 +567,11 @@ static int __tb_switch_tmu_enable_unidirectional(struct tb_switch *sw)
 	return 0;
 
 out:
-	__tb_switch_tmu_off(sw, true);
+	tb_switch_tmu_off(sw, true);
 	return ret;
 }
 
-static void __tb_switch_tmu_change_mode_prev(struct tb_switch *sw)
+static void tb_switch_tmu_change_mode_prev(struct tb_switch *sw)
 {
 	struct tb_port *down, *up;
 
@@ -594,7 +593,7 @@ static void __tb_switch_tmu_change_mode_prev(struct tb_switch *sw)
 	tb_port_tmu_set_unidirectional(up, sw->tmu.unidirectional);
 }
 
-static int __tb_switch_tmu_change_mode(struct tb_switch *sw)
+static int tb_switch_tmu_change_mode(struct tb_switch *sw)
 {
 	struct tb_port *up, *down;
 	int ret;
@@ -632,7 +631,7 @@ static int __tb_switch_tmu_change_mode(struct tb_switch *sw)
 	return 0;
 
 out:
-	__tb_switch_tmu_change_mode_prev(sw);
+	tb_switch_tmu_change_mode_prev(sw);
 	return ret;
 }
 
@@ -695,13 +694,13 @@ int tb_switch_tmu_enable(struct tb_switch *sw)
 		 */
 		if (sw->tmu.rate == TB_SWITCH_TMU_RATE_OFF) {
 			if (unidirectional)
-				ret = __tb_switch_tmu_enable_unidirectional(sw);
+				ret = tb_switch_tmu_enable_unidirectional(sw);
 			else
-				ret = __tb_switch_tmu_enable_bidirectional(sw);
+				ret = tb_switch_tmu_enable_bidirectional(sw);
 			if (ret)
 				return ret;
 		} else if (sw->tmu.rate == TB_SWITCH_TMU_RATE_NORMAL) {
-			ret = __tb_switch_tmu_change_mode(sw);
+			ret = tb_switch_tmu_change_mode(sw);
 			if (ret)
 				return ret;
 		}
-- 
2.39.2

