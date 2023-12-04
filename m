Return-Path: <linux-usb+bounces-3645-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 148D4803087
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:38:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C58C2280FED
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F325D2232A;
	Mon,  4 Dec 2023 10:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZhchDkl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7523385
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686312; x=1733222312;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GKhy7KzojDmaZXjsN+zhOm3iQ0rOVSc+6oVP+pnWE4Y=;
  b=LZhchDkl7tntmc6Y7KsuN3aabE/yWcJR9rABqzS5SyCCZHZrJ0ZImz+a
   EnazXbR5HuGmct6mwU0B3SfCZgd/Bg9adBozUW7HeAXVCTqd7RUF/3CD6
   jGPT0BGlwhLHs78Ug8YlmNy5XcKPRFrRESP82GIF69+qaIrHyaF0v2nbi
   HJ3gkaNj8oPNe3BBG7mR676wuTRFtowsJ1Fh95Vue/dvw/qXzkyE5xHNK
   Iek0OrQy0Zq+aXhKajBruK7AddjN1qQnwZfDE8b3f7KCZenQpcUP2Dznd
   5GFJk0Nz4qszGSr9MPbWxr07c5wngdZ2f8J2LXJGoRSUCZyEHkzMg2grQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="384116733"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="384116733"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:38:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="804861254"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="804861254"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 04 Dec 2023 02:38:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 48D13315; Mon,  4 Dec 2023 12:38:28 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Gil Fine <gil.fine@linux.intel.com>,
	Pengfei Xu <pengfei.xu@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 00/11] Improvements and Lunar Lake support
Date: Mon,  4 Dec 2023 12:38:17 +0200
Message-ID: <20231204103828.1635531-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series adds improvements around USB4 v2 support, PCIe tunneling,
some minor fixes and also adds Intel Lunar Lake support.

Gil Fine (7):
  thunderbolt: Handle lane bonding of Gen 4 XDomain links properly
  thunderbolt: Move width_name() helper to tb.h
  thunderbolt: Log XDomain link speed and width
  thunderbolt: Transition link to asymmetric only when both sides support it
  thunderbolt: Improve logging when DisplayPort resource is added due to hotplug
  thunderbolt: Make PCIe tunnel setup and teardown follow CM guide
  thunderbolt: Disable PCIe extended encapsulation upon teardown properly

Mika Westerberg (4):
  thunderbolt: Unwind TMU configuration if tb_switch_set_tmu_mode_params() fails
  thunderbolt: Disable CL states only when actually needed
  thunderbolt: Use tb_dp_read_cap() to read DP_COMMON_CAP as well
  thunderbolt: Add support for Intel Lunar Lake

 drivers/thunderbolt/nhi.c     |  4 +++
 drivers/thunderbolt/nhi.h     |  2 ++
 drivers/thunderbolt/switch.c  | 20 ++-----------
 drivers/thunderbolt/tb.c      | 46 ++++++++++++++++++-----------
 drivers/thunderbolt/tb.h      | 16 +++++++++++
 drivers/thunderbolt/tmu.c     |  2 +-
 drivers/thunderbolt/tunnel.c  | 44 ++++++++++++++++++++--------
 drivers/thunderbolt/xdomain.c | 54 ++++++++++++++++++++++++++++++++++-
 8 files changed, 139 insertions(+), 49 deletions(-)

-- 
2.42.0


