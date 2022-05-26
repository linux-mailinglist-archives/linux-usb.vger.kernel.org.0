Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4A8B534D8F
	for <lists+linux-usb@lfdr.de>; Thu, 26 May 2022 12:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243276AbiEZKte (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 May 2022 06:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237146AbiEZKtc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 May 2022 06:49:32 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81FE6CEB86
        for <linux-usb@vger.kernel.org>; Thu, 26 May 2022 03:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653562171; x=1685098171;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=g34ni762V7ZNpKT1kr6emy3LlL/db6fdQrXnmpTZEYw=;
  b=hp7N051GpHR1PUQ2fvho4cFRAE2kzW3NIfwE8AQQnXXFPADm/uOcNU4+
   7jHgsvd7MvSxLG/UiDnGZDVux18P46WnoK3CbHIYsyyW0IQ3ZMoo4QjHq
   2huj78cQoRP0CDQc8sthrZJpzZ8v2vHjN6aSf/XxApsmh0JtpOS+apvUB
   jhHajkBAOkibvP58GZ4V1b8AAdgWeW7tgxw1mWxzVbnzlJ7MRZW/NMwrq
   60u/Z27sswtaMitVoWfdQ4L9silL1WIKEYk20Dmize1IKtBDGb2uTQs6z
   RmfavzCrZDJr7cCYjXCmBDOc1pM2g8secHzyEjwS3YGmFUxTHrKGttYnA
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="274223363"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="274223363"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2022 03:49:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="704474295"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga004.jf.intel.com with ESMTP; 26 May 2022 03:49:29 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v4 3/6] thunderbolt: Fix typos in CLx enabling
Date:   Thu, 26 May 2022 13:59:18 +0300
Message-Id: <20220526105921.17214-4-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220526105921.17214-1-gil.fine@intel.com>
References: <20220526105921.17214-1-gil.fine@intel.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix few typos in CLx enabling.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/switch.c | 2 +-
 drivers/thunderbolt/tmu.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 549523c9a543..42b7daaf9c4d 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3485,7 +3485,7 @@ static int tb_switch_enable_cl0s(struct tb_switch *sw)
  * to improve performance. CLx is enabled only if both sides of the link
  * support CLx, and if both sides of the link are not configured as two
  * single lane links and only if the link is not inter-domain link. The
- * complete set of conditions is descibed in CM Guide 1.0 section 8.1.
+ * complete set of conditions is described in CM Guide 1.0 section 8.1.
  *
  * Return: Returns 0 on success or an error code on failure.
  */
diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index e4a07a26f693..b656659d02fb 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -606,7 +606,7 @@ int tb_switch_tmu_enable(struct tb_switch *sw)
 /**
  * tb_switch_tmu_configure() - Configure the TMU rate and directionality
  * @sw: Router whose mode to change
- * @rate: Rate to configure Off/LowRes/HiFi
+ * @rate: Rate to configure Off/Normal/HiFi
  * @unidirectional: If uni-directional (bi-directional otherwise)
  *
  * Selects the rate of the TMU and directionality (uni-directional or
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

