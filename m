Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B73E73087F5
	for <lists+linux-usb@lfdr.de>; Fri, 29 Jan 2021 11:56:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbhA2Kzw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Jan 2021 05:55:52 -0500
Received: from mga17.intel.com ([192.55.52.151]:49161 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232261AbhA2K0d (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 Jan 2021 05:26:33 -0500
IronPort-SDR: Uvx2dhu8cyxjzyVcnZu3afwdlOensRhF+l62caHw9nbz56w7KcFbHASoIlAB4oKdMALWQ0zgVd
 nkNQj+mpq5BA==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="160159828"
X-IronPort-AV: E=Sophos;i="5.79,385,1602572400"; 
   d="scan'208";a="160159828"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2021 00:32:45 -0800
IronPort-SDR: wYoluzMQ6lR5oyzLGSxGA4EDnT5TlS1ZBQS/Ox4X1C+G1PBEFow2nr/f8A2KF8BHqQnAfrwiRi
 Y/JlcW7wKLaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,385,1602572400"; 
   d="scan'208";a="409564863"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2021 00:32:42 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 97F0B17F; Fri, 29 Jan 2021 10:32:41 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mario Limonciello <mario.limonciello@dell.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Christian Kellner <christian@kellner.me>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-acpi@vger.kernel.org
Subject: [PATCH v2 0/5] thunderbolt / ACPI: Add support for USB4 _OSC
Date:   Fri, 29 Jan 2021 11:32:36 +0300
Message-Id: <20210129083241.72497-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

The just released ACPI 6.4 spec [1] adds a new _OSC method that is used to
negotiate OS support for native USB4 features such as PCIe tunneling. This
patch series adds Linux support for the new _OSC and modifies the
Thunderbolt/USB4 driver accordingly to enable/disable tunneling of
different protocols.

There is an additional setting in the firmware connection manager that
allows the BIOS to disable PCIe tunneling, so we add support for this and
also make the software connection manager to switch to this "nopcie"
security level when the _OSC does not allow PCIe tunneling.

This applies on top of thunderbolt.git/next.

[1] https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf

The previous version of the patch series can be found here:

  https://lore.kernel.org/linux-usb/20210126155723.9388-1-mika.westerberg@linux.intel.com/

Changes from v1:

  * Dropped patch 1/6. I already applied it to thunderbolt.git/fixes
  * Added ACK from Yehezkel to TBT patches
  * Updated changelog of patch 1/5 and fixed typos too
  * Added Rafael's tag to patch 4/5.

Mario Limonciello (1):
  ACPI: Execute platform _OSC also with query bit clear

Mika Westerberg (4):
  thunderbolt: Add support for PCIe tunneling disabled (SL5)
  thunderbolt: Allow disabling XDomain protocol
  ACPI: Add support for native USB4 control _OSC
  thunderbolt: Add support for native USB4 _OSC

 .../ABI/testing/sysfs-bus-thunderbolt         |   2 +
 Documentation/admin-guide/thunderbolt.rst     |   7 ++
 drivers/acpi/bus.c                            | 119 ++++++++++++++++--
 drivers/thunderbolt/acpi.c                    |  65 ++++++++++
 drivers/thunderbolt/domain.c                  |  16 ++-
 drivers/thunderbolt/icm.c                     |   6 +-
 drivers/thunderbolt/nhi.c                     |  27 +++-
 drivers/thunderbolt/switch.c                  |   6 +-
 drivers/thunderbolt/tb.c                      |  22 +++-
 drivers/thunderbolt/tb.h                      |  13 ++
 drivers/thunderbolt/tunnel.c                  |  10 +-
 drivers/thunderbolt/usb4.c                    |  11 +-
 drivers/thunderbolt/xdomain.c                 |   9 ++
 include/linux/acpi.h                          |  10 ++
 include/linux/thunderbolt.h                   |   3 +
 15 files changed, 298 insertions(+), 28 deletions(-)

-- 
2.29.2

