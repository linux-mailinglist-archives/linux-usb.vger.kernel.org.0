Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD17346215
	for <lists+linux-usb@lfdr.de>; Tue, 23 Mar 2021 15:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbhCWO5O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Mar 2021 10:57:14 -0400
Received: from mga07.intel.com ([134.134.136.100]:53406 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232477AbhCWO4x (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Mar 2021 10:56:53 -0400
IronPort-SDR: SLnK8Vi75m6907Zxcw440LpKKOPBszgcCpSf0O9MBWVE4AfoQyoSquRcCLuo6bUJT11/vUQa8a
 QFXmoozXJSEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="254491755"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; 
   d="scan'208";a="254491755"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 07:56:53 -0700
IronPort-SDR: P4io+lsDaU7HGP1rDCwsWTgD1+ovwSz9UtRnFi+NtC/xjlVHTBGj6wNphu22md9WfzBKtebp0Q
 iBjOjhdRwk2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; 
   d="scan'208";a="452171643"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 23 Mar 2021 07:56:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 755914DB; Tue, 23 Mar 2021 16:57:01 +0200 (EET)
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
Subject: [PATCH v2 0/3] thunderbolt: Expose details about tunneling
Date:   Tue, 23 Mar 2021 17:56:58 +0300
Message-Id: <20210323145701.86161-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

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

Version 1 of the series can be found here:

  https://lore.kernel.org/linux-usb/20210309134818.63118-1-mika.westerberg@linux.intel.com/

Changes from version 1:

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

