Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1294A717B44
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 11:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234557AbjEaJHy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 05:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235387AbjEaJHi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 05:07:38 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C9A113
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 02:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685524049; x=1717060049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7vclaYdL/x17BBOWAxh90k3pT1CpDtqepou/mmT3jj4=;
  b=EoDHaYW54gvEvGuqvYcj4RONquAWNRU/5fJzEKYFedTwWnS9D//1fbva
   ThQ9yWKPhhfHZOWMNmiEQgSLzTNPe4DgqnIY1ToJWiDjHeLWq4rag3FW4
   /+4H3P+Ktv2ae2aI7/C9mhQSPI29IaUyU2g3qppPoNsuCuA5rSoDsySok
   O8rlQ7qcu6W1dM2HTh0vWWcY/9pNyf5S3PyS3RuFkne5ZWZT06xEac0Hx
   ZxiJcTwDsycdkUNnvsdLnNEXQVEmnQL9i5WK2Zy2krX9tiz3tVQtzifzl
   5X88vpAyNAfaW7WqRBDcYm9rX6EQm+Ws0FrC4m7GPI9aoO16hmh2TPN1q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="354027672"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="354027672"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 02:06:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="657247253"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="657247253"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 31 May 2023 02:06:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 33F85916; Wed, 31 May 2023 12:06:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Christian Kellner <ckellner@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 08/20] thunderbolt: Enable USB4 v2 PCIe TLP/DLLP extended encapsulation
Date:   Wed, 31 May 2023 12:06:33 +0300
Message-Id: <20230531090645.5573-9-mika.westerberg@linux.intel.com>
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
index ca2888a8b703..e1f1ed7dd60c 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1302,6 +1302,8 @@ int usb4_dp_port_allocated_bw(struct tb_port *port);
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

