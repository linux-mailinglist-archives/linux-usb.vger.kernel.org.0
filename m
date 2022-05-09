Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21C0F5205BB
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 22:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbiEIUYn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 16:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiEIUYW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 16:24:22 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C6424DC03
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 13:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652126855; x=1683662855;
  h=from:to:cc:subject:date:message-id;
  bh=8hRzmeHUJDqLt8zotwJMg2LoG76wCsfHN8lTHNpsXko=;
  b=Pc7cyFRk2sN0MGKdbDcVOKAx5Xio1oaBmqlZBLYY33XsFG/5mkU5anWD
   3p3jDVOs3bHvYgt8po9YL3/UNvH20Hh04GS4bXJxedmsfjb5IMuVOaTkH
   f52XMbuIGMGXQQ6fCZmIvztRFjqXD7HOkzBqJhDVT6cJkhDJTbX2g4gy/
   110Di12Te4C7OAU0ga3+AoAmabNQTMxwLXS+gs+c+qR22JQchKQAE+CGV
   B5M3oKYEl81AAvqtNPR9uLjr6HTavOkg+gLrQbOAMzK5GxtWDFevXpqZo
   Cj/KbIuim4g7yPVu3lXi2TAarxyfVJNdwFPx71EIgsty6yL2RkOnkwtNl
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="249692907"
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; 
   d="scan'208";a="249692907"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 13:07:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; 
   d="scan'208";a="710688851"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by fmsmga001.fm.intel.com with ESMTP; 09 May 2022 13:07:32 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v2 0/6] thunderbolt: CL1 support for USB4 and Titan Ridge
Date:   Mon,  9 May 2022 23:16:50 +0300
Message-Id: <20220509201656.502-1-gil.fine@intel.com>
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

v1 can be found here:

  https://lore.kernel.org/linux-usb/20220501203321.19021-1-gil.fine@intel.com/

Changes from v1:

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

 drivers/thunderbolt/switch.c  |  91 ++++++++--------
 drivers/thunderbolt/tb.c      |  70 ++++++++++--
 drivers/thunderbolt/tb.h      |  51 +++++----
 drivers/thunderbolt/tb_regs.h |   6 ++
 drivers/thunderbolt/tmu.c     | 198 ++++++++++++++++++++++++++++------
 5 files changed, 313 insertions(+), 103 deletions(-)

-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

