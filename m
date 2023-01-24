Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD796793AB
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jan 2023 10:09:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233119AbjAXJJI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Jan 2023 04:09:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232827AbjAXJJG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Jan 2023 04:09:06 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6FE33A85A
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 01:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674551345; x=1706087345;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LEHelsAi7XkgV18EkkVKHefJtHLvN2IdJSffJIEWRbk=;
  b=ebEKDC8GjvxtXsPttcXBOQYJPepdJdANzIoR/pz/YKpWcM73KNo2E+Hz
   BsN+6qxoeikG4/f3tihs5X2EbNM/4ZQQqJUM9GzS/jDxA8y/zVo3gPKsA
   UyKrQHp6sty3qDfRbbhxLPOpzSXaEiD6xZSeaV/omHBL6ZL3YS+7TuS3M
   o4DVLSAEhL3MB7KMYVISj01Y47VqtjqwZufwAnoDFfh9Dn+Snt1QM9iMN
   aXya32k4VY+0kzwAmto4wfXv1Jt5pcKnaRWfVD9oVlDGSifrpsrnEXuWD
   d2kz7qVaNHl/20wNqckWLM/8xMlMu/18SrjjK8aA4yJlpw8/nZpBYvMmW
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="327511725"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="327511725"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 01:09:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="639510354"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="639510354"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 24 Jan 2023 01:09:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 44FE0154; Tue, 24 Jan 2023 11:09:39 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/2] thunderbolt: Handle bandwidth allocation mode enablement notification
Date:   Tue, 24 Jan 2023 11:09:37 +0200
Message-Id: <20230124090938.58825-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
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

When the graphics side enables bandwidth allocation mode the DP IN
adapter sends notification to the connection manager about this.
Currently the handler misses this and tries to allocate 0 Mb/s that then
makes the graphics side to think the request failed.

Fix this by properly handling the enablement notification.

Fixes: 6ce3563520be ("thunderbolt: Add support for DisplayPort bandwidth allocation mode")
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c   | 10 +++++++---
 drivers/thunderbolt/usb4.c |  7 ++++---
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 0b891d749a96..7bfbc9ca9ba4 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1756,11 +1756,15 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 		goto unlock;
 	}
 
-	requested_bw = usb4_dp_port_requested_bw(in);
-	if (requested_bw < 0) {
-		tb_port_dbg(in, "no bandwidth request active\n");
+	ret = usb4_dp_port_requested_bw(in);
+	if (ret < 0) {
+		if (ret == -ENODATA)
+			tb_port_dbg(in, "no bandwidth request active\n");
+		else
+			tb_port_warn(in, "failed to read requested bandwidth\n");
 		goto unlock;
 	}
+	requested_bw = ret;
 
 	tb_port_dbg(in, "requested bandwidth %d Mb/s\n", requested_bw);
 
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 2a9266fb5c0f..1e5e9c147a31 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -2732,7 +2732,8 @@ int usb4_dp_port_allocate_bw(struct tb_port *port, int bw)
  * Reads the DPCD (graphics driver) requested bandwidth and returns it
  * in Mb/s. Takes the programmed granularity into account. In case of
  * error returns negative errno. Specifically returns %-EOPNOTSUPP if
- * the adapter does not support bandwidth allocation mode.
+ * the adapter does not support bandwidth allocation mode, and %ENODATA
+ * if there is no active bandwidth request from the graphics driver.
  */
 int usb4_dp_port_requested_bw(struct tb_port *port)
 {
@@ -2750,10 +2751,10 @@ int usb4_dp_port_requested_bw(struct tb_port *port)
 	ret = tb_port_read(port, &val, TB_CFG_PORT,
 			   port->cap_adap + ADP_DP_CS_8, 1);
 	if (ret)
-		return 0;
+		return ret;
 
 	if (!(val & ADP_DP_CS_8_DR))
-		return 0;
+		return -ENODATA;
 
 	return (val & ADP_DP_CS_8_REQUESTED_BW_MASK) * granularity;
 }
-- 
2.39.0

