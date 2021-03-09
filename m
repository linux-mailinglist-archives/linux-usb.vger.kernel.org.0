Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E386A3327A4
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 14:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbhCINsy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 08:48:54 -0500
Received: from mga11.intel.com ([192.55.52.93]:24364 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231271AbhCINsV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Mar 2021 08:48:21 -0500
IronPort-SDR: mr26PU+zC12ELNoOYHwCPDETWgRgCkTIVHLuCTV6VkjmnL+ae299oCYyRA2mBFm3XoCKxGmT2f
 77Rf0VWcf7oQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="184875511"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="184875511"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 05:48:21 -0800
IronPort-SDR: LnOgMhGLiyTT3Aplzc1+7b0mDZvXV03edP+irQUHVN7I5A1yx2zaLcIMZZclSOQygMzo3eq0fk
 qBUEAx4i7xFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="437903759"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2021 05:48:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id EEF01147; Tue,  9 Mar 2021 15:48:18 +0200 (EET)
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
Subject: [PATCH 1/3] thunderbolt: Add details to router uevent
Date:   Tue,  9 Mar 2021 16:48:16 +0300
Message-Id: <20210309134818.63118-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309134818.63118-1-mika.westerberg@linux.intel.com>
References: <20210309134818.63118-1-mika.westerberg@linux.intel.com>
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
---
 drivers/thunderbolt/switch.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 72b43c7c0651..a82032c081e8 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1827,6 +1827,39 @@ static void tb_switch_release(struct device *dev)
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
@@ -1860,6 +1893,7 @@ static const struct dev_pm_ops tb_switch_pm_ops = {
 struct device_type tb_switch_type = {
 	.name = "thunderbolt_device",
 	.release = tb_switch_release,
+	.uevent = tb_switch_uevent,
 	.pm = &tb_switch_pm_ops,
 };
 
-- 
2.30.1

