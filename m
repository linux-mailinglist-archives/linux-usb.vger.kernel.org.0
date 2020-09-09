Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94A16262D9A
	for <lists+linux-usb@lfdr.de>; Wed,  9 Sep 2020 13:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729808AbgIILDR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Sep 2020 07:03:17 -0400
Received: from mga17.intel.com ([192.55.52.151]:41543 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727976AbgIILAX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Sep 2020 07:00:23 -0400
IronPort-SDR: 408r7hK2/TNFIW6b8BjcbiyD5SFFB5SY+WL4YvWGJFtReHv5XdXju1pRqbEWmnD1TUyxbkWCLy
 lBR+K2AhmT0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="138348286"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="138348286"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 04:00:05 -0700
IronPort-SDR: tfdgNGiFbAlzDNI8DWaWA54nTIMqRB5s8zVdogIbRZJsI1MZI9VuytQunfdtPwruxerkuarpAz
 gZGyG5lwTRIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="505415435"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 09 Sep 2020 04:00:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 01C0B163; Wed,  9 Sep 2020 14:00:01 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/7] thunderbolt: Additional minor improvements
Date:   Wed,  9 Sep 2020 13:59:54 +0300
Message-Id: <20200909110001.71603-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

This series has some additional minor improvements and cleanups from my
internal development tree. All of this is v5.10 material and apply on top
of thunderbolt.git/next.

Mika Westerberg (7):
  thunderbolt: Only stop control channel when entering freeze
  thunderbolt: Allow KUnit tests to be built also when CONFIG_USB4=m
  thunderbolt: Use "if USB4" instead of "depends on" in Kconfig
  thunderbolt: Handle ERR_LOCK notification
  thunderbolt: Log correct zeroX entries in decode_error()
  thunderbolt: Correct tb_check_quirks() kernel-doc
  thunderbolt: Capitalize comment on top of QUIRK_FORCE_POWER_LINK_CONTROLLER

 drivers/thunderbolt/Kconfig   |  6 ++++--
 drivers/thunderbolt/Makefile  |  3 +--
 drivers/thunderbolt/ctl.c     | 18 +++++++++++++++---
 drivers/thunderbolt/domain.c  | 31 +++++++++++++++++++++++++++++++
 drivers/thunderbolt/nhi.c     | 21 ++++++++++++++++++---
 drivers/thunderbolt/quirks.c  |  2 +-
 drivers/thunderbolt/tb.c      | 18 ++++++++++++++++++
 drivers/thunderbolt/tb.h      | 16 +++++++++++++++-
 drivers/thunderbolt/tb_msgs.h |  1 +
 drivers/thunderbolt/test.c    | 13 ++++++++++++-
 10 files changed, 116 insertions(+), 13 deletions(-)

-- 
2.28.0

