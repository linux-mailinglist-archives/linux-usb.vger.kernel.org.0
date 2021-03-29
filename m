Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C93FF34C521
	for <lists+linux-usb@lfdr.de>; Mon, 29 Mar 2021 09:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbhC2Hlp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Mar 2021 03:41:45 -0400
Received: from mga11.intel.com ([192.55.52.93]:58297 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230395AbhC2Hlk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Mar 2021 03:41:40 -0400
IronPort-SDR: hBwFzo5fg4pmn2ozvbLF9aXF/WCsh4V929b+BoV26kB06WLFcNOt+Vlt2f7xQQgMFMNthW6m7b
 YQH7tQkSmJ8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="188231495"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="188231495"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 00:41:40 -0700
IronPort-SDR: swz4OqF+StbePIuElUpAR6IR7u/qcoA8UV6w3YLFymh1k9oRvA7d32gVhQe9hmTd8mgq03KZCC
 NusOD1uEx8EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="383471237"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 29 Mar 2021 00:41:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 9568E93; Mon, 29 Mar 2021 10:41:50 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Christian Kellner <christian@kellner.me>,
        Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@google.com>,
        Diego Rivas <diegorivas@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v3 1/3] thunderbolt: Add details to router uevent
Date:   Mon, 29 Mar 2021 10:41:48 +0300
Message-Id: <20210329074150.62622-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329074150.62622-1-mika.westerberg@linux.intel.com>
References: <20210329074150.62622-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Expose two environment variables for routers as part of the initial
uevent:

  USB4_VERSION=1.0
  USB4_TYPE=host|device|hub

Userspace can use this information to expose more details about each
connected device. Only USB4 devices have USB4_VERSION but all devices
have USB4_TYPE.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/thunderbolt/switch.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 321a5bcfce65..a1b4a695080e 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1835,6 +1835,39 @@ static void tb_switch_release(struct device *dev)
 	kfree(sw);
 }
 
+static int tb_switch_uevent(struct device *dev, struct kobj_uevent_env *env)
+{
+	struct tb_switch *sw = tb_to_switch(dev);
+	const char *type;
+
+	if (sw->config.thunderbolt_version == USB4_VERSION_1_0) {
+		if (add_uevent_var(env, "USB4_VERSION=1.0"))
+			return -ENOMEM;
+	}
+
+	if (!tb_route(sw)) {
+		type = "host";
+	} else {
+		const struct tb_port *port;
+		bool hub = false;
+
+		/* Device is hub if it has any downstream ports */
+		tb_switch_for_each_port(sw, port) {
+			if (!port->disabled && !tb_is_upstream_port(port) &&
+			     tb_port_is_null(port)) {
+				hub = true;
+				break;
+			}
+		}
+
+		type = hub ? "hub" : "device";
+	}
+
+	if (add_uevent_var(env, "USB4_TYPE=%s", type))
+		return -ENOMEM;
+	return 0;
+}
+
 /*
  * Currently only need to provide the callbacks. Everything else is handled
  * in the connection manager.
@@ -1868,6 +1901,7 @@ static const struct dev_pm_ops tb_switch_pm_ops = {
 struct device_type tb_switch_type = {
 	.name = "thunderbolt_device",
 	.release = tb_switch_release,
+	.uevent = tb_switch_uevent,
 	.pm = &tb_switch_pm_ops,
 };
 
-- 
2.30.2

