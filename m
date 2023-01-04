Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0086765CDFE
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 09:05:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233733AbjADIFg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 03:05:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233067AbjADIFd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 03:05:33 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4650110559
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 00:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672819533; x=1704355533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nHFX+CqJndGQhA8WKITXRlhv8gTbHIHtDSrz0F4fYKo=;
  b=JMyp4CiE1C10h4FiUv1LXK8mKKbxhc0avYRlitTk70rxQARGCkei48SK
   xzv5L/vyJYIX+2J71l84VDBsVwg0smDrnOGufYWFVexrGsSOSOwa7sPXO
   sCL10mxJQPRwopaQtVm7KK+JQVVvRewElL4aAwtpVfp1pAd82x7OrlyX9
   l276+mHsh/Hhwaf4nSCUKCbHMJ9YYnPQD8Z80V9fXcHSCIM6JYHzyvRTD
   FP47vnugJrDzdUEihDAeK4fYmci+aCJRuMLoc1XKqTsfnaYD2Jfugrrcx
   8AYaEp+ACVYYtpKE1B8HAWF8wnvUF84TXB3P2Q/fdWA7K3WTeQnq4jp0u
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="320585148"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
   d="scan'208";a="320585148"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 00:05:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="687460449"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
   d="scan'208";a="687460449"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 04 Jan 2023 00:05:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 12FDB220; Wed,  4 Jan 2023 10:06:02 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Utkarsh Patel <utkarsh.h.patel@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/3] thunderbolt: Disable XDomain lane 1 only in software connection manager
Date:   Wed,  4 Jan 2023 10:06:01 +0200
Message-Id: <20230104080601.45562-4-mika.westerberg@linux.intel.com>
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

When firmware connection manager is in use we should not touch the lane
adapter (well or any) configuration space so do this only when we know
that the software connection manager is active.

Fixes: 8e1de7042596 ("thunderbolt: Add support for XDomain lane bonding")
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/xdomain.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index cfa83486c9da..3c51e47dd86b 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1419,12 +1419,19 @@ static int tb_xdomain_get_properties(struct tb_xdomain *xd)
 	 * registered, we notify the userspace that it has changed.
 	 */
 	if (!update) {
-		struct tb_port *port;
+		/*
+		 * Now disable lane 1 if bonding was not enabled. Do
+		 * this only if bonding was possible at the beginning
+		 * (that is we are the connection manager and there are
+		 * two lanes).
+		 */
+		if (xd->bonding_possible) {
+			struct tb_port *port;
 
-		/* Now disable lane 1 if bonding was not enabled */
-		port = tb_port_at(xd->route, tb_xdomain_parent(xd));
-		if (!port->bonded)
-			tb_port_disable(port->dual_link_port);
+			port = tb_port_at(xd->route, tb_xdomain_parent(xd));
+			if (!port->bonded)
+				tb_port_disable(port->dual_link_port);
+		}
 
 		if (device_add(&xd->dev)) {
 			dev_err(&xd->dev, "failed to add XDomain device\n");
-- 
2.35.1

