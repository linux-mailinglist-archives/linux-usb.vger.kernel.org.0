Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 142F126A267
	for <lists+linux-usb@lfdr.de>; Tue, 15 Sep 2020 11:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgIOJkS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 05:40:18 -0400
Received: from mga18.intel.com ([134.134.136.126]:40472 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726235AbgIOJkO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Sep 2020 05:40:14 -0400
IronPort-SDR: yhsQ5KhKEDMd/sLv6i2KgVPyunWbBu8xwDr55yzDbFXqOLK3u7VDvW6rmtyp/YsrlbNd6+XWzi
 brMfBSpPepzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="146970443"
X-IronPort-AV: E=Sophos;i="5.76,429,1592895600"; 
   d="scan'208";a="146970443"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2020 02:40:12 -0700
IronPort-SDR: 3adB/h8BivBu1wpnnRfFLUoiI8xylh6MfA6qVhkhQiKYUdqEBHzGVjjERUU09NsJEK1XODnuwE
 pf1dv2fSZEbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,429,1592895600"; 
   d="scan'208";a="409141498"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 15 Sep 2020 02:40:08 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 15 Sep 2020 12:40:07 +0300
Date:   Tue, 15 Sep 2020 12:40:07 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 fix for v5.9-rc6
Message-ID: <20200915094007.GV2495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 813050e0a9b871ac575abfd3d321f74916df609d:

  thunderbolt: Use maximum USB3 link rate when reclaiming if link is not up (2020-08-25 11:29:01 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.9-rc6

for you to fetch changes up to f022ff7bf377ca94367be05de61277934d42ea74:

  thunderbolt: Retry DROM read once if parsing fails (2020-09-09 14:00:56 +0300)

----------------------------------------------------------------
thunderbolt: Fix for v5.9-rc6

One more fix that makes ASUS PA27AC Thunderbolt 3 monitor work more
reliably.

This has been in linux-next with no reported issues.

----------------------------------------------------------------
Mika Westerberg (1):
      thunderbolt: Retry DROM read once if parsing fails

 drivers/thunderbolt/eeprom.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)
