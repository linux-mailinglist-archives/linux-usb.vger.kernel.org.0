Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 988CB483018
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jan 2022 11:53:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbiACKxd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jan 2022 05:53:33 -0500
Received: from mga07.intel.com ([134.134.136.100]:45537 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229651AbiACKxc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Jan 2022 05:53:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641207212; x=1672743212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HTNLGpyiIumfzI0Cm/z7Rjqw4gZock2j6tP5KpgTPsY=;
  b=mxmPez9N4iP6Y3UjnEerXckRFBrIHJZ16odugjxVvkWS7oLlP+3sP0Nr
   LRlI21P2H4XKrc50sHOtqM6YWpzgNjsPzsBpaJvEWBkVNlaRxDup0TMyy
   EMFCxqJmnX+1NU+PwhTeN9ER5fgsG38zxjCpJJ67cza5ANLlqUGv883La
   10/Ex+chdivuMNq73dHw5HchBODzHTK6p1yI+BxEMqi3RnTT2RIYkg047
   qtJHkhrvGhma5YauHqKVu9YUFxJnqA4aGy3GAU8mtIlbVuvoLbdB/WyBY
   DS3JLKKHcjuO4Y257sCuQQaMycqwbY1J5CK87L6Ag4QkJA5/L/0fSORjQ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10215"; a="305400016"
X-IronPort-AV: E=Sophos;i="5.88,257,1635231600"; 
   d="scan'208";a="305400016"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2022 02:53:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,257,1635231600"; 
   d="scan'208";a="555825898"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2022 02:53:20 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 03 Jan 2022 12:52:14 +0200
Date:   Mon, 3 Jan 2022 12:52:14 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 changes for v5.17 merge window
Message-ID: <YdLVXlwnU+QNxaHZ@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1:

  Linux 5.16-rc4 (2021-12-05 14:08:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.17-rc1

for you to fetch changes up to fa487b2a900d7b22fe7db678d2134fbf56ae9da0:

  thunderbolt: Add module parameter for CLx disabling (2021-12-28 10:43:56 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v5.17 merge window

This includes following Thunderbolt/USB4 changes for the v5.17 merge
window:

  * Enable low-power link state (CL0s) for USB4 and Intel Titan Ridge
    devices
  * Add support for TMU (Time Management Unit) uni-directional mode
  * Power management improvements (suspend-to-disk, runtime PM)
  * USB4 compatibility fixes
  * Minor fixes and cleanups.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Andy Shevchenko (1):
      thunderbolt: Do not dereference fwnode in struct device

Gil Fine (7):
      thunderbolt: Add TMU uni-directional mode
      thunderbolt: Add CL0s support for USB4 routers
      thunderbolt: Move usb4_switch_wait_for_bit() to switch.c
      thunderbolt: Implement TMU time disruption for Intel Titan Ridge
      thunderbolt: Rename Intel TB_VSE_CAP_IECS capability
      thunderbolt: Enable CL0s for Intel Titan Ridge
      thunderbolt: Add module parameter for CLx disabling

Kees Cook (1):
      thunderbolt: xdomain: Avoid potential stack OOB read

Mika Westerberg (6):
      thunderbolt: Runtime PM activate both ends of the device link
      thunderbolt: Tear down existing tunnels when resuming from hibernate
      thunderbolt: Runtime resume USB4 port when retimers are scanned
      thunderbolt: Do not allow subtracting more NFC credits than configured
      thunderbolt: Do not program path HopIDs for USB4 routers
      thunderbolt: Add debug logging of DisplayPort resource allocation

Xiaoke Wang (1):
      thunderbolt: Check return value of kmemdup() in icm_handle_event()

 drivers/thunderbolt/acpi.c    |  15 +-
 drivers/thunderbolt/icm.c     |   7 +-
 drivers/thunderbolt/lc.c      |  24 ++
 drivers/thunderbolt/path.c    |  42 ++--
 drivers/thunderbolt/retimer.c |  28 ++-
 drivers/thunderbolt/switch.c  | 493 +++++++++++++++++++++++++++++++++++++++++-
 drivers/thunderbolt/tb.c      |  91 ++++++--
 drivers/thunderbolt/tb.h      | 106 ++++++++-
 drivers/thunderbolt/tb_msgs.h |  47 ++--
 drivers/thunderbolt/tb_regs.h | 113 +++++++---
 drivers/thunderbolt/tmu.c     | 337 ++++++++++++++++++++++++-----
 drivers/thunderbolt/tunnel.c  |  27 ++-
 drivers/thunderbolt/tunnel.h  |   9 +-
 drivers/thunderbolt/usb4.c    |  52 +++--
 drivers/thunderbolt/xdomain.c |  16 +-
 15 files changed, 1203 insertions(+), 204 deletions(-)
