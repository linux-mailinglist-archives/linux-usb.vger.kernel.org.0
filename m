Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD8172BB41
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jun 2023 10:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234031AbjFLIxZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jun 2023 04:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233883AbjFLIw6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 04:52:58 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4518B1BE8
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 01:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686559940; x=1718095940;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zm1kKw2Zxiixz8nt7I7tApvyKW9ysxzZqTKxG4i1QqI=;
  b=nIQt32tirxbYtYeLA1d5BcZf18FIfIHW9pfwbZsEfI1WxdoIBVuwcRr9
   H7uVnhMGyPfAT65gtY6V07rr/F1M2R+Y5nOkA4jedZK4YuVT+sRuTrq8w
   wjLhYwcqo0Z0MQnmzo0AVrTeopUMqom9BD+JgjBmx2igpQXPqUmJo22pc
   E6XzpBqnYqzSBb/gq2ez15DW2bmic6RnW+6LzpO6RxbFZQx3G9s1g2u3f
   EYfdG66QPIUZqhZhHixOYjQLNFKMjpnFMkBnHxF3dFS65DMQWo/FBwOPC
   Ab42rNVths9Z8vTCvSe7e30PU+IJ5+8/4nkhGvqe3cKgVq5bMieJSzP+Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347627237"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347627237"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 01:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="744247713"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="744247713"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 01:21:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 43945357; Mon, 12 Jun 2023 11:21:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Gil Fine <gil.fine@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 00/20] thunderbolt: Initial USB4 v2 support
Date:   Mon, 12 Jun 2023 11:21:25 +0300
Message-Id: <20230612082145.62218-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

This series adds initial support for the next USB4 version (USB4 v2) and
the Intel Barlow Ridge discrete controller. This includes support for
the 80G symmetric link, the necessary configuration needed to bring up
the router in v2 mode, adaptive TMU, PCIe extended encapsulation, and
CL2 low power link state. We will be sending the rest of the USB4 v2
support, including asymmetric 128/80G link support later on once this
one has settled.

These are based on thunderbolt.git/next.

The previous version of the series can be found:

https://lore.kernel.org/linux-usb/20230531090645.5573-1-mika.westerberg@linux.intel.com/

Changes from v1:

  * Make tb_switch_is_usb4() use usb4_switch_version() as well
  * Set TMU mode off by default in tmu_mode_init()
  * Log TMU mode change only if it is actually changed in
    tb_switch_tmu_configure().

Gil Fine (9):
  thunderbolt: Identify USB4 v2 routers
  thunderbolt: Add support for USB4 v2 80 Gb/s link
  thunderbolt: Announce USB4 v2 connection manager support
  thunderbolt: Enable USB4 v2 PCIe TLP/DLLP extended encapsulation
  thunderbolt: Add two additional double words for adapters TMU for USB4 v2 routers
  thunderbolt: Fix DisplayPort IN adapter capability length for USB4 v2 routers
  thunderbolt: Fix PCIe adapter capability length for USB4 v2 routers
  thunderbolt: Move constants related to NVM into nvm.c
  thunderbolt: Increase NVM_MAX_SIZE to support Intel Barlow Ridge controller

Mika Westerberg (11):
  thunderbolt: Ignore data CRC mismatch for USB4 routers
  thunderbolt: Do not touch lane 1 adapter path config space
  thunderbolt: Add the new USB4 v2 notification types
  thunderbolt: Reset USB4 v2 host router
  thunderbolt: Add Intel Barlow Ridge PCI ID
  thunderbolt: Limit Intel Barlow Ridge USB3 bandwidth
  thunderbolt: Add support for enhanced uni-directional TMU mode
  thunderbolt: Enable CL2 low power state
  thunderbolt: Make bandwidth allocation mode function names consistent
  thunderbolt: Add DisplayPort 2.x tunneling support
  thunderbolt: Add test case for 3 DisplayPort tunnels

 drivers/thunderbolt/clx.c      |  31 +-
 drivers/thunderbolt/ctl.c      |  28 ++
 drivers/thunderbolt/debugfs.c  |  29 +-
 drivers/thunderbolt/dma_test.c |  10 +-
 drivers/thunderbolt/eeprom.c   |   3 +-
 drivers/thunderbolt/icm.c      |   6 +-
 drivers/thunderbolt/nhi.c      |  41 ++-
 drivers/thunderbolt/nhi.h      |   4 +
 drivers/thunderbolt/nhi_regs.h |  19 +-
 drivers/thunderbolt/nvm.c      |   4 +
 drivers/thunderbolt/quirks.c   |   8 +
 drivers/thunderbolt/switch.c   | 216 ++++++++----
 drivers/thunderbolt/tb.c       | 132 ++++++--
 drivers/thunderbolt/tb.h       | 144 ++++----
 drivers/thunderbolt/tb_msgs.h  |   7 +
 drivers/thunderbolt/tb_regs.h  |  25 +-
 drivers/thunderbolt/test.c     |  83 +++++
 drivers/thunderbolt/tmu.c      | 595 ++++++++++++++++++++++++++-------
 drivers/thunderbolt/tunnel.c   | 178 +++++++---
 drivers/thunderbolt/usb4.c     | 108 ++++--
 drivers/thunderbolt/xdomain.c  |  82 ++++-
 include/linux/thunderbolt.h    |  18 +-
 22 files changed, 1380 insertions(+), 391 deletions(-)

-- 
2.39.2

