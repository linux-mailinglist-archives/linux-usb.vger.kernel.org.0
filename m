Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0C11710839
	for <lists+linux-usb@lfdr.de>; Thu, 25 May 2023 11:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240500AbjEYJB2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 May 2023 05:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240035AbjEYJB0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 May 2023 05:01:26 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B813198
        for <linux-usb@vger.kernel.org>; Thu, 25 May 2023 02:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685005285; x=1716541285;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gnl1aFN3BvyzLDDJi1KWPmXKZ1XJx9r0jZWzTMOdAE4=;
  b=fTgN8WCIZPvHeOrjOJM+MN6SbHUSx3Qk7u37AwKigo/0kw6YTNAsXogq
   K5kvykgjKQDmtwRvCmkSXhLJ55M45/kaaW0QRXeALIb4hxK8y8q5QYBuQ
   jH0XwGSmyTupJVOKfDcbQiWA6lmMAVk0NFHYPaMjWb3ePlK6fWK8mlQV6
   nwGedc2MUd+6pfCcZ2dOYej1kQszKcU+gc6/UWwVdsMuilaghqw0nT0oH
   RZ6NVn5B6Kr9ZDEXWGYh50ZT/LNG54vx0Mmzl77SYOZWu5DKGi+mwFDsj
   cCjmhNM/V7E3XdtVoWGWw1N7nbz+CcUqkRrQwyglk3GYUB5GbR0MZ8RAM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333452077"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="333452077"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:01:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="655135848"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="655135848"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 25 May 2023 02:01:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id C88E0413; Thu, 25 May 2023 12:01:24 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Koba Ko <koba.ko@canonical.com>,
        Imre Deak <imre.deak@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/2] thunderbolt: Do not touch CL state configuration during discovery
Date:   Thu, 25 May 2023 12:01:24 +0300
Message-Id: <20230525090124.11614-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525090124.11614-1-mika.westerberg@linux.intel.com>
References: <20230525090124.11614-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the boot firmware has already established tunnels, especially ones
that have special requirements from the link such as DisplayPort, we
should not blindly enable CL states (nor change the TMU configuration).
Otherwise the existing tunnels may not work as expected.

For this reason, skip the CL state enabling when we go over the existing
topology. This will als keep the TMU settings untouched because we do
not change the TMU configururation when CL states are not enabled.

Reported-by: Koba Ko <koba.ko@canonical.com>
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7831
Cc: stable@vger.kernel.org # v6.0+
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 7bfbc9ca9ba4..c1af712ca728 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -737,6 +737,7 @@ static void tb_scan_port(struct tb_port *port)
 {
 	struct tb_cm *tcm = tb_priv(port->sw->tb);
 	struct tb_port *upstream_port;
+	bool discovery = false;
 	struct tb_switch *sw;
 	int ret;
 
@@ -804,8 +805,10 @@ static void tb_scan_port(struct tb_port *port)
 	 * tunnels and know which switches were authorized already by
 	 * the boot firmware.
 	 */
-	if (!tcm->hotplug_active)
+	if (!tcm->hotplug_active) {
 		dev_set_uevent_suppress(&sw->dev, true);
+		discovery = true;
+	}
 
 	/*
 	 * At the moment Thunderbolt 2 and beyond (devices with LC) we
@@ -835,10 +838,14 @@ static void tb_scan_port(struct tb_port *port)
 	 * CL0s and CL1 are enabled and supported together.
 	 * Silently ignore CLx enabling in case CLx is not supported.
 	 */
-	ret = tb_switch_enable_clx(sw, TB_CL1);
-	if (ret && ret != -EOPNOTSUPP)
-		tb_sw_warn(sw, "failed to enable %s on upstream port\n",
-			   tb_switch_clx_name(TB_CL1));
+	if (discovery) {
+		tb_sw_dbg(sw, "discovery, not touching CL states\n");
+	} else {
+		ret = tb_switch_enable_clx(sw, TB_CL1);
+		if (ret && ret != -EOPNOTSUPP)
+			tb_sw_warn(sw, "failed to enable %s on upstream port\n",
+				   tb_switch_clx_name(TB_CL1));
+	}
 
 	if (tb_switch_is_clx_enabled(sw, TB_CL1))
 		/*
-- 
2.39.2

