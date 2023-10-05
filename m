Return-Path: <linux-usb+bounces-1131-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8AC7B9D9D
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 15:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 0138C2827A9
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 13:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862B427738;
	Thu,  5 Oct 2023 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f05dpAPT"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6356826E20
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 13:50:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D161FCB
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696513802; x=1728049802;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PRLDJpulHO5glhwAGuRn4xH+3DYzQ6TTjBENgD6LQqc=;
  b=f05dpAPTuSGhD+x968bnsH7+HiEHToQT3V3AD+OqhYzu9NpqUiSAsu2Y
   I9X5dkXjsh+twVuDv4xp2QoTFefw9707YGegufXlvC79l+jpV8zTWCNRw
   R0Vfh0Tvwco0cfgpGucgFafZX/5d4CsJLoX0QuPSygRJF2qiXoVnIHdJS
   DJZElg+owiMXF78C1TFx159RzPvxyKai1QetOQJP55+pmwY9zkA3Di/VB
   LLlb1oLHWOWyrxHIVZY7bl5Hx34wTudiTX9Z4P83HPc4bI4u9Fl2y1KNJ
   czA/cDcyPDwD4RtI8VkfJ4+I6cpJF6Jroov0H42pBgK2dBrkUrQQiRxGm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383355551"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="383355551"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 02:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="728369857"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="728369857"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 05 Oct 2023 02:27:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C967235A; Thu,  5 Oct 2023 12:27:29 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 00/10] thunderbolt: USB4 v2 asymmetric switching and more
Date: Thu,  5 Oct 2023 12:27:19 +0300
Message-Id: <20231005092729.3595447-1-mika.westerberg@linux.intel.com>
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
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi all,

This series adds more USB4 v2 features. First it makes the bandwidth
reservation to comply with the v2 connection manager guide, adds the
PMPS packet support bit and enables asymmetric 120/40G switching to
support the Ultra-High Bitrate DisplayPort modes.

Applies on top of the cleanup series I sent out this week [1].

[1] https://lore.kernel.org/linux-usb/20231003094005.2676823-1-mika.westerberg@linux.intel.com/

Gil Fine (5):
  thunderbolt: Make is_gen4_link() available to the rest of the driver
  thunderbolt: Change bandwidth reservations to comply USB4 v2
  thunderbolt: Introduce tb_port_path_direction_downstream()
  thunderbolt: Add support for asymmetric link
  thunderbolt: Configure asymmetric link if needed and bandwidth allows

Mika Westerberg (5):
  thunderbolt: Use constants for path weight and priority
  thunderbolt: Use weight constants in tb_usb3_consumed_bandwidth()
  thunderbolt: Set path power management packet support bit for USB4 v2 routers
  thunderbolt: Introduce tb_for_each_upstream_port_on_path()
  thunderbolt: Introduce tb_switch_depth()

 drivers/thunderbolt/path.c    |   7 +-
 drivers/thunderbolt/switch.c  | 328 +++++++++++++---
 drivers/thunderbolt/tb.c      | 682 ++++++++++++++++++++++++++++------
 drivers/thunderbolt/tb.h      |  58 ++-
 drivers/thunderbolt/tb_regs.h |  12 +-
 drivers/thunderbolt/tunnel.c  | 161 ++++++--
 drivers/thunderbolt/tunnel.h  |   2 +
 drivers/thunderbolt/usb4.c    | 106 ++++++
 8 files changed, 1142 insertions(+), 214 deletions(-)

-- 
2.40.1


