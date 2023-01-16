Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C14E66BA59
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jan 2023 10:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbjAPJaA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Jan 2023 04:30:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbjAPJ3R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Jan 2023 04:29:17 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDFBF16ADE
        for <linux-usb@vger.kernel.org>; Mon, 16 Jan 2023 01:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673861356; x=1705397356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qsJJc9BF2WoGaIKpMhgXcwwzyKIXtD6MP0d1O8L+JGA=;
  b=MstSH+F0sfs1K1KIKj0rU1Z7F1gYnMMvmW70vl8lv/lQy1aV9Ksjs3Ia
   OyWQs+ZW2FCIGIdgEz9krUxCAfFv8+9c2bD8flP85FvBAtM2Ryi42kQ04
   ADbHPnatOMviiIQYpdRd6/LuVLAjvIGKRRCjLXzZMKtnwYGnTmlyyrh3o
   DK0dwSvr+agXMp1otmTRMxtBJ+fSb+O6RvzSv7m//4U7V3JIyr9ewOzCT
   /OzCKKaedc923uxxQFwsMM/lIQecvaGuwlf8OGckhVj8O3LjO7kAKhRMy
   e0HEXo68w5iWwtIpHGOFoUGN0R3ek+RerHRPX0oJyNn8HGDVSiZYfSEmA
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="351672159"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; 
   d="scan'208";a="351672159"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 01:29:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="747661097"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; 
   d="scan'208";a="747661097"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Jan 2023 01:29:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 95899130; Mon, 16 Jan 2023 11:29:45 +0200 (EET)
Date:   Mon, 16 Jan 2023 11:29:45 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 fixes for v6.2-rc5
Message-ID: <Y8UZCZV92voYDxv0@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
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

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.2-rc5

for you to fetch changes up to 84ee211c83212f4d35b56e0603acdcc41f860f1b:

  thunderbolt: Disable XDomain lane 1 only in software connection manager (2023-01-09 10:44:43 +0200)

----------------------------------------------------------------
thunderbolt: Fixes for v6.2-rc5

This includes fixes for:

  - on-board retimer scan return value
  - runtime PM during tb_retimer_scan()
  - USB3 link rate calculation
  - XDomain lane bonding.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Mika Westerberg (3):
      thunderbolt: Do not call PM runtime functions in tb_retimer_scan()
      thunderbolt: Use correct function to calculate maximum USB3 link rate
      thunderbolt: Disable XDomain lane 1 only in software connection manager

Utkarsh Patel (1):
      thunderbolt: Do not report errors if on-board retimers are found

 drivers/thunderbolt/retimer.c | 20 ++++----------------
 drivers/thunderbolt/tb.c      | 20 +++++++++++++++-----
 drivers/thunderbolt/tunnel.c  |  2 +-
 drivers/thunderbolt/xdomain.c | 17 ++++++++++++-----
 4 files changed, 32 insertions(+), 27 deletions(-)
