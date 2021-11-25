Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAC345DC77
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 15:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355718AbhKYOjk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 09:39:40 -0500
Received: from mga09.intel.com ([134.134.136.24]:2373 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355839AbhKYOhj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 09:37:39 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="235345411"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="235345411"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 06:32:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="741301378"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2021 06:32:32 -0800
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH 5/7] thunderbolt: Rename Intel VSC capability
Date:   Thu, 25 Nov 2021 16:38:19 +0200
Message-Id: <20211125143821.16558-6-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211125143821.16558-1-gil.fine@intel.com>
References: <20211125143821.16558-1-gil.fine@intel.com>
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
index 2ceed608573f..08f1213ea565 100644
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

