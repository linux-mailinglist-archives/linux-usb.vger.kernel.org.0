Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACF22737C48
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 09:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbjFUHTE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 03:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbjFUHS6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 03:18:58 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97F4612E
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 00:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687331936; x=1718867936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D/4idav0OE+jmspJhBx0EJmDQ8eSowuusQH+7iln7zw=;
  b=A5HDJgSAh7eoUS3eoKO+KSJ1XpRhtLDyOxvVOqUWPFqdDg128y6Q9IFX
   zChmgtO/VaRUkEuom56rDsdRgyVd2qTQW9Sf+WaAujXo57QUH10JIA9vW
   rxfYztMNUQHRxb/8MAms5fjDvu0KOSmyqr/H2GVgxhFvLXRKJWo0GjKH9
   ljbgeLVJtc4sIJpk1c4DzuLJMnNfWOaDP3+CcY2E/nnYhKZyV/WPaHdR/
   TqdMQo3RqPHoHxP6ot8Mkgv7752datmvqqu7XQ0asQFpQ8gOkP+6vS7U7
   1KoF0IqMk4ShEZW9+UVrhwRp2xgdbr67qkUTMuuf2mzyKAwDda9dsoKO6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="357588006"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="357588006"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 00:18:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="717522791"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="717522791"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 21 Jun 2023 00:18:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 9E415241; Wed, 21 Jun 2023 10:18:43 +0300 (EEST)
Date:   Wed, 21 Jun 2023 10:18:43 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 changes for v6.5 merge window
Message-ID: <20230621071843.GK45886@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 44c026a73be8038f03dbdeef028b642880cf1511:

  Linux 6.4-rc3 (2023-05-21 14:05:48 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.5-rc1

for you to fetch changes up to 481012b479fe6d8dd4e01d739c359a8d99d074a9:

  thunderbolt: Add test case for 3 DisplayPort tunnels (2023-06-16 09:53:29 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v6.5 merge window

This includes following Thunderbolt/USB4 changes for the v6.5 merge
window:

  - Improve debug logging
  - Rework for TMU and CL states handling
  - Retimer access improvements
  - Initial support for USB4 v2 features:

    * 80G symmetric link support
    * New notifications
    * PCIe extended encapsulation
    * enhanced uni-directional TMU mode
    * CL2 link low power state
    * DisplayPort 2.x tunneling

  - Support for Intel Barlow Ridge Thunderbolt/USB4 controller
  - Minor fixes and improvements.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Gil Fine (10):
      thunderbolt: Introduce tb_switch_downstream_port()
      thunderbolt: Identify USB4 v2 routers
      thunderbolt: Add support for USB4 v2 80 Gb/s link
      thunderbolt: Announce USB4 v2 connection manager support
      thunderbolt: Enable USB4 v2 PCIe TLP/DLLP extended encapsulation
      thunderbolt: Add two additional double words for adapters TMU for USB4 v2 routers
      thunderbolt: Fix DisplayPort IN adapter capability length for USB4 v2 routers
      thunderbolt: Fix PCIe adapter capability length for USB4 v2 routers
      thunderbolt: Move constants related to NVM into nvm.c
      thunderbolt: Increase NVM_MAX_SIZE to support Intel Barlow Ridge controller

Mika Westerberg (46):
      thunderbolt: dma_test: Use correct value for absent rings when creating paths
      thunderbolt: Check for ring 0 in tb_tunnel_alloc_dma()
      thunderbolt: Log function name of the called quirk
      thunderbolt: Add debug log for link controller power quirk
      thunderbolt: Allow specifying custom credits for DMA tunnels
      thunderbolt: Add MODULE_DESCRIPTION
      thunderbolt: dma_test: Update MODULE_DESCRIPTION
      thunderbolt: Drop retimer vendor check
      thunderbolt: Increase DisplayPort Connection Manager handshake timeout
      thunderbolt: Do not touch CL state configuration during discovery
      thunderbolt: Log DisplayPort adapter rate and lanes on discovery
      thunderbolt: Mask ring interrupt on Intel hardware as well
      Merge branch 'thunderbolt/fixes' into thunderbolt/next
      thunderbolt: Introduce tb_xdomain_downstream_port()
      thunderbolt: Fix a couple of style issues in TMU code
      thunderbolt: Drop useless 'unidirectional' parameter from tb_switch_tmu_is_enabled()
      thunderbolt: Rework Titan Ridge TMU objection disable function
      thunderbolt: Get rid of tb_switch_enable_tmu_1st_child()
      thunderbolt: Move TMU configuration to tb_enable_tmu()
      thunderbolt: Move tb_enable_tmu() close to other TMU functions
      thunderbolt: Check valid TMU configuration in tb_switch_tmu_configure()
      thunderbolt: Move CLx support functions into clx.c
      thunderbolt: Get rid of __tb_switch_[en|dis]able_clx()
      thunderbolt: Move CLx enabling into tb_enable_clx()
      thunderbolt: Switch CL states from enum to a bitmask
      thunderbolt: Check for first depth router in tb.c
      thunderbolt: Do not call CLx functions from TMU code
      thunderbolt: Prefix TMU post time log message with "TMU: "
      thunderbolt: Prefix CL state related log messages with "CLx: "
      thunderbolt: Initialize CL states from the hardware
      thunderbolt: Make tb_switch_clx_disable() return CL states that were enabled
      thunderbolt: Disable CL states when a DMA tunnel is established
      thunderbolt: Read retimer NVM authentication status prior tb_retimer_set_inbound_sbtx()
      thunderbolt: Do not send UNSET_INBOUND_SBTX when retimer NVM authentication started
      thunderbolt: Enable/disable sideband depending on USB4 port offline mode
      thunderbolt: Ignore data CRC mismatch for USB4 routers
      thunderbolt: Do not touch lane 1 adapter path config space
      thunderbolt: Add the new USB4 v2 notification types
      thunderbolt: Reset USB4 v2 host router
      thunderbolt: Add Intel Barlow Ridge PCI ID
      thunderbolt: Limit Intel Barlow Ridge USB3 bandwidth
      thunderbolt: Add support for enhanced uni-directional TMU mode
      thunderbolt: Enable CL2 low power state
      thunderbolt: Make bandwidth allocation mode function names consistent
      thunderbolt: Add DisplayPort 2.x tunneling support
      thunderbolt: Add test case for 3 DisplayPort tunnels

 drivers/thunderbolt/Makefile   |   2 +-
 drivers/thunderbolt/acpi.c     |   5 +-
 drivers/thunderbolt/clx.c      | 423 ++++++++++++++++++++++++
 drivers/thunderbolt/ctl.c      |  28 ++
 drivers/thunderbolt/debugfs.c  |  64 ++--
 drivers/thunderbolt/dma_test.c |  20 +-
 drivers/thunderbolt/eeprom.c   |   3 +-
 drivers/thunderbolt/icm.c      |  30 +-
 drivers/thunderbolt/nhi.c      |  53 ++-
 drivers/thunderbolt/nhi.h      |   4 +
 drivers/thunderbolt/nhi_regs.h |  19 +-
 drivers/thunderbolt/nvm.c      |   4 +
 drivers/thunderbolt/quirks.c   |  10 +
 drivers/thunderbolt/retimer.c  |  64 +++-
 drivers/thunderbolt/switch.c   | 594 ++++++++++------------------------
 drivers/thunderbolt/tb.c       | 332 ++++++++++++++-----
 drivers/thunderbolt/tb.h       | 243 +++++++-------
 drivers/thunderbolt/tb_msgs.h  |   7 +
 drivers/thunderbolt/tb_regs.h  |  25 +-
 drivers/thunderbolt/test.c     |  83 +++++
 drivers/thunderbolt/tmu.c      | 713 +++++++++++++++++++++++++++++------------
 drivers/thunderbolt/tunnel.c   | 241 +++++++++++---
 drivers/thunderbolt/usb4.c     | 114 +++++--
 drivers/thunderbolt/xdomain.c  |  98 ++++--
 include/linux/thunderbolt.h    |  18 +-
 25 files changed, 2181 insertions(+), 1016 deletions(-)
 create mode 100644 drivers/thunderbolt/clx.c
