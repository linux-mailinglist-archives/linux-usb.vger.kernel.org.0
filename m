Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5DA939DA72
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 13:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbhFGLCC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 07:02:02 -0400
Received: from mga09.intel.com ([134.134.136.24]:4781 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230507AbhFGLCA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Jun 2021 07:02:00 -0400
IronPort-SDR: vfuot7jVB7SAr2+DJbSSwfV/Zp/HdpvbMViLyW0rUh0bxnHn2CX9mTkycKdtoeM8MJkYLEwedp
 oaTUFUW2jd+A==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="204569300"
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="204569300"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 04:00:09 -0700
IronPort-SDR: MpE/U940CBhjR4xeXMPmE2XHOv6YCGTbbvwFpc9zY//kmHpkj1AXnBWek2hoKnQBhl59Fv5t32
 NhlXTvIuH2vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="413000837"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 07 Jun 2021 04:00:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 5AF4B67; Mon,  7 Jun 2021 14:00:30 +0300 (EEST)
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
Subject: [PATCH 1/5] thunderbolt: Bond lanes only when dual_link_port != NULL in alloc_dev_default()
Date:   Mon,  7 Jun 2021 14:00:26 +0300
Message-Id: <20210607110030.38664-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607110030.38664-1-mika.westerberg@linux.intel.com>
References: <20210607110030.38664-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We should not dereference ->dual_link_port if it is NULL and lane bonding
is requested. For this reason move lane bonding configuration happen
inside the block where ->dual_link_port != NULL.

Fixes: 54509f5005ca ("thunderbolt: Add KUnit tests for path walking")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/test.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index cf34c1ecf5d5..ba5afd471766 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -303,18 +303,18 @@ static struct tb_switch *alloc_dev_default(struct kunit *test,
 	if (port->dual_link_port && upstream_port->dual_link_port) {
 		port->dual_link_port->remote = upstream_port->dual_link_port;
 		upstream_port->dual_link_port->remote = port->dual_link_port;
-	}
 
-	if (bonded) {
-		/* Bonding is used */
-		port->bonded = true;
-		port->total_credits *= 2;
-		port->dual_link_port->bonded = true;
-		port->dual_link_port->total_credits = 0;
-		upstream_port->bonded = true;
-		upstream_port->total_credits *= 2;
-		upstream_port->dual_link_port->bonded = true;
-		upstream_port->dual_link_port->total_credits = 0;
+		if (bonded) {
+			/* Bonding is used */
+			port->bonded = true;
+			port->total_credits *= 2;
+			port->dual_link_port->bonded = true;
+			port->dual_link_port->total_credits = 0;
+			upstream_port->bonded = true;
+			upstream_port->total_credits *= 2;
+			upstream_port->dual_link_port->bonded = true;
+			upstream_port->dual_link_port->total_credits = 0;
+		}
 	}
 
 	return sw;
-- 
2.30.2

