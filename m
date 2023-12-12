Return-Path: <linux-usb+bounces-4021-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE96880E6EF
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 09:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6544B1F2246A
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 08:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF797487A0;
	Tue, 12 Dec 2023 08:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkzlUNYK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E26CE9
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 00:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702371368; x=1733907368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Olz1GivS2gP/ijpYmrJmCU9Y2pBFhxEADj24+mHOfg=;
  b=OkzlUNYKUYPe+4/PBCixyaCi6p9Pz0l0x/bmVPq3+GXn2uOXi8JEGUpM
   jd9oupyW2w40sz7BfYEGtt3K/R2FsyKCJK5YkMMS/t57FKO2m/fel4X3g
   T9+uKyY/XdaPql+bsE12c5t1PcNJzlX7OhXPZaMPrsnYpJ4aHO7pJ/6qT
   JU6iQsPa/wdFQQOj1uj34LTPzPScxDZ6R61ycpnl84UmtvKTi9F5zdJcs
   nFufDqT95xRBVT68Z+PJrDI6elmtaDrAuy/45+Drd3Ra4codQ/VRv6bWK
   P/K5ZV1tApYepSS37x2ashDGkVdRVHjbalpPnZbPR5saJzj2IaEAFNe6Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="461250344"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="461250344"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 00:56:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="749635182"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="749635182"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 12 Dec 2023 00:56:06 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C259E241; Tue, 12 Dec 2023 10:56:04 +0200 (EET)
Date: Tue, 12 Dec 2023 10:56:04 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fixes for v6.7-rc6
Message-ID: <20231212085604.GE1074920@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab:

  Linux 6.7-rc3 (2023-11-26 19:59:33 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.7-rc6

for you to fetch changes up to f0b94c1c5c7994a74e487f43c91cfc922105a423:

  thunderbolt: Fix minimum allocated USB 3.x and PCIe bandwidth (2023-12-08 09:03:49 +0200)

----------------------------------------------------------------
thunderbolt: Fixes for v6.7-rc6

This includes following USB4/Thunderbolt fixes for v6.7-rc6:

  - Fix memory leak in margining_port_remove()
  - Correct minimum bandwidth allocated for USB 3.x and PCIe to avoid
    reducing DisplayPort capabilities in certain monitor configurations.

Both have been in linux-next with no reported issues.

----------------------------------------------------------------
Gil Fine (1):
      thunderbolt: Fix minimum allocated USB 3.x and PCIe bandwidth

Yaxiong Tian (1):
      thunderbolt: Fix memory leak in margining_port_remove()

 drivers/thunderbolt/debugfs.c |  2 +-
 drivers/thunderbolt/usb4.c    | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

