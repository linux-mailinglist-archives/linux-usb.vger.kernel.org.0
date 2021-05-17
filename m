Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A95D3382CD8
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 15:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237220AbhEQNJe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 09:09:34 -0400
Received: from mga07.intel.com ([134.134.136.100]:27559 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237226AbhEQNJb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 May 2021 09:09:31 -0400
IronPort-SDR: TiOqO6+ydnMlo4RCmbEuojakuVDPmcxISguShSREjLeFJKJCTGAS5A5Gd/F+rWuG827KfOba20
 5FtkOefX3jNQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="264376883"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="264376883"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 06:06:55 -0700
IronPort-SDR: 5cqJvGMgFFGsKh2pb1I0mh+oVWLFbAKMc3gEKLKcq9z0Pp2lg7tPB1HFT2CguLgBYiaq0rr6ca
 +lRUSr1pGkjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="404079904"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 17 May 2021 06:06:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 23BA850E; Mon, 17 May 2021 16:07:13 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/3] thunderbolt: Cleanup ABI entries and update wakes
Date:   Mon, 17 May 2021 16:07:10 +0300
Message-Id: <20210517130713.30005-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

The first patch just cleans up the documentation of the sysfs entrues. The
following two patches add wake from DisplayPort (this is recent addition to
the USB4 spec), and aligns the driver wake configuration with the USB4
Connection Manager guide (which is part of the USB4 spec package).

Mika Westerberg (3):
  Documentation / thunderbolt: Clean up entries
  thunderbolt: Add wake from DisplayPort
  thunderbolt: Align USB4 router wakes configuration with the CM guide

 .../ABI/testing/sysfs-bus-thunderbolt         | 44 +++++++++----------
 drivers/thunderbolt/lc.c                      |  6 ++-
 drivers/thunderbolt/switch.c                  |  3 +-
 drivers/thunderbolt/tb.h                      |  1 +
 drivers/thunderbolt/tb_regs.h                 |  3 ++
 drivers/thunderbolt/usb4.c                    | 22 +++++++---
 6 files changed, 47 insertions(+), 32 deletions(-)

-- 
2.30.2

