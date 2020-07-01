Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E52210999
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 12:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729976AbgGAKoc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 06:44:32 -0400
Received: from mga14.intel.com ([192.55.52.115]:15969 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730052AbgGAKoa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jul 2020 06:44:30 -0400
IronPort-SDR: P3519VP9q0xn+++hiFINgZjdbbMpD48U+Vft2m3KgdusV8PsSjMB4+/mXwdR65rLL/y6MlRNdH
 obTmTXzQII0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="145602324"
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; 
   d="scan'208";a="145602324"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 03:44:30 -0700
IronPort-SDR: XuDoKBzCCyjv6ZNUKvMbB2LW9/HlVnPDSKeZH1yZYRZ0tSrXNL+88dQaRqbO0fzZU7qDFX3/8v
 bqv7+kqjOT3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; 
   d="scan'208";a="386974454"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 01 Jul 2020 03:44:27 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 01 Jul 2020 13:44:27 +0300
Date:   Wed, 1 Jul 2020 13:44:27 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 fix for v5.8-rc4
Message-ID: <20200701104427.GP5180@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 48778464bb7d346b47157d21ffde2af6b2d39110:

  Linux 5.8-rc2 (2020-06-21 15:45:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-fix-for-v5.8-rc4

for you to fetch changes up to 8b94a4b92327d061327117e127d7d44a4a43e639:

  thunderbolt: Fix path indices used in USB3 tunnel discovery (2020-06-25 15:45:30 +0300)

----------------------------------------------------------------
thunderbolt: Fix for v5.8-rc4

This includes a single patch that corrects path indices used in USB3
tunnel discovery.

----------------------------------------------------------------
Mika Westerberg (1):
      thunderbolt: Fix path indices used in USB3 tunnel discovery

 drivers/thunderbolt/tunnel.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
