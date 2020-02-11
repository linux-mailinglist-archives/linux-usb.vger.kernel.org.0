Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8B6158D85
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 12:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbgBKLZh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 06:25:37 -0500
Received: from mga17.intel.com ([192.55.52.151]:1071 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727639AbgBKLZh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 06:25:37 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Feb 2020 03:25:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="347261830"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2020 03:25:35 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 3/6] usb: typec: Allow power role swapping even without USB PD
Date:   Tue, 11 Feb 2020 14:25:28 +0300
Message-Id: <20200211112531.86510-4-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200211112531.86510-1-heikki.krogerus@linux.intel.com>
References: <20200211112531.86510-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Even though originally the USB Type-C Specification did not
describe the steps for power role swapping without USB PD
contract in place, it did not actually mean power role swap
without USB PD was not allowed. The USB Type-C Specification
did not clearly separate the data and power roles until in
the release 1.2 which is why there also were no clear steps
for the scenario where only the power role was swapped
without USB PD contract before that.

Since in the latest version of the specification the power
role swap without USB PD is now clearly mentioned as allowed
operation, removing the check that prevented power role swap
without USB PD support.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 Documentation/ABI/testing/sysfs-class-typec | 14 +++++++-------
 drivers/usb/typec/class.c                   |  6 ------
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index d7647b258c3c..0c2eb26fdc06 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -20,13 +20,13 @@ Date:		April 2017
 Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
 		The supported power roles. This attribute can be used to request
-		power role swap on the port when the port supports USB Power
-		Delivery. Swapping is supported as synchronous operation, so
-		write(2) to the attribute will not return until the operation
-		has finished. The attribute is notified about role changes so
-		that poll(2) on the attribute wakes up. Change on the role will
-		also generate uevent KOBJ_CHANGE. The current role is show in
-		brackets, for example "[source] sink" when in source mode.
+		power role swap on the port. Swapping is supported as
+		synchronous operation, so write(2) to the attribute will not
+		return until the operation has finished. The attribute is
+		notified about role changes so that poll(2) on the attribute
+		wakes up. Change on the role will also generate uevent
+		KOBJ_CHANGE. The current role is show in brackets, for example
+		"[source] sink" when in source mode.
 
 		Valid values: source, sink
 
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 7fed6855ad59..9cf4f6deb5a6 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1112,11 +1112,6 @@ static ssize_t power_role_store(struct device *dev,
 	struct typec_port *port = to_typec_port(dev);
 	int ret;
 
-	if (!port->cap->pd_revision) {
-		dev_dbg(dev, "USB Power Delivery not supported\n");
-		return -EOPNOTSUPP;
-	}
-
 	if (!port->ops || !port->ops->pr_set) {
 		dev_dbg(dev, "power role swapping not supported\n");
 		return -EOPNOTSUPP;
@@ -1338,7 +1333,6 @@ static umode_t typec_attr_is_visible(struct kobject *kobj,
 			return 0444;
 	} else if (attr == &dev_attr_power_role.attr) {
 		if (port->cap->type != TYPEC_PORT_DRP ||
-		    !port->cap->pd_revision ||
 		    !port->ops || !port->ops->pr_set)
 			return 0444;
 	} else if (attr == &dev_attr_vconn_source.attr) {
-- 
2.25.0

