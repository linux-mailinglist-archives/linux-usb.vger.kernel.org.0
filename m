Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1793327A0
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 14:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbhCINs4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 08:48:56 -0500
Received: from mga09.intel.com ([134.134.136.24]:8336 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231293AbhCINsW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Mar 2021 08:48:22 -0500
IronPort-SDR: 05RglrHpnA8BJMtpE5BhqojNUByZWZvi/whp3phWbulRqh8BnUPOFkpZOuAe88tPA2B3hiQvVY
 s3NG2EJ51RuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="188339385"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="188339385"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 05:48:21 -0800
IronPort-SDR: N5Dj70HpfxQgXHNvyebYIk3+AaiquMwNizNblM7+qkJs34alC+NCzX9CyQDWS0sbEQeQjmfBOH
 q0/M2KAp8X/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="447506025"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 09 Mar 2021 05:48:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id E3A661EC; Tue,  9 Mar 2021 15:48:18 +0200 (EET)
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
Subject: [PATCH 0/3] thunderbolt: Expose details about tunneling
Date:   Tue,  9 Mar 2021 16:48:15 +0300
Message-Id: <20210309134818.63118-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

There has been ask if we can expose more details about the connected
devices and the tunneling to userspace, so it can then provide more
detailed information to the user.

This series is not meant to be merged just yet but more like start of a
discussion if the information here is enough or we perhaps want to do
something differently.

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

I'm including the folks who have been working on the userspace side of
Thunderbolt in hope to get some feedback whether this is useful approach or
perhaps there are better ideas.

Thanks!

Mika Westerberg (3):
  thunderbolt: Add details to router uevent
  thunderbolt: Hide authorized attribute if router does not support PCIe tunnels
  thunderbolt: Expose more details about USB 3.x and DisplayPort tunnels

 .../ABI/testing/sysfs-bus-thunderbolt         | 26 ++++++
 drivers/thunderbolt/domain.c                  | 10 +++
 drivers/thunderbolt/switch.c                  | 90 ++++++++++++++++++-
 drivers/thunderbolt/tb.c                      | 49 +++++++---
 drivers/thunderbolt/tb.h                      |  4 +
 include/linux/thunderbolt.h                   |  6 ++
 6 files changed, 173 insertions(+), 12 deletions(-)

-- 
2.30.1

