Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC21533417
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2019 17:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729701AbfFCPxm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jun 2019 11:53:42 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:53878 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729410AbfFCPvu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Jun 2019 11:51:50 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E332A1AED;
        Mon,  3 Jun 2019 08:51:49 -0700 (PDT)
Received: from en101.cambridge.arm.com (en101.cambridge.arm.com [10.1.196.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B02323F246;
        Mon,  3 Jun 2019 08:51:48 -0700 (PDT)
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
To:     linux-kernel@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        suzuki.poulose@arm.com,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [RFC PATCH 33/57] drivers: usb: Use class_find_device_by_name() helper
Date:   Mon,  3 Jun 2019 16:49:59 +0100
Message-Id: <1559577023-558-34-git-send-email-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559577023-558-1-git-send-email-suzuki.poulose@arm.com>
References: <1559577023-558-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the new class_find_device_by_name() helper.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/usb/roles/class.c | 8 +-------
 drivers/usb/typec/class.c | 8 +-------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index f45d8df..3dc78cb 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -90,11 +90,6 @@ static int switch_fwnode_match(struct device *dev, const void *fwnode)
 	return dev_fwnode(dev) == fwnode;
 }
 
-static int switch_name_match(struct device *dev, const void *name)
-{
-	return !strcmp((const char *)name, dev_name(dev));
-}
-
 static void *usb_role_switch_match(struct device_connection *con, int ep,
 				   void *data)
 {
@@ -107,8 +102,7 @@ static void *usb_role_switch_match(struct device_connection *con, int ep,
 		dev = class_find_device(role_class, NULL, con->fwnode,
 					switch_fwnode_match);
 	} else {
-		dev = class_find_device(role_class, NULL, con->endpoint[ep],
-					switch_name_match);
+		dev = class_find_device_by_name(role_class, NULL, con->endpoint[ep]);
 	}
 
 	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 2eb6238..c11cc5f 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -210,11 +210,6 @@ static int typec_port_fwnode_match(struct device *dev, const void *fwnode)
 	return dev_fwnode(dev) == fwnode;
 }
 
-static int typec_port_name_match(struct device *dev, const void *name)
-{
-	return !strcmp((const char *)name, dev_name(dev));
-}
-
 static void *typec_port_match(struct device_connection *con, int ep, void *data)
 {
 	struct device *dev;
@@ -227,8 +222,7 @@ static void *typec_port_match(struct device_connection *con, int ep, void *data)
 		return class_find_device(typec_class, NULL, con->fwnode,
 					 typec_port_fwnode_match);
 
-	dev = class_find_device(typec_class, NULL, con->endpoint[ep],
-				typec_port_name_match);
+	dev = class_find_device_by_name(typec_class, NULL, con->endpoint[ep]);
 
 	return dev ? dev : ERR_PTR(-EPROBE_DEFER);
 }
-- 
2.7.4

