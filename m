Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD5C45D5A6
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 08:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348674AbhKYHmy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 02:42:54 -0500
Received: from mga11.intel.com ([192.55.52.93]:7215 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236705AbhKYHky (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 02:40:54 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="232957911"
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; 
   d="scan'208";a="232957911"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 23:37:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; 
   d="scan'208";a="457764817"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 24 Nov 2021 23:37:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 3688D2CC; Thu, 25 Nov 2021 09:37:34 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/6] thunderbolt: Runtime resume USB4 port when retimers are scanned
Date:   Thu, 25 Nov 2021 10:37:30 +0300
Message-Id: <20211125073733.74902-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211125073733.74902-1-mika.westerberg@linux.intel.com>
References: <20211125073733.74902-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Sometimes when plugging in a USB4 device we might see following error:

  thunderbolt 1-0:3.1: runtime PM trying to activate child device 1-0:3.1 but parent (usb4_port3) is not active

This happens because the parent USB4 port was still runtime suspended.
Fix this by runtime resuming the USB4 port before scanning the retimers
below it.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/retimer.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 722694052f4a..8c29bd556ae0 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -324,15 +324,10 @@ struct device_type tb_retimer_type = {
 
 static int tb_retimer_add(struct tb_port *port, u8 index, u32 auth_status)
 {
-	struct usb4_port *usb4;
 	struct tb_retimer *rt;
 	u32 vendor, device;
 	int ret;
 
-	usb4 = port->usb4;
-	if (!usb4)
-		return -EINVAL;
-
 	ret = usb4_port_retimer_read(port, index, USB4_SB_VENDOR_ID, &vendor,
 				     sizeof(vendor));
 	if (ret) {
@@ -374,7 +369,7 @@ static int tb_retimer_add(struct tb_port *port, u8 index, u32 auth_status)
 	rt->port = port;
 	rt->tb = port->sw->tb;
 
-	rt->dev.parent = &usb4->dev;
+	rt->dev.parent = &port->usb4->dev;
 	rt->dev.bus = &tb_bus_type;
 	rt->dev.type = &tb_retimer_type;
 	dev_set_name(&rt->dev, "%s:%u.%u", dev_name(&port->sw->dev),
@@ -453,6 +448,13 @@ int tb_retimer_scan(struct tb_port *port, bool add)
 {
 	u32 status[TB_MAX_RETIMER_INDEX + 1] = {};
 	int ret, i, last_idx = 0;
+	struct usb4_port *usb4;
+
+	usb4 = port->usb4;
+	if (!usb4)
+		return 0;
+
+	pm_runtime_get_sync(&usb4->dev);
 
 	/*
 	 * Send broadcast RT to make sure retimer indices facing this
@@ -460,7 +462,7 @@ int tb_retimer_scan(struct tb_port *port, bool add)
 	 */
 	ret = usb4_port_enumerate_retimers(port);
 	if (ret)
-		return ret;
+		goto out;
 
 	/*
 	 * Enable sideband channel for each retimer. We can do this
@@ -490,8 +492,10 @@ int tb_retimer_scan(struct tb_port *port, bool add)
 			break;
 	}
 
-	if (!last_idx)
-		return 0;
+	if (!last_idx) {
+		ret = 0;
+		goto out;
+	}
 
 	/* Add on-board retimers if they do not exist already */
 	for (i = 1; i <= last_idx; i++) {
@@ -507,7 +511,11 @@ int tb_retimer_scan(struct tb_port *port, bool add)
 		}
 	}
 
-	return 0;
+out:
+	pm_runtime_mark_last_busy(&usb4->dev);
+	pm_runtime_put_autosuspend(&usb4->dev);
+
+	return ret;
 }
 
 static int remove_retimer(struct device *dev, void *data)
-- 
2.33.0

