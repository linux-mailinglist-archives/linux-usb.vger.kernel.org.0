Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4DA5187B63
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2020 09:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbgCQIjf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Mar 2020 04:39:35 -0400
Received: from mga12.intel.com ([192.55.52.136]:63611 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbgCQIje (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Mar 2020 04:39:34 -0400
IronPort-SDR: J2qwsiJR0mCYfIiR25JjHhth2Lv667+YAH+w3RPCQ5oCtiXLCW3AzKzZB5/k4TI9R130MaSR0P
 W+N3msX6hcNw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2020 01:39:34 -0700
IronPort-SDR: Hv0Uz0Xgye5i0bAuhUZ2TSQYE3qGO+n+aktRlV5j3+umrvx8bZ/wedD1JmiQU3Jcux9n1OIwNd
 ISHQaWhbHpOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,563,1574150400"; 
   d="scan'208";a="355296928"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 17 Mar 2020 01:39:31 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 17 Mar 2020 10:39:30 +0200
Date:   Tue, 17 Mar 2020 10:39:30 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 changes for v5.7 merge window
Message-ID: <20200317083930.GB2601@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.7

for you to fetch changes up to 3010518964dc96c41848a05a5b0ec11ccf8d5ebe:

  thunderbolt: Use scnprintf() for avoiding potential buffer overflow (2020-03-12 11:27:41 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v5.7 merge window

- A couple of commits that make the driver to use flexible-array member
  instead of zero-length array extension. This allows compiler to issue a
  warning if the flexible array is not the last member of a structure.

- Use scnprintf() instead of snprintf() to avoid potential buffer
  overflow.

----------------------------------------------------------------
Gustavo A. R. Silva (2):
      thunderbolt: eeprom: Replace zero-length array with flexible-array member
      thunderbolt: icm: Replace zero-length array with flexible-array member

Takashi Iwai (1):
      thunderbolt: Use scnprintf() for avoiding potential buffer overflow

 drivers/thunderbolt/domain.c | 4 ++--
 drivers/thunderbolt/eeprom.c | 2 +-
 drivers/thunderbolt/icm.c    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
