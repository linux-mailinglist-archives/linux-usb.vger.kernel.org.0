Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEDF729E7B1
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 10:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgJ2Jqk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 05:46:40 -0400
Received: from mga01.intel.com ([192.55.52.88]:50689 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726843AbgJ2Jqk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Oct 2020 05:46:40 -0400
IronPort-SDR: i3ZnRRVawtD3rMDYdZ1DFWx9Yj5weUmWK/yn3tGBPlRUPuGfrleUFYlTvoqFO3sydvsrGwaRFF
 TJcZodE1Z2cA==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="186188388"
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="186188388"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 02:46:40 -0700
IronPort-SDR: O2DvmzbKSZ8CZShnCNgE53ZtvYuOX1AiOLKk61jje68c7mHpXEs6fwvh5QnNFDEavqDT9GbnZa
 fy/xhoBHF10g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="361429942"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2020 02:46:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 0BB894E1; Thu, 29 Oct 2020 11:46:36 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Casey Bowman <casey.g.bowman@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/3] thunderbolt: Fix memory leak if ida_simple_get() fails in enumerate_services()
Date:   Thu, 29 Oct 2020 12:46:34 +0300
Message-Id: <20201029094636.51818-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The svc->key field is not released as it should be if ida_simple_get()
fails so fix that.

Fixes: 9aabb68568b4 ("thunderbolt: Fix to check return value of ida_simple_get")
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/xdomain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 48907853732a..c00ad817042e 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -881,6 +881,7 @@ static void enumerate_services(struct tb_xdomain *xd)
 
 		id = ida_simple_get(&xd->service_ids, 0, 0, GFP_KERNEL);
 		if (id < 0) {
+			kfree(svc->key);
 			kfree(svc);
 			break;
 		}
-- 
2.28.0

