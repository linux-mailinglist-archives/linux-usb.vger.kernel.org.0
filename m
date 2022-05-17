Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 865C1529F4E
	for <lists+linux-usb@lfdr.de>; Tue, 17 May 2022 12:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237619AbiEQKUU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 May 2022 06:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244987AbiEQKTs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 May 2022 06:19:48 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF244C424
        for <linux-usb@vger.kernel.org>; Tue, 17 May 2022 03:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652782696; x=1684318696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vf3GXc8SNsp74pWimX6fnwJC5utep4zLZvMuGoskijM=;
  b=PUpPhueJyHrtUXlO5ur4ElPqdLB9siUpu7NzBa+GisGmcwOxjALacXvE
   XS2ZYo37b5vUpe5Oh6clI7LFv+59hL6rN0zs1q0PMHflgoLhcF+1UgrNN
   r6K8kFi3+vXj6smbc9l9q2Oxxz/WJo7PgYbKVYDQjek+2OXSx3WrS7Atl
   pPiKw3YZ13OmqDAcYALdVlv4bHioUT1Wbk/K8prLZm2ZLhzyI8VltYCV8
   IGIExlRBc0Hn5s281++UJPzR9bsfHiF/PJ5qezlRrcka+U0KqqPQxK+2m
   7Qk9Ux3n/9HDLMVsSODod87rJvwKNGE+/IWvcfDchn5392/JFmuc/MVsA
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="253186292"
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; 
   d="scan'208";a="253186292"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 03:18:16 -0700
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; 
   d="scan'208";a="568813377"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 03:18:13 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 17 May 2022 13:18:10 +0300
Date:   Tue, 17 May 2022 13:18:10 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 changes for v5.19 merge window
Message-ID: <YoN2YpxxWTNC6C1D@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.19-rc1

for you to fetch changes up to c7c99a09ef0e2615d13e13b19c74428ca43b7dcf:

  thunderbolt: Add KUnit test for devices with no DisplayPort adapters (2022-05-12 09:22:36 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v5.19 merge window

This includes following Thunderbolt/USB4 changes for the v5.19 merge
window:

  * Improvements for Thunderbolt 1 DisplayPort tunneling
  * Link USB4 ports to their USB Type-C connectors
  * Lane bonding support for host-to-host (XDomain) connections
  * Buffer allocation improvement for devices with no DisplayPort
    adapters
  * Few cleanups and minor fixes.

All these have been in linux-next with no reported issues except that
there is a minor merge conflict with the kunit-next tree because one of
the commits touches the driver KUnit tests.

----------------------------------------------------------------
Gil Fine (2):
      thunderbolt: Fix buffer allocation of devices with no DisplayPort adapters
      thunderbolt: Add KUnit test for devices with no DisplayPort adapters

Heikki Krogerus (1):
      thunderbolt: Link USB4 ports to their USB Type-C connectors

Jakob Koschel (1):
      thunderbolt: Replace usage of found with dedicated list iterator variable

Mika Westerberg (9):
      thunderbolt: Fix typo in comment
      thunderbolt: Use decimal number with port numbers
      thunderbolt: Dump path config space entries during discovery
      thunderbolt: Use different lane for second DisplayPort tunnel
      thunderbolt: Add debug logging when lane is enabled/disabled
      thunderbolt: Move tb_port_state() prototype to correct place
      thunderbolt: Split setting link width and lane bonding into own functions
      thunderbolt: Ignore port locked error in tb_port_wait_for_link_width()
      thunderbolt: Add support for XDomain lane bonding

Won Chung (1):
      misc/mei: Add NULL check to component match callback functions

 Documentation/ABI/testing/sysfs-bus-thunderbolt |  10 +
 drivers/misc/mei/hdcp/mei_hdcp.c                |   2 +-
 drivers/misc/mei/pxp/mei_pxp.c                  |   2 +-
 drivers/thunderbolt/ctl.c                       |  15 +-
 drivers/thunderbolt/nhi.c                       |   2 +-
 drivers/thunderbolt/path.c                      |   6 +
 drivers/thunderbolt/switch.c                    | 109 ++++-
 drivers/thunderbolt/tb.c                        |  25 +-
 drivers/thunderbolt/tb.h                        |   6 +-
 drivers/thunderbolt/tb_msgs.h                   |  39 ++
 drivers/thunderbolt/tb_regs.h                   |   5 +
 drivers/thunderbolt/test.c                      | 108 ++++-
 drivers/thunderbolt/tunnel.c                    |  18 +-
 drivers/thunderbolt/tunnel.h                    |   4 +-
 drivers/thunderbolt/usb4_port.c                 |  38 ++
 drivers/thunderbolt/xdomain.c                   | 609 +++++++++++++++++++++---
 include/linux/thunderbolt.h                     |  19 +-
 17 files changed, 883 insertions(+), 134 deletions(-)
