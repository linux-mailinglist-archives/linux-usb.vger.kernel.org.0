Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD8C6ABE4F
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 12:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbjCFLhB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 06:37:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjCFLhA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 06:37:00 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03172BB94
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 03:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678102618; x=1709638618;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g+NGdUgQV7G/JaTCAaewWGrAkQ841VA95rmyIGf4fUE=;
  b=Y/R1AODVdx++0sy6ZJdxC31wzWftQaY5Iswacd8C7c90r5KQWWyRKJ1s
   gsAS1RrySXHIYTkQgb+GXtsJfILClWMwUJ9JSMGFJg7FIYYnBbX1azuPa
   hKK/2sBq4vzqDjjxu4VWs8fLiEuEfUrvB09OkLhD5l+mBjqrkowlxJ23A
   yTUu02/aCLw8r/yP/dA2XH/UGwkileZ63Ep6XBbHE0Vu25h+4ZgbAY8YA
   3nQWpRv1AADej+/19RPBWl+G5/klWptai6DSU/tderOgUEAs5ppmF5thS
   99trhp6ooJOUlmNg7FSqwrjf8oY2xYj2y3G8NEsOqoXgLRgTXQGH2wRFX
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="363147604"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="363147604"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 03:35:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="745024095"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="745024095"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 06 Mar 2023 03:35:22 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 264D514F; Mon,  6 Mar 2023 13:36:06 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        =?UTF-8?q?Christian=20Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/5] thunderbolt: Add missing UNSET_INBOUND_SBTX for retimer access
Date:   Mon,  6 Mar 2023 13:36:02 +0200
Message-Id: <20230306113605.46137-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230306113605.46137-1-mika.westerberg@linux.intel.com>
References: <20230306113605.46137-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Gil Fine <gil.fine@linux.intel.com>

According to USB4 retimer specification, the process of firmware update
sequence requires issuing a SET_INBOUND_SBTX port operation that later
shall be followed by UNSET_INBOUND_SBTX port operation. This last step
is not currently issued by the driver but it is necessary to make sure
the retimers are put back to passthrough mode even during enumeration.

If this step is missing the link may not come up properly after
soft-reboot for example.

For this reason issue UNSET_INBOUND_SBTX after SET_INBOUND_SBTX for
enumeration and also when the NVM upgrade is run.

Reported-by: Christian Schaubschläger <christian.schaubschlaeger@gmx.at>
Link: https://lore.kernel.org/linux-usb/b556f5ed-5ee8-9990-9910-afd60db93310@gmx.at/
Cc: stable@vger.kernel.org
Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/retimer.c | 23 +++++++++++++++++++++--
 drivers/thunderbolt/sb_regs.h |  1 +
 drivers/thunderbolt/tb.h      |  1 +
 drivers/thunderbolt/usb4.c    | 14 ++++++++++++++
 4 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 56008eb91e2e..9cc28197dbc4 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -187,6 +187,22 @@ static ssize_t nvm_authenticate_show(struct device *dev,
 	return ret;
 }
 
+static void tb_retimer_set_inbound_sbtx(struct tb_port *port)
+{
+	int i;
+
+	for (i = 1; i <= TB_MAX_RETIMER_INDEX; i++)
+		usb4_port_retimer_set_inbound_sbtx(port, i);
+}
+
+static void tb_retimer_unset_inbound_sbtx(struct tb_port *port)
+{
+	int i;
+
+	for (i = TB_MAX_RETIMER_INDEX; i >= 1; i--)
+		usb4_port_retimer_unset_inbound_sbtx(port, i);
+}
+
 static ssize_t nvm_authenticate_store(struct device *dev,
 	struct device_attribute *attr, const char *buf, size_t count)
 {
@@ -213,6 +229,7 @@ static ssize_t nvm_authenticate_store(struct device *dev,
 	rt->auth_status = 0;
 
 	if (val) {
+		tb_retimer_set_inbound_sbtx(rt->port);
 		if (val == AUTHENTICATE_ONLY) {
 			ret = tb_retimer_nvm_authenticate(rt, true);
 		} else {
@@ -232,6 +249,7 @@ static ssize_t nvm_authenticate_store(struct device *dev,
 	}
 
 exit_unlock:
+	tb_retimer_unset_inbound_sbtx(rt->port);
 	mutex_unlock(&rt->tb->lock);
 exit_rpm:
 	pm_runtime_mark_last_busy(&rt->dev);
@@ -440,8 +458,7 @@ int tb_retimer_scan(struct tb_port *port, bool add)
 	 * Enable sideband channel for each retimer. We can do this
 	 * regardless whether there is device connected or not.
 	 */
-	for (i = 1; i <= TB_MAX_RETIMER_INDEX; i++)
-		usb4_port_retimer_set_inbound_sbtx(port, i);
+	tb_retimer_set_inbound_sbtx(port);
 
 	/*
 	 * Before doing anything else, read the authentication status.
@@ -464,6 +481,8 @@ int tb_retimer_scan(struct tb_port *port, bool add)
 			break;
 	}
 
+	tb_retimer_unset_inbound_sbtx(port);
+
 	if (!last_idx)
 		return 0;
 
diff --git a/drivers/thunderbolt/sb_regs.h b/drivers/thunderbolt/sb_regs.h
index 5185cf3e4d97..f37a4320f10a 100644
--- a/drivers/thunderbolt/sb_regs.h
+++ b/drivers/thunderbolt/sb_regs.h
@@ -20,6 +20,7 @@ enum usb4_sb_opcode {
 	USB4_SB_OPCODE_ROUTER_OFFLINE = 0x4e45534c,		/* "LSEN" */
 	USB4_SB_OPCODE_ENUMERATE_RETIMERS = 0x4d554e45,		/* "ENUM" */
 	USB4_SB_OPCODE_SET_INBOUND_SBTX = 0x5055534c,		/* "LSUP" */
+	USB4_SB_OPCODE_UNSET_INBOUND_SBTX = 0x50555355,		/* "USUP" */
 	USB4_SB_OPCODE_QUERY_LAST_RETIMER = 0x5453414c,		/* "LAST" */
 	USB4_SB_OPCODE_GET_NVM_SECTOR_SIZE = 0x53534e47,	/* "GNSS" */
 	USB4_SB_OPCODE_NVM_SET_OFFSET = 0x53504f42,		/* "BOPS" */
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 64968c162ec7..b3cd13dc783b 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1242,6 +1242,7 @@ int usb4_port_sw_margin(struct tb_port *port, unsigned int lanes, bool timing,
 int usb4_port_sw_margin_errors(struct tb_port *port, u32 *errors);
 
 int usb4_port_retimer_set_inbound_sbtx(struct tb_port *port, u8 index);
+int usb4_port_retimer_unset_inbound_sbtx(struct tb_port *port, u8 index);
 int usb4_port_retimer_read(struct tb_port *port, u8 index, u8 reg, void *buf,
 			   u8 size);
 int usb4_port_retimer_write(struct tb_port *port, u8 index, u8 reg,
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 1e5e9c147a31..95ff02395822 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1578,6 +1578,20 @@ int usb4_port_retimer_set_inbound_sbtx(struct tb_port *port, u8 index)
 				    500);
 }
 
+/**
+ * usb4_port_retimer_unset_inbound_sbtx() - Disable sideband channel transactions
+ * @port: USB4 port
+ * @index: Retimer index
+ *
+ * Disables sideband channel transations on SBTX. The reverse of
+ * usb4_port_retimer_set_inbound_sbtx().
+ */
+int usb4_port_retimer_unset_inbound_sbtx(struct tb_port *port, u8 index)
+{
+	return usb4_port_retimer_op(port, index,
+				    USB4_SB_OPCODE_UNSET_INBOUND_SBTX, 500);
+}
+
 /**
  * usb4_port_retimer_read() - Read from retimer sideband registers
  * @port: USB4 port
-- 
2.39.1

