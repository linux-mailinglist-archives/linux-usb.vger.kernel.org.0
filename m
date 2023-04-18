Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12F616E5FC9
	for <lists+linux-usb@lfdr.de>; Tue, 18 Apr 2023 13:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjDRL0U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 07:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjDRL0T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 07:26:19 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10DC11A4
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 04:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681817178; x=1713353178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JPPAD0VSWJWkbNeWNnSf+XtCF61+Scc5aoXaxcvRWVE=;
  b=MN8ZxczQQg4t8qNwKui1G+uc+gF5hNotsweqPYtO7F/sFjV6U30a1XpP
   68mZWQDI23TAKqsT9nttOArT5t4AXfHo/y1tDz6anLE9jrIrfPJi8bgYh
   dmK3fdFwMHrVDDHPumVJtZLW0RJ065DIWtowKmQVdCg+ZlS77yEW+P1lX
   Egmafb2aPKahPPireTjSQDhTdvndQnz6wH26PYiVng9po0XyN8jchDNPy
   bzn+yAbLNJw6mbNmdzMGfrUCKm/NKQqAxZDjU9aSlvDCEgiW9WZXZD5E3
   YrgYt7wMdhfRl07rb1O+itFLlaNChf6f+seaDBBPoks8CDpDdjHO+TuuR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="408042095"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="408042095"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 04:26:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="815173376"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="815173376"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 18 Apr 2023 04:26:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 7E9CA1A8; Tue, 18 Apr 2023 14:26:11 +0300 (EEST)
Date:   Tue, 18 Apr 2023 14:26:11 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 changes for v6.4 merge window
Message-ID: <20230418112611.GF66750@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.4-rc1

for you to fetch changes up to 1f15af76784cc902a1fe85e864c7ddf3d74b4130:

  thunderbolt: Introduce usb4_port_sb_opcode_err_to_errno() helper (2023-04-03 08:37:18 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v6.4 merge window

This includes following Thunderbolt/USB4 changes for the v6.4 merge
window:

  - Refactoring of DROM read code paths
  - Convert to use SI units from units.h
  - A couple of cleanups

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Andy Shevchenko (3):
      thunderbolt: Get rid of redundant 'else'
      thunderbolt: Make use of SI units from units.h
      thunderbolt: Introduce usb4_port_sb_opcode_err_to_errno() helper

Mario Limonciello (2):
      thunderbolt: use `tb_eeprom_get_drom_offset` to discover DROM offset
      thunderbolt: Refactor DROM reading

 drivers/thunderbolt/acpi.c    |   2 +-
 drivers/thunderbolt/ctl.c     |   2 +-
 drivers/thunderbolt/eeprom.c  | 204 ++++++++++++++++++++++--------------------
 drivers/thunderbolt/nhi.c     |   3 +-
 drivers/thunderbolt/switch.c  |   4 +-
 drivers/thunderbolt/usb4.c    |  52 +++++------
 drivers/thunderbolt/xdomain.c |  24 +++--
 7 files changed, 149 insertions(+), 142 deletions(-)
