Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18709346214
	for <lists+linux-usb@lfdr.de>; Tue, 23 Mar 2021 15:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232477AbhCWO5O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Mar 2021 10:57:14 -0400
Received: from mga05.intel.com ([192.55.52.43]:26356 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232475AbhCWO4x (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Mar 2021 10:56:53 -0400
IronPort-SDR: Voq3aBB2GN9jaaJlPAzLs0Kx7KmNaGljBJMAMZQZ1/kEucNxUtpCWjPULhicaYN1WeNrYmpgua
 xJ0px7UIp+Rw==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="275592054"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; 
   d="scan'208";a="275592054"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 07:56:52 -0700
IronPort-SDR: ZUGaN4BzgLwwYndyuX8Pz5KdTmFUiXgM/jUmDsEqmgyojXjXsI/H+WfCCaQmeXLciGmMcct5Mu
 7ElJywZgwmRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; 
   d="scan'208";a="435584482"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 23 Mar 2021 07:56:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id CED7D4CC; Tue, 23 Mar 2021 16:57:01 +0200 (EET)
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
Subject: [PATCH v2 2/3] thunderbolt: Hide authorized attribute if router does not support PCIe tunnels
Date:   Tue, 23 Mar 2021 17:57:00 +0300
Message-Id: <20210323145701.86161-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323145701.86161-1-mika.westerberg@linux.intel.com>
References: <20210323145701.86161-1-mika.westerberg@linux.intel.com>
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
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/thunderbolt/switch.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index a1b4a695080e..fbcc920e327c 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1746,6 +1746,18 @@ static struct attribute *switch_attrs[] = {
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
@@ -1754,7 +1766,8 @@ static umode_t switch_attr_is_visible(struct kobject *kobj,
 
 	if (attr == &dev_attr_authorized.attr) {
 		if (sw->tb->security_level == TB_SECURITY_NOPCIE ||
-		    sw->tb->security_level == TB_SECURITY_DPONLY)
+		    sw->tb->security_level == TB_SECURITY_DPONLY ||
+		    !has_port(sw, TB_TYPE_PCIE_UP))
 			return 0;
 	} else if (attr == &dev_attr_device.attr) {
 		if (!sw->device)
-- 
2.30.2

