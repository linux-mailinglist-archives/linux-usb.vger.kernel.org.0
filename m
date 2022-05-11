Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5AD15234C8
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 15:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244385AbiEKN4n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 09:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244352AbiEKN4T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 09:56:19 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A2A38A
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 06:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652277378; x=1683813378;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DqPAPw8qgQY+R2Ioy5u5gNT27Lof2P8GFRvoRMzp6kM=;
  b=nFnWKhBCZ1RLE9qutxanPLqo8McfEwgez21Y16AveOOE2RIwnK1WtodG
   oJLF3T9GW+YvrhLqLzsqqY6hHv34OiD0qt1x19PCafWlPZPL2zhxiQSHB
   D+YXhks2jibpwUuHvrNcbkltLXzsBQhKEmzV6Qv5e3WUqquWOWFhJzEca
   nyPRhGQR1hm0IQHkul4GVOC8Gta89n1YRjED9ZzWNqhpfx9XQOqv0mlB6
   NNm50Fsjs6jg8TOS5E7BDUUuzDTfw+uIK4n9o9Q4LQ8guAQRqKDiZban5
   K2v0jOb82qRCYPVkiHvVB81qas1gu/KW6d6vuhpHStE0wte/xiaAeSS4h
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="249599704"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="249599704"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 06:56:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="553332018"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga002.jf.intel.com with ESMTP; 11 May 2022 06:56:15 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v3 2/6] thunderbolt: CLx disable before system suspend only if previously enabled
Date:   Wed, 11 May 2022 17:05:45 +0300
Message-Id: <20220511140549.10571-3-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220511140549.10571-1-gil.fine@intel.com>
References: <20220511140549.10571-1-gil.fine@intel.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Disable CLx before system suspended only if previously was enabled.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/switch.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index ac87e8b50e52..549523c9a543 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3063,8 +3063,10 @@ void tb_switch_suspend(struct tb_switch *sw, bool runtime)
 	 * Actually only needed for Titan Ridge but for simplicity can be
 	 * done for USB4 device too as CLx is re-enabled at resume.
 	 */
-	if (tb_switch_disable_clx(sw, TB_CL0S))
-		tb_sw_warn(sw, "failed to disable CLx on upstream port\n");
+	if (tb_switch_is_clx_enabled(sw)) {
+		if (tb_switch_disable_clx(sw, TB_CL0S))
+			tb_sw_warn(sw, "failed to disable CLx on upstream port\n");
+	}
 
 	err = tb_plug_events_active(sw, false);
 	if (err)
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

