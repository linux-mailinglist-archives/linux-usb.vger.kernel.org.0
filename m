Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6FD2D2A95
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 13:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729265AbgLHMUV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 07:20:21 -0500
Received: from mga03.intel.com ([134.134.136.65]:14714 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725803AbgLHMUV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Dec 2020 07:20:21 -0500
IronPort-SDR: Ohkrp7HYgXlBlIi8r66D1D7gKWhVMocEVrl+oiZbXfgU/AZr1eLBf7UDtYLTYPPDFb8Iod3pHp
 gWGgcsAMEXiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="173993416"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="173993416"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 04:18:35 -0800
IronPort-SDR: wump9c68YpxnOeC4Vud614DuRAxIvM0ln4it36wuWs4A+sxKWsja46QDA/Y/SYLlyZuwZXSNli
 XBT4lS3Cv+6g==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="363615082"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 04:18:32 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 08 Dec 2020 14:18:30 +0200
Date:   Tue, 8 Dec 2020 14:18:30 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 changes for v5.11 merge window
Message-ID: <20201208121830.GC5246@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit f8394f232b1eab649ce2df5c5f15b0e528c92091:

  Linux 5.10-rc3 (2020-11-08 16:10:16 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.11-rc1

for you to fetch changes up to db0746e3399ee87ee5f957880811da16faa89fb8:

  thunderbolt: Add support for Intel Maple Ridge (2020-11-30 14:39:24 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v5.11 merge window

This includes following Thunderbolt/USB4 changes for v5.11 merge window:

  * DMA traffic test driver

  * USB4 router NVM upgrade improvements

  * USB4 router operations proxy implementation available in the recent
    Intel Connection Manager firmwares

  * Support for Intel Maple Ridge discrete Thunderbolt 4 controller

  * A couple of cleanups and minor improvements.

----------------------------------------------------------------
Isaac Hazan (4):
      thunderbolt: Add link_speed and link_width to XDomain
      thunderbolt: Add functions for enabling and disabling lane bonding on XDomain
      thunderbolt: Add DMA traffic test driver
      MAINTAINERS: Add Isaac as maintainer of Thunderbolt DMA traffic test driver

Mika Westerberg (18):
      thunderbolt: Do not clear USB4 router protocol adapter IFC and ISE bits
      thunderbolt: Find XDomain by route instead of UUID
      thunderbolt: Create XDomain devices for loops back to the host
      thunderbolt: Create debugfs directory automatically for services
      thunderbolt: Make it possible to allocate one directional DMA tunnel
      thunderbolt: Add support for end-to-end flow control
      thunderbolt: Move max_boot_acl field to correct place in struct icm
      thunderbolt: Log which connection manager implementation is used
      thunderbolt: Log adapter numbers in decimal in path activation/deactivation
      thunderbolt: Keep the parent runtime resumed for a while on device disconnect
      thunderbolt: Return -ENOTCONN when ERR_CONN is received
      thunderbolt: Perform USB4 router NVM upgrade in two phases
      thunderbolt: Pass metadata directly to usb4_switch_op()
      thunderbolt: Pass TX and RX data directly to usb4_switch_op()
      thunderbolt: Add connection manager specific hooks for USB4 router operations
      thunderbolt: Move constants for USB4 router operations to tb_regs.h
      thunderbolt: Add USB4 router operation proxy for firmware connection manager
      thunderbolt: Add support for Intel Maple Ridge

 Documentation/ABI/testing/sysfs-bus-thunderbolt |  28 +
 MAINTAINERS                                     |   6 +
 drivers/net/thunderbolt.c                       |   2 +-
 drivers/thunderbolt/Kconfig                     |  13 +
 drivers/thunderbolt/Makefile                    |   3 +
 drivers/thunderbolt/ctl.c                       |   7 +-
 drivers/thunderbolt/debugfs.c                   |  24 +
 drivers/thunderbolt/dma_test.c                  | 736 ++++++++++++++++++++++++
 drivers/thunderbolt/icm.c                       | 240 +++++++-
 drivers/thunderbolt/nhi.c                       |  36 +-
 drivers/thunderbolt/nhi.h                       |   1 +
 drivers/thunderbolt/path.c                      |  17 +-
 drivers/thunderbolt/switch.c                    |  53 +-
 drivers/thunderbolt/tb.c                        |   2 +
 drivers/thunderbolt/tb.h                        |  22 +
 drivers/thunderbolt/tb_msgs.h                   |  28 +
 drivers/thunderbolt/tb_regs.h                   |  14 +
 drivers/thunderbolt/tunnel.c                    |  50 +-
 drivers/thunderbolt/usb4.c                      | 269 +++++----
 drivers/thunderbolt/xdomain.c                   | 148 ++++-
 include/linux/thunderbolt.h                     |  18 +-
 21 files changed, 1553 insertions(+), 164 deletions(-)
 create mode 100644 drivers/thunderbolt/dma_test.c
