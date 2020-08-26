Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56E1D252C2A
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 13:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728707AbgHZLHm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 07:07:42 -0400
Received: from mga06.intel.com ([134.134.136.31]:15562 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728586AbgHZLHk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Aug 2020 07:07:40 -0400
IronPort-SDR: nXcvERGA4xsFwGxuVcoubZMkmD2nSGtX3t9TNYmXh8NHxRHC0l01X31/tcbQTPOpvTQn2RJcUS
 yx/qziMt0vWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="217817815"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="217817815"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 04:07:39 -0700
IronPort-SDR: YAY2uhONPZvKpQEYmQI0Lt8ylHiITgFV74Z7v5L1qRnhSZ5HqBtgkv4WrTbEORpPddFl+5hcD9
 fO5duUaOZtjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="499674041"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 26 Aug 2020 04:07:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id C745B1B4; Wed, 26 Aug 2020 14:07:36 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/9] thunderbolt: Move struct tb_cap_any to tb_regs.h
Date:   Wed, 26 Aug 2020 14:07:28 +0300
Message-Id: <20200826110736.55186-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
References: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This structure will be needed by the debugfs implementation so make it
available outside of cap.c.

While there add kernel-doc comments to the structure.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/cap.c     |  8 --------
 drivers/thunderbolt/tb_regs.h | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/thunderbolt/cap.c b/drivers/thunderbolt/cap.c
index 19db6cdc5b70..1582e4ebac56 100644
--- a/drivers/thunderbolt/cap.c
+++ b/drivers/thunderbolt/cap.c
@@ -15,14 +15,6 @@
 #define VSE_CAP_OFFSET_MAX	0xffff
 #define TMU_ACCESS_EN		BIT(20)
 
-struct tb_cap_any {
-	union {
-		struct tb_cap_basic basic;
-		struct tb_cap_extended_short extended_short;
-		struct tb_cap_extended_long extended_long;
-	};
-} __packed;
-
 static int tb_port_enable_tmu(struct tb_port *port, bool enable)
 {
 	struct tb_switch *sw = port->sw;
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 0431e415e3bc..c33751be0f56 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -93,6 +93,20 @@ struct tb_cap_extended_long {
 	u16 length;
 } __packed;
 
+/**
+ * struct tb_cap_any - Structure capable of hold every capability
+ * @basic: Basic capability
+ * @extended_short: Vendor specific capability
+ * @extended_long: Vendor specific extended capability
+ */
+struct tb_cap_any {
+	union {
+		struct tb_cap_basic basic;
+		struct tb_cap_extended_short extended_short;
+		struct tb_cap_extended_long extended_long;
+	};
+} __packed;
+
 /* capabilities */
 
 struct tb_cap_link_controller {
-- 
2.28.0

