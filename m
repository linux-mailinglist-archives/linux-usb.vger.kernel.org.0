Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 939E47147A3
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbjE2KEc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231910AbjE2KEb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:31 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 489F2C4
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354664; x=1716890664;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fFQIsAbAHof1DVjlFcCnUIJZZzixzIrecCkfM8US1TI=;
  b=UG1KHPGK61eVuxRxrd5h3QB/EK1C8ppSdlL1QgXVxmZ4TjI8w+e2/umI
   1FgzksOfA/nePT+3c82XPrOmNjDltSl9dxC94ATBMppcmxawI9DnxE/5M
   G3zf8TbBy1/W41gnqHfLf2GX5uPXE7ruWSk8XHLEI429NRNZAGGLspumf
   UwytXX8T9PB/pqhgroLmxLmV9UG6p9StKhli9ozcRn0s1OjtuixRtK4lk
   P9IsyRzUsm/VEbzhvWDePpWyTEppWY5fnz0AYY7hTUfLcn6DqYp+Ip41r
   Y56tf/BdH99lvqnLZIEr6PHZ2xXoexvVyny2FaoZu6e+zRt12cGdoyLv8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684404"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684404"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518267"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518267"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id B35FA350; Mon, 29 May 2023 13:04:25 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 00/20] thunderbolt: Rework TMU and CLx support
Date:   Mon, 29 May 2023 13:04:05 +0300
Message-Id: <20230529100425.6125-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

This series reworks the TMU and CLx support code to match better what we
do elsewhere in the driver and prepares for USB4v2 adaptive TMU support
that we are going to add in the subsequent series (I'm sending that out
later this week). I've split this part as separate from USB4v2 support
hoping that it makes reviewing them easier.

Gil Fine (1):
  thunderbolt: Introduce tb_switch_downstream_port()

Mika Westerberg (19):
  thunderbolt: Introduce tb_xdomain_downstream_port()
  thunderbolt: Fix a couple of style issues in TMU code
  thunderbolt: Drop useless 'unidirectional' parameter from tb_switch_tmu_is_enabled()
  thunderbolt: Rework Titan Ridge TMU objection disable function
  thunderbolt: Get rid of tb_switch_enable_tmu_1st_child()
  thunderbolt: Move TMU configuration to tb_enable_tmu()
  thunderbolt: Move tb_enable_tmu() close to other TMU functions
  thunderbolt: Check valid TMU configuration in tb_switch_tmu_configure()
  thunderbolt: Move CLx support functions into clx.c
  thunderbolt: Get rid of __tb_switch_[en|dis]able_clx()
  thunderbolt: Move CLx enabling into tb_enable_clx()
  thunderbolt: Switch CL states from enum to a bitmask
  thunderbolt: Check for first depth router in tb.c
  thunderbolt: Do not call CLx functions from TMU code
  thunderbolt: Prefix TMU post time log message with "TMU: "
  thunderbolt: Prefix CL state related log messages with "CLx: "
  thunderbolt: Initialize CL states from the hardware
  thunderbolt: Make tb_switch_clx_disable() return CL states that were enabled
  thunderbolt: Disable CL states when a DMA tunnel is established

 drivers/thunderbolt/Makefile  |   2 +-
 drivers/thunderbolt/acpi.c    |   5 +-
 drivers/thunderbolt/clx.c     | 416 ++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/debugfs.c |  35 ++-
 drivers/thunderbolt/icm.c     |  24 +-
 drivers/thunderbolt/switch.c  | 378 +-----------------------------
 drivers/thunderbolt/tb.c      | 227 +++++++++++++------
 drivers/thunderbolt/tb.h      | 102 ++++-----
 drivers/thunderbolt/tmu.c     | 152 ++++---------
 drivers/thunderbolt/usb4.c    |   9 +-
 drivers/thunderbolt/xdomain.c |  16 +-
 11 files changed, 719 insertions(+), 647 deletions(-)
 create mode 100644 drivers/thunderbolt/clx.c

-- 
2.39.2

