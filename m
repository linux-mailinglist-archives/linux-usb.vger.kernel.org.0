Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CDD4158D88
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 12:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728486AbgBKLZl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 06:25:41 -0500
Received: from mga17.intel.com ([192.55.52.151]:1071 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727639AbgBKLZl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 06:25:41 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Feb 2020 03:25:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="347261841"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2020 03:25:39 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 6/6] usb: typec: mux: Drop support for device name matching
Date:   Tue, 11 Feb 2020 14:25:31 +0300
Message-Id: <20200211112531.86510-7-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200211112531.86510-1-heikki.krogerus@linux.intel.com>
References: <20200211112531.86510-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There are no more users for the old device connection
descriptions that used device names.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/mux.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 5baf0f416c73..b952fa2fff39 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -17,11 +17,6 @@
 
 #include "bus.h"
 
-static int name_match(struct device *dev, const void *name)
-{
-	return !strcmp((const char *)name, dev_name(dev));
-}
-
 static bool dev_name_ends_with(struct device *dev, const char *suffix)
 {
 	const char *name = dev_name(dev);
@@ -44,16 +39,11 @@ static void *typec_switch_match(struct device_connection *con, int ep,
 {
 	struct device *dev;
 
-	if (con->fwnode) {
-		if (con->id && !fwnode_property_present(con->fwnode, con->id))
-			return NULL;
+	if (con->id && !fwnode_property_present(con->fwnode, con->id))
+		return NULL;
 
-		dev = class_find_device(&typec_mux_class, NULL, con->fwnode,
-					switch_fwnode_match);
-	} else {
-		dev = class_find_device(&typec_mux_class, NULL,
-					con->endpoint[ep], name_match);
-	}
+	dev = class_find_device(&typec_mux_class, NULL, con->fwnode,
+				switch_fwnode_match);
 
 	return dev ? to_typec_switch(dev) : ERR_PTR(-EPROBE_DEFER);
 }
@@ -191,13 +181,6 @@ static void *typec_mux_match(struct device_connection *con, int ep, void *data)
 	u16 *val;
 	int i;
 
-	if (!con->fwnode) {
-		dev = class_find_device(&typec_mux_class, NULL,
-					con->endpoint[ep], name_match);
-
-		return dev ? to_typec_switch(dev) : ERR_PTR(-EPROBE_DEFER);
-	}
-
 	/*
 	 * Check has the identifier already been "consumed". If it
 	 * has, no need to do any extra connection identification.
-- 
2.25.0

