Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1B7768E90F
	for <lists+linux-usb@lfdr.de>; Wed,  8 Feb 2023 08:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbjBHHfy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Feb 2023 02:35:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbjBHHfx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Feb 2023 02:35:53 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D64DF3526B
        for <linux-usb@vger.kernel.org>; Tue,  7 Feb 2023 23:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675841738; x=1707377738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZUv7DcnPxFxFYny0vzatxuLsEo74bPIQviVQZb+2v8g=;
  b=TRaEp72zSFtIe8LUf5c8x7TTy5GT5iLWZqOSMRN9or17YfIloda4c+gV
   tRbEMYesvTTz2mioTGeKaDLft1qGSx0TwRLic+llNmQ6kWlDoeyRXY4xI
   S4IKuz83EDt8juFxJn6YMTeUO1o4YLIA5IWnLhgu3ckkJvUpCwvtWpRZ2
   xvV7iYBmX4JqTBIwoGj0gdbciCJi9zVyCYHumoXby3JCx4GhpEaBDehn0
   u0FcMmeRdYEb5hr/0oTVvxwMn7NmPgy/un1zMpDXpAVP4CfLf8s7b23sV
   7QuSUJyXO8+SCmkqIQTim+IBmNm40ES9SUm2Dj6q8XmHK9aZgB9+LseBI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="313376090"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="313376090"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 23:35:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="996037666"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="996037666"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 07 Feb 2023 23:35:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id EB13C1C5; Wed,  8 Feb 2023 09:36:14 +0200 (EET)
Date:   Wed, 8 Feb 2023 09:36:14 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 changes for v6.3 merge window
Message-ID: <Y+NQ7qTXIw5ichzB@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.3-rc1

for you to fetch changes up to 06cbcbfaa6510eed406e3b6d5d071386b9830689:

  thunderbolt: Add missing kernel-doc comment to tb_tunnel_maximum_bandwidth() (2023-01-27 08:25:59 +0200)

----------------------------------------------------------------
thunderbolt: Changes for v6.3 merge window

This includes following Thunderbolt/USB4 changes for the v6.3 merge
window:

  - Add support for DisplayPort bandwidth allocation mode
  - Debug logging improvements
  - Minor cleanups.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Andy Shevchenko (1):
      thunderbolt: Refactor tb_acpi_add_link()

Jiri Slaby (SUSE) (1):
      thunderbolt: Use correct type in tb_port_is_clx_enabled() prototype

Mika Westerberg (10):
      thunderbolt: Use decimal port number in control and tunnel logs too
      thunderbolt: Log DP adapter type
      thunderbolt: Improve debug logging in tb_available_bandwidth()
      thunderbolt: Take CL states into account when waiting for link to come up
      thunderbolt: Increase timeout of DP OUT adapter handshake
      thunderbolt: Add functions to support DisplayPort bandwidth allocation mode
      thunderbolt: Include the additional DP IN double word in debugfs dump
      thunderbolt: Add support for DisplayPort bandwidth allocation mode
      thunderbolt: Handle bandwidth allocation mode enablement notification
      thunderbolt: Add missing kernel-doc comment to tb_tunnel_maximum_bandwidth()

 drivers/thunderbolt/acpi.c    |  13 +-
 drivers/thunderbolt/ctl.c     |  52 +++-
 drivers/thunderbolt/ctl.h     |   2 +
 drivers/thunderbolt/debugfs.c |   5 +-
 drivers/thunderbolt/switch.c  |  42 ++--
 drivers/thunderbolt/tb.c      | 508 +++++++++++++++++++++++++++++++++++--
 drivers/thunderbolt/tb.h      |  39 ++-
 drivers/thunderbolt/tb_msgs.h |  11 +-
 drivers/thunderbolt/tb_regs.h |  36 +++
 drivers/thunderbolt/tunnel.c  | 506 ++++++++++++++++++++++++++++++++++---
 drivers/thunderbolt/tunnel.h  |  18 ++
 drivers/thunderbolt/usb4.c    | 572 ++++++++++++++++++++++++++++++++++++++++++
 12 files changed, 1710 insertions(+), 94 deletions(-)
