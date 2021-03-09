Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E319C3321DC
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 10:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbhCIJXP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 04:23:15 -0500
Received: from mga07.intel.com ([134.134.136.100]:15813 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229924AbhCIJWv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Mar 2021 04:22:51 -0500
IronPort-SDR: pgPTueDkkGs00s86SPA+8tSHL0okL+CXE1YqSo2IP3sYJtV11Hg2tNdBDLuyutvIynWNitJa60
 vSmXgIw4HALg==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="252216754"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="252216754"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 01:22:49 -0800
IronPort-SDR: ugsy72p/NstETdFW9PIOAQx6/vZL9pvjbvb000nRdOy+Xb7aoOoRSyaMUenCse4DrusglvW+Ls
 1NGJOiYV0ryg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="408578633"
Received: from ccdjlinux26.jer.intel.com ([10.12.48.253])
  by orsmga007.jf.intel.com with ESMTP; 09 Mar 2021 01:22:47 -0800
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH] thunderbolt: debugfs: Show all accessible dwords
Date:   Tue,  9 Mar 2021 11:23:30 +0200
Message-Id: <20210309092330.5813-1-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently, when first failure occurs while reading of the block,
we stop reading the block and jump to the next capability.
This doesn't cover the case of block with "holes" of inaccessible
dwords, followed by accessible dwords.
This patch address this problem.
In case of failure while reading the complete block in one transaction,
(because of one or more dwords is inaccessible), we read the remaining
dwords of the block dword-by-dword, one dword per transaction,
till the end of the block.
By doing this, we handle the case of block with "holes" of inaccessible
dwords, followed by accessible dwords. The accessible dwords are shown
with the fields: <offset> <relative_offset> <cap_id> <vs_cap_id> <value>
E.g.:
0x01eb  236 0x05 0x06 0x0000d166
While the inaccesible dwords are shown as: <offset> <not accessible>
E.g.:
0x01ed <not accessible>

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/debugfs.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 201036507cb8..c850b0ac098c 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -265,10 +265,8 @@ static void cap_show_by_dw(struct seq_file *s, struct tb_switch *sw,
 		else
 			ret = tb_sw_read(sw, &data, TB_CFG_SWITCH, cap + offset + i, 1);
 		if (ret) {
-			seq_printf(s, "0x%04x <not accessible>\n", cap + offset);
-			if (dwords - i > 1)
-				seq_printf(s, "0x%04x ...\n", cap + offset + 1);
-			return;
+			seq_printf(s, "0x%04x <not accessible>\n", cap + offset + i);
+			continue;
 		}
 
 		seq_printf(s, "0x%04x %4d 0x%02x 0x%02x 0x%08x\n", cap + offset + i,
@@ -292,7 +290,7 @@ static void cap_show(struct seq_file *s, struct tb_switch *sw,
 		else
 			ret = tb_sw_read(sw, data, TB_CFG_SWITCH, cap + offset, dwords);
 		if (ret) {
-			cap_show_by_dw(s, sw, port, cap, offset, cap_id, vsec_id, dwords);
+			cap_show_by_dw(s, sw, port, cap, offset, cap_id, vsec_id, length);
 			return;
 		}
 
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

