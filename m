Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7C255CAC7
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 14:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344606AbiF1KTO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jun 2022 06:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344819AbiF1KTF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Jun 2022 06:19:05 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3AA62F664
        for <linux-usb@vger.kernel.org>; Tue, 28 Jun 2022 03:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656411539; x=1687947539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rrmHRctSCguTVSE9Q6vhGhOlXuZ5a/VmHKTtVEQ40Eo=;
  b=eqWxk/pJ2Tt68J0xQ80yVr8RAKIJT2O04MXl7lN6+BWcay1w4huUpdu8
   2ckklb+NdTWef6TS1T8W48wNYifmIg2CwNFnXT2JrwcdvPiP/xzOJ52En
   KFzp/VD56yoHY4cvjSbGE6MBr2wSHFINW7bw3SVJErViw042kxnTw1PqE
   GGLHtqBIp+7uN8tDNIkkzyB4CW2sPCUN83uihjSpht+50vSfzwhV5OfaP
   +oyzpn156jbcVwsuw1737jXm6Pol1oQMH5Xm9ziE09Mnad7G5PFe2fEXk
   rb0W9hHwmM7BJH8PPlMYABtG3ELNCMeHl6aggMOgzFa876b6ttsBuzotd
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="279247203"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="279247203"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 03:18:59 -0700
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="594738086"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 03:18:56 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 28 Jun 2022 13:18:54 +0300
Date:   Tue, 28 Jun 2022 13:18:54 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 changes for v5.20 merge window
Message-ID: <YrrVjj+xZyaqjFFi@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Please find Thunderbolt/USB4 changes for the next merge window below.
I'm sending this one early because I will be on vacation pretty much the
whole July. I hope this is fine for you. 

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.20-rc1

for you to fetch changes up to 34b9715b7caee2e2b7d74bb4230f2be2c2765c0a:

  thunderbolt: Fix typo in comment (2022-06-17 18:19:15 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v5.20 merge window

This includes following Thunderbolt/USB4 changes for the v5.20 merge
window:

  * Enable CL1 low power link state
  * Add support for Intel Raptor Lake Thunderbolt/USB4 controller
  * A couple of typos fixed.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
George D Sworo (1):
      thunderbolt: Add support for Intel Raptor Lake

Gil Fine (6):
      thunderbolt: Silently ignore CLx enabling in case CLx is not supported
      thunderbolt: CLx disable before system suspend only if previously enabled
      thunderbolt: Fix typos in CLx enabling
      thunderbolt: Change downstream router's TMU rate in both TMU uni/bidir mode
      thunderbolt: Add CL1 support for USB4 and Titan Ridge routers
      thunderbolt: Change TMU mode to HiFi uni-directional once DisplayPort tunneled

Xiang Wangx (1):
      thunderbolt: Fix typo in comment

Yang Li (1):
      thunderbolt: Fix some kernel-doc comments

 drivers/thunderbolt/ctl.c     |   6 +-
 drivers/thunderbolt/ctl.h     |   2 +-
 drivers/thunderbolt/icm.c     |   2 +
 drivers/thunderbolt/nhi.c     |   4 +
 drivers/thunderbolt/nhi.h     |   2 +
 drivers/thunderbolt/switch.c  |  91 +++++++++--------
 drivers/thunderbolt/tb.c      |  68 ++++++++++---
 drivers/thunderbolt/tb.h      |  48 ++++-----
 drivers/thunderbolt/tb_regs.h |   6 ++
 drivers/thunderbolt/tmu.c     | 221 +++++++++++++++++++++++++++++++++++-------
 10 files changed, 335 insertions(+), 115 deletions(-)
