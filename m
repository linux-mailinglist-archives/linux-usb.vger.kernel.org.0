Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F08C49CC17
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 15:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242037AbiAZOQn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 09:16:43 -0500
Received: from mga01.intel.com ([192.55.52.88]:39082 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235491AbiAZOQm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Jan 2022 09:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643206602; x=1674742602;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=avkL63V+zrEPXeIRcNzetzTNXLIYzyz3qnJ9mlX45C8=;
  b=AzyW/FZGab/or7IqNm/u1VfrcS4ErIYTni6nAExMbhAIiEye407JyxU3
   sgRDahQkswSpcGJ7ZwJZw7a2do7uDiAPtjhkYE++kl0RY6wbq+Rel3e/+
   1wzfB4QDvoT7KLTUSDzzi2/EfmdIpp4I9hWxv745uK6xV3Me+sV/HOVqs
   boue8f+X5Us/DZTaSg7S26yx00YFuxynV0HGrC4DD4vLQCh7MmfDAgssp
   m7VWgFpfeSKZrs+u8C8eunFyaTn7RCoNyqE0+Gm1e+aoG6xJzoIScTmoE
   FnZbF0guPBTC6e5aIiurP84aqB7aZXcVizZ4AlHH63wSUg2w/wgRiA66A
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="271008867"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="271008867"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 06:16:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="628313200"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 26 Jan 2022 06:16:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1656C167; Wed, 26 Jan 2022 16:16:53 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/3] thunderbolt: Improvements for Alpine and Titan Ridge devices
Date:   Wed, 26 Jan 2022 17:16:50 +0300
Message-Id: <20220126141653.28092-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

The first two patches implement flows that are needed to bring up the
internal xHCI controller when there is USB device connected to the
downstream Thunderbolt port of the the router. The last patch disables
LTTPR (LT-tunable PHY Repeater, DisplayPort term) when Titan Ridge device
router is connected to avoid tunneling issues.

Mika Westerberg (3):
  thunderbolt: Add missing device ID to tb_switch_is_alpine_ridge()
  thunderbolt: Add internal xHCI connect flows for Thunderbolt 3 devices
  thunderbolt: Disable LTTPR on Intel Titan Ridge

 drivers/thunderbolt/lc.c      | 110 ++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/switch.c  |  71 +++++++++++++++++++++-
 drivers/thunderbolt/tb.c      |  11 ++++
 drivers/thunderbolt/tb.h      |   8 +++
 drivers/thunderbolt/tb_regs.h |   9 +++
 drivers/thunderbolt/tunnel.c  |  10 ++++
 6 files changed, 218 insertions(+), 1 deletion(-)

-- 
2.34.1

