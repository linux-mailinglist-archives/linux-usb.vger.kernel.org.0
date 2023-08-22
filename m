Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF10783D40
	for <lists+linux-usb@lfdr.de>; Tue, 22 Aug 2023 11:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234461AbjHVJpD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Aug 2023 05:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234458AbjHVJpC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Aug 2023 05:45:02 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05691A1
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 02:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692697501; x=1724233501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UMAvKzLwMNpPTCL9KkA1icMDxpwGzIqYVWE5BbG90rE=;
  b=FQwNVqMvaec0UUaLMZEsAmd9hZt9veuSKqihb0NbiZeyGKgQBCzIOSTe
   dxS5ZZb7ktU2k4juinQo8SD6r1Ujx9ardio6w9uDSlhXXe9D2GW1fN/ik
   S6WACI4StcYyia866ZEbG4T088kT8CWN7ynHyv0QwCgLeaacuMTeIRdpI
   NscT42jYAuCcEc+t0QFDkHL3V7DGzpglShX6PwaaV7qwDbCX4JN+T33tb
   G956v7obGPLg5Tq0cLKB+Jf9zfcdA4/UDjh8zImkhGSREPo4JDj/WZC+Q
   loMwEbmfRZdKA9UgIORfdpjF8f2vKTpSwBoa3ZKBZ5zVDGPhlQCGvSSFA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="460200305"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="460200305"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 02:45:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="826268143"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="826268143"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Aug 2023 02:44:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 93EDF2FF; Tue, 22 Aug 2023 12:44:57 +0300 (EEST)
Date:   Tue, 22 Aug 2023 12:44:57 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] Thunderbolt/USB4 changes for v6.6 merge window
Message-ID: <20230822094457.GL3465@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4:

  Linux 6.5-rc4 (2023-07-30 13:23:47 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.6-rc1

for you to fetch changes up to a3f6445842e581233fbd19baad661dbba6d1fd58:

  Documentation/ABI: thunderbolt: Replace 01.org in contact (2023-08-08 08:13:22 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v6.6 merge window

This includes following Thunderbolt/USB4 changes for the v6.6 merge
window:

  - Replace broken mailing list address in the ABI document
  - Small improvements.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Mika Westerberg (3):
      thunderbolt: Log a warning if device links are not found
      thunderbolt: Check Intel vendor ID in tb_switch_get_generation()
      Documentation/ABI: thunderbolt: Replace 01.org in contact

Tom Rix (1):
      thunderbolt: Set variable tmu_params storage class specifier to static

 Documentation/ABI/testing/sysfs-bus-thunderbolt | 38 ++++++-------
 drivers/thunderbolt/acpi.c                      | 18 ++++--
 drivers/thunderbolt/switch.c                    | 75 +++++++++++++------------
 drivers/thunderbolt/tb.c                        | 24 +++++---
 drivers/thunderbolt/tb.h                        |  4 +-
 drivers/thunderbolt/tmu.c                       |  2 +-
 6 files changed, 90 insertions(+), 71 deletions(-)
