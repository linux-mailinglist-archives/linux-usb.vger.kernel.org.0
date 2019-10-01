Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0786DC32BD
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 13:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732589AbfJALik (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 07:38:40 -0400
Received: from mga02.intel.com ([134.134.136.20]:39070 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732559AbfJALij (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 07:38:39 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 04:38:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; 
   d="scan'208";a="191434929"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 01 Oct 2019 04:38:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 4D65C4E5; Tue,  1 Oct 2019 14:38:31 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
        Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mario.Limonciello@dell.com,
        Anthony Wong <anthony.wong@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 10/22] thunderbolt: Convert PCIe adapter register names to use USB4 names
Date:   Tue,  1 Oct 2019 14:38:18 +0300
Message-Id: <20191001113830.13028-11-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
References: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Now that USB4 spec has names for these PCIe adapter registers we can use
them instead. This makes it easier to match certain register to the spec.

No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c  | 10 ++++++----
 drivers/thunderbolt/tb_regs.h |  4 ++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 8d17398e3349..2079e6065038 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -929,10 +929,11 @@ bool tb_pci_port_is_enabled(struct tb_port *port)
 {
 	u32 data;
 
-	if (tb_port_read(port, &data, TB_CFG_PORT, port->cap_adap, 1))
+	if (tb_port_read(port, &data, TB_CFG_PORT,
+			 port->cap_adap + ADP_PCIE_CS_0, 1))
 		return false;
 
-	return !!(data & TB_PCI_EN);
+	return !!(data & ADP_PCIE_CS_0_PE);
 }
 
 /**
@@ -942,10 +943,11 @@ bool tb_pci_port_is_enabled(struct tb_port *port)
  */
 int tb_pci_port_enable(struct tb_port *port, bool enable)
 {
-	u32 word = enable ? TB_PCI_EN : 0x0;
+	u32 word = enable ? ADP_PCIE_CS_0_PE : 0x0;
 	if (!port->cap_adap)
 		return -ENXIO;
-	return tb_port_write(port, &word, TB_CFG_PORT, port->cap_adap, 1);
+	return tb_port_write(port, &word, TB_CFG_PORT,
+			     port->cap_adap + ADP_PCIE_CS_0, 1);
 }
 
 /**
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 0ac22fc26a5f..cd03d160634c 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -258,8 +258,8 @@ struct tb_regs_port_header {
 #define TB_DP_REMOTE_CAP		0x5
 
 /* PCIe adapter registers */
-
-#define TB_PCI_EN			BIT(31)
+#define ADP_PCIE_CS_0				0x00
+#define ADP_PCIE_CS_0_PE			BIT(31)
 
 /* Hop register from TB_CFG_HOPS. 8 byte per entry. */
 struct tb_regs_hop {
-- 
2.23.0

