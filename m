Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4C273D7868
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 16:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232356AbhG0OYh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 10:24:37 -0400
Received: from mga06.intel.com ([134.134.136.31]:45125 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232136AbhG0OYh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Jul 2021 10:24:37 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="273532672"
X-IronPort-AV: E=Sophos;i="5.84,273,1620716400"; 
   d="scan'208";a="273532672"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2021 07:24:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,273,1620716400"; 
   d="scan'208";a="505905527"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2021 07:24:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 49150DE; Tue, 27 Jul 2021 17:25:01 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Christian Kellner <ckellner@redhat.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] Revert "thunderbolt: Hide authorized attribute if router does not support PCIe tunnels"
Date:   Tue, 27 Jul 2021 17:25:01 +0300
Message-Id: <20210727142501.27476-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit 6f3badead6a078cf3c71f381f9d84ac922984a00.

It turns out bolt depends on having authorized attribute visible under
each device. Hiding it makes bolt crash as several people have reported
on various bug trackers. For this reason revert the commit.

Link: https://gitlab.freedesktop.org/bolt/bolt/-/issues/174
Link: https://bugzilla.redhat.com/show_bug.cgi?id=1979765
Link: https://bugs.archlinux.org/task/71569
Cc: stable@vger.kernel.org
Cc: Christian Kellner <ckellner@redhat.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 83b1ef3d5d03..10d6b228cc94 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1875,18 +1875,6 @@ static struct attribute *switch_attrs[] = {
 	NULL,
 };
 
-static bool has_port(const struct tb_switch *sw, enum tb_port_type type)
-{
-	const struct tb_port *port;
-
-	tb_switch_for_each_port(sw, port) {
-		if (!port->disabled && port->config.type == type)
-			return true;
-	}
-
-	return false;
-}
-
 static umode_t switch_attr_is_visible(struct kobject *kobj,
 				      struct attribute *attr, int n)
 {
@@ -1895,8 +1883,7 @@ static umode_t switch_attr_is_visible(struct kobject *kobj,
 
 	if (attr == &dev_attr_authorized.attr) {
 		if (sw->tb->security_level == TB_SECURITY_NOPCIE ||
-		    sw->tb->security_level == TB_SECURITY_DPONLY ||
-		    !has_port(sw, TB_TYPE_PCIE_UP))
+		    sw->tb->security_level == TB_SECURITY_DPONLY)
 			return 0;
 	} else if (attr == &dev_attr_device.attr) {
 		if (!sw->device)
-- 
2.30.2

