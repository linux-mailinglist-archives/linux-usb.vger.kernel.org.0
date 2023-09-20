Return-Path: <linux-usb+bounces-400-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6427A7095
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 04:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A7B91C20C8D
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 02:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AC123CB;
	Wed, 20 Sep 2023 02:33:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A2B1FA2
	for <linux-usb@vger.kernel.org>; Wed, 20 Sep 2023 02:33:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C98ECCA;
	Tue, 19 Sep 2023 19:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695177196; x=1726713196;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TK0oa6roRAzVZaNYP02htJmMdnLtew4NjMItolNeLC4=;
  b=RUTNb0alBNyWCiImHieA9rPqAaerjoeSxoj7bDJSiZ7AGz93l25axVRE
   tUHa4h+j/uspiqJFLzhhUYQtBupGa9cGBCt0mh1nQTpU9Jmf4YNaodUsV
   9NoX0JTjoRA7wz4Xkjmgz5TjVse+3hw0LvwB8/kcHzVt7rpbzrH/oh4F1
   LQtF6ZuKo5OnR8Eni+d0Vt3iTYCD9+ziV43PdebYftUQ2tKBWq3i3eglU
   tyshAvG7xlWkeoCGXS+p8sH+CJWrAMn2/4VYn+FGPnxWQQELxp3nVNjmG
   nqROHxNCh6z19zqY5okt9v5Z80Swj441S9CgNmA2Et/yk4l7Zci6ApvBF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466422441"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="466422441"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 19:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="816690718"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="816690718"
Received: from uhpatel-desk4.jf.intel.com ([10.23.15.215])
  by fmsmga004.fm.intel.com with ESMTP; 19 Sep 2023 19:33:11 -0700
From: Utkarsh Patel <utkarsh.h.patel@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com,
	pmalani@chromium.org,
	chrome-platform@lists.linux.dev,
	andriy.shevchenko@linux.intel.com,
	bleung@chromium.org,
	Utkarsh Patel <utkarsh.h.patel@intel.com>
Subject: [PATCH v4 0/5] Displayport Alternate Mode 2.1 Support
Date: Tue, 19 Sep 2023 19:32:38 -0700
Message-Id: <20230920023243.2494410-1-utkarsh.h.patel@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This series enabels cable identification flow required for Displayport
Alternate Mode 2.1 support.

Please add this series to usb-next. 

Changes in v4:
- Added [PATCH 3/5] back in this series with Reviewed-by tag from Heikki.

Changes in v3:
- Removed [PATCH 3/5] usb: pd: Add helper macro to get Type C cable speed
  instead added the helper function in [PATCH 3/4].
- In [PATCH 3/4] Removed use of variable cable_speed. 

Changes in v2:
- Added two new patches [PATCH 2/5] and [PATCH 3/5] in to this series.
- Removed [PATCH 2/4]  platform/chrome: cros_ec: Add Displayport
  Alternatemode 2.1 feature flag
- In [PATCH 4/5] Removed feature flag and separate function for DP2.1.
- In [PATCH 4/5] used cable vdos instead of host commands to get cable
  details.

Utkarsh Patel (5):
  usb: typec: Add Displayport Alternate Mode 2.1 Support
  usb: typec: Add Active or Passive cable defination to cable discover
    mode VDO
  usb: pd: Add helper macro to get Type C cable speed
  platform/chrome: cros_ec_typec: Add Displayport Alternatemode 2.1
    Support
  usb: typec: intel_pmc_mux: Configure Displayport Alternate mode 2.1

 drivers/platform/chrome/cros_ec_typec.c  | 28 ++++++++++++++++++++++++
 drivers/usb/typec/altmodes/displayport.c |  5 ++++-
 drivers/usb/typec/mux/intel_pmc_mux.c    | 24 ++++++++++++++++++++
 drivers/usb/typec/ucsi/displayport.c     |  2 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c        |  4 ++--
 include/linux/usb/pd_vdo.h               |  1 +
 include/linux/usb/typec_dp.h             | 28 ++++++++++++++++++++----
 include/linux/usb/typec_tbt.h            |  1 +
 8 files changed, 85 insertions(+), 8 deletions(-)

-- 
2.25.1


