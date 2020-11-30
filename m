Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB312C8352
	for <lists+linux-usb@lfdr.de>; Mon, 30 Nov 2020 12:35:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729168AbgK3LeY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 06:34:24 -0500
Received: from mga02.intel.com ([134.134.136.20]:48127 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728345AbgK3LeY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Nov 2020 06:34:24 -0500
IronPort-SDR: 6bwMl23HWPklERCjpNJhocn8nmlG5OW6DQH814+w5NGEBOUDinc3NRVRCP/DhMDIJ1fXOpD4NS
 HsrH3TNxoAFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="159671766"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; 
   d="scan'208";a="159671766"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 03:32:44 -0800
IronPort-SDR: WDj5bXBzENd2PdlqqxP9H80inRwHBSG6pBwd3vyhf2qPim9xOt82IzkQuhjDOG1gyUbwiz3kA9
 jeJiHF8W3OSg==
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; 
   d="scan'208";a="549061268"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 03:32:41 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 30 Nov 2020 13:32:38 +0200
Date:   Mon, 30 Nov 2020 13:32:38 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 fix for v5.10-rc7
Message-ID: <20201130113238.GT5246@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 09162bc32c880a791c6c0668ce0745cf7958f576:

  Linux 5.10-rc4 (2020-11-15 16:44:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.10-rc7

for you to fetch changes up to 600c0849cf86b75d86352f59745226273290986a:

  thunderbolt: Fix use-after-free in remove_unplugged_switch() (2020-11-19 17:44:10 +0300)

----------------------------------------------------------------
thunderbolt: Fix for v5.10-rc7

This includes a single fix for use-after-free bug after resume from
hibernation.

----------------------------------------------------------------
Mika Westerberg (1):
      thunderbolt: Fix use-after-free in remove_unplugged_switch()

 drivers/thunderbolt/icm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
