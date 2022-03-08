Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8363B4D1745
	for <lists+linux-usb@lfdr.de>; Tue,  8 Mar 2022 13:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346709AbiCHMaY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Mar 2022 07:30:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235466AbiCHMaX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Mar 2022 07:30:23 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC31369CF
        for <linux-usb@vger.kernel.org>; Tue,  8 Mar 2022 04:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646742567; x=1678278567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9o58/RGSpN4bxsc76gOpwpTEa7NExYFvWNFAsSNmCtQ=;
  b=CUNlLmurwv5VPwGm3LQTngmdV0z4q2IwM3NLnshr4AsblhG+oLBJazwz
   NK7vUpg0SJCyHrN/znJiRGtaO3Zg9jn6fA/De/DwAnlh4LfQRsgm3rMv9
   NlEbLZMziaVmw7chkHsok1+mT5C2kIQg1hfPKIbCL82t1kcaKSfHWWoSR
   bu6WDoY1qq6HRAQ8c77r8MuLRRwW+R3izcXK77SzSbzfjANpXZ1Gm1od4
   4/MyjJDKe1dpUGQpTfYuOG/HT+teRkCiMFqFd2/A5HeGs8Zp4qhq3GNng
   YgOBSfmUlunI0myT8+rZhjt1Ukw6lHKhJKLdGYfsDl+OXhbCRrj3qtSl7
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="234625559"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
   d="scan'208";a="234625559"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 04:29:26 -0800
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
   d="scan'208";a="577979323"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 04:29:23 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 08 Mar 2022 14:20:33 +0200
Date:   Tue, 8 Mar 2022 14:20:33 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 changes for v5.18 merge window
Message-ID: <YidKEUcphTB4SE0E@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.18-rc1

for you to fetch changes up to 144c4a77a3e1e520daba85eafd28999af22e1aa5:

  thunderbolt: Rename EEPROM handling bits to match USB4 spec (2022-03-04 17:10:36 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v5.18 merge window

This includes following Thunderbolt/USB4 changes for the v5.18 merge
window:

  * Improvements for Intel Alpine and Titan Ridge support
  * Replace acpi_bus_get_device() with acpi_fetch_acpi_dev()
  * Improvements around DROM handling on AMD hardware
  * A couple of cleanups.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Christophe JAILLET (1):
      thunderbolt: Remove useless DMA-32 fallback configuration

Mario Limonciello (5):
      thunderbolt: Retry DROM reads for more failure scenarios
      thunderbolt: Do not resume routers if UID is not set
      thunderbolt: Do not make DROM read success compulsory
      thunderbolt: Clarify register definitions for `tb_cap_plug_events`
      thunderbolt: Rename EEPROM handling bits to match USB4 spec

Mika Westerberg (3):
      thunderbolt: Disable LTTPR on Intel Titan Ridge
      thunderbolt: Add missing device ID to tb_switch_is_alpine_ridge()
      thunderbolt: Add internal xHCI connect flows for Thunderbolt 3 devices

Rafael J. Wysocki (1):
      thunderbolt: Replace acpi_bus_get_device()

 drivers/thunderbolt/acpi.c    |   4 +-
 drivers/thunderbolt/eeprom.c  |  41 ++++++++--------
 drivers/thunderbolt/lc.c      | 110 ++++++++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/nhi.c     |   3 +-
 drivers/thunderbolt/switch.c  |  81 +++++++++++++++++++++++++++++--
 drivers/thunderbolt/tb.c      |  11 +++++
 drivers/thunderbolt/tb.h      |   8 +++
 drivers/thunderbolt/tb_regs.h |  37 +++++++++-----
 drivers/thunderbolt/tunnel.c  |  10 ++++
 9 files changed, 265 insertions(+), 40 deletions(-)
