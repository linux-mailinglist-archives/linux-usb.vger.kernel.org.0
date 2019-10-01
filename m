Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8186FC32BC
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 13:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732471AbfJALig (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 07:38:36 -0400
Received: from mga03.intel.com ([134.134.136.65]:58885 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725839AbfJALif (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 07:38:35 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 04:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; 
   d="scan'208";a="342949799"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 01 Oct 2019 04:38:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id F3D811F6; Tue,  1 Oct 2019 14:38:30 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
        Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mario.Limonciello@dell.com,
        Anthony Wong <anthony.wong@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 03/22] thunderbolt: Log warning if adding switch fails
Date:   Tue,  1 Oct 2019 14:38:11 +0300
Message-Id: <20191001113830.13028-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
References: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If we fail to add a switch for some reason log a warning with the error
code. This is useful for debugging.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 1f7a9e1cc09c..541295be9bfc 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -143,6 +143,7 @@ static void tb_scan_port(struct tb_port *port)
 	struct tb_cm *tcm = tb_priv(port->sw->tb);
 	struct tb_port *upstream_port;
 	struct tb_switch *sw;
+	int ret;
 
 	if (tb_is_upstream_port(port))
 		return;
@@ -203,7 +204,9 @@ static void tb_scan_port(struct tb_port *port)
 	if (!tcm->hotplug_active)
 		dev_set_uevent_suppress(&sw->dev, true);
 
-	if (tb_switch_add(sw)) {
+	ret = tb_switch_add(sw);
+	if (ret) {
+		dev_warn(&sw->dev, "failed to register switch: %d\n", ret);
 		tb_switch_put(sw);
 		return;
 	}
-- 
2.23.0

