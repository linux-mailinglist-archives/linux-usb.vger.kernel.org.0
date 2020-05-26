Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B31DE1E1E1B
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2020 11:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731795AbgEZJN1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 May 2020 05:13:27 -0400
Received: from mga14.intel.com ([192.55.52.115]:33932 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731635AbgEZJN1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 May 2020 05:13:27 -0400
IronPort-SDR: /QlhAE+sSEnOtCqi7Sn1EKeOgbpSL1Jy46yHTAbmKEf6JXzPQ2i1sS/2D0kLkilUoIZVAMKE9+
 Ww5g9EfsWA4w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2020 02:13:27 -0700
IronPort-SDR: 8f5xbmvWlPF5ZzD0delccDTFMqXOEE48lTosgpKWD5S3voTperTyehxgc5oN9r2cdlWw3e8Kdo
 +cNHGRpy4nDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,436,1583222400"; 
   d="scan'208";a="375642487"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 26 May 2020 02:13:24 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 26 May 2020 12:13:23 +0300
Date:   Tue, 26 May 2020 12:13:23 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 changes for v5.8 merge window
Message-ID: <20200526091323.GH247495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.8

for you to fetch changes up to 4caf2511ec498277333d229f8a7ad1fa9331df65:

  thunderbolt: Add trivial .shutdown (2020-05-25 11:48:03 +0300)

----------------------------------------------------------------
thunderbolt: Changes for v5.8 merge window

This adds support for Intel Tiger Lake Thunderbolt controller using
firmware based connection manager. In addition the driver can now be
built on non-x86 architectures as well. Then there are a couple of
commits that make the driver work across kexec, replace a zero length
array with flexible one, and revert one change that is not needed
anymore because of NVMem subsystem improvements.

----------------------------------------------------------------
David Manouchehri (1):
      thunderbolt: Update Kconfig to allow building on other architectures.

Gustavo A. R. Silva (1):
      thunderbolt: Replace zero-length array with flexible-array

Maxim Levitsky (1):
      thunderbolt: Add trivial .shutdown

Mika Westerberg (1):
      thunderbolt: Add support for Intel Tiger Lake

Nicholas Johnson (1):
      Revert "thunderbolt: Prevent crash if non-active NVMem file is read"

 drivers/thunderbolt/Kconfig  |  1 -
 drivers/thunderbolt/icm.c    | 22 ++++++++++++++++++++++
 drivers/thunderbolt/nhi.c    |  5 +++++
 drivers/thunderbolt/nhi.h    |  2 ++
 drivers/thunderbolt/switch.c |  7 -------
 include/linux/thunderbolt.h  |  2 +-
 6 files changed, 30 insertions(+), 9 deletions(-)
