Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF8715205BF
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 22:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbiEIUZK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 16:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbiEIUYa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 16:24:30 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C36924DC2D
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 13:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652126861; x=1683662861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=g34ni762V7ZNpKT1kr6emy3LlL/db6fdQrXnmpTZEYw=;
  b=L18ci3rMVvipkJZk6kVYb+9eJM8EsKIidyv3p+4+BAUjlPRReCrYR7NJ
   KvJEq+kirVJUhKoBQNae8hEk/e1TAFTKbdDJAL0oiXwgOi6ZfO191A5c5
   Ynqvw2gV4FdprdMCA/t3QA8puZaQaTQ6ZLtGvzf17DOQYjimjrSU+UfBy
   07mCWmR5xpKktqJhw6RhmQmXNATE9mdluV+j0Xg+DVOeqyi5Mq/A6BzTK
   n6dSX/E4kIkLslz7ZcR5CdEgiaHKZH8L9BNw9M9GbvMQ4HBvKPZtUdsMR
   ushpL/RJ47XHkd9fb8KmukEMTaSbcnqt37hlpXh0eYxB6rUiO6m6/yCls
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="249692930"
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; 
   d="scan'208";a="249692930"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 13:07:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; 
   d="scan'208";a="710688882"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by fmsmga001.fm.intel.com with ESMTP; 09 May 2022 13:07:39 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH 3/6] thunderbolt: Fix typos in CLx enabling
Date:   Mon,  9 May 2022 23:16:53 +0300
Message-Id: <20220509201656.502-4-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220509201656.502-1-gil.fine@intel.com>
References: <20220509201656.502-1-gil.fine@intel.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
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

