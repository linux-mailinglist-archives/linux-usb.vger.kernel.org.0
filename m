Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA9E5A64AA
	for <lists+linux-usb@lfdr.de>; Tue, 30 Aug 2022 15:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbiH3N2I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Aug 2022 09:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbiH3N1o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Aug 2022 09:27:44 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3642C7E33E
        for <linux-usb@vger.kernel.org>; Tue, 30 Aug 2022 06:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661866060; x=1693402060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u2xcnUqK7Nim6AHJUN3WIlpZhnk/EHzehx2V6+tze8k=;
  b=TU134fkQWtVJDjHuLfkFNnJkexUbCbueFI5LgWPQ1Nm5n/UGL1fhDjSY
   Mfoc4/s4jjulEXp4dxTTjHWrJET736a5IkUS3bPWeNGu065J7ff6ybrON
   BDT90GM2yY+WvKGu/+ymyNT68H8g5sBdpnH+qk+99OO6kpnheJjhAFyw4
   gofuBzBHdzSIM4oix+9AaDoyerzhzFtCfiIIRZ9dPYXNCyKs5y4XV8bHP
   Tv/jkaBQpeB36g6iyuNu4CRx0ZVLcFvAiIBoL9UQ90HyAyjslesMorrAM
   s3KmSxhrZ1bFokP9ZYWzR01jko1FiQFOd/aoWc8ZAowZq+NA1eLJWfez4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="293916584"
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="293916584"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 06:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="672865251"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 30 Aug 2022 06:27:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1FF03174; Tue, 30 Aug 2022 16:27:52 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 2/5] thunderbolt: Move port CL state functions into correct place in switch.c
Date:   Tue, 30 Aug 2022 16:27:48 +0300
Message-Id: <20220830132751.42518-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830132751.42518-1-mika.westerberg@linux.intel.com>
References: <20220830132751.42518-1-mika.westerberg@linux.intel.com>
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

They should be close to other functions dealing with USB4 ports. No
functional impact.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 212 +++++++++++++++++------------------
 1 file changed, 106 insertions(+), 106 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 244f8cd38b25..deefc92c7c60 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1229,6 +1229,112 @@ int tb_port_update_credits(struct tb_port *port)
 	return tb_port_do_update_credits(port->dual_link_port);
 }
 
+static int __tb_port_pm_secondary_set(struct tb_port *port, bool secondary)
+{
+	u32 phy;
+	int ret;
+
+	ret = tb_port_read(port, &phy, TB_CFG_PORT,
+			   port->cap_phy + LANE_ADP_CS_1, 1);
+	if (ret)
+		return ret;
+
+	if (secondary)
+		phy |= LANE_ADP_CS_1_PMS;
+	else
+		phy &= ~LANE_ADP_CS_1_PMS;
+
+	return tb_port_write(port, &phy, TB_CFG_PORT,
+			     port->cap_phy + LANE_ADP_CS_1, 1);
+}
+
+static int tb_port_pm_secondary_enable(struct tb_port *port)
+{
+	return __tb_port_pm_secondary_set(port, true);
+}
+
+static int tb_port_pm_secondary_disable(struct tb_port *port)
+{
+	return __tb_port_pm_secondary_set(port, false);
+}
+
+/* Called for USB4 or Titan Ridge routers only */
+static bool tb_port_clx_supported(struct tb_port *port, enum tb_clx clx)
+{
+	u32 mask, val;
+	bool ret;
+
+	/* Don't enable CLx in case of two single-lane links */
+	if (!port->bonded && port->dual_link_port)
+		return false;
+
+	/* Don't enable CLx in case of inter-domain link */
+	if (port->xdomain)
+		return false;
+
+	if (tb_switch_is_usb4(port->sw)) {
+		if (!usb4_port_clx_supported(port))
+			return false;
+	} else if (!tb_lc_is_clx_supported(port)) {
+		return false;
+	}
+
+	switch (clx) {
+	case TB_CL1:
+		/* CL0s and CL1 are enabled and supported together */
+		mask = LANE_ADP_CS_0_CL0S_SUPPORT | LANE_ADP_CS_0_CL1_SUPPORT;
+		break;
+
+	/* For now we support only CL0s and CL1. Not CL2 */
+	case TB_CL2:
+	default:
+		return false;
+	}
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_phy + LANE_ADP_CS_0, 1);
+	if (ret)
+		return false;
+
+	return !!(val & mask);
+}
+
+static int __tb_port_clx_set(struct tb_port *port, enum tb_clx clx, bool enable)
+{
+	u32 phy, mask;
+	int ret;
+
+	/* CL0s and CL1 are enabled and supported together */
+	if (clx == TB_CL1)
+		mask = LANE_ADP_CS_1_CL0S_ENABLE | LANE_ADP_CS_1_CL1_ENABLE;
+	else
+		/* For now we support only CL0s and CL1. Not CL2 */
+		return -EOPNOTSUPP;
+
+	ret = tb_port_read(port, &phy, TB_CFG_PORT,
+			   port->cap_phy + LANE_ADP_CS_1, 1);
+	if (ret)
+		return ret;
+
+	if (enable)
+		phy |= mask;
+	else
+		phy &= ~mask;
+
+	return tb_port_write(port, &phy, TB_CFG_PORT,
+			     port->cap_phy + LANE_ADP_CS_1, 1);
+}
+
+static int tb_port_clx_disable(struct tb_port *port, enum tb_clx clx)
+{
+	return __tb_port_clx_set(port, clx, false);
+}
+
+static int tb_port_clx_enable(struct tb_port *port, enum tb_clx clx)
+{
+	return __tb_port_clx_set(port, clx, true);
+}
+
 static int tb_port_start_lane_initialization(struct tb_port *port)
 {
 	int ret;
@@ -3361,35 +3467,6 @@ struct tb_port *tb_switch_find_port(struct tb_switch *sw,
 	return NULL;
 }
 
-static int __tb_port_pm_secondary_set(struct tb_port *port, bool secondary)
-{
-	u32 phy;
-	int ret;
-
-	ret = tb_port_read(port, &phy, TB_CFG_PORT,
-			   port->cap_phy + LANE_ADP_CS_1, 1);
-	if (ret)
-		return ret;
-
-	if (secondary)
-		phy |= LANE_ADP_CS_1_PMS;
-	else
-		phy &= ~LANE_ADP_CS_1_PMS;
-
-	return tb_port_write(port, &phy, TB_CFG_PORT,
-			     port->cap_phy + LANE_ADP_CS_1, 1);
-}
-
-static int tb_port_pm_secondary_enable(struct tb_port *port)
-{
-	return __tb_port_pm_secondary_set(port, true);
-}
-
-static int tb_port_pm_secondary_disable(struct tb_port *port)
-{
-	return __tb_port_pm_secondary_set(port, false);
-}
-
 static int tb_switch_pm_secondary_resolve(struct tb_switch *sw)
 {
 	struct tb_switch *parent = tb_switch_parent(sw);
@@ -3408,83 +3485,6 @@ static int tb_switch_pm_secondary_resolve(struct tb_switch *sw)
 	return tb_port_pm_secondary_disable(down);
 }
 
-/* Called for USB4 or Titan Ridge routers only */
-static bool tb_port_clx_supported(struct tb_port *port, enum tb_clx clx)
-{
-	u32 mask, val;
-	bool ret;
-
-	/* Don't enable CLx in case of two single-lane links */
-	if (!port->bonded && port->dual_link_port)
-		return false;
-
-	/* Don't enable CLx in case of inter-domain link */
-	if (port->xdomain)
-		return false;
-
-	if (tb_switch_is_usb4(port->sw)) {
-		if (!usb4_port_clx_supported(port))
-			return false;
-	} else if (!tb_lc_is_clx_supported(port)) {
-		return false;
-	}
-
-	switch (clx) {
-	case TB_CL1:
-		/* CL0s and CL1 are enabled and supported together */
-		mask = LANE_ADP_CS_0_CL0S_SUPPORT | LANE_ADP_CS_0_CL1_SUPPORT;
-		break;
-
-	/* For now we support only CL0s and CL1. Not CL2 */
-	case TB_CL2:
-	default:
-		return false;
-	}
-
-	ret = tb_port_read(port, &val, TB_CFG_PORT,
-			   port->cap_phy + LANE_ADP_CS_0, 1);
-	if (ret)
-		return false;
-
-	return !!(val & mask);
-}
-
-static int __tb_port_clx_set(struct tb_port *port, enum tb_clx clx, bool enable)
-{
-	u32 phy, mask;
-	int ret;
-
-	/* CL0s and CL1 are enabled and supported together */
-	if (clx == TB_CL1)
-		mask = LANE_ADP_CS_1_CL0S_ENABLE | LANE_ADP_CS_1_CL1_ENABLE;
-	else
-		/* For now we support only CL0s and CL1. Not CL2 */
-		return -EOPNOTSUPP;
-
-	ret = tb_port_read(port, &phy, TB_CFG_PORT,
-			   port->cap_phy + LANE_ADP_CS_1, 1);
-	if (ret)
-		return ret;
-
-	if (enable)
-		phy |= mask;
-	else
-		phy &= ~mask;
-
-	return tb_port_write(port, &phy, TB_CFG_PORT,
-			     port->cap_phy + LANE_ADP_CS_1, 1);
-}
-
-static int tb_port_clx_disable(struct tb_port *port, enum tb_clx clx)
-{
-	return __tb_port_clx_set(port, clx, false);
-}
-
-static int tb_port_clx_enable(struct tb_port *port, enum tb_clx clx)
-{
-	return __tb_port_clx_set(port, clx, true);
-}
-
 static int __tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx)
 {
 	struct tb_switch *parent = tb_switch_parent(sw);
-- 
2.35.1

