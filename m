Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80AE179AED5
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 01:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350832AbjIKVll (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236264AbjIKKE5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 06:04:57 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B050E6C
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 03:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694426693; x=1725962693;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=favUYh5YkCTfirv9jmPMIlJmw8GqaPLjfKiwPb8aFvA=;
  b=axnGjplOHMQUyUMIB4cbLZmE132c2GLJPqlSb8QGm6T3J1kE1l2+04qB
   2U3RbOFadUuLKxndTvkNUNVDMz6xHwmhWVOnfcCSksv1lCXm3tv9yDhtF
   AamG2FDkBd8GKNutbFAaT92QObKJ2N4NBoWaI0iJKr69Q5euwxAzWyFBE
   5dyICAhKwLCQRAk44vdAt1eq15jpoUl5XJDxbuFUPTyJz9m9LDPkF4eGg
   BA45BzIXry6FhjSrGEJ+AusdGKphTIQmZCOLt9d4Pf6RzjCYmgpHCJXiS
   5JeQWzrlhoqvZRvgvfwqExvcx77qYkyIlbgEIQ5j544goKxkZz5oc+Bw0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="442037125"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="442037125"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 03:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="858263762"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="858263762"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 11 Sep 2023 03:04:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id A6CE4988; Mon, 11 Sep 2023 13:04:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Werner Sembach <wse@tuxedocomputers.com>,
        Konrad J Hambrick <kjhambrick@gmail.com>,
        Calvin Walton <calvin.walton@kepstin.ca>,
        =?UTF-8?q?Marek=20=C5=A0anta?= <teslan223@gmail.com>,
        David Binderman <dcb314@hotmail.com>,
        Alex Balcanquall <alex@alexbal.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/5] thunderbolt: Couple of fixes and improvements
Date:   Mon, 11 Sep 2023 13:04:40 +0300
Message-Id: <20230911100445.3612655-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

This series contains fixes for various issues folks have reported and
also a few not so critical improvements.

I was planning to take patches 1-3 through my fixes branch into v6.6-rc
and the patches 4 and 5 to my next branch where they can sit some more
time in linux-next until they go into v6.7.

Mika Westerberg (5):
  thunderbolt: Workaround an IOMMU fault on certain systems with Intel Maple Ridge
  thunderbolt: Check that lane 1 is in CL0 before enabling lane bonding
  thunderbolt: Correct TMU mode initialization from hardware
  thunderbolt: Apply USB 3.x bandwidth quirk only in software connection manager
  thunderbolt: Restart XDomain discovery handshake after failure

 drivers/thunderbolt/icm.c     | 40 ++++++++++++------------
 drivers/thunderbolt/quirks.c  |  3 ++
 drivers/thunderbolt/switch.c  |  7 +++++
 drivers/thunderbolt/tmu.c     |  2 +-
 drivers/thunderbolt/xdomain.c | 58 +++++++++++++++++++++++++----------
 5 files changed, 72 insertions(+), 38 deletions(-)

-- 
2.40.1

