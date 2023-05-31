Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 166BD717B3B
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 11:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235295AbjEaJHj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 05:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235266AbjEaJHV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 05:07:21 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F46A1B9
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 02:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685524031; x=1717060031;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kygC6MdyDA00/GNP1csNFrWPt63I4QUNs53CWr5ACIs=;
  b=V/coQma1u1mbqi9CinYAEStvi2XizBLnP3ftA+kjUMdldm77Xq7F3IKy
   Eoa4FR9t9qkePe/UQwLjUSmXj4vi0UZ53va9Br41cb+X/P7XwIi+Jnn4E
   yOINimIeqjj3jY0doJBG6L005eI3usqgw3W7BFrbLu+s0Qt4if7T4Eygx
   vcXjjJMzoYusJtngTh/LOWmkvjiQ7ZirjJ79iMHENwmfQkjig1S0XIDHB
   0fUfCEHcBJbxHErdXGR2pZA0z9X59vqsiecyeOUh5e4BOuqawu2ORU0Eb
   hpUzmGpuIkD3+fUB+gjk0u17IdHKH5mC+pnb8SeKbdpGgNmQBvPR/SBOa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="354027628"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="354027628"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 02:06:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="657247212"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="657247212"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 31 May 2023 02:06:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id EADE953A; Wed, 31 May 2023 12:06:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Christian Kellner <ckellner@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 00/20] thunderbolt: Initial USB4 v2 support
Date:   Wed, 31 May 2023 12:06:25 +0300
Message-Id: <20230531090645.5573-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
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

The series is based on the "CLx and TMU rework" series I sent out
earlier this week:

  https://lore.kernel.org/linux-usb/20230529100425.6125-1-mika.westerberg@linux.intel.com/

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
 drivers/thunderbolt/tb.h       | 125 ++++---
 drivers/thunderbolt/tb_msgs.h  |   7 +
 drivers/thunderbolt/tb_regs.h  |  25 +-
 drivers/thunderbolt/test.c     |  83 +++++
 drivers/thunderbolt/tmu.c      | 591 ++++++++++++++++++++++++++-------
 drivers/thunderbolt/tunnel.c   | 178 +++++++---
 drivers/thunderbolt/usb4.c     | 108 ++++--
 drivers/thunderbolt/xdomain.c  |  82 ++++-
 include/linux/thunderbolt.h    |  18 +-
 22 files changed, 1367 insertions(+), 381 deletions(-)

-- 
2.39.2

