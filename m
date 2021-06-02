Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBCFA3987FF
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 13:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhFBLYQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 07:24:16 -0400
Received: from mga06.intel.com ([134.134.136.31]:6710 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229695AbhFBLYO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Jun 2021 07:24:14 -0400
IronPort-SDR: 7vcaQbhDewIgpiNJ0AqGXYKfO2nkVHBRsp5QzoqAMuU5KkwDlcWNmn1tYw/0hOynSp7dIcPyJP
 8EpAYQ4yv6bg==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="264945049"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; 
   d="scan'208";a="264945049"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2021 04:22:31 -0700
IronPort-SDR: 0HsfANnQWK+n/Y5muLuzt1Blb0bxkNQc5V+Ii8OVkO/fafppM6015LVU39clFl1hWYqM8wWhx2
 maD0YikpqB1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; 
   d="scan'208";a="550098233"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2021 04:22:30 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Li Jun <jun.li@nxp.com>, linux-usb@vger.kernel.org
Subject: [PATCH] Revert "usb: typec: mux: Remove requirement for the "orientation-switch" device property"
Date:   Wed,  2 Jun 2021 14:22:53 +0300
Message-Id: <20210602112253.70200-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit acad3e9c7250c5fd20d9778a163f2adc95de38f5.

The device property that can be used to identify the device
class/type of the remote port parent when device graph is
used is always needed after all. Without it there is no real
way to know is the requested connection actually described
in the device graph or not.

If the connection is described in the device graph but the
device instance is still missing for what ever reason, the
code defers probe for now.

Adding a comment to the code to explain this.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Hi,

I'm sorry about this again. I hope the comments help prevent me from
doing the same thing again.

thanks,
---
 drivers/usb/typec/mux.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 603f3e698cc0b..664fb3513f480 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -30,6 +30,22 @@ static void *typec_switch_match(struct fwnode_handle *fwnode, const char *id,
 {
 	struct device *dev;
 
+	/*
+	 * Device graph (OF graph) does not give any means to identify the
+	 * device type or the device class of the remote port parent that @fwnode
+	 * represents, so in order to identify the type or the class of @fwnode
+	 * an additional device property is needed. With typec switches the
+	 * property is named "orientation-switch" (@id). The value of the device
+	 * property is ignored.
+	 */
+	if (id && !fwnode_property_present(fwnode, id))
+		return NULL;
+
+	/*
+	 * At this point we are sure that @fwnode is a typec switch in all
+	 * cases. If the switch hasn't yet been registered for some reason, the
+	 * function "defers probe" for now.
+	 */
 	dev = class_find_device(&typec_mux_class, NULL, fwnode,
 				switch_fwnode_match);
 
-- 
2.30.2

