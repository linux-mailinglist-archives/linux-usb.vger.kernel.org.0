Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AAEE6ABE4B
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 12:36:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjCFLg6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 06:36:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbjCFLg5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 06:36:57 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43EB8EFAC
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 03:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678102611; x=1709638611;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gM3suLlOLcgVyntYgSCX4iXmRBYOD/cbc9cSKDP1+Ls=;
  b=jRdNtWwmqOsnQqiFTENAHxo0oXbe4QQHPcmmaXe6asGDFzYq6Yx9Fei/
   sw9lc87DanmsEKE7nMU30cYYvGPeda0Fub1lZJ1WwKaQxwtZjF2IH2ulg
   ZyXeci04w2mT3d1v6TjMJi5K0NRtAkZW2Khoi8xuaQtwo/eZboyzp/kg0
   bg1dmvNrzI0mt/psrfjIOwsImFDXHou7bl+CgIP/rs5OSRaY09Hip7ATQ
   /BI35B2dwUy2nhq4ZAnAy3irWDLw1dRBo2MII2u2VRNo0S1nX3O1fgkob
   fm4uaioSsHRQoWMt/mFMg7aR4i9Ha9LWTJHYfUq6bUTbS6OZHHKgXEQO3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="315927691"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="315927691"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 03:35:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="1005358906"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="1005358906"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 06 Mar 2023 03:35:22 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1DBF287; Mon,  6 Mar 2023 13:36:06 +0200 (EET)
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
Subject: [PATCH 1/5] thunderbolt: Fix memory leak in margining
Date:   Mon,  6 Mar 2023 13:36:01 +0200
Message-Id: <20230306113605.46137-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230306113605.46137-1-mika.westerberg@linux.intel.com>
References: <20230306113605.46137-1-mika.westerberg@linux.intel.com>
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

Memory for the usb4->margining needs to be relased for the upstream port
of the router as well, even though the debugfs directory gets released
with the router device removal. Fix this.

Fixes: d0f1e0c2a699 ("thunderbolt: Add support for receiver lane margining")
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 4339e706cc3a..f92ad71ef983 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -942,7 +942,8 @@ static void margining_port_remove(struct tb_port *port)
 
 	snprintf(dir_name, sizeof(dir_name), "port%d", port->port);
 	parent = debugfs_lookup(dir_name, port->sw->debugfs_dir);
-	debugfs_remove_recursive(debugfs_lookup("margining", parent));
+	if (parent)
+		debugfs_remove_recursive(debugfs_lookup("margining", parent));
 
 	kfree(port->usb4->margining);
 	port->usb4->margining = NULL;
@@ -967,19 +968,18 @@ static void margining_switch_init(struct tb_switch *sw)
 
 static void margining_switch_remove(struct tb_switch *sw)
 {
+	struct tb_port *upstream, *downstream;
 	struct tb_switch *parent_sw;
-	struct tb_port *downstream;
 	u64 route = tb_route(sw);
 
 	if (!route)
 		return;
 
-	/*
-	 * Upstream is removed with the router itself but we need to
-	 * remove the downstream port margining directory.
-	 */
+	upstream = tb_upstream_port(sw);
 	parent_sw = tb_switch_parent(sw);
 	downstream = tb_port_at(route, parent_sw);
+
+	margining_port_remove(upstream);
 	margining_port_remove(downstream);
 }
 
-- 
2.39.1

