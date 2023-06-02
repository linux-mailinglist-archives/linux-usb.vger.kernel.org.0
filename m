Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2DE071FD42
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 11:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234767AbjFBJMq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 05:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234759AbjFBJMV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 05:12:21 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C15AE42
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 02:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685697054; x=1717233054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nH1RBF2R2VS+X/Zddkgn87XcgZAEUQrPe7PidUdIfqE=;
  b=WxPpu8RGAMxNo1tItQgDLLOm4LZzoMAoHFG116H0l0yYuFg56m6lwDYH
   cfn+eJopEm5ohRSvR0lydPWMEuNcVVqoipRbEnodKimE4y2uk7uHu/r89
   QV8xiGpIuMMeX6lFM1KuopPYetDPSFx1BfA839cBQ6BaNumSXUgS8TTXq
   HAB9YjD5R8kOZSD+ZhofXJHINbBqSyZVVSYkrOA8WGRWpP8b7+eEzth01
   apiIkxyXpBXkVLXTT8gxN/aBFOwESnWTLybOdrDwFPDhU8T8yAs5PRI7X
   he3bzXXDdbQwGVUlAOEmXwbqpnaSrDPN2x0F5ODL90IukHYGucwa4K5ii
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="345402021"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="345402021"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 02:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="820211855"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="820211855"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 02 Jun 2023 02:10:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 2F47A53A; Fri,  2 Jun 2023 12:10:56 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Utkarsh H Patel <utkarsh.h.patel@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/3] thunderbolt: Read retimer NVM authentication status prior tb_retimer_set_inbound_sbtx()
Date:   Fri,  2 Jun 2023 12:10:53 +0300
Message-Id: <20230602091055.65049-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230602091055.65049-1-mika.westerberg@linux.intel.com>
References: <20230602091055.65049-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

According to the USB4 retimer guide the correct order is immediately
after sending ENUMERATE_RETIMERS so update the code to follow this.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/retimer.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index ccc2f0e7adba..fb8e113488db 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -187,6 +187,21 @@ static ssize_t nvm_authenticate_show(struct device *dev,
 	return ret;
 }
 
+static void tb_retimer_nvm_authenticate_status(struct tb_port *port, u32 *status)
+{
+	int i;
+
+	tb_port_dbg(port, "reading NVM authentication status of retimers\n");
+
+	/*
+	 * Before doing anything else, read the authentication status.
+	 * If the retimer has it set, store it for the new retimer
+	 * device instance.
+	 */
+	for (i = 1; i <= TB_MAX_RETIMER_INDEX; i++)
+		usb4_port_retimer_nvm_authenticate_status(port, i, &status[i]);
+}
+
 static void tb_retimer_set_inbound_sbtx(struct tb_port *port)
 {
 	int i;
@@ -449,18 +464,16 @@ int tb_retimer_scan(struct tb_port *port, bool add)
 		return ret;
 
 	/*
-	 * Enable sideband channel for each retimer. We can do this
-	 * regardless whether there is device connected or not.
+	 * Immediately after sending enumerate retimers read the
+	 * authentication status of each retimer.
 	 */
-	tb_retimer_set_inbound_sbtx(port);
+	tb_retimer_nvm_authenticate_status(port, status);
 
 	/*
-	 * Before doing anything else, read the authentication status.
-	 * If the retimer has it set, store it for the new retimer
-	 * device instance.
+	 * Enable sideband channel for each retimer. We can do this
+	 * regardless whether there is device connected or not.
 	 */
-	for (i = 1; i <= TB_MAX_RETIMER_INDEX; i++)
-		usb4_port_retimer_nvm_authenticate_status(port, i, &status[i]);
+	tb_retimer_set_inbound_sbtx(port);
 
 	for (i = 1; i <= TB_MAX_RETIMER_INDEX; i++) {
 		/*
-- 
2.39.2

