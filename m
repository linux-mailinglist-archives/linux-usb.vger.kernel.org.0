Return-Path: <linux-usb+bounces-1009-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D127B65A4
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 11:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 6AE96B20A84
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 09:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC1A10798;
	Tue,  3 Oct 2023 09:40:16 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7D2FC17
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 09:40:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC67B0
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 02:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696326010; x=1727862010;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3e4EBuapbkB+l9mqA4Cra63IRmh4fP3gLTFmR3oi+T8=;
  b=h2W/fjLYEAujK+29ThFfUCxGDfTEpem06xcy2jO545bacZv7wdgqM89u
   Ljb9qm5iMjQ5ajoMGFq9TsebHsxOIjpNZP1aSaXgOsdbX1ITRKx1Z9S0W
   LDKtNW/ui+IlNS+fqdRC9KyAUlwk+Szx+otzoPGmXPgP7H06ZZii8EMoO
   BY2Ez/k/ioOi1uyNYL6j+FDx3Fnf5PvCH+aEeA0fkYX6nUFXhyQcn/QfI
   GpR0op9euRONxGpi2FpOhtqCQ86RdaTTrV/8t42fd87B83BK3ewKJ4OfW
   wodJ+Jwrc2cM8jOoWVCyoxLiVJYixaz8Q6UJ4uZbYhXsiUbI8wKR7MTIq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1424878"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1424878"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 02:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="997945434"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="997945434"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 03 Oct 2023 02:40:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 73C4E18A0; Tue,  3 Oct 2023 12:40:05 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 00/13] thunderbolt: DisplayPort and logging improvements & cleanups
Date: Tue,  3 Oct 2023 12:39:52 +0300
Message-Id: <20231003094005.2676823-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi all,

This series improves the DisplayPort tunneling slightly to handle
several "active" DP IN/OUT pairs so that for each of them a DP tunnel is
created. It also improves pairing when eGPU with DP IN adapter is
plugged in.

The rest are logging improvements and small cleanups here and there. I'm
planning to merge these for v6.7.

Gil Fine (5):
  thunderbolt: Fix debug log when DisplayPort adapter not available for pairing
  thunderbolt: Fix typo of HPD bit for Hot Plug Detect
  thunderbolt: Log NVM version of routers and retimers
  thunderbolt: Create multiple DisplayPort tunnels if there are more DP IN/OUT pairs
  thunderbolt: Add DP IN added last in the head of the list of DP resources

Mika Westerberg (8):
  thunderbolt: dma_test: Use enum tb_link_width
  thunderbolt: Get rid of usb4_usb3_port_actual_link_rate()
  thunderbolt: Make tb_switch_clx_is_supported() static
  thunderbolt: Check for unplugged router in tb_switch_clx_disable()
  thunderbolt: Fix typo in enum tb_link_width kernel-doc
  thunderbolt: Use tb_tunnel_dbg() where possible to make logging more consistent
  thunderbolt: Expose tb_tunnel_xxx() log macros to the rest of the driver
  thunderbolt: Use tb_tunnel_xxx() log macros in tb.c

 drivers/thunderbolt/clx.c      |  47 ++++++++-------
 drivers/thunderbolt/dma_test.c |  14 ++---
 drivers/thunderbolt/retimer.c  |   1 +
 drivers/thunderbolt/switch.c   |   9 +--
 drivers/thunderbolt/tb.c       |  85 +++++++++++++++------------
 drivers/thunderbolt/tb.h       |   2 -
 drivers/thunderbolt/tb_regs.h  |   7 +--
 drivers/thunderbolt/tunnel.c   | 102 ++++++++++++---------------------
 drivers/thunderbolt/tunnel.h   |  24 +++++++-
 drivers/thunderbolt/usb4.c     |  29 ----------
 include/linux/thunderbolt.h    |   2 +-
 11 files changed, 148 insertions(+), 174 deletions(-)

-- 
2.40.1


