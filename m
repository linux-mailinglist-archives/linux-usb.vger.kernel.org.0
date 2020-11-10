Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF2F82AD0BC
	for <lists+linux-usb@lfdr.de>; Tue, 10 Nov 2020 08:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728403AbgKJH6a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Nov 2020 02:58:30 -0500
Received: from mga03.intel.com ([134.134.136.65]:24983 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726825AbgKJH6a (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Nov 2020 02:58:30 -0500
IronPort-SDR: vryIweX4lrCuguktv74Fkpbw8LYqhwgkLLKbUpPdxO+fXhAGyqPczcRFOoc3nB9smM7uPPkFZ8
 p4qrDpZx11sA==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="170044628"
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; 
   d="scan'208";a="170044628"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 23:58:28 -0800
IronPort-SDR: +W2pAKk4dh4YUlHAcnDzbOtQzTkuZcCOcRAwfQl9IwsRnk9VaKIeq8moknSaD8ikJEeFHnAgSY
 O01L5enN4CPg==
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; 
   d="scan'208";a="541231177"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 23:58:24 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 10 Nov 2020 09:58:21 +0200
Date:   Tue, 10 Nov 2020 09:58:21 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 fixes for v5.10-rc4
Message-ID: <20201110075821.GP2495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.10-rc4

for you to fetch changes up to f6439c531d52193f890807958aaec52905bc0f2e:

  thunderbolt: Add support for Intel Tiger Lake-H (2020-11-06 16:39:11 +0300)

----------------------------------------------------------------
thunderbolt: Fixes for v5.10-rc4

This includes two fixes for resource leaks that have been around for a
while. Then two fixes for code that was added during v5.10 merge window
and PCI IDs for Intel Tiger Lake-H.

All these have been in linux-next without reported issues.

----------------------------------------------------------------
Casey Bowman (1):
      thunderbolt: Add uaccess dependency to debugfs interface

Jing Xiangfeng (1):
      thunderbolt: Add the missed ida_simple_remove() in ring_request_msix()

Mika Westerberg (3):
      thunderbolt: Fix memory leak if ida_simple_get() fails in enumerate_services()
      thunderbolt: Only configure USB4 wake for lane 0 adapters
      thunderbolt: Add support for Intel Tiger Lake-H

 drivers/thunderbolt/debugfs.c |  1 +
 drivers/thunderbolt/icm.c     |  2 ++
 drivers/thunderbolt/nhi.c     | 23 +++++++++++++++++++----
 drivers/thunderbolt/nhi.h     |  2 ++
 drivers/thunderbolt/tb.h      |  2 ++
 drivers/thunderbolt/usb4.c    |  4 ++++
 drivers/thunderbolt/xdomain.c |  1 +
 7 files changed, 31 insertions(+), 4 deletions(-)
