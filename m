Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D43DF252C2B
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 13:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728778AbgHZLHn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 07:07:43 -0400
Received: from mga06.intel.com ([134.134.136.31]:15562 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728691AbgHZLHl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Aug 2020 07:07:41 -0400
IronPort-SDR: Jp+qy7LV9U6LS5kxNGEg+1U/ZC+QoFb2mXx9TApHjXnNoGCX2Xthn0X/1j+6vq2sUyc6DD5upU
 jmf7QAAt1mFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="217817814"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="217817814"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 04:07:39 -0700
IronPort-SDR: BuQJcF39gcHvEnmHbbRph93O+giovsl2MvK9oBSA0G/TPzuTOZ3zf20yPn1vVpGbtdfTeXm0fX
 ykqsaV3xPsDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="499674038"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 26 Aug 2020 04:07:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id BB473352; Wed, 26 Aug 2020 14:07:36 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/9] thunderbolt: Add debugfs support
Date:   Wed, 26 Aug 2020 14:07:27 +0300
Message-Id: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

This series adds debugfs support to the driver. This is useful when
debugging different hardware/software issues as the developer can dump
different config spaces of the router including adapter, path and counters
config spaces. Each connected router is exposed in debugfs under
thunderbolt directory, and the naming follows what we have in sysfs.

This also adds a capability to write certain registers but that needs to be
enabled through Kconfig option, not supposed to be enabled by distros (or
regular users).

The series is based on top of my "Power Management improvements" patches
which can be viewed in the below link:

  https://lore.kernel.org/linux-usb/20200819115905.59834-1-mika.westerberg@linux.intel.com/

Gil Fine (2):
  thunderbolt: Introduce tb_switch_is_tiger_lake()
  thunderbolt: Add debugfs interface

Mika Westerberg (7):
  thunderbolt: Move struct tb_cap_any to tb_regs.h
  thunderbolt: Introduce tb_port_next_cap()
  thunderbolt: Introduce tb_switch_next_cap()
  thunderbolt: Introduce tb_port_is_nhi()
  thunderbolt: Check for Intel vendor ID when identifying controller
  thunderbolt: Introduce tb_switch_is_ice_lake()
  thunderbolt: No need to warn in TB_CFG_ERROR_INVALID_CONFIG_SPACE

 drivers/thunderbolt/Kconfig   |  10 +
 drivers/thunderbolt/Makefile  |   1 +
 drivers/thunderbolt/cap.c     | 126 ++++--
 drivers/thunderbolt/ctl.c     |   5 +-
 drivers/thunderbolt/debugfs.c | 700 ++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/domain.c  |  13 +-
 drivers/thunderbolt/switch.c  |   5 +-
 drivers/thunderbolt/tb.h      | 109 ++++--
 drivers/thunderbolt/tb_regs.h |  18 +-
 9 files changed, 909 insertions(+), 78 deletions(-)
 create mode 100644 drivers/thunderbolt/debugfs.c

-- 
2.28.0

