Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A91CD2EA778
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 10:33:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728431AbhAEJaA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 04:30:00 -0500
Received: from mga12.intel.com ([192.55.52.136]:41037 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728415AbhAEJ35 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Jan 2021 04:29:57 -0500
IronPort-SDR: FeWA1cQwxwJzcNlbKX/a/8qg2UyI+nNzyrJkzhpVl0/6DocNQXfeUB2a9CaBThmTvl1sH1S7da
 IhN3k5P8VYHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="156274180"
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; 
   d="scan'208";a="156274180"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 01:28:11 -0800
IronPort-SDR: wpgZgG+N5K+g+7/lC02I0HeF26KAX3ddVwvxQSy5uRVf2E3jnMynpOTdvNoePyBQh7eKMmpCR7
 9dLJNzIL5K7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; 
   d="scan'208";a="496714550"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 05 Jan 2021 01:28:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 65EF3B7; Tue,  5 Jan 2021 11:28:08 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Christian Kellner <christian@kellner.me>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/2] thunderbolt: Add support for de-authorizing devices
Date:   Tue,  5 Jan 2021 12:28:08 +0300
Message-Id: <20210105092808.15817-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210105092808.15817-1-mika.westerberg@linux.intel.com>
References: <20210105092808.15817-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In some cases it is useful to be able de-authorize devices. For example
if user logs out the userspace can have a policy that disconnects PCIe
devices until logged in again. This is only possible for software based
connection manager as it directly controls the tunnels.

For this reason make the authorized attribute accept writing 0 which
makes the software connection manager to tear down the corresponding
PCIe tunnel. Userspace can check if this is supported by reading a new
domain attribute deauthorization, that holds 1 in that case.

While there correct tb_domain_approve_switch() kernel-doc and
description of authorized attribute to mention that it is only about
PCIe tunnels.

Cc: Christian Kellner <christian@kellner.me>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 .../ABI/testing/sysfs-bus-thunderbolt         | 18 +++++++---
 drivers/thunderbolt/domain.c                  | 32 +++++++++++++++--
 drivers/thunderbolt/switch.c                  | 34 ++++++++++++++++++-
 drivers/thunderbolt/tb.c                      | 20 +++++++++++
 drivers/thunderbolt/tb.h                      |  3 ++
 5 files changed, 100 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-thunderbolt b/Documentation/ABI/testing/sysfs-bus-thunderbolt
index a91b4b24496e..81aa090137b4 100644
--- a/Documentation/ABI/testing/sysfs-bus-thunderbolt
+++ b/Documentation/ABI/testing/sysfs-bus-thunderbolt
@@ -49,6 +49,15 @@ Description:	Holds a comma separated list of device unique_ids that
 		If a device is authorized automatically during boot its
 		boot attribute is set to 1.
 
+What: /sys/bus/thunderbolt/devices/.../domainX/deauthorization
+Date:		May 2021
+KernelVersion:	5.12
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Description:	This attribute tells whether the system supports
+		de-authorization of devices. Value of 1 means user can
+		de-authorize PCIe tunnel by writing 0 to authorized
+		attribute under each device.
+
 What: /sys/bus/thunderbolt/devices/.../domainX/iommu_dma_protection
 Date:		Mar 2019
 KernelVersion:	4.21
@@ -84,17 +93,18 @@ KernelVersion:	4.13
 Contact:	thunderbolt-software@lists.01.org
 Description:	This attribute is used to authorize Thunderbolt devices
 		after they have been connected. If the device is not
-		authorized, no devices such as PCIe and Display port are
-		available to the system.
+		authorized, no PCIe devices are available to the system.
 
 		Contents of this attribute will be 0 when the device is not
 		yet authorized.
 
 		Possible values are supported:
 
-		==  ===========================================
+		==  ===================================================
+		0   The device will be de-authorized (only supported if
+		    deauthorization attribute under domain contains 1)
 		1   The device will be authorized and connected
-		==  ===========================================
+		==  ===================================================
 
 		When key attribute contains 32 byte hex string the possible
 		values are:
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index f0de94f7acbf..5826f7a29742 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -238,6 +238,16 @@ static ssize_t boot_acl_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RW(boot_acl);
 
+static ssize_t deauthorization_show(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	const struct tb *tb = container_of(dev, struct tb, dev);
+
+	return sprintf(buf, "%d\n", !!tb->cm_ops->disapprove_switch);
+}
+static DEVICE_ATTR_RO(deauthorization);
+
 static ssize_t iommu_dma_protection_show(struct device *dev,
 					 struct device_attribute *attr,
 					 char *buf)
@@ -267,6 +277,7 @@ static DEVICE_ATTR_RO(security);
 
 static struct attribute *domain_attrs[] = {
 	&dev_attr_boot_acl.attr,
+	&dev_attr_deauthorization.attr,
 	&dev_attr_iommu_dma_protection.attr,
 	&dev_attr_security.attr,
 	NULL,
@@ -601,14 +612,31 @@ int tb_domain_runtime_resume(struct tb *tb)
 	return 0;
 }
 
+/**
+ * tb_domain_disapprove_switch() - Disapprove switch
+ * @tb: Domain the switch belongs to
+ * @sw: Switch to disapprove
+ *
+ * This will disconnect PCIe tunnel from parent to this @sw.
+ *
+ * Return: %0 on success and negative errno in case of failure.
+ */
+int tb_domain_disapprove_switch(struct tb *tb, struct tb_switch *sw)
+{
+	if (!tb->cm_ops->disapprove_switch)
+		return -EPERM;
+
+	return tb->cm_ops->disapprove_switch(tb, sw);
+}
+
 /**
  * tb_domain_approve_switch() - Approve switch
  * @tb: Domain the switch belongs to
  * @sw: Switch to approve
  *
  * This will approve switch by connection manager specific means. In
- * case of success the connection manager will create tunnels for all
- * supported protocols.
+ * case of success the connection manager will create PCIe tunnel from
+ * parent to @sw.
  */
 int tb_domain_approve_switch(struct tb *tb, struct tb_switch *sw)
 {
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index e7e6726ff5d1..83e17631884c 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1387,6 +1387,30 @@ static ssize_t authorized_show(struct device *dev,
 	return sprintf(buf, "%u\n", sw->authorized);
 }
 
+static int disapprove_switch(struct device *dev, void *data)
+{
+	struct tb_switch *sw;
+
+	sw = tb_to_switch(dev);
+	if (sw && sw->authorized) {
+		int ret;
+
+		/* First children */
+		ret = device_for_each_child_reverse(&sw->dev, NULL, disapprove_switch);
+		if (ret)
+			return ret;
+
+		ret = tb_domain_disapprove_switch(sw->tb, sw);
+		if (ret)
+			return ret;
+
+		sw->authorized = 0;
+		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
+	}
+
+	return 0;
+}
+
 static int tb_switch_set_authorized(struct tb_switch *sw, unsigned int val)
 {
 	int ret = -EINVAL;
@@ -1394,10 +1418,18 @@ static int tb_switch_set_authorized(struct tb_switch *sw, unsigned int val)
 	if (!mutex_trylock(&sw->tb->lock))
 		return restart_syscall();
 
-	if (sw->authorized)
+	if (!!sw->authorized == !!val)
 		goto unlock;
 
 	switch (val) {
+	/* Disapprove switch */
+	case 0:
+		if (tb_route(sw)) {
+			ret = disapprove_switch(&sw->dev, NULL);
+			goto unlock;
+		}
+		break;
+
 	/* Approve switch */
 	case 1:
 		if (sw->key)
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 51d5b031cada..d08879849abe 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1002,6 +1002,25 @@ static void tb_disconnect_and_release_dp(struct tb *tb)
 	}
 }
 
+static int tb_disconnect_pci(struct tb *tb, struct tb_switch *sw)
+{
+	struct tb_tunnel *tunnel;
+	struct tb_port *up;
+
+	up = tb_switch_find_port(sw, TB_TYPE_PCIE_UP);
+	if (WARN_ON(!up))
+		return -ENODEV;
+
+	tunnel = tb_find_tunnel(tb, TB_TUNNEL_PCI, NULL, up);
+	if (WARN_ON(!tunnel))
+		return -ENODEV;
+
+	tb_tunnel_deactivate(tunnel);
+	list_del(&tunnel->list);
+	tb_tunnel_free(tunnel);
+	return 0;
+}
+
 static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
 {
 	struct tb_port *up, *down, *port;
@@ -1512,6 +1531,7 @@ static const struct tb_cm_ops tb_cm_ops = {
 	.runtime_suspend = tb_runtime_suspend,
 	.runtime_resume = tb_runtime_resume,
 	.handle_event = tb_handle_event,
+	.disapprove_switch = tb_disconnect_pci,
 	.approve_switch = tb_tunnel_pci,
 	.approve_xdomain_paths = tb_approve_xdomain_paths,
 	.disconnect_xdomain_paths = tb_disconnect_xdomain_paths,
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 34ae83b9e52a..31468de658e4 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -361,6 +361,7 @@ struct tb_path {
  * @handle_event: Handle thunderbolt event
  * @get_boot_acl: Get boot ACL list
  * @set_boot_acl: Set boot ACL list
+ * @disapprove_switch: Disapprove switch (disconnect PCIe tunnel)
  * @approve_switch: Approve switch
  * @add_switch_key: Add key to switch
  * @challenge_switch_key: Challenge switch using key
@@ -394,6 +395,7 @@ struct tb_cm_ops {
 			     const void *buf, size_t size);
 	int (*get_boot_acl)(struct tb *tb, uuid_t *uuids, size_t nuuids);
 	int (*set_boot_acl)(struct tb *tb, const uuid_t *uuids, size_t nuuids);
+	int (*disapprove_switch)(struct tb *tb, struct tb_switch *sw);
 	int (*approve_switch)(struct tb *tb, struct tb_switch *sw);
 	int (*add_switch_key)(struct tb *tb, struct tb_switch *sw);
 	int (*challenge_switch_key)(struct tb *tb, struct tb_switch *sw,
@@ -629,6 +631,7 @@ int tb_domain_thaw_noirq(struct tb *tb);
 void tb_domain_complete(struct tb *tb);
 int tb_domain_runtime_suspend(struct tb *tb);
 int tb_domain_runtime_resume(struct tb *tb);
+int tb_domain_disapprove_switch(struct tb *tb, struct tb_switch *sw);
 int tb_domain_approve_switch(struct tb *tb, struct tb_switch *sw);
 int tb_domain_approve_switch_key(struct tb *tb, struct tb_switch *sw);
 int tb_domain_challenge_switch_key(struct tb *tb, struct tb_switch *sw);
-- 
2.29.2

