Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4895234C7
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 15:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244325AbiEKN4l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 09:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244341AbiEKN4O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 09:56:14 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD1717049
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 06:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652277373; x=1683813373;
  h=from:to:cc:subject:date:message-id;
  bh=PaknoUT219cpZbAZZlDWnGCpzV7TGSELBMEXj22/aQ4=;
  b=jY3IsCzixpnx0QNjS3ml/xtoZjdxLRhWSO40VbwGqfZ6//mt7PkPPxeM
   ql7/islMG5a5hjj/prOyQsLApbse9P81EplXGe0c/pUKxZ+iVlzxsMYR0
   yNW/oC+BTNyfBin/SPNnI9vL1ySUDeaLPTpa+eEEQ9nAhZL4PzlBVQ0M2
   zLKpOuPf/UlySpMpLn4MxWHcXC/+oxX9AxA6BVgrKAlY8Zveg5UMRN28A
   IHu5nDyUoX8VlvbqAooFlbaXd30i6TQACKK9+rMLav8hH6EklGIvcjiAG
   vQ4Cz41eKQjbF0wZXMnau3W2F/e5Ee1DBcYYUXWfqPLLrHWveQZ1P2l/6
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="249599682"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="249599682"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 06:56:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="553332010"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga002.jf.intel.com with ESMTP; 11 May 2022 06:56:11 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v3 0/6] thunderbolt: CL1 support for USB4 and Titan Ridge
Date:   Wed, 11 May 2022 17:05:43 +0300
Message-Id: <20220511140549.10571-1-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

v1 can be found here:
  https://lore.kernel.org/linux-usb/20220501203321.19021-1-gil.fine@intel.com/
v2 can be found here:
  https://lore.kernel.org/linux-usb/20220509201656.502-1-gil.fine@intel.com/

Changes in v3:
* Fix to support the case of enabling CL1 entry after resume
  from runtime PM (if CL1 suppported in the connected device)

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
Though, after sleep or runtime PM resume, the TMU is changed to normal
uni-directional (if CLx suppported in the connected device) to enable
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

 drivers/thunderbolt/switch.c  |  91 ++++++++--------
 drivers/thunderbolt/tb.c      |  83 +++++++++++---
 drivers/thunderbolt/tb.h      |  51 +++++----
 drivers/thunderbolt/tb_regs.h |   6 ++
 drivers/thunderbolt/tmu.c     | 198 ++++++++++++++++++++++++++++------
 5 files changed, 322 insertions(+), 107 deletions(-)

-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

