Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E567138E7A6
	for <lists+linux-usb@lfdr.de>; Mon, 24 May 2021 15:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232869AbhEXNbh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 May 2021 09:31:37 -0400
Received: from mga05.intel.com ([192.55.52.43]:31667 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233009AbhEXNbd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 May 2021 09:31:33 -0400
IronPort-SDR: EI1yhbau+CVku4vscMZuAhdtTAi4znCQEo2vZTPamtCCbUIPHx7S6h7PPQmAWlGQ7O9foeK129
 bjXis179Ixpw==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="287501521"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="287501521"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 06:29:37 -0700
IronPort-SDR: V14XzI/08TylZL9go/8CMKU++vgfMI9NSXNjQgVZQ4hTnkrYBJmUa0hnoIXetlW+aBL5PXvrfz
 Af/2q2h7Op/w==
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="470572708"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 06:29:35 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 24 May 2021 16:29:32 +0300
Date:   Mon, 24 May 2021 16:29:32 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 fixes for v5.13-rc4
Message-ID: <20210524132932.GF291593@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit d07f6ca923ea0927a1024dfccafc5b53b61cfecc:

  Linux 5.13-rc2 (2021-05-16 15:27:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.13-rc4

for you to fetch changes up to 22c7a18ed5f007faccb7527bc890463763214081:

  thunderbolt: usb4: Fix NVM read buffer bounds and offset issue (2021-05-20 11:52:58 +0300)

----------------------------------------------------------------
thunderbolt: Fixes for v5.13-rc4

This includes two fixes from Mathias to handle NVM read side properly in
certain situations.

Both have been in linux-next with no reported issues.

----------------------------------------------------------------
Mathias Nyman (2):
      thunderbolt: dma_port: Fix NVM read buffer bounds and offset issue
      thunderbolt: usb4: Fix NVM read buffer bounds and offset issue

 drivers/thunderbolt/dma_port.c | 11 ++++++-----
 drivers/thunderbolt/usb4.c     |  9 +++++----
 2 files changed, 11 insertions(+), 9 deletions(-)
