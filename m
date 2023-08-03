Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A44EC76E511
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 11:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233453AbjHCJ4N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 05:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232828AbjHCJ4L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 05:56:11 -0400
Received: from mgamail.intel.com (unknown [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19CF430F9
        for <linux-usb@vger.kernel.org>; Thu,  3 Aug 2023 02:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691056570; x=1722592570;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2VW1Wusaffjk+ZBnzCsmbes05qnM9jHppGSAfHS9DBs=;
  b=WcDtxXrn0dnSbWe+KaqiLzHc+rVRZRI4NkxQFQM6zAltvdTFhMdnJWy6
   zRdj0ry4xYFq36clgt+T08NgP0mqkD+XZxbP6y+cwDshzIYjEA3OzBdxI
   p+kZOdHDUdU1vCOnrXFn+1BX7m9QTE5f9GPMW37ysumLSxGlg5jzs8saB
   Fcj3+1MAGbwHNpHopLjL1oao6HXaXMW8f7bUavCMEJSdwgUl/LqoXPEBk
   1nKPSR75LLucZ7MYD06C3U0fhIe1/uu+v3ctu6OgQX6sCbEvlNuFPN9sZ
   Yirab2X0BrJgRXwsZJcnjA6s8hDMAF5oRsETm4snWGVOvlTSDenwCKR5j
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="400767716"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="400767716"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 02:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="764536628"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="764536628"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 03 Aug 2023 02:56:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 8995AE3; Thu,  3 Aug 2023 12:56:18 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/3] thunderbolt: Check Intel vendor ID in tb_switch_get_generation()
Date:   Thu,  3 Aug 2023 12:56:17 +0300
Message-Id: <20230803095618.56001-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230803095618.56001-1-mika.westerberg@linux.intel.com>
References: <20230803095618.56001-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Only Intel made Thunderbolt 1-3 devices so to avoid possible confusion
check for the Intel vendor ID before deciding the device generation.
While there move the USB4 check to happen first.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 75 ++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 37 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 7ea63bb31714..43171cc1cc2d 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2188,46 +2188,47 @@ struct device_type tb_switch_type = {
 
 static int tb_switch_get_generation(struct tb_switch *sw)
 {
-	switch (sw->config.device_id) {
-	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
-	case PCI_DEVICE_ID_INTEL_EAGLE_RIDGE:
-	case PCI_DEVICE_ID_INTEL_LIGHT_PEAK:
-	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_2C:
-	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
-	case PCI_DEVICE_ID_INTEL_PORT_RIDGE:
-	case PCI_DEVICE_ID_INTEL_REDWOOD_RIDGE_2C_BRIDGE:
-	case PCI_DEVICE_ID_INTEL_REDWOOD_RIDGE_4C_BRIDGE:
-		return 1;
-
-	case PCI_DEVICE_ID_INTEL_WIN_RIDGE_2C_BRIDGE:
-	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_BRIDGE:
-	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_BRIDGE:
-		return 2;
-
-	case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_BRIDGE:
-	case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_BRIDGE:
-	case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_BRIDGE:
-	case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_2C_BRIDGE:
-	case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_BRIDGE:
-	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_BRIDGE:
-	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_BRIDGE:
-	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_BRIDGE:
-	case PCI_DEVICE_ID_INTEL_ICL_NHI0:
-	case PCI_DEVICE_ID_INTEL_ICL_NHI1:
-		return 3;
+	if (tb_switch_is_usb4(sw))
+		return 4;
 
-	default:
-		if (tb_switch_is_usb4(sw))
-			return 4;
+	if (sw->config.vendor_id == PCI_VENDOR_ID_INTEL) {
+		switch (sw->config.device_id) {
+		case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
+		case PCI_DEVICE_ID_INTEL_EAGLE_RIDGE:
+		case PCI_DEVICE_ID_INTEL_LIGHT_PEAK:
+		case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_2C:
+		case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
+		case PCI_DEVICE_ID_INTEL_PORT_RIDGE:
+		case PCI_DEVICE_ID_INTEL_REDWOOD_RIDGE_2C_BRIDGE:
+		case PCI_DEVICE_ID_INTEL_REDWOOD_RIDGE_4C_BRIDGE:
+			return 1;
 
-		/*
-		 * For unknown switches assume generation to be 1 to be
-		 * on the safe side.
-		 */
-		tb_sw_warn(sw, "unsupported switch device id %#x\n",
-			   sw->config.device_id);
-		return 1;
+		case PCI_DEVICE_ID_INTEL_WIN_RIDGE_2C_BRIDGE:
+		case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_BRIDGE:
+		case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_BRIDGE:
+			return 2;
+
+		case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_BRIDGE:
+		case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_BRIDGE:
+		case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_BRIDGE:
+		case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_2C_BRIDGE:
+		case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_BRIDGE:
+		case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_BRIDGE:
+		case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_BRIDGE:
+		case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_BRIDGE:
+		case PCI_DEVICE_ID_INTEL_ICL_NHI0:
+		case PCI_DEVICE_ID_INTEL_ICL_NHI1:
+			return 3;
+		}
 	}
+
+	/*
+	 * For unknown switches assume generation to be 1 to be on the
+	 * safe side.
+	 */
+	tb_sw_warn(sw, "unsupported switch device id %#x\n",
+		   sw->config.device_id);
+	return 1;
 }
 
 static bool tb_switch_exceeds_max_depth(const struct tb_switch *sw, int depth)
-- 
2.40.1

