Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFE632C602
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 02:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbhCDA1S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 19:27:18 -0500
Received: from mga06.intel.com ([134.134.136.31]:61841 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1444678AbhCCMPn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Mar 2021 07:15:43 -0500
IronPort-SDR: P+ZQhKbvpiuu9vOMaI6mirN65tX4nqfayCUlh8FYpwlsEhtoZdp+jS00huOsMjn3viFVa2VBhM
 G8FkiHOjDkzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="248585374"
X-IronPort-AV: E=Sophos;i="5.81,219,1610438400"; 
   d="scan'208";a="248585374"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2021 04:13:12 -0800
IronPort-SDR: +NietHrzMBM2rKTsW6Gn7aq9fdeBxhBXfagqUbOKVjWKkNSTQHAzzrpDKKk+tWxLDFMUOH5dw+
 W3fO5YSMt3Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,219,1610438400"; 
   d="scan'208";a="373959470"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 03 Mar 2021 04:13:10 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 5E313103; Wed,  3 Mar 2021 14:13:10 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 2/2] thunderbolt: Increase runtime PM reference count on DP tunnel discovery
Date:   Wed,  3 Mar 2021 15:13:10 +0300
Message-Id: <20210303121310.80937-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210303121310.80937-1-mika.westerberg@linux.intel.com>
References: <20210303121310.80937-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the driver is unbound and then bound back it goes over the topology
and figure out the existing tunnels. However, if it finds DP tunnel it
should make sure the domain does not runtime suspend as otherwise it
will tear down the DP tunnel unexpectedly.

Fixes: 6ac6faee5d7d ("thunderbolt: Add runtime PM for Software CM")
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 1f000ac1728b..c348b1fc0efc 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -138,6 +138,10 @@ static void tb_discover_tunnels(struct tb_switch *sw)
 				parent->boot = true;
 				parent = tb_switch_parent(parent);
 			}
+		} else if (tb_tunnel_is_dp(tunnel)) {
+			/* Keep the domain from powering down */
+			pm_runtime_get_sync(&tunnel->src_port->sw->dev);
+			pm_runtime_get_sync(&tunnel->dst_port->sw->dev);
 		}
 
 		list_add_tail(&tunnel->list, &tcm->tunnel_list);
-- 
2.30.1

