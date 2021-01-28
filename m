Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1510307633
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 13:33:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231473AbhA1Mbd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 07:31:33 -0500
Received: from mga01.intel.com ([192.55.52.88]:54368 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231462AbhA1Mb1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 28 Jan 2021 07:31:27 -0500
IronPort-SDR: iZgKQF39w486Y/iW7ZBABMgmdPcEuy967pg0TEyA/TXU6QN+l/SmS3hxeOd9JUENFi/wYGTYBl
 p41m5Gcd2giQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="199057041"
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="199057041"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 04:29:37 -0800
IronPort-SDR: LF2zqqZz190ukuORBHbQ8yozCmfv8Ylqb1QKZks2qn7JyIhGG5+sr4EQKfi/uvz1ayqSCU/hgB
 vcATsVgzhEdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="357411029"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 28 Jan 2021 04:29:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id CED74173; Thu, 28 Jan 2021 14:29:34 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/5] thunderbolt: eeprom: Fix kernel-doc descriptions of non-static functions
Date:   Thu, 28 Jan 2021 15:29:31 +0300
Message-Id: <20210128122934.36897-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
References: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix kernel-doc descriptions of the two non-static functions. This also
gets rid of the rest of the warnings on W=1 build.

Reported-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/eeprom.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
index 63c64f503faa..dd03d3096653 100644
--- a/drivers/thunderbolt/eeprom.c
+++ b/drivers/thunderbolt/eeprom.c
@@ -279,7 +279,9 @@ struct tb_drom_entry_port {
 
 
 /**
- * tb_drom_read_uid_only - read uid directly from drom
+ * tb_drom_read_uid_only() - Read UID directly from DROM
+ * @sw: Router whose UID to read
+ * @uid: UID is placed here
  *
  * Does not use the cached copy in sw->drom. Used during resume to check switch
  * identity.
@@ -520,7 +522,14 @@ static int tb_drom_read_n(struct tb_switch *sw, u16 offset, u8 *val,
 }
 
 /**
- * tb_drom_read - copy drom to sw->drom and parse it
+ * tb_drom_read() - Copy DROM to sw->drom and parse it
+ * @sw: Router whose DROM to read and parse
+ *
+ * This function reads router DROM and if successful parses the entries and
+ * populates the fields in @sw accordingly. Can be called for any router
+ * generation.
+ *
+ * Returns %0 in case of success and negative errno otherwise.
  */
 int tb_drom_read(struct tb_switch *sw)
 {
-- 
2.29.2

