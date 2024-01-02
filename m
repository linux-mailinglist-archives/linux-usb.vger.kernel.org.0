Return-Path: <linux-usb+bounces-4629-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC18D821BC3
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jan 2024 13:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A63B2829F0
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jan 2024 12:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50CAF4EE;
	Tue,  2 Jan 2024 12:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfG8WqoN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0E8F4F7
	for <linux-usb@vger.kernel.org>; Tue,  2 Jan 2024 12:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704199199; x=1735735199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WcxmoHsPzQiv9UwC//FDXUOpPbGQkKEH6NjOL8FGvk4=;
  b=bfG8WqoNcvHBSJgQ16axz7hQ45vA/kbsJqgIiKmt4LV+gx6EUHyZjRvs
   V+2WSlTJ/vctelvp7HW5dZV8yWInCPJUNgkAoSCjnOxaBmwH8u6NinhSM
   4K5ikQHfXpsfuEXMCeLOVtWTvLaFO+hX5CYHbs0ozj4moaRhfCt2aPk/G
   bepz1aIQ5V4vHVc6OP685ZCXsOwYPoQ+dKMZ0SdVzYMWJ0BW+iRGm0FAc
   165LAeGbWS5npExpaGe/+5Lkb3yHrUIlIhnAa1f0y80OXQngh1Li7zMFC
   p4eqAHQj0WbZ6mrKq/wS9lIR8owTGm0KW8laFUfDG5jGydAGt9V3uMyw3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="10261824"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; 
   d="scan'208";a="10261824"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 04:39:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="729493306"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; 
   d="scan'208";a="729493306"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 02 Jan 2024 04:39:56 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id DA5B624D; Tue,  2 Jan 2024 14:39:54 +0200 (EET)
Date: Tue, 2 Jan 2024 14:39:54 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt changes for v6.8 merge window
Message-ID: <20240102123954.GK2543524@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.8-rc1

for you to fetch changes up to 04b99eac389adc6485f7913d83ec9ed68bbc8326:

  thunderbolt: Reduce retry timeout to speed up boot for some devices (2023-12-22 13:00:26 +0200)

----------------------------------------------------------------
thunderbolt: Changes for v6.8 merge window

This includes following USB4/Thunderbolt changes for the v6.8 merge
window:

  - Intel Lunar Lake support
  - PCIe tunneling improvements
  - DisplayPort tunneling improvements
  - Asymmetric switching improvements
  - Couple of minor fixes and cleanups.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Colin Ian King (1):
      thunderbolt: Remove duplicated re-assignment of pointer 'out'

Gil Fine (8):
      thunderbolt: Handle lane bonding of Gen 4 XDomain links properly
      thunderbolt: Move width_name() helper to tb.h
      thunderbolt: Log XDomain link speed and width
      thunderbolt: Transition link to asymmetric only when both sides support it
      thunderbolt: Improve logging when DisplayPort resource is added due to hotplug
      thunderbolt: Make PCIe tunnel setup and teardown follow CM guide
      thunderbolt: Disable PCIe extended encapsulation upon teardown properly
      thunderbolt: Keep link as asymmetric if preferred by hardware

Mika Westerberg (4):
      thunderbolt: Unwind TMU configuration if tb_switch_set_tmu_mode_params() fails
      thunderbolt: Disable CL states only when actually needed
      thunderbolt: Use tb_dp_read_cap() to read DP_COMMON_CAP as well
      thunderbolt: Add support for Intel Lunar Lake

Werner Sembach (1):
      thunderbolt: Reduce retry timeout to speed up boot for some devices

 drivers/thunderbolt/icm.c     |  2 +-
 drivers/thunderbolt/nhi.c     |  4 +++
 drivers/thunderbolt/nhi.h     |  2 ++
 drivers/thunderbolt/switch.c  | 33 +++++++++----------
 drivers/thunderbolt/tb.c      | 74 +++++++++++++++++++++++++++++--------------
 drivers/thunderbolt/tb.h      | 18 +++++++++++
 drivers/thunderbolt/tmu.c     |  2 +-
 drivers/thunderbolt/tunnel.c  | 46 +++++++++++++++++++--------
 drivers/thunderbolt/xdomain.c | 54 ++++++++++++++++++++++++++++++-
 9 files changed, 176 insertions(+), 59 deletions(-)

