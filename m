Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7B8710838
	for <lists+linux-usb@lfdr.de>; Thu, 25 May 2023 11:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240493AbjEYJB0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 May 2023 05:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240478AbjEYJBZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 May 2023 05:01:25 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CACD18D
        for <linux-usb@vger.kernel.org>; Thu, 25 May 2023 02:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685005284; x=1716541284;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EPlWlvcgpP2QjheKqqAWfQtRtfWkomoVewnN3EONT0g=;
  b=I31eyvui4SOyWemc475ISZeadeYZ3xJPutm3fGS0ecfT/O7ytDtlJ+BR
   blHqGz/0A+ieHgPQw133zuf8/JsOk50cVriHckynKnw8KJP3nomulaR/O
   DA/VKUcQcg/yRFmQ904bJiaUrIQ/O9hPNH69mmraeA3a6/gLAhg6rr2hR
   WaoLvpTDT6ro8RHxi/D0b5lK9HvFlWTt6T0tmq+tLpY+rX4+5rfTLVQPP
   SszTz8cIW1yEoxMs0HFKm/vqN8tUOPVJKTs9CIxNjwM74XpcQ+ZqlDmro
   u3cy7Rnu6Vd5SaQWym35HKt5dTwKNTwyHRM7KOBBP7msPBbf+Hy5jFwwR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333452075"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="333452075"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:01:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="655135846"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="655135846"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 25 May 2023 02:01:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id C3F1623A; Thu, 25 May 2023 12:01:24 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Koba Ko <koba.ko@canonical.com>,
        Imre Deak <imre.deak@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/2] thunderbolt: Increase DisplayPort Connection Manager handshake timeout
Date:   Thu, 25 May 2023 12:01:23 +0300
Message-Id: <20230525090124.11614-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525090124.11614-1-mika.westerberg@linux.intel.com>
References: <20230525090124.11614-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It turns out that when plugging in VGA cable through USB-C to VGA/DVI
dongle the Connection Manager handshake can take longer time, at least
on Intel Titan Ridge based docks such as Dell WD91TB. This leads to
following error in the dmesg:

  thunderbolt 0000:00:0d.3: 3:10: DP tunnel activation failed, aborting

and the display stays blank (because we failed to establish the tunnel).
For this reason increase the timeout to 3s.

Reported-by: Koba Ko <koba.ko@canonical.com>
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 3bf2628a5dcd..3ebd32b897a0 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -531,7 +531,7 @@ static int tb_dp_xchg_caps(struct tb_tunnel *tunnel)
 	 * Perform connection manager handshake between IN and OUT ports
 	 * before capabilities exchange can take place.
 	 */
-	ret = tb_dp_cm_handshake(in, out, 1500);
+	ret = tb_dp_cm_handshake(in, out, 3000);
 	if (ret)
 		return ret;
 
-- 
2.39.2

