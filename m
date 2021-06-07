Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A8439DA74
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 13:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbhFGLCE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 07:02:04 -0400
Received: from mga09.intel.com ([134.134.136.24]:4781 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231160AbhFGLCC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Jun 2021 07:02:02 -0400
IronPort-SDR: Uax36emI5H7iQxk6BMrXt4UVjE4NrhbNaJ4AFPCiLVA8p5pMmrNOM96aso6i0NMqXOSRQqOU+w
 JI4/AXotdIqg==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="204569302"
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="204569302"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 04:00:09 -0700
IronPort-SDR: RkCfR0ShIOg9HMOcOemnZg6tWIiWEVkiNYOYOwj+/EkoptkmZvbsD7h5Uqy3mgX4LIU2rafqQW
 Gx8PsoZwZWTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="481479072"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 07 Jun 2021 04:00:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 6ECEB184; Mon,  7 Jun 2021 14:00:30 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        kernel test robot <lkp@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        Azhar Shaikh <azhar.shaikh@intel.com>
Subject: [PATCH 3/5] thunderbolt: Poll 10ms for REG_FW_STS_NVM_AUTH_DONE to be set
Date:   Mon,  7 Jun 2021 14:00:28 +0300
Message-Id: <20210607110030.38664-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607110030.38664-1-mika.westerberg@linux.intel.com>
References: <20210607110030.38664-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Gil Fine <gil.fine@intel.com>

In Intel Tiger Lake and beyond it takes some time after the force power
is set until the firmware connection manager is ready. So instead of
reading it once we poll it for 10ms before giving up.

Signed-off-by: Gil Fine <gil.fine@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/icm.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index 2f30b816705a..0f25cf9fe519 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -1677,14 +1677,18 @@ static void icm_icl_rtd3_veto(struct tb *tb, const struct icm_pkg_header *hdr)
 
 static bool icm_tgl_is_supported(struct tb *tb)
 {
-	u32 val;
+	unsigned long end = jiffies + msecs_to_jiffies(10);
 
-	/*
-	 * If the firmware is not running use software CM. This platform
-	 * should fully support both.
-	 */
-	val = ioread32(tb->nhi->iobase + REG_FW_STS);
-	return !!(val & REG_FW_STS_NVM_AUTH_DONE);
+	do {
+		u32 val;
+
+		val = ioread32(tb->nhi->iobase + REG_FW_STS);
+		if (val & REG_FW_STS_NVM_AUTH_DONE)
+			return true;
+		usleep_range(100, 500);
+	} while (time_before(jiffies, end));
+
+	return false;
 }
 
 static void icm_handle_notification(struct work_struct *work)
-- 
2.30.2

