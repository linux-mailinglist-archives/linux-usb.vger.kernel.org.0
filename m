Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 996A479BE0B
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 02:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350882AbjIKVmA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236256AbjIKKE5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 06:04:57 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C64F2E68
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 03:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694426692; x=1725962692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PKr+r2A7w4fkYUGg7IwStLMBgtKmmOrekmzXaNpn630=;
  b=cP+zszrU15f4bd6qi/su0yLI225lVZto4x7g0tY3QA8v5C8Q1TEi/eFW
   bIW8Lqc6RwZgU+LNdPs5WMlpIxcxNBx9UlS4tOogYD9GDGuRMGrTb+oey
   DoNMody/2TRXhVR8UcIk47rkIXB+rr6mdo3kDBfGGvB63JTJVmBxWAPOW
   clvknoBG1t7EYNGMy5p7RaR9z8rXCT7u85WJQtoCZhnv+pr3kI4p/hrUo
   7Oo1pdUYM+FlJRdINTTBUkOxR4E4HqFcGuvOXqjd59qdpYn2dK9ai9mod
   ZXh6fFqOA1LgkGex+GrOg047meSGN9RU5ekDtZq9aq776HnxVNV4Qgpkf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="442037123"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="442037123"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 03:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="858263763"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="858263763"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 11 Sep 2023 03:04:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id C17249E2; Mon, 11 Sep 2023 13:04:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Werner Sembach <wse@tuxedocomputers.com>,
        Konrad J Hambrick <kjhambrick@gmail.com>,
        Calvin Walton <calvin.walton@kepstin.ca>,
        =?UTF-8?q?Marek=20=C5=A0anta?= <teslan223@gmail.com>,
        David Binderman <dcb314@hotmail.com>,
        Alex Balcanquall <alex@alexbal.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/5] thunderbolt: Check that lane 1 is in CL0 before enabling lane bonding
Date:   Mon, 11 Sep 2023 13:04:42 +0300
Message-Id: <20230911100445.3612655-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230911100445.3612655-1-mika.westerberg@linux.intel.com>
References: <20230911100445.3612655-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Marek reported that when BlackMagic UltraStudio device is connected the
kernel repeatedly tries to enable lane bonding without success making
the device non-functional. It looks like the device does not have lane 1
connected at all so even though it is enabled we should not try to bond
the lanes. For this reason check that lane 1 is in fact CL0 (connected,
active) before attempting to bond the lanes.

Reported-by: Marek Šanta <teslan223@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217737
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 43171cc1cc2d..bd5815f8f23b 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2725,6 +2725,13 @@ int tb_switch_lane_bonding_enable(struct tb_switch *sw)
 	    !tb_port_is_width_supported(down, TB_LINK_WIDTH_DUAL))
 		return 0;
 
+	/*
+	 * Both lanes need to be in CL0. Here we assume lane 0 already be in
+	 * CL0 and check just for lane 1.
+	 */
+	if (tb_wait_for_port(down->dual_link_port, false) <= 0)
+		return -ENOTCONN;
+
 	ret = tb_port_lane_bonding_enable(up);
 	if (ret) {
 		tb_port_warn(up, "failed to enable lane bonding\n");
-- 
2.40.1

