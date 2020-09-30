Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C77827E13C
	for <lists+linux-usb@lfdr.de>; Wed, 30 Sep 2020 08:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727599AbgI3Ggo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Sep 2020 02:36:44 -0400
Received: from mga03.intel.com ([134.134.136.65]:17146 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728341AbgI3Ggn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 30 Sep 2020 02:36:43 -0400
IronPort-SDR: IgRDGQkuuWR0HR3AraSe/F9vaosQlelnhm6iixB1FlWBeBKsrg6zaeTJRgyKsUaRnVdayiXKpf
 ds/Iu6YH2MhQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="162436447"
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; 
   d="scan'208";a="162436447"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 23:36:38 -0700
IronPort-SDR: 8+pO2zE/2y+1bLuMVvxeFqvBYwp7G15Y5A8+gAr4djQW45LSoWuvIRfeOXTWIf9jYkbQp1+nIb
 ZBhM7D+o7oZQ==
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; 
   d="scan'208";a="495889818"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 23:36:35 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 30 Sep 2020 09:36:32 +0300
Date:   Wed, 30 Sep 2020 09:36:32 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 changes for v5.10 merge window
Message-ID: <20200930063632.GR2495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit f75aef392f869018f78cfedf3c320a6b3fcfda6b:

  Linux 5.9-rc3 (2020-08-30 16:01:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.10-rc1

for you to fetch changes up to 810278da901c15fba475394edb7f1271c3806658:

  thunderbolt: Capitalize comment on top of QUIRK_FORCE_POWER_LINK_CONTROLLER (2020-09-16 14:57:46 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v5.10 merge window

This includes following Thunderbolt/USB4 changes for v5.10 merge window:

  * A couple of optimizations around Tiger Lake force power logic and
    NHI (Native Host Interface) LC (Link Controller) mailbox command
    processing

  * Power management improvements for Software Connection Manager

  * Debugfs support

  * Allow KUnit tests to be enabled also when Thunderbolt driver is
    configured as module.

  * Few minor cleanups and fixes

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Dan Carpenter (1):
      thunderbolt: debugfs: Fix uninitialized return in counters_write()

Gil Fine (2):
      thunderbolt: Introduce tb_switch_is_tiger_lake()
      thunderbolt: Add debugfs interface

Mika Westerberg (31):
      thunderbolt: Software CM only should set force power in Tiger Lake
      thunderbolt: Use bit 31 to check if Firmware CM is running in Tiger Lake
      thunderbolt: Do not program NFC buffers for USB4 router protocol adapters
      thunderbolt: No need to log an error if tb_switch_lane_bonding_enable() fails
      thunderbolt: Send reset only to first generation routers
      thunderbolt: Tear down DP tunnels when suspending
      thunderbolt: Initialize TMU again on resume
      thunderbolt: Do not change default USB4 router notification timeout
      thunderbolt: Configure link after lane bonding is enabled
      thunderbolt: Set port configured for both ends of the link
      thunderbolt: Configure port for XDomain
      thunderbolt: Disable lane 1 for XDomain connection
      thunderbolt: Enable wakes from system suspend
      PCI / thunderbolt: Switch to use device links instead of PCI quirk
      ACPI: Export acpi_get_first_physical_node() to modules
      thunderbolt: Create device links from ACPI description
      thunderbolt: Add runtime PM for Software CM
      thunderbolt: Move struct tb_cap_any to tb_regs.h
      thunderbolt: Introduce tb_port_next_cap()
      thunderbolt: Introduce tb_switch_next_cap()
      thunderbolt: Introduce tb_port_is_nhi()
      thunderbolt: Check for Intel vendor ID when identifying controller
      thunderbolt: Introduce tb_switch_is_ice_lake()
      thunderbolt: No need to warn in TB_CFG_ERROR_INVALID_CONFIG_SPACE
      thunderbolt: Only stop control channel when entering freeze
      thunderbolt: Allow KUnit tests to be built also when CONFIG_USB4=m
      thunderbolt: Use "if USB4" instead of "depends on" in Kconfig
      thunderbolt: Handle ERR_LOCK notification
      thunderbolt: Log correct zeroX entries in decode_error()
      thunderbolt: Correct tb_check_quirks() kernel-doc
      thunderbolt: Capitalize comment on top of QUIRK_FORCE_POWER_LINK_CONTROLLER

Rajmohan Mani (2):
      thunderbolt: Optimize Force Power logic
      thunderbolt: Optimize NHI LC mailbox command processing

Tian Tao (1):
      thunderbolt: Use kobj_to_dev() instead of container_of()

 drivers/acpi/bus.c            |   1 +
 drivers/pci/quirks.c          |  57 ----
 drivers/thunderbolt/Kconfig   |  14 +-
 drivers/thunderbolt/Makefile  |   4 +-
 drivers/thunderbolt/acpi.c    | 117 +++++++
 drivers/thunderbolt/cap.c     | 136 +++++---
 drivers/thunderbolt/ctl.c     |  23 +-
 drivers/thunderbolt/debugfs.c | 701 ++++++++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/domain.c  |  48 ++-
 drivers/thunderbolt/icm.c     |   5 +-
 drivers/thunderbolt/lc.c      | 151 +++++++--
 drivers/thunderbolt/nhi.c     |  90 +++++-
 drivers/thunderbolt/nhi_ops.c |  31 +-
 drivers/thunderbolt/quirks.c  |   2 +-
 drivers/thunderbolt/switch.c  | 216 +++++++++++--
 drivers/thunderbolt/tb.c      | 207 ++++++++++++-
 drivers/thunderbolt/tb.h      | 160 +++++++---
 drivers/thunderbolt/tb_msgs.h |   1 +
 drivers/thunderbolt/tb_regs.h |  34 +-
 drivers/thunderbolt/test.c    |  13 +-
 drivers/thunderbolt/usb4.c    | 251 +++++++++++----
 21 files changed, 1971 insertions(+), 291 deletions(-)
 create mode 100644 drivers/thunderbolt/acpi.c
 create mode 100644 drivers/thunderbolt/debugfs.c
