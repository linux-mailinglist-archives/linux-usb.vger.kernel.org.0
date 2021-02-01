Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E196930B245
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 22:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhBAVrF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 16:47:05 -0500
Received: from mga09.intel.com ([134.134.136.24]:56832 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229704AbhBAVrB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 16:47:01 -0500
IronPort-SDR: Z3yolrDVh0oazemumji18KjEuHPzUeAdA7c753Ev6N5jlQa6ng6T6SDmM9bAephwqxYlQqifd6
 rQq/UwTkMrpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180901363"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="180901363"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 13:46:17 -0800
IronPort-SDR: +wuEcCCB7PFGgDRqnarp9hsSqqljqb1v2qn3f6JU2Ki1lFQAxskRdw/6GCCKmY1dpCU2jKTpA+
 Gr8HUtFIk7Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="354638630"
Received: from ccdtglu46.jer.intel.com ([10.12.50.142])
  by fmsmga007.fm.intel.com with ESMTP; 01 Feb 2021 13:46:14 -0800
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH] thunderbolt: debugfs: handle fail reading block
Date:   Mon,  1 Feb 2021 23:46:37 +0200
Message-Id: <20210201214637.2158-1-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There are cases when reading block of dwords in single transaction fail,
for several reasons, mostly if HW publish to implement all of the dwords,
while actually it doesn't or if some dwords not accessible for read
for security reasons. We handle these cases by trying to read the block,
dword-by-dword, one dword per transaction, till we get a failure.
We drop the not-used functions:
tb_switch_is_tiger_lake() and tb_switch_is_ice_lake()

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/debugfs.c | 38 +++++++++++++++++++++++------------
 drivers/thunderbolt/tb.h      | 27 -------------------------
 2 files changed, 25 insertions(+), 40 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 9541d7409ab1..f1012eed9511 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -251,6 +251,30 @@ static ssize_t counters_write(struct file *file, const char __user *user_buf,
 	return ret < 0 ? ret : count;
 }
 
+static void cap_show_by_dw(struct seq_file *s, struct tb_switch *sw,
+			   struct tb_port *port, unsigned int cap, unsigned int offset,
+			   u8 cap_id, u8 vsec_id, int dwords)
+{
+	int i, ret;
+	u32 data;
+
+	for (i = 0; i < dwords; i++) {
+		if (port)
+			ret = tb_port_read(port, &data, TB_CFG_PORT, cap + offset + i, 1);
+		else
+			ret = tb_sw_read(sw, &data, TB_CFG_SWITCH, cap + offset + i, 1);
+		if (ret) {
+			seq_printf(s, "0x%04x <not accessible>\n", cap + offset);
+			if (dwords - i > 1)
+				seq_printf(s, "0x%04x ...\n", cap + offset + 1);
+			return;
+		}
+
+		seq_printf(s, "0x%04x %4d 0x%02x 0x%02x 0x%08x\n", cap + offset + i,
+			   offset + i, cap_id, vsec_id, data);
+	}
+}
+
 static void cap_show(struct seq_file *s, struct tb_switch *sw,
 		     struct tb_port *port, unsigned int cap, u8 cap_id,
 		     u8 vsec_id, int length)
@@ -267,10 +291,7 @@ static void cap_show(struct seq_file *s, struct tb_switch *sw,
 		else
 			ret = tb_sw_read(sw, data, TB_CFG_SWITCH, cap + offset, dwords);
 		if (ret) {
-			seq_printf(s, "0x%04x <not accessible>\n",
-				   cap + offset);
-			if (dwords > 1)
-				seq_printf(s, "0x%04x ...\n", cap + offset + 1);
+			cap_show_by_dw(s, sw, port, cap, offset, cap_id, vsec_id, dwords);
 			return;
 		}
 
@@ -341,15 +362,6 @@ static void port_cap_show(struct tb_port *port, struct seq_file *s,
 		} else {
 			length = header.extended_short.length;
 			vsec_id = header.extended_short.vsec_id;
-			/*
-			 * Ice Lake and Tiger Lake do not implement the
-			 * full length of the capability, only first 32
-			 * dwords so hard-code it here.
-			 */
-			if (!vsec_id &&
-			    (tb_switch_is_ice_lake(port->sw) ||
-			     tb_switch_is_tiger_lake(port->sw)))
-				length = 32;
 		}
 		break;
 
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 49d34c45e10b..39dc4dd5302d 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -796,33 +796,6 @@ static inline bool tb_switch_is_titan_ridge(const struct tb_switch *sw)
 	return false;
 }
 
-static inline bool tb_switch_is_ice_lake(const struct tb_switch *sw)
-{
-	if (sw->config.vendor_id == PCI_VENDOR_ID_INTEL) {
-		switch (sw->config.device_id) {
-		case PCI_DEVICE_ID_INTEL_ICL_NHI0:
-		case PCI_DEVICE_ID_INTEL_ICL_NHI1:
-			return true;
-		}
-	}
-	return false;
-}
-
-static inline bool tb_switch_is_tiger_lake(const struct tb_switch *sw)
-{
-	if (sw->config.vendor_id == PCI_VENDOR_ID_INTEL ||
-	    sw->config.vendor_id == 0x8087) {
-		switch (sw->config.device_id) {
-		case PCI_DEVICE_ID_INTEL_TGL_NHI0:
-		case PCI_DEVICE_ID_INTEL_TGL_NHI1:
-		case PCI_DEVICE_ID_INTEL_TGL_H_NHI0:
-		case PCI_DEVICE_ID_INTEL_TGL_H_NHI1:
-			return true;
-		}
-	}
-	return false;
-}
-
 /**
  * tb_switch_is_usb4() - Is the switch USB4 compliant
  * @sw: Switch to check
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

