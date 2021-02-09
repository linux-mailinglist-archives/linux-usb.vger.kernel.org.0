Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E77314E57
	for <lists+linux-usb@lfdr.de>; Tue,  9 Feb 2021 12:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbhBILn0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Feb 2021 06:43:26 -0500
Received: from mga07.intel.com ([134.134.136.100]:24673 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230241AbhBILgl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Feb 2021 06:36:41 -0500
IronPort-SDR: hWjcm5U3JNSagWqaLFtUK7uwiyvy8wZziRXEAGasxQQZvVkH/A5tI5CvH21NkhjDlSHg+rZJco
 hVvd82ZbIDkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="245934128"
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; 
   d="scan'208";a="245934128"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 03:34:32 -0800
IronPort-SDR: TQQ+WDtcoX9Vu8HwUW/4bpqNHU7PFN4XGfOSF5NmJx2/eRxGboCepIuro8K9ZWCWPoNEOtLY44
 MRqwZQBbS22Q==
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; 
   d="scan'208";a="436060526"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 03:34:29 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 09 Feb 2021 13:34:26 +0200
Date:   Tue, 9 Feb 2021 13:34:26 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 changes for v5.12 merge window
Message-ID: <20210209113426.GH2542@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.12-rc1

for you to fetch changes up to c6da62a219d028de10f2e22e93a34c7ee2b88d03:

  thunderbolt: Add support for native USB4 _OSC (2021-02-04 10:45:25 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v5.12 merge window

This includes following Thunderbolt/USB4 changes for v5.12 merge
window:

  * Start lane initialization after sleep for Thunderbolt 3 compatible
    devices

  * Add support for de-authorizing PCIe tunnels (software based
    connection manager only)

  * Add support for new ACPI 6.4 USB4 _OSC

  * Allow disabling XDomain protocol

  * Add support for new SL5 security level

  * Clean up kernel-docs to pass W=1 builds

  * A couple of cleanups and minor fixes

All these have been in linux-next without reported issues.

----------------------------------------------------------------
Lee Jones (11):
      thunderbolt: dma_port: Check 'dma_port_flash_write_block()'s return value
      thunderbolt: cap: Fix kernel-doc formatting issue
      thunderbolt: ctl: Demote non-conformant kernel-doc headers
      thunderbolt: eeprom: Demote non-conformant kernel-doc headers to standard comment blocks
      thunderbolt: xdomain: Fix 'tb_unregister_service_driver()'s 'drv' param
      thunderbolt: nhi: Demote some non-conformant kernel-doc headers
      thunderbolt: tb: Kernel-doc function headers should document their parameters
      thunderbolt: switch: Demote a bunch of non-conformant kernel-doc headers
      thunderbolt: icm: Fix a couple of formatting issues
      thunderbolt: tunnel: Fix misspelling of 'receive_path'
      thunderbolt: switch: Fix function name in the header

Mario Limonciello (1):
      ACPI: Execute platform _OSC also with query bit clear

Mika Westerberg (13):
      thunderbolt: Start lane initialization after sleep
      thunderbolt: Add support for de-authorizing devices
      thunderbolt: ctl: Fix kernel-doc descriptions of non-static functions
      thunderbolt: eeprom: Fix kernel-doc descriptions of non-static functions
      thunderbolt: path: Fix kernel-doc descriptions of non-static functions
      thunderbolt: nhi: Fix kernel-doc descriptions of non-static functions
      thunderbolt: switch: Fix kernel-doc descriptions of non-static functions
      thunderbolt: Add clarifying comments about USB4 terms router and adapter
      thunderbolt: dma_test: Drop unnecessary include
      thunderbolt: Add support for PCIe tunneling disabled (SL5)
      thunderbolt: Allow disabling XDomain protocol
      ACPI: Add support for native USB4 control _OSC
      thunderbolt: Add support for native USB4 _OSC

Rikard Falkeborn (1):
      thunderbolt: Constify static attribute_group structs

Tian Tao (1):
      thunderbolt: Use kmemdup instead of kzalloc and memcpy

 Documentation/ABI/testing/sysfs-bus-thunderbolt |  22 ++++-
 Documentation/admin-guide/thunderbolt.rst       |  23 +++++
 drivers/acpi/bus.c                              | 119 +++++++++++++++++++++---
 drivers/thunderbolt/acpi.c                      |  65 +++++++++++++
 drivers/thunderbolt/cap.c                       |   2 +-
 drivers/thunderbolt/ctl.c                       |  51 ++++++++--
 drivers/thunderbolt/dma_port.c                  |   2 +
 drivers/thunderbolt/dma_test.c                  |   5 +-
 drivers/thunderbolt/domain.c                    |  48 +++++++++-
 drivers/thunderbolt/eeprom.c                    |  33 ++++---
 drivers/thunderbolt/icm.c                       |  10 +-
 drivers/thunderbolt/lc.c                        |  35 +++++++
 drivers/thunderbolt/nhi.c                       |  39 ++++++--
 drivers/thunderbolt/path.c                      |   2 +
 drivers/thunderbolt/switch.c                    |  82 ++++++++++++++--
 drivers/thunderbolt/tb.c                        |  54 +++++++++--
 drivers/thunderbolt/tb.h                        |  22 +++++
 drivers/thunderbolt/tb_regs.h                   |   1 +
 drivers/thunderbolt/tunnel.c                    |  12 ++-
 drivers/thunderbolt/usb4.c                      |  11 ++-
 drivers/thunderbolt/xdomain.c                   |  15 ++-
 include/linux/acpi.h                            |  10 ++
 include/linux/thunderbolt.h                     |   3 +
 23 files changed, 585 insertions(+), 81 deletions(-)

