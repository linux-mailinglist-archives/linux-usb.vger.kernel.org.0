Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8473A33279F
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 14:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231350AbhCINsz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 08:48:55 -0500
Received: from mga01.intel.com ([192.55.52.88]:52470 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231272AbhCINsV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Mar 2021 08:48:21 -0500
IronPort-SDR: TcUJ9GK6f3SvY4yUqicpkLK+GI04J3SOGEM+YX4laA6X9Wp0Z8MAmiuOJL8TML1QwxsUi+qbzy
 sStq3vob9ANA==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="208014457"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="208014457"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 05:48:21 -0800
IronPort-SDR: 4vkwr0ULxaWZq74y02Wx2EIqusi/53MFYBtYaiPcLb8fbX3Ic7hxb3U4qfC5j2FYFitQ4CGUFG
 ZxQRNF+6mWVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="376533363"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 09 Mar 2021 05:48:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 0636A490; Tue,  9 Mar 2021 15:48:18 +0200 (EET)
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
Subject: [PATCH 2/3] thunderbolt: Hide authorized attribute if router does not support PCIe tunnels
Date:   Tue,  9 Mar 2021 16:48:17 +0300
Message-Id: <20210309134818.63118-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309134818.63118-1-mika.westerberg@linux.intel.com>
References: <20210309134818.63118-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With USB4 devices PCIe tunneling is optional so for device routers
without PCIe upstream adapter it does not make much sense to expose the
authorized attribute. For this reason hide it if PCIe tunneling is not
supported by the device router.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index a82032c081e8..e73cd296db7e 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1740,6 +1740,18 @@ static struct attribute *switch_attrs[] = {
 	NULL,
 };
 
+static bool has_port(const struct tb_switch *sw, enum tb_port_type type)
+{
+	const struct tb_port *port;
+
+	tb_switch_for_each_port(sw, port) {
+		if (!port->disabled && port->config.type == type)
+			return true;
+	}
+
+	return false;
+}
+
 static umode_t switch_attr_is_visible(struct kobject *kobj,
 				      struct attribute *attr, int n)
 {
@@ -1748,7 +1760,8 @@ static umode_t switch_attr_is_visible(struct kobject *kobj,
 
 	if (attr == &dev_attr_authorized.attr) {
 		if (sw->tb->security_level == TB_SECURITY_NOPCIE ||
-		    sw->tb->security_level == TB_SECURITY_DPONLY)
+		    sw->tb->security_level == TB_SECURITY_DPONLY ||
+		    !has_port(sw, TB_TYPE_PCIE_UP))
 			return 0;
 	} else if (attr == &dev_attr_device.attr) {
 		if (!sw->device)
-- 
2.30.1

