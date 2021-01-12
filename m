Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B012F340F
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jan 2021 16:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387812AbhALPUb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 10:20:31 -0500
Received: from mga04.intel.com ([192.55.52.120]:33645 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728953AbhALPUb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Jan 2021 10:20:31 -0500
IronPort-SDR: qvcRk9EDoqqQRkXUSrbBnc7d14cdXLNZ8AEmrnWx13jBQBnNelHVJbtmkQVus4/rGvXhIYRZJt
 A1abL/egXNwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="175472642"
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; 
   d="scan'208";a="175472642"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 07:18:43 -0800
IronPort-SDR: 9m5yJJ40gQJcuLy3IfAfWD1l2GJ5X+E11G4hYOKcxREskBsoNm8ShFwCzzOe+TDSt3Cg4pGMIE
 DXmjvQoi9x/g==
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; 
   d="scan'208";a="464557671"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 07:18:39 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 12 Jan 2021 17:18:36 +0200
Date:   Tue, 12 Jan 2021 17:18:36 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 fix for v5.11-rc4
Message-ID: <20210112151836.GX968855@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:

  Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.11-rc4

for you to fetch changes up to c14556fc0c7c115ffb4a287560e1ec9f7869aac3:

  thunderbolt: Drop duplicated 0x prefix from format string (2021-01-07 15:14:44 +0300)

----------------------------------------------------------------
thunderbolt: Fix for v5.11-rc4

This includes a single format string fix for the firmware connection
manager USB4 NVM authentication proxy implementation introduced in this
merge window.

----------------------------------------------------------------
Mika Westerberg (1):
      thunderbolt: Drop duplicated 0x prefix from format string

 drivers/thunderbolt/icm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

