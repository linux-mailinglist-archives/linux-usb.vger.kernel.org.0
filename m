Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E13553AE6C3
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jun 2021 12:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhFUKL2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Jun 2021 06:11:28 -0400
Received: from mga03.intel.com ([134.134.136.65]:64065 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229621AbhFUKL2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Jun 2021 06:11:28 -0400
IronPort-SDR: YNxSxM/7vh0Z43/PQyLJCRFrW8LYrIL/cW0CfRLf9GIfd2+RQ8cpqi1eykIzoWjnm7oxdwsMUT
 6Sbx8R8mGfPw==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="206855624"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; 
   d="scan'208";a="206855624"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2021 03:09:13 -0700
IronPort-SDR: mUSqCZ+QWs7gLg8f5QPGOQiwkWUDXj7VQ2Zx3YAxSeR6ba5Mp3aIGG7cX6I7pI3vUyCR5Jk8JV
 Jec+4mtBfggg==
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; 
   d="scan'208";a="556194793"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2021 03:09:10 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 21 Jun 2021 13:09:08 +0300
Date:   Mon, 21 Jun 2021 13:09:08 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 changes for v5.14 merge window
Message-ID: <YNBlRNAvQ9DGhWqg@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 8124c8a6b35386f73523d27eacb71b5364a68c4c:

  Linux 5.13-rc4 (2021-05-30 11:58:25 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.14-rc1

for you to fetch changes up to b18f901382fdb74a138a0bf30458c54a023a1d86:

  thunderbolt: Fix DROM handling for USB4 DROM (2021-06-15 13:51:07 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v5.14 merge window

This includes following Thunderbolt/USB4 changes for the v5.14 merge
window:

  * Add self-authenticate quirk for a new Dell dock
  * NVM improvements
  * Align wake configuration with the USB4 connection manager guide
  * USB4 buffer allocation support
  * Retimer NVM firmware upgrade support when there is no device
    attached
  * Support for Intel Alder Lake integrated Thunderbolt/USB4 controller
  * A couple of miscellaneous cleanups.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Azhar Shaikh (1):
      thunderbolt: Add support for Intel Alder Lake

Crag Wang (1):
      thunderbolt: Add self-authenticate support for new dock

Gil Fine (2):
      thunderbolt: Poll 10ms for REG_FW_STS_NVM_AUTH_DONE to be set
      thunderbolt: Fix DROM handling for USB4 DROM

Mika Westerberg (20):
      thunderbolt: Split NVM read/write generic functions out from usb4.c
      thunderbolt: Use generic tb_nvm_[read|write]_data() for Thunderbolt 2/3 devices
      Documentation / thunderbolt: Clean up entries
      thunderbolt: Add wake from DisplayPort
      thunderbolt: Align USB4 router wakes configuration with the CM guide
      thunderbolt: Make tb_port_type() take const parameter
      thunderbolt: Move nfc_credits field to struct tb_path_hop
      thunderbolt: Wait for the lanes to actually bond
      thunderbolt: Read router preferred credit allocation information
      thunderbolt: Update port credits after bonding is enabled/disabled
      thunderbolt: Allocate credits according to router preferences
      thunderbolt: Add quirk for Intel Goshen Ridge DP credits
      thunderbolt: Add KUnit tests for credit allocation
      thunderbolt: Log the link as TBT instead of TBT3
      thunderbolt: Add USB4 port devices
      thunderbolt: Allow router NVM authenticate separately
      thunderbolt: Check for NVM authentication status after the operation started
      thunderbolt: Bond lanes only when dual_link_port != NULL in alloc_dev_default()
      thunderbolt: Add device links only when software connection manager is used
      thunderbolt: No need to include <linux/acpi.h> in usb4_port.c

Rajmohan Mani (5):
      thunderbolt: Add support for ACPI _DSM to power on/off retimers
      thunderbolt: Add additional USB4 port operations for retimer access
      thunderbolt: Add support for retimer NVM upgrade when there is no link
      thunderbolt: Move nvm_write_ops to tb.h
      thunderbolt: Add WRITE_ONLY and AUTHENTICATE_ONLY NVM operations for retimers

 Documentation/ABI/testing/sysfs-bus-thunderbolt |  82 +++-
 Documentation/admin-guide/thunderbolt.rst       |  29 ++
 drivers/thunderbolt/Makefile                    |   2 +-
 drivers/thunderbolt/acpi.c                      | 206 +++++++++
 drivers/thunderbolt/dma_port.c                  |  94 +---
 drivers/thunderbolt/domain.c                    |   9 +-
 drivers/thunderbolt/eeprom.c                    |  19 +-
 drivers/thunderbolt/icm.c                       |  20 +-
 drivers/thunderbolt/lc.c                        |   6 +-
 drivers/thunderbolt/nhi.c                       |  71 +--
 drivers/thunderbolt/nhi.h                       |   2 +
 drivers/thunderbolt/nvm.c                       |  95 ++++
 drivers/thunderbolt/path.c                      |   4 +-
 drivers/thunderbolt/quirks.c                    |  30 +-
 drivers/thunderbolt/retimer.c                   | 108 +++--
 drivers/thunderbolt/sb_regs.h                   |   2 +
 drivers/thunderbolt/switch.c                    | 274 +++++++++---
 drivers/thunderbolt/tb.c                        |  71 ++-
 drivers/thunderbolt/tb.h                        | 116 ++++-
 drivers/thunderbolt/tb_regs.h                   |   4 +
 drivers/thunderbolt/test.c                      | 559 +++++++++++++++++++++++-
 drivers/thunderbolt/tunnel.c                    | 401 ++++++++++++++---
 drivers/thunderbolt/tunnel.h                    |   2 +
 drivers/thunderbolt/usb4.c                      | 438 ++++++++++++++-----
 drivers/thunderbolt/usb4_port.c                 | 280 ++++++++++++
 drivers/thunderbolt/xdomain.c                   |  10 +
 26 files changed, 2472 insertions(+), 462 deletions(-)
 create mode 100644 drivers/thunderbolt/usb4_port.c
