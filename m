Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7DD5A64B3
	for <lists+linux-usb@lfdr.de>; Tue, 30 Aug 2022 15:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiH3N2Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Aug 2022 09:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbiH3N1p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Aug 2022 09:27:45 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C805A571B
        for <linux-usb@vger.kernel.org>; Tue, 30 Aug 2022 06:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661866062; x=1693402062;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=w/KE0Uacg3JOaf64DfXRxNh/K2WO9WOHwTy2Y4+MsC0=;
  b=jUMAf2gPyRUcDuhNxYTXz8rXY+p0E2xLSRTWwNGdgsdtZfCA/AnUQrQI
   4NR7NEMlVC/x5gmghSSZXn2J7bIRS8C4CVD4KCKUlNmF2Eflw8lr31LtD
   9NH7CbdBJnzU6JKMkMkzLRzIuBMBQw4wtryXg83yuYPuALp/M+wwR/syb
   ohIeQH4C1tn92vqjAi+/c5iM5/xOn7nZr9TR66rwQ0WQZIJfV4a1B8v5+
   PqyeAlwOVifijC60cqDs5NDcHpcER3MEoUA3Ll6rcDdl7S6itfn0+XMlj
   ug+RNzI64ObzKhxQvZZyp36iMLH09eTbi2FfoCFubBKbGlvOurXFbHsBj
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="321301071"
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="321301071"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 06:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="562643204"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 30 Aug 2022 06:27:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 017E5AD; Tue, 30 Aug 2022 16:27:51 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 0/5] thunderbolt: Add support for receiver lane margining
Date:   Tue, 30 Aug 2022 16:27:46 +0300
Message-Id: <20220830132751.42518-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

This series adds support for receiver lane margining. This is standard
USB4 port feature that can be used in manufacturing to check electrical
robustness and quality of given USB4 port. This is a separate Kconfig
option (CONFIG_USB4_DEBUGFS_MARGINING) that can be enabled by the
kernels used in manufacturing floor (normal distro kernels do not need
this to be enabled).

This exposes a new debugfs directory "margining" under each connected
USB4 port that can be used to run the margining test. This supports both
hardware and software lane margining although I have only tested the
former as the current Intel hardware only supports that.

Previous version of the series can be found here:
  
  https://lore.kernel.org/linux-usb/20220823105352.56306-1-mika.westerberg@linux.intel.com/

Changes from the previous version:

  * Pass bitmask of CL states into tb_port_clx_supported(). This is a
    new patch 3/5.
  * Use bitmask of CL states also in tb_port_is_clx_enabled() and drop
    tb_port_are_clx_enabled().

Mika Westerberg (5):
  thunderbolt: Move tb_xdomain_parent() to tb.h
  thunderbolt: Move port CL state functions into correct place in switch.c
  thunderbolt: Pass CL state bitmask to tb_port_clx_supported()
  thunderbolt: Add helper to check if CL states are enabled on port
  thunderbolt: Add support for receiver lane margining

 drivers/thunderbolt/Kconfig   |  10 +
 drivers/thunderbolt/debugfs.c | 836 ++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/sb_regs.h |  58 +++
 drivers/thunderbolt/switch.c  | 235 +++++-----
 drivers/thunderbolt/tb.h      |  25 +-
 drivers/thunderbolt/tb_regs.h |   2 +
 drivers/thunderbolt/usb4.c    | 120 +++++
 drivers/thunderbolt/xdomain.c |   9 +-
 8 files changed, 1182 insertions(+), 113 deletions(-)

-- 
2.35.1

