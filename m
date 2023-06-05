Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B668721F64
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jun 2023 09:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbjFEHTW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Jun 2023 03:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjFEHTV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Jun 2023 03:19:21 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F1898
        for <linux-usb@vger.kernel.org>; Mon,  5 Jun 2023 00:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685949560; x=1717485560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f+z2Z3/d+mt4Pw9CPEiferzzoVNMdEUh2Fj8tNxKODs=;
  b=W1r7iBCQVHcx6CwwKm9QcXeW/KJX9kDsWLG7U8kEoaWWOHzqthjdSgPI
   C101o9u4XgRggfdYxo+cZIc4Edw+mtRg471zpWn8jESNBWjcQ8XOFHBSn
   dEX4OK0axUpwtc4n4nfAYkj92VvHyTMBUY5mXXQ1NqxTkWlbzARQDYFPn
   NRe13SAyovO024sEGG+IOja97uYnsEb/Es14gPL6KfTQ33/noCKXRGlkC
   fB7VCDOmkUhLRUM5JeZ4P/nqzdfcbdmFRCuXcs8sdaguToMAGSXcB/37k
   gxdFKj+/7JMRlPVstDKTkFOvFXlyncpfmQTwq2mpLxiHBT8TPdU3L/4YJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="353793913"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="353793913"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 00:19:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="686018282"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="686018282"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 05 Jun 2023 00:19:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 13479204; Mon,  5 Jun 2023 10:19:23 +0300 (EEST)
Date:   Mon, 5 Jun 2023 10:19:23 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 fixes for v6.4-rc6
Message-ID: <20230605071923.GS45886@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 44c026a73be8038f03dbdeef028b642880cf1511:

  Linux 6.4-rc3 (2023-05-21 14:05:48 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.4-rc6

for you to fetch changes up to 9f9666e65359d5047089aef97ac87c50f624ecb0:

  thunderbolt: Mask ring interrupt on Intel hardware as well (2023-05-31 10:37:21 +0300)

----------------------------------------------------------------
thunderbolt: Fixes for v6.4-rc6

This includes following fixes for v6.4-rc6:

  - Fix DMA test driver to pass correct values when only RX or TX ring
    is used
  - Increase timeout when DisplayPort tunnel is established to cope with
    a VGA/DVI dongle connected to a dock
  - Do not enable CL states when BIOS connnection manager already
    created the tunnels
  - Correct the ring interrupt masking to work again in Intel hardware
    on resume from system sleep states.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Mika Westerberg (4):
      thunderbolt: dma_test: Use correct value for absent rings when creating paths
      thunderbolt: Increase DisplayPort Connection Manager handshake timeout
      thunderbolt: Do not touch CL state configuration during discovery
      thunderbolt: Mask ring interrupt on Intel hardware as well

 drivers/thunderbolt/dma_test.c |  8 ++++----
 drivers/thunderbolt/nhi.c      | 11 ++++++++---
 drivers/thunderbolt/tb.c       | 17 ++++++++++++-----
 drivers/thunderbolt/tunnel.c   |  2 +-
 4 files changed, 25 insertions(+), 13 deletions(-)
