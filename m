Return-Path: <linux-usb+bounces-3065-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFF67F259D
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 07:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B73471C21959
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 06:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468F41B28B;
	Tue, 21 Nov 2023 06:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="babJSEN7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4F2100
	for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 22:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700546589; x=1732082589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lcwTkCuwFZFoxx7xPkCIyFU7Vmw6J9bgsWhieuJdebs=;
  b=babJSEN7dfGeEoBGaS08Mnpalrhb1/WKEjc/Nnoh5n4iSuunOwPKbXVa
   ki5ivbckYXGzoWlvulXt2JV70OVHKz8DgLaUpW5G7/lG0kIz7pEQx3GwC
   7Qkfww8HWf8nbp/ph3RuUuoTNeefbKNgeknq9Io47eadNm71yqCvy7YoQ
   dJjxTxm/WBgiY51KCxROE9CyDCSK03IsrFeLZhkl773E+aL8Wfg073woM
   2Mvq22cbo8RymjxJtDTiC5xal57KUBumNDSPgXUxtzphHKMgNn6+FYmc9
   Cd5imozXBchGz6ifL9cNqnRJ8+M6y21uZtSh++vCl/akDWcKKjmDGGZLc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="13318975"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="13318975"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 22:03:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="1013802928"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="1013802928"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 20 Nov 2023 22:03:07 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id DD49513A; Tue, 21 Nov 2023 08:03:05 +0200 (EET)
Date: Tue, 21 Nov 2023 08:03:05 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fixes for v6.7-rc3
Message-ID: <20231121060305.GE1074920@black.fi.intel.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.7-rc3

for you to fetch changes up to 480713b1ba8eac4617936f8404da34bda991c30e:

  thunderbolt: Only add device router DP IN to the head of the DP resource list (2023-11-17 13:05:57 +0200)

----------------------------------------------------------------
thunderbolt: Fixes for v6.7-rc3

This includes following USB4/Thunderbolt fixes for v6.7-rc3:

  - Fix a lane bonding issue on ASMedia USB4 device
  - Send uevents when link is switched to asymmetric or symmetric
  - Only add device router DP IN adapters to the head of resource list
    to avoid issues during system resume.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Gil Fine (1):
      thunderbolt: Set lane bonding bit only for downstream port

Mika Westerberg (2):
      thunderbolt: Send uevent after asymmetric/symmetric switch
      thunderbolt: Only add device router DP IN to the head of the DP resource list

 drivers/thunderbolt/switch.c |  6 +++---
 drivers/thunderbolt/tb.c     | 12 +++++++++++-
 2 files changed, 14 insertions(+), 4 deletions(-)

