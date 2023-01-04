Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE01A65CDFC
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 09:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233351AbjADIFe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 03:05:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjADIFc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 03:05:32 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4F9E032
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 00:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672819532; x=1704355532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+kBrEgTFmAGcxJVnRR1l3xAkp3N19AS2NYGSx31fA4A=;
  b=cySBP0kIcbjg2vy9KQrF9l6Wp2/mHRFW3u19NkzEyy0UwDNUbsGO5ZtK
   Tz8kZULOzOaSbLXIbbA0dwK9nhhI6kB1On+VRa2pCEkSXxASomSIUOI5q
   G/9Fm0LB1A4gism1lmgS9eKWqAqfnbgGBh8AKDkENj1c2YlHNRXNInNe+
   Rb09pcS5SV5RN2DJhG2mOxBpu9bV52dOxNcasl/a1kkkpsuRMDseNa1Yu
   7OlPCvyEm5lp6DL2B0WQKLA6rolhGWV/ZpUfDuxedyIwMW4UZjEPSmQ4T
   JrvSR3P5SED8unemAndW72h3V/f7E13EF9s4vBHYRayCoeG8+aQOAUaKq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="320585142"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
   d="scan'208";a="320585142"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 00:05:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="687460445"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
   d="scan'208";a="687460445"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 04 Jan 2023 00:05:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id EDA47F4; Wed,  4 Jan 2023 10:06:01 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Utkarsh Patel <utkarsh.h.patel@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/3] thunderbolt: Do not call PM runtime functions in tb_retimer_scan()
Date:   Wed,  4 Jan 2023 10:05:59 +0200
Message-Id: <20230104080601.45562-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230104080601.45562-1-mika.westerberg@linux.intel.com>
References: <20230104080601.45562-1-mika.westerberg@linux.intel.com>
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

We cannot call PM runtime functions in tb_retimer_scan() because it will
also be called when retimers are scanned from userspace (happens when
there is no device connected on ChromeOS for instance) and at the same
USB4 port runtime resume hook. This leads to hang because neither can
proceed.

Fix this by runtime resuming USB4 ports in tb_scan_port() instead. This
makes sure the ports are runtime PM active when retimers are added under
it while avoiding the reported hang as well.

Reported-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
Fixes: 1e56c88adecc ("thunderbolt: Runtime resume USB4 port when retimers are scanned")
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/retimer.c | 17 +++--------------
 drivers/thunderbolt/tb.c      | 20 +++++++++++++++-----
 2 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 6ebe7a2886ec..56008eb91e2e 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -427,13 +427,6 @@ int tb_retimer_scan(struct tb_port *port, bool add)
 {
 	u32 status[TB_MAX_RETIMER_INDEX + 1] = {};
 	int ret, i, last_idx = 0;
-	struct usb4_port *usb4;
-
-	usb4 = port->usb4;
-	if (!usb4)
-		return 0;
-
-	pm_runtime_get_sync(&usb4->dev);
 
 	/*
 	 * Send broadcast RT to make sure retimer indices facing this
@@ -441,7 +434,7 @@ int tb_retimer_scan(struct tb_port *port, bool add)
 	 */
 	ret = usb4_port_enumerate_retimers(port);
 	if (ret)
-		goto out;
+		return ret;
 
 	/*
 	 * Enable sideband channel for each retimer. We can do this
@@ -471,11 +464,11 @@ int tb_retimer_scan(struct tb_port *port, bool add)
 			break;
 	}
 
-	ret = 0;
 	if (!last_idx)
-		goto out;
+		return 0;
 
 	/* Add on-board retimers if they do not exist already */
+	ret = 0;
 	for (i = 1; i <= last_idx; i++) {
 		struct tb_retimer *rt;
 
@@ -489,10 +482,6 @@ int tb_retimer_scan(struct tb_port *port, bool add)
 		}
 	}
 
-out:
-	pm_runtime_mark_last_busy(&usb4->dev);
-	pm_runtime_put_autosuspend(&usb4->dev);
-
 	return ret;
 }
 
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 462845804427..3f1ab30c4fb1 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -628,11 +628,15 @@ static void tb_scan_port(struct tb_port *port)
 			 * Downstream switch is reachable through two ports.
 			 * Only scan on the primary port (link_nr == 0).
 			 */
+
+	if (port->usb4)
+		pm_runtime_get_sync(&port->usb4->dev);
+
 	if (tb_wait_for_port(port, false) <= 0)
-		return;
+		goto out_rpm_put;
 	if (port->remote) {
 		tb_port_dbg(port, "port already has a remote\n");
-		return;
+		goto out_rpm_put;
 	}
 
 	tb_retimer_scan(port, true);
@@ -647,12 +651,12 @@ static void tb_scan_port(struct tb_port *port)
 		 */
 		if (PTR_ERR(sw) == -EIO || PTR_ERR(sw) == -EADDRNOTAVAIL)
 			tb_scan_xdomain(port);
-		return;
+		goto out_rpm_put;
 	}
 
 	if (tb_switch_configure(sw)) {
 		tb_switch_put(sw);
-		return;
+		goto out_rpm_put;
 	}
 
 	/*
@@ -681,7 +685,7 @@ static void tb_scan_port(struct tb_port *port)
 
 	if (tb_switch_add(sw)) {
 		tb_switch_put(sw);
-		return;
+		goto out_rpm_put;
 	}
 
 	/* Link the switches using both links if available */
@@ -733,6 +737,12 @@ static void tb_scan_port(struct tb_port *port)
 
 	tb_add_dp_resources(sw);
 	tb_scan_switch(sw);
+
+out_rpm_put:
+	if (port->usb4) {
+		pm_runtime_mark_last_busy(&port->usb4->dev);
+		pm_runtime_put_autosuspend(&port->usb4->dev);
+	}
 }
 
 static void tb_deactivate_and_free_tunnel(struct tb_tunnel *tunnel)
-- 
2.35.1

