Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF35227F2A
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 13:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728210AbgGULnA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 07:43:00 -0400
Received: from mga14.intel.com ([192.55.52.115]:57748 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727103AbgGULm7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Jul 2020 07:42:59 -0400
IronPort-SDR: z/tlFwaDQR5WbHsEUS55iwhw2IL+E9qqKH65b2vOMDR39Kx1nk2LsDeyFRNPYn+0pbHpx7NHlk
 ugXeO0/3K3yg==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="149261558"
X-IronPort-AV: E=Sophos;i="5.75,378,1589266800"; 
   d="scan'208";a="149261558"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2020 04:42:55 -0700
IronPort-SDR: sj0m4B7bK/pV4+paPk8PxgW95ipkImedkzFOLRZ1vGs+S3jR4+Tn3FuWTbsE5yYjgiUpgkJFUU
 IOjFWcsM86/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,378,1589266800"; 
   d="scan'208";a="392327784"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 21 Jul 2020 04:42:53 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 21 Jul 2020 14:42:52 +0300
Date:   Tue, 21 Jul 2020 14:42:52 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 changes for v5.9 merge window
Message-ID: <20200721114252.GD5180@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.9

for you to fetch changes up to ef7e12078ab832c72315adcfa05e7a9498a5e109:

  thunderbolt: Fix old style declaration warning (2020-07-02 14:50:11 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v5.9 merge window

This includes following Thunderbolt/USB4 changes for v5.9 merge window:

  * Improvements around NHI (Native Host Interface) HopID allocation

  * Improvements to tunneling and USB3 bandwidth management support

  * Add KUnit tests for path walking and tunneling

  * Initial support for USB4 retimer firmware upgrade

  * Implement Thunderbolt device firmware upgrade mechanism that runs
    the NVM image authentication when the device is disconnected.

  * A couple of small non-critical fixes

----------------------------------------------------------------

Please notice when merged with kunit-next tree there will be a build
error because the one member (allocation) of struct kunit_resource was
renamed with linux-next commit d4cdd146d0db ("kunit: generalize
kunit_resource API beyond allocated resources"). Linux-next carries a
fix that is at the end of this email to solve the issue (from Stephen
Rothwell).

Let me know if you prefer that I merge kunit-next branch to my -next
branch and resolve it there first.

Thanks!

Colin Ian King (1):
      thunderbolt: Ensure left shift of 512 does not overflow a 32 bit int

Geert Uytterhoeven (1):
      thunderbolt: Improve USB4 config symbol help text

Kranthi Kuntala (1):
      thunderbolt: Add support for on-board retimers

Mario Limonciello (2):
      thunderbolt: Add support for separating the flush to SPI and authenticate
      thunderbolt: Add support for authenticate on disconnect

Mika Westerberg (25):
      thunderbolt: Build initial XDomain property block upon first connect
      thunderbolt: No need to warn if NHI hop_count != 12 or hop_count != 32
      thunderbolt: NHI can use HopIDs 1-7
      thunderbolt: Get rid of E2E workaround
      thunderbolt: Fix path indices used in USB3 tunnel discovery
      thunderbolt: Make tb_next_port_on_path() work with tree topologies
      thunderbolt: Make tb_path_alloc() work with tree topologies
      thunderbolt: Check that both ports are reachable when allocating path
      thunderbolt: Handle incomplete PCIe/USB3 paths correctly in discovery
      thunderbolt: Increase path length in discovery
      thunderbolt: Add KUnit tests for path walking
      thunderbolt: Add DP IN resources for all routers
      thunderbolt: Do not tunnel USB3 if link is not USB4
      thunderbolt: Make usb4_switch_map_usb3_down() also return enabled ports
      thunderbolt: Make usb4_switch_map_pcie_down() also return enabled ports
      thunderbolt: Report consumed bandwidth in both directions
      thunderbolt: Increase DP DPRX wait timeout
      thunderbolt: Implement USB3 bandwidth negotiation routines
      thunderbolt: Make tb_port_get_link_speed() available to other files
      thunderbolt: Add USB3 bandwidth management
      thunderbolt: Add KUnit tests for tunneling
      thunderbolt: Add Intel USB-IF ID to the NVM upgrade supported list
      thunderbolt: Split common NVM functionality into a separate file
      thunderbolt: Generalize usb4_switch_do_[read|write]_data()
      thunderbolt: Retry USB4 block read operation

Rajmohan Mani (1):
      thunderbolt: Implement USB4 port sideband operations for retimer access

Wei Yongjun (1):
      thunderbolt: Fix old style declaration warning

 Documentation/ABI/testing/sysfs-bus-thunderbolt |   57 +-
 Documentation/admin-guide/thunderbolt.rst       |   11 +-
 drivers/net/thunderbolt.c                       |    4 +-
 drivers/thunderbolt/Kconfig                     |    9 +-
 drivers/thunderbolt/Makefile                    |    3 +
 drivers/thunderbolt/domain.c                    |    2 +-
 drivers/thunderbolt/eeprom.c                    |    1 +
 drivers/thunderbolt/lc.c                        |   14 +
 drivers/thunderbolt/nhi.c                       |   30 +-
 drivers/thunderbolt/nvm.c                       |  170 +++
 drivers/thunderbolt/path.c                      |   38 +-
 drivers/thunderbolt/quirks.c                    |   42 +
 drivers/thunderbolt/retimer.c                   |  485 +++++++
 drivers/thunderbolt/sb_regs.h                   |   33 +
 drivers/thunderbolt/switch.c                    |  232 ++--
 drivers/thunderbolt/tb.c                        |  388 ++++--
 drivers/thunderbolt/tb.h                        |  131 +-
 drivers/thunderbolt/tb_regs.h                   |   31 +
 drivers/thunderbolt/test.c                      | 1626 +++++++++++++++++++++++
 drivers/thunderbolt/tunnel.c                    |  326 ++++-
 drivers/thunderbolt/tunnel.h                    |   37 +-
 drivers/thunderbolt/usb4.c                      |  874 +++++++++++-
 drivers/thunderbolt/xdomain.c                   |   94 +-
 include/linux/thunderbolt.h                     |    2 -
 24 files changed, 4266 insertions(+), 374 deletions(-)
 create mode 100644 drivers/thunderbolt/nvm.c
 create mode 100644 drivers/thunderbolt/quirks.c
 create mode 100644 drivers/thunderbolt/retimer.c
 create mode 100644 drivers/thunderbolt/sb_regs.h
 create mode 100644 drivers/thunderbolt/test.c

-----------

diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index acb8b6256847..a4d78811f7e2 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -17,13 +17,13 @@ static int __ida_init(struct kunit_resource *res, void *context)
 	struct ida *ida = context;
 
 	ida_init(ida);
-	res->allocation = ida;
+	res->data = ida;
 	return 0;
 }
 
 static void __ida_destroy(struct kunit_resource *res)
 {
-	struct ida *ida = res->allocation;
+	struct ida *ida = res->data;
 
 	ida_destroy(ida);
 }
