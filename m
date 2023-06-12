Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 931A072BB49
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jun 2023 10:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233555AbjFLIxi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jun 2023 04:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233927AbjFLIxE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 04:53:04 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05447210C
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 01:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686559943; x=1718095943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y2YobN/E4kGk5ZU1Uth/c4ac3L1l0yCi9BZbTpt+t18=;
  b=LvJ5cxDaIXK6pfcWzU3qZP2F4Qa0z2UZp6fLOKgNKUgNLaQeDXvOoZkT
   KEmd0E1MBRBCA/XLY5dET+qtbX+qLTJZjpny/yQCEsKkEHMLTVJa8xVPI
   DDOt7lsUjuwuJRp8Dt+K6E34BRMX03TqvefFEoR97x/55m2VlWV0sDk1i
   flCggSBUozoDr2w2qjsS5q53XjKVq7r5EARjfXcLecqQekbCFYgbuoftK
   n05JfreMYqi2t+vruJxanC48I3ytkHM/xbDzJWAIg3b5KIfEGf5sA6U3t
   HqV+UEr643/Nk+n1BFFOroNX3f2A+VFK6+GEKfBtfpysSgYCOCtH20FzH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347627270"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347627270"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 01:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="744247748"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="744247748"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 01:21:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id A504F765; Mon, 12 Jun 2023 11:21:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Gil Fine <gil.fine@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 08/20] thunderbolt: Enable USB4 v2 PCIe TLP/DLLP extended encapsulation
Date:   Mon, 12 Jun 2023 11:21:33 +0300
Message-Id: <20230612082145.62218-9-mika.westerberg@linux.intel.com>
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

USB4 v2 spec introduces modified encapsulation of PCIe TLP and DLLP
packets. This improves the PCIe tunneled traffic usage by reducing
overhead. Enable this if both sides of the link support it.

Signed-off-by: Gil Fine <gil.fine@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h      |  2 ++
 drivers/thunderbolt/tb_regs.h |  2 ++
 drivers/thunderbolt/tunnel.c  | 37 ++++++++++++++++++++++++++++++++---
 drivers/thunderbolt/usb4.c    | 34 ++++++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 845e851012e5..002e0426a82c 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1301,6 +1301,8 @@ int usb4_dp_port_allocated_bw(struct tb_port *port);
 int usb4_dp_port_allocate_bw(struct tb_port *port, int bw);
 int usb4_dp_port_requested_bw(struct tb_port *port);
 
+int usb4_pci_port_set_ext_encapsulation(struct tb_port *port, bool enable);
+
 static inline bool tb_is_usb4_port_device(const struct device *dev)
 {
 	return dev->type == &usb4_port_device_type;
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index c8e40ef09903..549cc79c7313 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -451,6 +451,8 @@ struct tb_regs_port_header {
 /* PCIe adapter registers */
 #define ADP_PCIE_CS_0				0x00
 #define ADP_PCIE_CS_0_PE			BIT(31)
+#define ADP_PCIE_CS_1				0x01
+#define ADP_PCIE_CS_1_EE			BIT(0)
 
 /* USB adapter registers */
 #define ADP_USB3_CS_0				0x00
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 7df5f90e21d4..f1d0ab2b39a2 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -153,18 +153,49 @@ static struct tb_tunnel *tb_tunnel_alloc(struct tb *tb, size_t npaths,
 	return tunnel;
 }
 
+static int tb_pci_set_ext_encapsulation(struct tb_tunnel *tunnel, bool enable)
+{
+	int ret;
+
+	/* Only supported of both routers are at least USB4 v2 */
+	if (usb4_switch_version(tunnel->src_port->sw) < 2 ||
+	    usb4_switch_version(tunnel->dst_port->sw) < 2)
+		return 0;
+
+	ret = usb4_pci_port_set_ext_encapsulation(tunnel->src_port, enable);
+	if (ret)
+		return ret;
+
+	ret = usb4_pci_port_set_ext_encapsulation(tunnel->dst_port, enable);
+	if (ret)
+		return ret;
+
+	tb_tunnel_dbg(tunnel, "extended encapsulation %sabled\n",
+		      enable ? "en" : "dis");
+	return 0;
+}
+
 static int tb_pci_activate(struct tb_tunnel *tunnel, bool activate)
 {
 	int res;
 
+	if (activate) {
+		res = tb_pci_set_ext_encapsulation(tunnel, activate);
+		if (res)
+			return res;
+	}
+
 	res = tb_pci_port_enable(tunnel->src_port, activate);
 	if (res)
 		return res;
 
-	if (tb_port_is_pcie_up(tunnel->dst_port))
-		return tb_pci_port_enable(tunnel->dst_port, activate);
+	if (tb_port_is_pcie_up(tunnel->dst_port)) {
+		res = tb_pci_port_enable(tunnel->dst_port, activate);
+		if (res)
+			return res;
+	}
 
-	return 0;
+	return activate ? 0 : tb_pci_set_ext_encapsulation(tunnel, activate);
 }
 
 static int tb_pci_init_credits(struct tb_path_hop *hop)
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 9f5a98347bee..b80972cb5b9d 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -2796,3 +2796,37 @@ int usb4_dp_port_requested_bw(struct tb_port *port)
 
 	return (val & ADP_DP_CS_8_REQUESTED_BW_MASK) * granularity;
 }
+
+/**
+ * usb4_pci_port_set_ext_encapsulation() - Enable/disable extended encapsulation
+ * @port: PCIe adapter
+ * @enable: Enable/disable extended encapsulation
+ *
+ * Can be called to any adapter. Enables or disables extended
+ * encapsulation used in PCIe tunneling. Returns %0 on success and
+ * negative errno otherwise.
+ */
+int usb4_pci_port_set_ext_encapsulation(struct tb_port *port, bool enable)
+{
+	u32 val;
+	int ret;
+
+	if (!tb_port_is_pcie_up(port) && !tb_port_is_pcie_down(port))
+		return 0;
+
+	if (usb4_switch_version(port->sw) < 2)
+		return 0;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_PCIE_CS_1, 1);
+	if (ret)
+		return ret;
+
+	if (enable)
+		val |= ADP_PCIE_CS_1_EE;
+	else
+		val &= ~ADP_PCIE_CS_1_EE;
+
+	return tb_port_write(port, &val, TB_CFG_PORT,
+			     port->cap_adap + ADP_PCIE_CS_1, 1);
+}
-- 
2.39.2

