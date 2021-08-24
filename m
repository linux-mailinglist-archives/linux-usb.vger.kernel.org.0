Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBB023F5CCD
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 13:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236622AbhHXLGp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 07:06:45 -0400
Received: from mga06.intel.com ([134.134.136.31]:51987 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236471AbhHXLGl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Aug 2021 07:06:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10085"; a="278299414"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278299414"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 04:05:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="515370151"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 04:05:47 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 24 Aug 2021 14:05:44 +0300
Date:   Tue, 24 Aug 2021 14:05:44 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 changes for v5.15 merge window
Message-ID: <YSTSiJa0omQE/4lI@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit c500bee1c5b2f1d59b1081ac879d73268ab0ff17:

  Linux 5.14-rc4 (2021-08-01 17:04:17 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.15-rc1

for you to fetch changes up to 42716425ad7e1b6529ec61c260c11176841f4b5f:

  thunderbolt: Fix port linking by checking all adapters (2021-08-09 14:58:29 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v5.15 merge window

This includes following Thunderbolt/USB4 changes for the v5.15 merge
window:

  * Include authorized value in the KOBJ_CHANGE event of a device router
  * A couple of improvements to get the driver working also with the AMD
    USB4 host controller.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Rajat Jain (1):
      thunderbolt: Add authorized value to the KOBJ_CHANGE uevent

Sanjay R Mehta (4):
      thunderbolt: Add vendor specific NHI quirk for auto-clearing interrupt status
      thunderbolt: Handle ring interrupt by reading interrupt status register
      thunderbolt: Do not read control adapter config space
      thunderbolt: Fix port linking by checking all adapters

 drivers/thunderbolt/nhi.c    | 46 ++++++++++++++++++++++++++++++++++++--------
 drivers/thunderbolt/switch.c | 28 ++++++++++++++++++---------
 include/linux/thunderbolt.h  |  2 ++
 3 files changed, 59 insertions(+), 17 deletions(-)
