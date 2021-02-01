Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5DD030A76C
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 13:18:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbhBAMST (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 07:18:19 -0500
Received: from mga12.intel.com ([192.55.52.136]:2645 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231192AbhBAMST (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 07:18:19 -0500
IronPort-SDR: jSN9b8a/5AFMz+gBRC++yXY+Sc77od/uuJHW150/7i/c8tADS4qPtrh3WIR2h3yzw9m7A8Rq79
 UikxYdie55vA==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="159841707"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="159841707"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 04:16:32 -0800
IronPort-SDR: q2po7mvQgdvEmio2cDC+PI5owAuX3eEg+NXd39d+9Y/fMm9JiK1pYY5AIwkf9lIWW4C0sCNiG0
 vacMkRr2MjYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="581443236"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2021 04:16:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 8E53B1A2; Mon,  1 Feb 2021 14:16:29 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 2/6] thunderbolt: eeprom: Fix kernel-doc descriptions of non-static functions
Date:   Mon,  1 Feb 2021 15:16:25 +0300
Message-Id: <20210201121629.76969-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210201121629.76969-1-mika.westerberg@linux.intel.com>
References: <20210201121629.76969-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix kernel-doc descriptions of the two non-static functions. This also
gets rid of the rest of the warnings on W=1 build.

Reported-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Lee Jones <lee.jones@linaro.org>
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

