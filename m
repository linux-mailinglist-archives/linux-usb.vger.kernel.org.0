Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEF715ED9D4
	for <lists+linux-usb@lfdr.de>; Wed, 28 Sep 2022 12:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbiI1KIl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Sep 2022 06:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233610AbiI1KIi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Sep 2022 06:08:38 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63888D5762
        for <linux-usb@vger.kernel.org>; Wed, 28 Sep 2022 03:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664359716; x=1695895716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nFCIRsR2syuFhjqPxfuFJin0ZyDmtLjdBuvxTUiHzw4=;
  b=C052lggt85YsUM1Z4FZLCdpy/3e1Q2xKHliWBwqxyEQUOdqtrwnGoLwR
   IPGhs+wXxNspZa3WWreztaPUE0sBVBKXveHUIxCYRW3pHvhe4Jt712tl2
   vbr+1qlkkebxSCdC/EixGppiak/QwBdCiPX6+4Uv7P0j2No7QFWPI4qaD
   061zodeVNQeVL8CeMGeJaku13+ktuslFP5Yyx+A30+I/swdB7+zsRejPa
   b/hddr7QfW+57wa7bT9dr5gH6FmW2UxV5+/3sSL78fVRBgQ7xdxRsAkyR
   MMD9vwx7n3aAHVfgUv/zq88tRPzsNSfSA1ikTEqJeJTRZoCTeLRPU3oHG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="299161954"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="299161954"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2022 03:08:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="764232245"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="764232245"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 28 Sep 2022 03:08:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1B9D686; Wed, 28 Sep 2022 13:08:52 +0300 (EEST)
Date:   Wed, 28 Sep 2022 13:08:51 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 changes for v6.1 merge window
Message-ID: <YzQdM0/5yFGjBCgY@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.1-rc1

for you to fetch changes up to 5d2569cb4a65c373896ec0217febdf88739ed295:

  thunderbolt: Explicitly enable lane adapter hotplug events at startup (2022-09-26 20:18:25 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v6.1 merge window

This includes following Thunderbolt/USB4 changes for the v6.1 merge
window:

  - Support for Intel Meteor Lake integrated Thunderbolt/USB4 controller
  - Support for ASMedia USB4 controller NVM firmware upgrade
  - Receiver lane margining support
  - Few fixes and cleanups.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Andy Shevchenko (2):
      thunderbolt: Convert to use sysfs_emit()/sysfs_emit_at() APIs
      thunderbolt: Use dev_err_probe()

Colin Ian King (2):
      thunderbolt: debugfs: Fix spelling mistakes in seq_puts text
      thunderbolt: Fix spelling mistake "simultaneusly" -> "simultaneously"

Mario Limonciello (1):
      thunderbolt: Explicitly enable lane adapter hotplug events at startup

Mika Westerberg (8):
      thunderbolt: Add comment where Thunderbolt 4 PCI IDs start
      thunderbolt: Add support for Intel Meteor Lake
      thunderbolt: Move tb_xdomain_parent() to tb.h
      thunderbolt: Move port CL state functions into correct place in switch.c
      thunderbolt: Pass CL state bitmask to tb_port_clx_supported()
      thunderbolt: Add helper to check if CL states are enabled on port
      thunderbolt: Add support for receiver lane margining
      thunderbolt: Provide tb_retimer_nvm_read() analogous to tb_switch_nvm_read()

Sanjay R Mehta (1):
      thunderbolt: Add DP OUT resource when DP tunnel is discovered

Szuying Chen (5):
      thunderbolt: Allow NVM upgrade of USB4 host routers
      thunderbolt: Extend NVM version fields to 32-bits
      thunderbolt: Rename and make nvm_read() available for other files
      thunderbolt: Move vendor specific NVM handling into nvm.c
      thunderbolt: Add support for ASMedia NVM image format

 Documentation/ABI/testing/sysfs-bus-thunderbolt |   4 +-
 drivers/thunderbolt/Kconfig                     |  10 +
 drivers/thunderbolt/debugfs.c                   | 836 ++++++++++++++++++++++++
 drivers/thunderbolt/domain.c                    |  10 +-
 drivers/thunderbolt/icm.c                       |   3 +
 drivers/thunderbolt/nhi.c                       |  55 +-
 drivers/thunderbolt/nhi.h                       |   3 +
 drivers/thunderbolt/nvm.c                       | 385 ++++++++++-
 drivers/thunderbolt/retimer.c                   | 113 ++--
 drivers/thunderbolt/sb_regs.h                   |  58 ++
 drivers/thunderbolt/switch.c                    | 449 +++++++------
 drivers/thunderbolt/tb.c                        |  33 +-
 drivers/thunderbolt/tb.h                        |  56 +-
 drivers/thunderbolt/tb_regs.h                   |   3 +
 drivers/thunderbolt/usb4.c                      | 140 ++++
 drivers/thunderbolt/xdomain.c                   |  35 +-
 16 files changed, 1822 insertions(+), 371 deletions(-)

