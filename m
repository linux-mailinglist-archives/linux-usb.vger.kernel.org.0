Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFCD30A782
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 13:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhBAMXE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 07:23:04 -0500
Received: from mga14.intel.com ([192.55.52.115]:12018 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229500AbhBAMWv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 07:22:51 -0500
IronPort-SDR: sLlTq2L9Fu6J+DNglEnXnp0Vk2C4r2sbiFPMog59ol9j0R8LOd+ASBheWvOvhjzkcRbC4mStlZ
 FN0lzDhQah8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="179897705"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="179897705"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 04:21:04 -0800
IronPort-SDR: 55xEm2p+dJSDIQdkomBKhFVOXh3W2hQbIxcGc/xEIbbgrNHxJtSE+R0Z6iONufsNmCBVjunK76
 ncvFyq7BJ4Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="506831435"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 01 Feb 2021 04:21:01 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 59DA811E; Mon,  1 Feb 2021 14:21:01 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Isaac Hazan <isaac.hazan@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: dma_test: Drop unnecessary include
Date:   Mon,  1 Feb 2021 15:21:01 +0300
Message-Id: <20210201122101.87783-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It seems <linux/acpi.h> is not actually needed in this driver so we can
drop it.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/dma_test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/thunderbolt/dma_test.c b/drivers/thunderbolt/dma_test.c
index 955f980986ca..6debaf5a6604 100644
--- a/drivers/thunderbolt/dma_test.c
+++ b/drivers/thunderbolt/dma_test.c
@@ -7,7 +7,6 @@
  *	    Mika Westerberg <mika.westerberg@linux.intel.com>
  */
 
-#include <linux/acpi.h>
 #include <linux/completion.h>
 #include <linux/debugfs.h>
 #include <linux/module.h>
-- 
2.29.2

