Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B58A43946F
	for <lists+linux-usb@lfdr.de>; Mon, 25 Oct 2021 13:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232680AbhJYLHD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Oct 2021 07:07:03 -0400
Received: from mga18.intel.com ([134.134.136.126]:17048 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232525AbhJYLHD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 Oct 2021 07:07:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10147"; a="216533558"
X-IronPort-AV: E=Sophos;i="5.87,180,1631602800"; 
   d="scan'208";a="216533558"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2021 04:04:41 -0700
X-IronPort-AV: E=Sophos;i="5.87,180,1631602800"; 
   d="scan'208";a="496751709"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2021 04:04:38 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 25 Oct 2021 14:04:36 +0300
Date:   Mon, 25 Oct 2021 14:04:35 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 changes for v5.16 merge window
Message-ID: <YXaPQ1p8c6PfTiOh@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 5816b3e6577eaa676ceb00a848f0fd65fe2adc29:

  Linux 5.15-rc3 (2021-09-26 14:08:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.16-rc1

for you to fetch changes up to 0a0624a26f9ceb8aae16882d87dc3b12f17f4a49:

  thunderbolt: Fix -Wrestrict warning (2021-09-28 12:28:54 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v5.16 merge window

This includes following Thunderbolt/USB4 changes for the v5.16 merge
window:

  * Re-enable retry logic for control packets in domain needed by some
    controllers when software connection manager is being used
  * Fix -Wrestrict build warning emitted by gcc-11.

Both have been in linux-next with no reported issues.

----------------------------------------------------------------
Arnd Bergmann (1):
      thunderbolt: Fix -Wrestrict warning

Sanjay R Mehta (1):
      thunderbolt: Enable retry logic for intra-domain control packets

 drivers/thunderbolt/ctl.c     | 2 +-
 drivers/thunderbolt/xdomain.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
