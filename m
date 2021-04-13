Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11F9835DC3A
	for <lists+linux-usb@lfdr.de>; Tue, 13 Apr 2021 12:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbhDMKLD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Apr 2021 06:11:03 -0400
Received: from mga01.intel.com ([192.55.52.88]:59719 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229683AbhDMKLC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Apr 2021 06:11:02 -0400
IronPort-SDR: 1tqe/SUPVgjHjyWd94glvPqmP7xKm/e7PzrlivvgMDqGhgdhiHlzlC1SEgC3EfwpWetOlwAkP8
 F5GRaD6wKYvQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="214858415"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="214858415"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 03:10:41 -0700
IronPort-SDR: hxizsNiTsndwYkY0Z/W3J7a9nfsQeBE+lKQMF/mqY9Nc+RRQmQ3kAS0YU/Y41vh9CJKdU/AEQ2
 0sXkN7gPT7IA==
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="424186857"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 03:10:36 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 13 Apr 2021 13:10:34 +0300
Date:   Tue, 13 Apr 2021 13:10:34 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 changes for v5.13 merge window
Message-ID: <20210413101034.GA3253676@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.13-rc1

for you to fetch changes up to 6f3badead6a078cf3c71f381f9d84ac922984a00:

  thunderbolt: Hide authorized attribute if router does not support PCIe tunnels (2021-04-09 12:26:24 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v5.13 merge window

This includes following Thunderbolt/USB4 changes for v5.13 merge window:

  * Debugfs improvements

  * Align the inter-domain (peer-to-peer) support with the USB4
    inter-domain spec for better interoperability

  * Add support for USB4 DROM and the new product descriptor

  * More KUnit tests

  * Detailed uevent for routers

  * Few miscellaneous improvements

All these have been in linux-next without reported issues.

----------------------------------------------------------------
Dan Carpenter (1):
      thunderbolt: Unlock on error path in tb_domain_add()

Gil Fine (3):
      thunderbolt: debugfs: Handle fail reading block
      thunderbolt: Drop unused functions tb_switch_is_[ice|tiger]_lake()
      thunderbolt: debugfs: Show all accessible dwords

Mika Westerberg (20):
      thunderbolt: Disable retry logic for intra-domain control packets
      thunderbolt: Do not pass timeout for tb_cfg_reset()
      thunderbolt: Decrease control channel timeout for software connection manager
      Documentation / thunderbolt: Drop speed/lanes entries for XDomain
      thunderbolt: Add more logging to XDomain connections
      thunderbolt: Do not re-establish XDomain DMA paths automatically
      thunderbolt: Use pseudo-random number as initial property block generation
      thunderbolt: Align XDomain protocol timeouts with the spec
      thunderbolt: Add tb_property_copy_dir()
      thunderbolt: Add support for maxhopid XDomain property
      thunderbolt: Use dedicated flow control for DMA tunnels
      thunderbolt: Drop unused tb_port_set_initial_credits()
      thunderbolt: Allow multiple DMA tunnels over a single XDomain connection
      net: thunderbolt: Align the driver to the USB4 networking spec
      thunderbolt: Add KUnit tests for XDomain properties
      thunderbolt: Add KUnit tests for DMA tunnels
      thunderbolt: Check quirks in tb_switch_add()
      thunderbolt: Add support for USB4 DROM
      thunderbolt: Add details to router uevent
      thunderbolt: Hide authorized attribute if router does not support PCIe tunnels

 Documentation/ABI/testing/sysfs-bus-thunderbolt |  35 +-
 drivers/net/thunderbolt.c                       |  56 ++-
 drivers/thunderbolt/ctl.c                       |  21 +-
 drivers/thunderbolt/ctl.h                       |   8 +-
 drivers/thunderbolt/debugfs.c                   |  37 +-
 drivers/thunderbolt/dma_test.c                  |  35 +-
 drivers/thunderbolt/domain.c                    |  89 +++--
 drivers/thunderbolt/eeprom.c                    | 105 +++--
 drivers/thunderbolt/icm.c                       |  34 +-
 drivers/thunderbolt/property.c                  |  71 ++++
 drivers/thunderbolt/switch.c                    |  75 ++--
 drivers/thunderbolt/tb.c                        |  52 ++-
 drivers/thunderbolt/tb.h                        |  45 +--
 drivers/thunderbolt/test.c                      | 492 ++++++++++++++++++++++++
 drivers/thunderbolt/tunnel.c                    | 102 +++--
 drivers/thunderbolt/tunnel.h                    |   8 +-
 drivers/thunderbolt/xdomain.c                   | 416 ++++++++++++--------
 include/linux/thunderbolt.h                     |  54 ++-
 18 files changed, 1292 insertions(+), 443 deletions(-)
