Return-Path: <linux-usb+bounces-359-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDD47A597B
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 07:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1836B281F05
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 05:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6E735883;
	Tue, 19 Sep 2023 05:44:09 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D04AA3B
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 05:44:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC51100
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 22:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695102247; x=1726638247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2JSxPd0iDgK0rRcLhmUxXOd/myooTf3Xhn8uneTCi/s=;
  b=JgKlYYRrJmE91XZhpq6VG+6QvlFEf8ZnsOoes5RMn/ecP3oy5sg21UtC
   il9PNUh/43q9cDmqFu6PSRm3FIXeZYjmRCYRzwQ8BKd4WzFfrEXsYmzu2
   BBdrjXlmFn7uqgYH4ofp2OhPGaVuPpxADlTQFHahRwQrClf/5e14uo0IY
   aDIB++O8DFOq8YzFJGDjqY1UFTJDWM5R3p1ZvEUF+Y78ljGCUIwgZEMan
   lPgK558pqzoZLwtPishGLp7ZNdcYCYhb6m6yC90hCi1jwZkEJyvIx2GhX
   8keUN+OozIa7sdhHLpu6JZMz+3/NdZ4brAEmUo4EelT3wPoUdWK0bJ8Av
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="410789321"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="410789321"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 22:44:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="861391103"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="861391103"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2023 22:44:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 78B89128; Tue, 19 Sep 2023 08:44:03 +0300 (EEST)
Date: Tue, 19 Sep 2023 08:44:03 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fixes for v6.6-rc3
Message-ID: <20230919054403.GX1599918@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Greg,

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.6-rc3

for you to fetch changes up to 308092d080852f8997126e5b3507536162416f4a:

  thunderbolt: Restart XDomain discovery handshake after failure (2023-09-15 13:01:18 +0300)

----------------------------------------------------------------
thunderbolt: Fixes for v6.6-rc3

This includes following fixes for v6.6-rc3:

  - Add a workaround for IOMMU faults for certain systems with Intel
    Maple Ridge
  - Make sure lane 1 is in CL0 before bonding lanes
  - Correct TMU mode initialization from hardware
  - Restart XDomain discovery handshake after failure.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Mika Westerberg (4):
      thunderbolt: Workaround an IOMMU fault on certain systems with Intel Maple Ridge
      thunderbolt: Check that lane 1 is in CL0 before enabling lane bonding
      thunderbolt: Correct TMU mode initialization from hardware
      thunderbolt: Restart XDomain discovery handshake after failure

 drivers/thunderbolt/icm.c     | 40 ++++++++++++++---------------
 drivers/thunderbolt/switch.c  |  7 ++++++
 drivers/thunderbolt/tmu.c     |  2 +-
 drivers/thunderbolt/xdomain.c | 58 ++++++++++++++++++++++++++++++-------------
 4 files changed, 69 insertions(+), 38 deletions(-)

