Return-Path: <linux-usb+bounces-1583-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 317947C8553
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 14:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCD4F282DF9
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 12:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56CB14AAE;
	Fri, 13 Oct 2023 12:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atmYBN9+"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CBB14270
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 12:06:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22194CA
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 05:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697198806; x=1728734806;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qed/Ll2dd/Us0xaA3yFRv9djbs3nOzEusiy3kwTrRxQ=;
  b=atmYBN9+pmHRjqt7/hlRUsE6S/K1x8RYLbtdYiPDRbexB73ALpAasHwo
   dhC/ow3+O71oIfazsj++0UvTaRNDROG20+uxhab/KI2UFl9gEp3pRB75e
   OhrNtkA+zE57wfknqZ3WhsF4yoTjVugHVUuZS+cqIVoyZ1xLhMAJdkqZp
   7C/jUeRuj3HSnn7IbxhG7IsHu8liKMtavfuKaAnxI9ftH2Rrtl+ECE5uE
   QSF9+hqaOjYRuaGSflnV/XjBptseQ8QvfTgJVTOd8ko2DIPQOJU+isttJ
   h4hQYB9WDHHqZZN2BdQVM3QKmvOrFutV0ML0cpA7dXW96pGRt2Dli52RA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375515454"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="375515454"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 05:06:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="754683564"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="754683564"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 13 Oct 2023 05:06:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id BDC406CB; Fri, 13 Oct 2023 15:06:40 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 00/10] thunderbolt: USB4 v2 asymmetric switching and more
Date: Fri, 13 Oct 2023 15:06:30 +0300
Message-Id: <20231013120640.709255-1-mika.westerberg@linux.intel.com>
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
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi all,

This series adds more USB4 v2 features. First it makes the bandwidth
reservation to comply with the v2 connection manager guide, adds the
PMPS packet support bit and enables asymmetric 120/40G switching to
support the Ultra-High Bitrate DisplayPort modes.

Applies on top of thunderbolt.git/next.

Previous version of the series can be found through below link:

https://lore.kernel.org/linux-usb/20231005092729.3595447-1-mika.westerberg@linux.intel.com/

Changes from v1:
  - Try to transition above links symmetric if a USB4 v2 router is
    connected whose link comes up as symmetric regardless whether it
    support asymmetric links or not (previously we just checked for the
    support).

  - Transition asymmetric also when DP tunnel is established if its
    consumption goes over the threshold.

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
 drivers/thunderbolt/tb.c      | 689 ++++++++++++++++++++++++++++------
 drivers/thunderbolt/tb.h      |  58 ++-
 drivers/thunderbolt/tb_regs.h |  12 +-
 drivers/thunderbolt/tunnel.c  | 161 ++++++--
 drivers/thunderbolt/tunnel.h  |   2 +
 drivers/thunderbolt/usb4.c    | 106 ++++++
 8 files changed, 1149 insertions(+), 214 deletions(-)

-- 
2.40.1


