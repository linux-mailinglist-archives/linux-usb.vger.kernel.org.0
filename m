Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 543F36ABE4C
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 12:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbjCFLg7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 06:36:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjCFLg6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 06:36:58 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A1055595
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 03:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678102614; x=1709638614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SHZVq4iyHzTc7/aCLv34kX9/Alux3PeXI8w4nMsshYA=;
  b=aFElk05tVLd7ses6g0KPofpa10SS9CLFXt5nZ0mcnc7n8vR7p2yNCeli
   4HfMswEeJjg3DUQLBDC3SULH/27fiCXNoYbODMhsJB9BOiQCM1vRCnFzA
   urx2PTubeLZUBwwbuAEQMKaIH26N5ewRn3BRVx7oms4igjHwsP6NAPYuJ
   cvQZXEOaEcuCzxEe3zBFuk1yTW/Xi6dzwqeSCE7Qy1EbXOmKEQyAMaoz2
   NK3oXqL3HnUqr73z9rYTnE6XApWMX8hYLyG3BgEPxaql6SSZBmlczVdcH
   6cbi46hf5gywlk085+mLiAjlnbCBBDxegAC0QVo+SF1DBnbOO+bL7GxPl
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="363147590"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="363147590"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 03:35:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="745024096"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="745024096"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 06 Mar 2023 03:35:22 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 3371D354; Mon,  6 Mar 2023 13:36:06 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        =?UTF-8?q?Christian=20Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/5] thunderbolt: Call tb_check_quirks() after initializing adapters
Date:   Mon,  6 Mar 2023 13:36:03 +0200
Message-Id: <20230306113605.46137-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230306113605.46137-1-mika.westerberg@linux.intel.com>
References: <20230306113605.46137-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In order to apply quirks based on certain adapter types move call to
tb_check_quirks() happen after the adapters are initialized. This should
not affect the existing quirks.

Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 3370e18ba05f..da373ac38285 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2968,8 +2968,6 @@ int tb_switch_add(struct tb_switch *sw)
 			dev_warn(&sw->dev, "reading DROM failed: %d\n", ret);
 		tb_sw_dbg(sw, "uid: %#llx\n", sw->uid);
 
-		tb_check_quirks(sw);
-
 		ret = tb_switch_set_uuid(sw);
 		if (ret) {
 			dev_err(&sw->dev, "failed to set UUID\n");
@@ -2988,6 +2986,8 @@ int tb_switch_add(struct tb_switch *sw)
 			}
 		}
 
+		tb_check_quirks(sw);
+
 		tb_switch_default_link_ports(sw);
 
 		ret = tb_switch_update_link_attributes(sw);
-- 
2.39.1

