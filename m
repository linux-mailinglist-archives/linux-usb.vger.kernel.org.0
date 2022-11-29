Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5131A63BEBC
	for <lists+linux-usb@lfdr.de>; Tue, 29 Nov 2022 12:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231432AbiK2LRi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Nov 2022 06:17:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbiK2LRh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Nov 2022 06:17:37 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6921CD5A
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 03:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669720654; x=1701256654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5RNYYfgh67sAEQwFVMxIQmi4OdkXcQUFdMlishDvrks=;
  b=E0U0HsYVn0GUoZT0APxVU0XKyWg7L3leCrooe5alA+aJwAiJfcD2Im7m
   F9By5shd0NW8a71ff70Ql6vwjhrcxfI2mYHRcsggXO9FCjzdc76dNzkQH
   bEYzrz9xJY+sIW/FVYEL9Ku+cwBj4AxBFq7kSbrczWKNOpaxkP46P8QU4
   G5vSdrP12LuyftDS4WkO41uulMyL3ZjNEGTF2gNS4ZxKD80YrNBgV8Y9z
   V9Aeg7IcqIKEURzsehLToiyu0+eOGq2QANo2Zj1UrU4+oSY49IwUZlJRc
   dmtp+/o5Ovt+Qbw2AiSOjc65IqrWVltDWDZaLdq9/FaD80t83hQFUXLDA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="315115298"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="315115298"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2022 03:17:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="972636327"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="972636327"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 29 Nov 2022 03:17:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 9387C184; Tue, 29 Nov 2022 13:17:58 +0200 (EET)
Date:   Tue, 29 Nov 2022 13:17:58 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 changes for v6.2 merge window
Message-ID: <Y4XqZpTx1iC/tShY@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.2-rc1

for you to fetch changes up to a5cfc9d65879c0d377f732531a2e80ee3a9eebbc:

  thunderbolt: Add wake on connect/disconnect on USB4 ports (2022-11-07 14:36:47 +0200)

----------------------------------------------------------------
thunderbolt: Changes for v6.2 merge window

This includes following Thunderbolt/USB4 changes for the v6.2 merge
window:

  - Add wake on connect/disconnect for USB4 ports
  - A couple of minor cleanups

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Andy Shevchenko (1):
      thunderbolt: Use str_enabled_disabled() helper

Colin Ian King (1):
      thunderbolt: Remove redundant assignment to variable len

Heikki Krogerus (1):
      thunderbolt: ACPI: Use the helper fwnode_find_reference()

Rajat Khandelwal (1):
      thunderbolt: Add wake on connect/disconnect on USB4 ports

 drivers/thunderbolt/acpi.c      | 12 ++++--------
 drivers/thunderbolt/switch.c    |  5 +++--
 drivers/thunderbolt/tb_regs.h   |  2 ++
 drivers/thunderbolt/usb4.c      | 33 +++++++++++++++++++++++++--------
 drivers/thunderbolt/usb4_port.c |  3 +++
 drivers/thunderbolt/xdomain.c   |  4 ++--
 6 files changed, 39 insertions(+), 20 deletions(-)
