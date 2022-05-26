Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36A75534D8C
	for <lists+linux-usb@lfdr.de>; Thu, 26 May 2022 12:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241216AbiEZKt1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 May 2022 06:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237146AbiEZKt0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 May 2022 06:49:26 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B638C8BF4
        for <linux-usb@vger.kernel.org>; Thu, 26 May 2022 03:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653562165; x=1685098165;
  h=from:to:cc:subject:date:message-id;
  bh=Xf3guFB31jOayyyXTeVDq4DER3+60mFEB0UAOl0SZ0A=;
  b=PVFFcg1EDCT+mARGy3q2JkbuIW2BlktOitKdSJQwPb4ePT5CfE4Ul8A9
   XvbtIYcOmJvsx7ywClYk+3CTAypz/u5j3PA5dLv3CUc12wdBBo1G+K+vn
   VanjlrIxhQ0DIbsyeUFT8hj9rj19D+x1n0k44WMaU0da+x9ekWpxHE3gd
   8OQf4j5Ic6+4J69RkPm2zH6M+Jt3rZwjweruJjCPMx3EVo2sa+wStmkZ9
   mB+MRUXnTOtR+pBUkUIK+GFu9RudkCuYGrtqKiF4/gnZ4tYK0UFVG6z1q
   dNUIZX6/g07aXEact+Kn7Dqd4Owl4HwG221EJv3Or66IBSgxDyHj8YzTc
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="274223342"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="274223342"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2022 03:49:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="704474261"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga004.jf.intel.com with ESMTP; 26 May 2022 03:49:22 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v4 0/6] thunderbolt: CL1 support for USB4 and Titan Ridge
Date:   Thu, 26 May 2022 13:59:15 +0300
Message-Id: <20220526105921.17214-1-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

v1 can be found here:
  https://lore.kernel.org/linux-usb/20220501203321.19021-1-gil.fine@intel.com/
v2 can be found here:
  https://lore.kernel.org/linux-usb/20220509201656.502-1-gil.fine@intel.com/
v3 can be found here:
  https://lore.kernel.org/linux-usb/20220511140549.10571-1-gil.fine@intel.com/

Changes in v4:
* Remove unnecessary struct tb_sw_tmu_config and fix some typos.
* device_for_each_child() move from tb.c to tmu.c
  inside tb_switch_enable_tmu_1st_child().

Changes in v3:
* Fix to support the case of enabling CL1 entry after resume
  from runtime PM (if CL1 supported in the connected device)

Changes in v2:
* Handle CL1 and CL0s together since on the hardware level they are
  supported and enabled together
* Use device_for_each_child() to set TMU mode of host router's 1st
  children
* Use FIELD_x macros from include/linux/bitfield.h
* Split single patch into two for clarity
* Fix commit message

In this series of patches, first, we address several issues in the CL0s
implementation.
Then, we add support for a second low power state of the
link: CL1. Low power states (called collectively CLx) are used to reduce
transmitter and receiver power when a high-speed lane is idle.
We enable it, if both sides of the link support it, and only for the
first hop router (i.e. the first device that connected to the
host router). This is needed for better thermal management.
CL1 improves power management that was intoduced by CL0s.
Also, we add support of dynamic change of TMU mode to HiFi uni-directional
once DisplayPort tunnel is created.
This enables CL0s while DP tunnel exists.
Due to Intel hardware limitation, once we changed the TMU mode to HiFi
uni-directional (when DP tunnel exists), we don't change TMU mode back
to normal uni-directional, even if DP tunnel is torn down later.
Though, after sleep (or runtime PM) resume, the TMU is changed to normal
uni-directional (if CLx supported in the connected device) to enable
CL1 entry.

Gil Fine (6):
  thunderbolt: Silently ignore CLx enabling in case CLx is not supported
  thunderbolt: CLx disable before system suspend only if previously
    enabled
  thunderbolt: Fix typos in CLx enabling
  thunderbolt: Change downstream router's TMU rate in both TMU uni/bidir
    mode
  thunderbolt: Add CL1 support for USB4 and Titan Ridge routers
  thunderbolt: Change TMU mode to HiFi uni-directional once DisplayPort
    tunneled

 drivers/thunderbolt/switch.c  |  91 +++++++-------
 drivers/thunderbolt/tb.c      |  68 +++++++++--
 drivers/thunderbolt/tb.h      |  48 ++++----
 drivers/thunderbolt/tb_regs.h |   6 +
 drivers/thunderbolt/tmu.c     | 221 ++++++++++++++++++++++++++++------
 5 files changed, 323 insertions(+), 111 deletions(-)

-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

