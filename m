Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1044131CADC
	for <lists+linux-usb@lfdr.de>; Tue, 16 Feb 2021 14:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbhBPNF6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Feb 2021 08:05:58 -0500
Received: from mga14.intel.com ([192.55.52.115]:46343 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229784AbhBPNF5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Feb 2021 08:05:57 -0500
IronPort-SDR: qG2/BkeQqX/v/vHg2XTkn/W1gKaJrAa8w1ozO/u3rwzVqSmfVjgT5q4nENoc2zecaR+kbOjqRC
 0lLunJ9OkHUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="182098037"
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="182098037"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 05:04:55 -0800
IronPort-SDR: qk7OTejG93D1uTeGA8vUQ3SD9u3vbdsWWvKEF0/apQiS/tLdB/maOD4d2XE3CPF8MyBU8FDgkk
 7uTrIgzdNANQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="512524051"
Received: from ccdtglu46.jer.intel.com ([10.12.50.142])
  by orsmga004.jf.intel.com with ESMTP; 16 Feb 2021 05:04:53 -0800
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v2 1/2] thunderbolt: debugfs: handle fail reading block
Date:   Tue, 16 Feb 2021 15:04:26 +0200
Message-Id: <20210216130427.7317-2-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210216130427.7317-1-gil.fine@intel.com>
References: <20210216130427.7317-1-gil.fine@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There are cases when reading block of dwords in single transaction fail,
for several reasons, mostly if HW publish to implement all of the dwords,
while actually it doesn't or if some dwords not accessible for read
for security reasons. We handle these cases by trying to read the block,
dword-by-dword, one dword per transaction, till we get a failure.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/debugfs.c | 38 +++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 13 deletions(-)

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
 
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

