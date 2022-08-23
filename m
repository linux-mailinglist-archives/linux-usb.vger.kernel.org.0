Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D05159E5F5
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 17:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241092AbiHWPZv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 11:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243934AbiHWPZZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 11:25:25 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9218FAF4A0
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 04:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661252525; x=1692788525;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J65JMMECYwz2R2Q85qKixfawpdrVFB78WE/hOnd7yr4=;
  b=AGfuZ9FtkT8YcfxY6O1FD27sYGX9SoYeNi24EGDFpG1B0/xnidK9l1jm
   wCrHfgJTHBmgyYajo3nA1/8NsmA1B9vVavluNor+a1mEtiAnzTmzX7lqt
   RiU4clB0zUCGiBOUwFx1qYZF81uehdsQb4+K9JkVkZiYBeob/QpTIRWQS
   QlarH+34oNGhdyLOLWyYIXEHQ84axZKjp3hUg4UD3BDD49k3xFNflzRWm
   6U87x+NrT6Nh/yVTX6z992TLhZGmYvwLYyrMMiMideRl31OruEWzJEO4H
   aBUbhFTaCX9JvtPVjdBr1yEtAIutfGJd2H7VGhuwbTQF0CzLG1a2JB47u
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="276682472"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="276682472"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 03:53:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="605623050"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 23 Aug 2022 03:53:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 0ACEE19D; Tue, 23 Aug 2022 13:53:52 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/4] thunderbolt: Add support for receiver lane margining
Date:   Tue, 23 Aug 2022 13:53:48 +0300
Message-Id: <20220823105352.56306-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
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

Mika Westerberg (4):
  thunderbolt: Move tb_xdomain_parent() to tb.h
  thunderbolt: Move port CL state functions into correct place in switch.c
  thunderbolt: Add helpers to check if CL states are enabled on port
  thunderbolt: Add support for receiver lane margining

 drivers/thunderbolt/Kconfig   |  10 +
 drivers/thunderbolt/debugfs.c | 836 ++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/sb_regs.h |  58 +++
 drivers/thunderbolt/switch.c  | 235 +++++-----
 drivers/thunderbolt/tb.h      |  27 ++
 drivers/thunderbolt/usb4.c    | 120 +++++
 drivers/thunderbolt/xdomain.c |   9 +-
 7 files changed, 1184 insertions(+), 111 deletions(-)

-- 
2.35.1

