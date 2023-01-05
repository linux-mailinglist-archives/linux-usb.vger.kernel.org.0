Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3795565EA0A
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jan 2023 12:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbjAELf6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Jan 2023 06:35:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232540AbjAELfc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Jan 2023 06:35:32 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D273058D09
        for <linux-usb@vger.kernel.org>; Thu,  5 Jan 2023 03:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672918531; x=1704454531;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gri5pJFQl2oXTg4jkiEbCHhui0Kgxbdg/Z6/h+IPNXU=;
  b=YEACJ+hqFFQsJ/ZGT/tznRcM/T+Jv2McwDoF7CGhT7AfLdmGAum3C0Hx
   Im8+20j7dbTSS2kDp8NgLr9O4D6aGKcgKuOd+vrqszMiXflV4v7hiqrXG
   zopdGxEEYOmt823/+/v07NdnJyftz/dXQpnWQBbDCYqvPE2gQ1s8HxedZ
   BE90e4BaOtmhB8cra5VZQnmcbpnK3k8PLnwGmPbagBLCn/65nG0HmFBHv
   OFUqg410PVdJbFGLJqzoy2JnQ7YgjZsR9CcABrjdhLFYGxKc8AttcytiV
   qYGzOt8AQAuvJ+sE121D8kzUwYjT4XTItNCzO0WdwW1k3ic5rVVI9QV+t
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="319888876"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="319888876"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 03:35:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="829527669"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="829527669"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 05 Jan 2023 03:35:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id B50EE220; Thu,  5 Jan 2023 13:35:59 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 5/8] thunderbolt: Increase timeout of DP OUT adapter handshake
Date:   Thu,  5 Jan 2023 13:35:56 +0200
Message-Id: <20230105113559.68531-6-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230105113559.68531-1-mika.westerberg@linux.intel.com>
References: <20230105113559.68531-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Sometimes the current timeout is not enough so increase it to 1500 ms
and while there make the loop use ktime instead.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index de584d7e3991..e5a5a20e391f 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -339,9 +339,10 @@ static bool tb_dp_is_usb4(const struct tb_switch *sw)
 	return tb_switch_is_usb4(sw) || tb_switch_is_titan_ridge(sw);
 }
 
-static int tb_dp_cm_handshake(struct tb_port *in, struct tb_port *out)
+static int tb_dp_cm_handshake(struct tb_port *in, struct tb_port *out,
+			      int timeout_msec)
 {
-	int timeout = 10;
+	ktime_t timeout = ktime_add_ms(ktime_get(), timeout_msec);
 	u32 val;
 	int ret;
 
@@ -368,8 +369,8 @@ static int tb_dp_cm_handshake(struct tb_port *in, struct tb_port *out)
 			return ret;
 		if (!(val & DP_STATUS_CTRL_CMHS))
 			return 0;
-		usleep_range(10, 100);
-	} while (timeout--);
+		usleep_range(100, 150);
+	} while (ktime_before(ktime_get(), timeout));
 
 	return -ETIMEDOUT;
 }
@@ -519,7 +520,7 @@ static int tb_dp_xchg_caps(struct tb_tunnel *tunnel)
 	 * Perform connection manager handshake between IN and OUT ports
 	 * before capabilities exchange can take place.
 	 */
-	ret = tb_dp_cm_handshake(in, out);
+	ret = tb_dp_cm_handshake(in, out, 1500);
 	if (ret)
 		return ret;
 
-- 
2.35.1

