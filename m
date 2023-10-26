Return-Path: <linux-usb+bounces-2209-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFECA7D7EBA
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 10:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8042D281F90
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 08:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134551CAAF;
	Thu, 26 Oct 2023 08:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsgTkCzp"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFF71C6A3
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 08:44:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1635A129
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 01:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698309850; x=1729845850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P3HWvTavV+n2a56NQVuLXNnsoTlUS84rMMBGYy3kUwc=;
  b=JsgTkCzpOpKZVmaPDbhJI4YSzqOPzH3fJjS1C++q7u1/42MtRnt6r6AD
   4zdwYboJIoVbXP3ejt/YEYJpRhx52QuWOt6gBcSV6zQ4CU5XNUWxjDsTv
   RImqhCOm5RbDC66t6j6cxY9z8aEvhRsQzunsEzXnwVENS62wurL5T511h
   jNeoGYSOb9TvMvkReN/Ju5wTJNosOJMsmliTuRxo1TQnlAxpx8ni8lIMb
   h3ey9D3dsAmyrWJWQNK8KN5IxPKRswW7oqawqeWsQSW4wiqD6Jzk9XrqH
   iiKoCLx9/Y6q05sydNEBt+tWG+I1j/WKBe/B7nuK7naygEym+ClfJKoVr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="387317443"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="387317443"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:44:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="794121394"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="794121394"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 26 Oct 2023 01:44:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 12AFE81C; Thu, 26 Oct 2023 11:44:06 +0300 (EEST)
Date: Thu, 26 Oct 2023 11:44:05 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt changes for v6.7 merge window
Message-ID: <20231026084405.GJ3208943@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.7-rc1

for you to fetch changes up to a558892b3456d44f2a89d238f5d650f0574fa3b2:

  thunderbolt: Fix one kernel-doc comment (2023-10-24 07:49:17 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v6.7 merge window

This includes following USB4/Thunderbolt changes for the v6.7 merge
window:

  - Configure asymmetric link if the DisplayPort bandwidth requires so
  - Enable path power management packet support for USB4 v2 routers
  - Make the bandwidth reservations to follow the USB4 v2 connection
    manager guide suggestions
  - DisplayPort tunneling improvements
  - Small cleanups and improvements around the driver.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Gil Fine (10):
      thunderbolt: Fix debug log when DisplayPort adapter not available for pairing
      thunderbolt: Fix typo of HPD bit for Hot Plug Detect
      thunderbolt: Log NVM version of routers and retimers
      thunderbolt: Create multiple DisplayPort tunnels if there are more DP IN/OUT pairs
      thunderbolt: Add DP IN added last in the head of the list of DP resources
      thunderbolt: Make is_gen4_link() available to the rest of the driver
      thunderbolt: Change bandwidth reservations to comply USB4 v2
      thunderbolt: Introduce tb_port_path_direction_downstream()
      thunderbolt: Add support for asymmetric link
      thunderbolt: Configure asymmetric link if needed and bandwidth allows

Mika Westerberg (14):
      thunderbolt: Apply USB 3.x bandwidth quirk only in software connection manager
      thunderbolt: dma_test: Use enum tb_link_width
      thunderbolt: Get rid of usb4_usb3_port_actual_link_rate()
      thunderbolt: Make tb_switch_clx_is_supported() static
      thunderbolt: Check for unplugged router in tb_switch_clx_disable()
      thunderbolt: Fix typo in enum tb_link_width kernel-doc
      thunderbolt: Use tb_tunnel_dbg() where possible to make logging more consistent
      thunderbolt: Expose tb_tunnel_xxx() log macros to the rest of the driver
      thunderbolt: Use tb_tunnel_xxx() log macros in tb.c
      thunderbolt: Use constants for path weight and priority
      thunderbolt: Use weight constants in tb_usb3_consumed_bandwidth()
      thunderbolt: Set path power management packet support bit for USB4 v2 routers
      thunderbolt: Introduce tb_for_each_upstream_port_on_path()
      thunderbolt: Introduce tb_switch_depth()

Yang Li (1):
      thunderbolt: Fix one kernel-doc comment

 drivers/thunderbolt/clx.c      |  47 +--
 drivers/thunderbolt/dma_test.c |  14 +-
 drivers/thunderbolt/path.c     |   7 +-
 drivers/thunderbolt/quirks.c   |   3 +
 drivers/thunderbolt/retimer.c  |   1 +
 drivers/thunderbolt/switch.c   | 337 +++++++++++++++---
 drivers/thunderbolt/tb.c       | 774 ++++++++++++++++++++++++++++++++---------
 drivers/thunderbolt/tb.h       |  60 +++-
 drivers/thunderbolt/tb_regs.h  |  19 +-
 drivers/thunderbolt/tunnel.c   | 263 ++++++++------
 drivers/thunderbolt/tunnel.h   |  26 +-
 drivers/thunderbolt/usb4.c     | 135 +++++--
 include/linux/thunderbolt.h    |   2 +-
 13 files changed, 1300 insertions(+), 388 deletions(-)

