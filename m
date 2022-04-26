Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE54C50FBE9
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 13:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349522AbiDZL2w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Apr 2022 07:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240073AbiDZL2u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 07:28:50 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A169418397
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 04:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650972342; x=1682508342;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lp+/YJxKd4cEPqvP8d//5aAitI+nT/oXEftZJYvZop0=;
  b=E7ud1ASWtsKxE4CxZr+YjMAEEowcgaXSA0FlNYm8gXVfzeqvCMJrv9oF
   X5r2Fg5w5Odr9R7fi9ObuAFrWMYlw0L5FoVm1t3SWqbTnusxvBo5nZvFk
   MJFW+OgSX92yoL8FHVeMowsfo6Et5GKa0S/fKY2fHe2A1TfON98k5c5vE
   tXYfxVh1JpiBI6AMUVe3DBRVgQUNtOK6Ou1tuGq6tGmeCQAdBaaVZa9Is
   sYuey12qKIvpf52hWUQIvqujcwEAWot+ycj/Fp6HC+tJxtPFRd4LdZoTa
   Ke4NEeplL/PVnDlZ/HFu7aqDHICEoeQbTTVWORbOLdoohEq5MZpH66XVh
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="290688237"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="290688237"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 04:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="579837529"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 26 Apr 2022 04:25:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 533454E1; Tue, 26 Apr 2022 14:25:40 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/5] thunderbolt: Add support for XDomain lane bonding
Date:   Tue, 26 Apr 2022 14:25:35 +0300
Message-Id: <20220426112540.6053-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

So far connecting two Thunderbolt/USB4 domains (hosts) the high-speed link
has been using a single lane. The reason for this was simplicity and also
the fact that the host DMA was not able to go over the 20 Gbit/s even if
the lanes were bonded. However, Intel Alder Lake and beyond actually can go
higher than that so now it makes more sense to take advantage of the lane
bonding. The USB4 Inter-Domain Service specification describes the
protocol and this patch series implements it for the Linux Thunderbolt/USB4
driver.

If both sides (hosts) of the link announce supporting this, we will
establish bonded link. This is only possible on systems with software based
connection manager (so Intel Alder Lake and beyond).

Mika Westerberg (5):
  thunderbolt: Add debug logging when lane is enabled/disabled
  thunderbolt: Move tb_port_state() prototype to correct place
  thunderbolt: Split setting link width and lane bonding into own functions
  thunderbolt: Ignore port locked error in tb_port_wait_for_link_width()
  thunderbolt: Add support for XDomain lane bonding

 drivers/thunderbolt/switch.c  | 109 ++++--
 drivers/thunderbolt/tb.c      |   6 -
 drivers/thunderbolt/tb.h      |   4 +-
 drivers/thunderbolt/tb_msgs.h |  39 +++
 drivers/thunderbolt/tb_regs.h |   5 +
 drivers/thunderbolt/xdomain.c | 609 ++++++++++++++++++++++++++++++----
 include/linux/thunderbolt.h   |  19 +-
 7 files changed, 688 insertions(+), 103 deletions(-)

-- 
2.35.1

