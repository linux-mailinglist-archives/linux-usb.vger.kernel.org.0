Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF972EA730
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 10:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727707AbhAEJU5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 04:20:57 -0500
Received: from mga11.intel.com ([192.55.52.93]:39181 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727481AbhAEJU4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Jan 2021 04:20:56 -0500
IronPort-SDR: o8e6+2CsLxmXFIUn2NYSwIybnk6Up0tfQEWY4HnDBjZ4qPM6HtT2bJV3n6l8HVXH0A3b7UNO/d
 caf8mxVNNz3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="173567980"
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; 
   d="scan'208";a="173567980"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 01:19:11 -0800
IronPort-SDR: 52Ecl22xpjflHRLP+ijsKY1w7kOdCN4e0Kw3eyCzuP5qSI1ysq/4OBFyxBnbM/6wbwFFn+JDzT
 oqaGNWiLu0Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; 
   d="scan'208";a="386988078"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 05 Jan 2021 01:19:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id A70A8F2; Tue,  5 Jan 2021 11:19:08 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Drop duplicated 0x prefix from format string
Date:   Tue,  5 Jan 2021 12:19:08 +0300
Message-Id: <20210105091908.15290-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The tb_dbg() call is using %#x that already adds the 0x prefix so don't
duplicate it.

Fixes: 9039387e166e ("thunderbolt: Add USB4 router operation proxy for firmware connection manager")
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/icm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index 8b7f941a9bb7..b8c4159bc32d 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -2316,7 +2316,7 @@ static int icm_usb4_switch_nvm_authenticate_status(struct tb_switch *sw,
 
 	if (auth && auth->reply.route_hi == sw->config.route_hi &&
 	    auth->reply.route_lo == sw->config.route_lo) {
-		tb_dbg(tb, "NVM_AUTH found for %llx flags 0x%#x status %#x\n",
+		tb_dbg(tb, "NVM_AUTH found for %llx flags %#x status %#x\n",
 		       tb_route(sw), auth->reply.hdr.flags, auth->reply.status);
 		if (auth->reply.hdr.flags & ICM_FLAGS_ERROR)
 			ret = -EIO;
-- 
2.29.2

