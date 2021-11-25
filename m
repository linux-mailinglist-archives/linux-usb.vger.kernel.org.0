Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A559545D5B7
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 08:45:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239374AbhKYHs5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 02:48:57 -0500
Received: from mga06.intel.com ([134.134.136.31]:8101 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234579AbhKYHq4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 02:46:56 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="296269515"
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; 
   d="scan'208";a="296269515"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 23:37:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; 
   d="scan'208";a="741094662"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 24 Nov 2021 23:37:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 58A1453E; Thu, 25 Nov 2021 09:37:34 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 6/6] thunderbolt: Add debug logging of DisplayPort resource allocation
Date:   Thu, 25 Nov 2021 10:37:33 +0300
Message-Id: <20211125073733.74902-7-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211125073733.74902-1-mika.westerberg@linux.intel.com>
References: <20211125073733.74902-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add more debugging around DP resource allocation/de-allocation.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index e00f4b878b56..13f9230104d7 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3056,9 +3056,20 @@ bool tb_switch_query_dp_resource(struct tb_switch *sw, struct tb_port *in)
  */
 int tb_switch_alloc_dp_resource(struct tb_switch *sw, struct tb_port *in)
 {
+	int ret;
+
 	if (tb_switch_is_usb4(sw))
-		return usb4_switch_alloc_dp_resource(sw, in);
-	return tb_lc_dp_sink_alloc(sw, in);
+		ret = usb4_switch_alloc_dp_resource(sw, in);
+	else
+		ret = tb_lc_dp_sink_alloc(sw, in);
+
+	if (ret)
+		tb_sw_warn(sw, "failed to allocate DP resource for port %d\n",
+			   in->port);
+	else
+		tb_sw_dbg(sw, "allocated DP resource for port %d\n", in->port);
+
+	return ret;
 }
 
 /**
@@ -3081,6 +3092,8 @@ void tb_switch_dealloc_dp_resource(struct tb_switch *sw, struct tb_port *in)
 	if (ret)
 		tb_sw_warn(sw, "failed to de-allocate DP resource for port %d\n",
 			   in->port);
+	else
+		tb_sw_dbg(sw, "released DP resource for port %d\n", in->port);
 }
 
 struct tb_sw_lookup {
-- 
2.33.0

