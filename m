Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 154824781F4
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 02:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbhLQBKh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Dec 2021 20:10:37 -0500
Received: from mga09.intel.com ([134.134.136.24]:64461 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231668AbhLQBKg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Dec 2021 20:10:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639703436; x=1671239436;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+B/Pjk3rHioXV9UWFFc3k1vyEULDgaX2ibGBMc5Cf/c=;
  b=gc6AXL9OYzRA7mcYksqNnU+W9d9gWtSvSNSI4IDPPVojAM3hhzLH+x3x
   gVa/ZDjn5hDWvVD3yKreI1wsW88ux3XpwVwcbMCwbt5AFYlDCQsHetjtU
   5StaR3gGqk8R37hZgyDPmhS9i6Gkf4obMT5dNxRm3Jy/kFCbnX2D5cewu
   GYZAC9vAbK1G9NKP5GYokdippeQhghVTsmKcbvXPy80rF9j+m1BXK1mdW
   bU1t+w0nOSpeW37KnLUJwV/9RLYZpcwUIN1Qfh2hlrpqGIBJ4TCSjlHDo
   iz8t4zU8Sg8lHQ8TrnP1nBrvxNL+jjsv7+ZhQLTWxgvgS9QoThzYisuQL
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239460895"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="239460895"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 17:10:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="605733749"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Dec 2021 17:10:23 -0800
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v2 5/7] thunderbolt: Rename Intel VSC capability
Date:   Fri, 17 Dec 2021 03:16:42 +0200
Message-Id: <20211217011644.21634-6-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211217011644.21634-1-gil.fine@intel.com>
References: <20211217011644.21634-1-gil.fine@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Rename the VSC capability: TB_VSE_CAP_IECS to TB_VSE_CAP_CP_LP to follow the
Intel devices namings as appear in the datasheet.
This capability is used for controlling CLx (Low Power states of the link).

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/tb_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 0b5e4891567d..7a1b5a06303a 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -33,7 +33,7 @@ enum tb_switch_cap {
 enum tb_switch_vse_cap {
 	TB_VSE_CAP_PLUG_EVENTS		= 0x01, /* also EEPROM */
 	TB_VSE_CAP_TIME2		= 0x03,
-	TB_VSE_CAP_IECS			= 0x04,
+	TB_VSE_CAP_CP_LP		= 0x04,
 	TB_VSE_CAP_LINK_CONTROLLER	= 0x06, /* also IECS */
 };
 
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

