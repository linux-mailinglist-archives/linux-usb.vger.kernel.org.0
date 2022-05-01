Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 213D05167B6
	for <lists+linux-usb@lfdr.de>; Sun,  1 May 2022 22:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345863AbiEAU1X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 May 2022 16:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232492AbiEAU1W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 May 2022 16:27:22 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB843EF36
        for <linux-usb@vger.kernel.org>; Sun,  1 May 2022 13:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651436635; x=1682972635;
  h=from:to:cc:subject:date:message-id;
  bh=Cpx0DaMwH4i1gXviqFY6O5iDA4bcLFJVuUCNjN+VMf0=;
  b=ARIWtqFqzjXDb49YeFBy8pbwJh0Ke4L7Nm9e4KvDc2QK1pEbUJyA0uYh
   MfARelJqI5+vXZjLbFL9I7PqpRrBKYsPqSBfQFFam2jn7oac5abaq151d
   jNYleBSdRMIEjQ8JeoWhTWtI1dp7gEX2APup0zm2IHQphMwhSpUDZUsKd
   qZolSkBzff6B+HtMxff7aSBMriQEdeS03MW7jCFm4BplscpAzdkx0il2Y
   zayiYrNj18l8bAGNOcpg+x53CvDMLGkoCacshduaplTZfwnX5+U8dCfzR
   XZ9Mkz+kcU3zOEZhYHuCJ0LzFTREc5EUiAbqPLs4xYBrfzKq8CrkCSGGZ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="247611824"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="247611824"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2022 13:23:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="583310198"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga008.jf.intel.com with ESMTP; 01 May 2022 13:23:52 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH 0/5] thunderbolt: CL1 support for USB4 and Titan Ridge
Date:   Sun,  1 May 2022 23:33:16 +0300
Message-Id: <20220501203321.19021-1-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In this series of patches, first, we address several issues in the CL0s
implementation.
Then, we add support for a second low power state of the
link: CL1. Low power states (called collectively CLx) are used to reduce
transmitter and receiver power when a high-speed lane is idle.
We enable it, if both sides of the link support it, and only for the
first hop router (i.e. the first device that connected to the
host router). This is needed for better thermal management.
CL1 improves power management that was intoduced by CL0s.
Also, we add support of dynamic change of TMU mode to Hifi-Uni once DP
tunnel is created. This enables CL0s while DP tunnel exists.
Due to Intel HW limitation, once we changed the TMU mode to Hifi-Uni
(when DP tunnel exists), we don't change TMU mode back to Normal-Uni,
even if DP tunnel is teared-down later.

Gil Fine (5):
  thunderbolt: Silently ignore CLx enabling in case CLx is not supported
  thunderbolt: CLx disable before system suspend only if previously
    enabled
  thunderbolt: Change downstream router's TMU rate in both TMU uni/bidir
    mode
  thunderbolt: Add CL1 support for USB4 and Titan Ridge routers
  thunderbolt: Change TMU mode to Hifi-Uni once DP tunneled

 drivers/thunderbolt/switch.c  |  85 ++++++++-------
 drivers/thunderbolt/tb.c      |  70 +++++++++++--
 drivers/thunderbolt/tb.h      |  22 +++-
 drivers/thunderbolt/tb_regs.h |   8 ++
 drivers/thunderbolt/tmu.c     | 192 ++++++++++++++++++++++++++++------
 5 files changed, 295 insertions(+), 82 deletions(-)

-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

