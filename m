Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA2034C520
	for <lists+linux-usb@lfdr.de>; Mon, 29 Mar 2021 09:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbhC2Hlq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Mar 2021 03:41:46 -0400
Received: from mga12.intel.com ([192.55.52.136]:44482 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229762AbhC2Hlk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Mar 2021 03:41:40 -0400
IronPort-SDR: EGKy8C6l8X/iwP1Ofcf58XNJwdnp37/BaLS1TWdVrvFkiVpH59aUmYg5fF4rs0mx/so5m3B0BA
 mw3+sT3uk3eQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="170900052"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="170900052"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 00:41:39 -0700
IronPort-SDR: HV01pF80dYUD6ipCgv7FHSfctVCYEUWny+vFXXl1X+EIf9ceLZwUmUdolqSk+W6+BD+pw6wO2S
 rX6Sw5P6Hj7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="417547999"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 29 Mar 2021 00:41:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 8AC12A1; Mon, 29 Mar 2021 10:41:50 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Christian Kellner <christian@kellner.me>,
        Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@google.com>,
        Diego Rivas <diegorivas@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v3 0/3] thunderbolt: Expose details about tunneling
Date:   Mon, 29 Mar 2021 10:41:47 +0300
Message-Id: <20210329074150.62622-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello there,

There has been ask if we can expose more details about the connected
devices and the tunneling to userspace, so it can then provide more
detailed information to the user.

First we add uevent details for each device (USB4 router) that adds
USB4_TYPE=host|device|hub and USB4_VERSION=1.0 (if the device actually is
USB4). The host|device|hub definitions follow the USB4 spec.

Then for each device router we expose two new attributes: "usb3" and "dp"
that if present mean that the device has corresponding adapter (USB 3.x
upstream adapter and DP OUT adapter). The contents of the attributes then
hold number of tunnels ending to this router. So if USB 3.x is tunneled
"usb3" reads 1. Since there can be multiple DP OUT adaptes the "dp"
attribute holds number of DP tunnels ending to this router. For PCIe
tunneling the "authorized" attribute works the same way.

Previous versions can be found:

  v2: https://lore.kernel.org/linux-usb/20210323145701.86161-1-mika.westerberg@linux.intel.com/
  v1: https://lore.kernel.org/linux-usb/20210309134818.63118-1-mika.westerberg@linux.intel.com/

Changes from v2:

  * Added missing sysfs_emit()

Changes from v1:

  * Added Greg's Reviewed-by tags for patch 1 and 2
  * Use sysfs_emit()
  * Drop the locking in the new attributes
  * Drop the kobject_uevent()

Mika Westerberg (3):
  thunderbolt: Add details to router uevent
  thunderbolt: Hide authorized attribute if router does not support PCIe tunnels
  thunderbolt: Expose more details about USB 3.x and DisplayPort tunnels

 .../ABI/testing/sysfs-bus-thunderbolt         | 26 +++++++
 drivers/thunderbolt/domain.c                  | 10 +++
 drivers/thunderbolt/switch.c                  | 78 ++++++++++++++++++-
 drivers/thunderbolt/tb.c                      | 44 ++++++++---
 drivers/thunderbolt/tb.h                      |  4 +
 include/linux/thunderbolt.h                   |  6 ++
 6 files changed, 156 insertions(+), 12 deletions(-)

-- 
2.30.2

