Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1A16C47FF
	for <lists+linux-usb@lfdr.de>; Wed, 22 Mar 2023 11:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbjCVKqS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Mar 2023 06:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbjCVKqM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Mar 2023 06:46:12 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E25265BD81
        for <linux-usb@vger.kernel.org>; Wed, 22 Mar 2023 03:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679481949; x=1711017949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5+YoWlbmCnIN7uwmvuGmrYyryHU4pj0Tvkjj+hJ4v/I=;
  b=fGA4UEut3OdFNnxpVdaoiZR5thZ3BmJVpY2Bf9M4lbACSloo+zcHRoYe
   RR2P0TsII4YD/LklfWpZEmY6WHkIYCd12OB8lIzHQnJRecxPpRWz58JV2
   oMC8v75puGrSj0eu+9W1XlhL8IseGroIDabZminXrY9YvnyDIsa18xF1p
   6sksS1rypfMRIC3Y9pZ2uFWScdS8d/XrIsPXZ2n2oXFGjYkTa1iGatwdW
   kN2I6BPy+q8zErQJn/E8syP69tFS2GbxXUgv3/aLccrF0ZGyoMb39br+n
   fNjz/78OV2CXtkOTd0pC2IKOxUTSU6cxefh0FY4neNBBNkuVkA6xccHAM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="340718266"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="340718266"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 03:45:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="1011318439"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="1011318439"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 22 Mar 2023 03:45:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id A21A21CC; Wed, 22 Mar 2023 12:46:26 +0200 (EET)
Date:   Wed, 22 Mar 2023 12:46:26 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 fixes for v6.3-rc4
Message-ID: <20230322104626.GD62143@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.3-rc4

for you to fetch changes up to 58cdfe6f58b35f17f56386f5fcf937168a423ad1:

  thunderbolt: Rename shadowed variables bit to interrupt_bit and auto_clear_bit (2023-03-20 19:00:58 +0200)

----------------------------------------------------------------
thunderbolt: Fixes for v6.3-rc4

This includes following fixes and quirks for v6.3-rc:

  - Quirk to disable CL-states on AMD USB4 host routers
  - Fix memory leak in lane margining
  - Correct the retimer access flows
  - Quirk to limit USB3 bandwidth on certain Intel USB4 host routers
  - Fix usage of scale field when allocting USB3 bandwidth
  - Fix interrupt "auto clear" on non-Intel USB4 host routers.

There are also two commits that are not fixes themselves but are needed
for the USB3 bandwidth quirk and for the interrupt auto clear fix to
work.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Gil Fine (2):
      thunderbolt: Add missing UNSET_INBOUND_SBTX for retimer access
      thunderbolt: Limit USB3 bandwidth of certain Intel USB4 host routers

Mario Limonciello (2):
      thunderbolt: Use const qualifier for `ring_interrupt_index`
      thunderbolt: Disable interrupt auto clear for rings

Mika Westerberg (3):
      thunderbolt: Fix memory leak in margining
      thunderbolt: Call tb_check_quirks() after initializing adapters
      thunderbolt: Use scale field when allocating USB3 bandwidth

Sanjay R Mehta (1):
      thunderbolt: Add quirk to disable CLx

Tom Rix (1):
      thunderbolt: Rename shadowed variables bit to interrupt_bit and auto_clear_bit

 drivers/thunderbolt/debugfs.c  | 12 +++++-----
 drivers/thunderbolt/nhi.c      | 49 +++++++++++++++++++++++---------------
 drivers/thunderbolt/nhi_regs.h |  6 +++--
 drivers/thunderbolt/quirks.c   | 44 +++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/retimer.c  | 23 ++++++++++++++++--
 drivers/thunderbolt/sb_regs.h  |  1 +
 drivers/thunderbolt/switch.c   |  4 ++--
 drivers/thunderbolt/tb.h       | 15 +++++++++---
 drivers/thunderbolt/usb4.c     | 53 ++++++++++++++++++++++++++++++++++++------
 9 files changed, 166 insertions(+), 41 deletions(-)
