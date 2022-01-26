Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFAFA49CC15
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 15:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242034AbiAZOQm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 09:16:42 -0500
Received: from mga18.intel.com ([134.134.136.126]:49392 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235496AbiAZOQm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Jan 2022 09:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643206602; x=1674742602;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YXYbZOGPBz6o6Fcig7v5+o4Pnujq7RNYVb/99zu4GRc=;
  b=HG1bVCfgA6IM/IzW8vEJoQkqRnVa43I72PciLajL2x9uHphgoInaTL8h
   jOjirFkwA0nXSML1WQ8z6h/7q5EwCcia7W9uroeXk1/mS2MCgIBlFaFds
   RMnNMx5YiRs7oK/ui2vfppjNESV5/9kSg4DzPwNx6YztrbkBIlJodx0Nd
   RjzeUsM97A5qj5mxSxyc58h1gSmsiCq+oqICgNkP9IAxTa0dGH+JMc/GJ
   Ieei6qrJhfgOUdvmexLvB9Fj7qzo408P0s7+OMEGaW3A6Qv4ECMCNaL5y
   hK9eZMiA6PMeV6Ts1h+NNoTW2AHSBDs4OMi/9imTpeF5wRqOGpkc4wEf1
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="230130906"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="230130906"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 06:16:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="532770291"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 26 Jan 2022 06:16:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 392BA40C; Wed, 26 Jan 2022 16:16:53 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/3] thunderbolt: Disable LTTPR on Intel Titan Ridge
Date:   Wed, 26 Jan 2022 17:16:53 +0300
Message-Id: <20220126141653.28092-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126141653.28092-1-mika.westerberg@linux.intel.com>
References: <20220126141653.28092-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Intel Titan Ridge does not disable AUX timers when it gets SET_CONFIG
with SET_LTTPR_MODE set which makes DP tunneling to fail. For this
reason disable LTTPR on Titan Ridge device side.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb_regs.h |  1 +
 drivers/thunderbolt/tunnel.c  | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index dc00cbd69d36..70795a2aa9bb 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -389,6 +389,7 @@ struct tb_regs_port_header {
 #define DP_COMMON_CAP_1_LANE			0x0
 #define DP_COMMON_CAP_2_LANES			0x1
 #define DP_COMMON_CAP_4_LANES			0x2
+#define DP_COMMON_CAP_LTTPR_NS			BIT(27)
 #define DP_COMMON_CAP_DPRX_DONE			BIT(31)
 
 /* PCIe adapter registers */
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index a473cc7d9a8d..118742ec93ed 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -580,6 +580,16 @@ static int tb_dp_xchg_caps(struct tb_tunnel *tunnel)
 		out_dp_cap = tb_dp_cap_set_lanes(out_dp_cap, new_lanes);
 	}
 
+	/*
+	 * Titan Ridge does not disable AUX timers when it gets
+	 * SET_CONFIG with SET_LTTPR_MODE set. This causes problems with
+	 * DP tunneling.
+	 */
+	if (tb_route(out->sw) && tb_switch_is_titan_ridge(out->sw)) {
+		out_dp_cap |= DP_COMMON_CAP_LTTPR_NS;
+		tb_port_dbg(out, "disabling LTTPR\n");
+	}
+
 	return tb_port_write(in, &out_dp_cap, TB_CFG_PORT,
 			     in->cap_adap + DP_REMOTE_CAP, 1);
 }
-- 
2.34.1

