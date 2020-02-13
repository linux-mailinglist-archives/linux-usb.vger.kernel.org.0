Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA44E15BC49
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 11:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729494AbgBMKCK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 05:02:10 -0500
Received: from mga17.intel.com ([192.55.52.151]:63227 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729422AbgBMKCK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Feb 2020 05:02:10 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Feb 2020 02:02:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,436,1574150400"; 
   d="scan'208";a="228097601"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 13 Feb 2020 02:02:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id B869D193; Thu, 13 Feb 2020 12:02:07 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH] thunderbolt: Add missing kernel-doc parameter descriptions
Date:   Thu, 13 Feb 2020 13:02:07 +0300
Message-Id: <20200213100207.1942-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Two functions that were added for USB4 support miss kernel-doc parameter
descriptions so add them now.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/usb4.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index b341fc60c4ba..06592738b653 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -259,6 +259,7 @@ int usb4_switch_setup(struct tb_switch *sw)
 /**
  * usb4_switch_read_uid() - Read UID from USB4 router
  * @sw: USB4 router
+ * @uid: UID is stored here
  *
  * Reads 64-bit UID from USB4 router config space.
  */
@@ -296,6 +297,9 @@ static int usb4_switch_drom_read_block(struct tb_switch *sw,
 /**
  * usb4_switch_drom_read() - Read arbitrary bytes from USB4 router DROM
  * @sw: USB4 router
+ * @address: Byte address inside DROM to start reading
+ * @buf: Buffer where the DROM contens is stored
+ * @size: Number of bytes to read from DROM
  *
  * Uses USB4 router operations to read router DROM. For devices this
  * should always work but for hosts it may return %-EOPNOTSUPP in which
-- 
2.25.0

