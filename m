Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19394249BB9
	for <lists+linux-usb@lfdr.de>; Wed, 19 Aug 2020 13:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbgHSL13 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Aug 2020 07:27:29 -0400
Received: from mga06.intel.com ([134.134.136.31]:63288 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727116AbgHSL1V (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Aug 2020 07:27:21 -0400
IronPort-SDR: vCsKWuPvDT7zYG4WsnbLCBHdiAzkGU9/paYxs7zudVzCchF2XGRAgj+YjQe94RVpO9bc8p9rHF
 V0YoIacUEmpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="216612662"
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; 
   d="scan'208";a="216612662"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2020 04:27:20 -0700
IronPort-SDR: uyxpC3TYfO1rGHJQqNXNOkfwQxVPBiXdoTMWebCucXgZbpfAT3IYcra/QIhfvrTT81ZO4wAarO
 /rp63RHHgyAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; 
   d="scan'208";a="497204521"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 19 Aug 2020 04:27:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id CE706B8; Wed, 19 Aug 2020 14:27:16 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Nikunj A . Dadhania" <nikunj.dadhania@linux.intel.com>,
        Srikanth Nandamuri <srikanth.nandamuri@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 2/2] thunderbolt: Use maximum USB3 link rate when reclaiming if link is not up
Date:   Wed, 19 Aug 2020 14:27:16 +0300
Message-Id: <20200819112716.59074-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819112716.59074-1-mika.westerberg@linux.intel.com>
References: <20200819112716.59074-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the USB3 link is not up the actual link rate is 0 so when reclaiming
bandwidth we should look at maximum supported link rate instead.

Cc: stable@vger.kernel.org
Fixes: 0bd680cd900c ("thunderbolt: Add USB3 bandwidth management")
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 2aae2c76d880..d50e5b93632a 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -951,10 +951,18 @@ static void tb_usb3_reclaim_available_bandwidth(struct tb_tunnel *tunnel,
 	int ret, max_rate, allocate_up, allocate_down;
 
 	ret = usb4_usb3_port_actual_link_rate(tunnel->src_port);
-	if (ret <= 0) {
-		tb_tunnel_warn(tunnel, "tunnel is not up\n");
+	if (ret < 0) {
+		tb_tunnel_warn(tunnel, "failed to read actual link rate\n");
 		return;
+	} else if (!ret) {
+		/* Use maximum link rate if the link valid is not set */
+		ret = usb4_usb3_port_max_link_rate(tunnel->src_port);
+		if (ret < 0) {
+			tb_tunnel_warn(tunnel, "failed to read maximum link rate\n");
+			return;
+		}
 	}
+
 	/*
 	 * 90% of the max rate can be allocated for isochronous
 	 * transfers.
-- 
2.28.0

