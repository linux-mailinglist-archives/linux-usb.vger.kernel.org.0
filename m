Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9352A30A7ED
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 13:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbhBAMqx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 07:46:53 -0500
Received: from mga04.intel.com ([192.55.52.120]:37445 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229707AbhBAMqw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 07:46:52 -0500
IronPort-SDR: VO/TS7XRQ9UVnXHCW+jmlPsOdoaoCa7T8QXklisXgTbmDhoXcB9Qxrk3aiNQQ/H1NdMW/GlOEB
 5sqPMlkWHBfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="178114065"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="178114065"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 04:44:58 -0800
IronPort-SDR: nOPKHzbiJlao0JRXGmJOugkfBOflJyBHNgu4U7BW/iIMMZpwkmMR7dkGBi2bgGJNAclgdLG0PI
 48tpIXFR67sg==
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="390893137"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 04:44:55 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 01 Feb 2021 14:44:52 +0200
Date:   Mon, 1 Feb 2021 14:44:52 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 fix for v5.11-rc7
Message-ID: <20210201124452.GM2542@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 6ee1d745b7c9fd573fba142a2efdad76a9f1cb04:

  Linux 5.11-rc5 (2021-01-24 16:47:14 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.11-rc7

for you to fetch changes up to 4d395c5e74398f664405819330e5a298da37f655:

  thunderbolt: Fix possible NULL pointer dereference in tb_acpi_add_link() (2021-01-28 15:30:57 +0300)

----------------------------------------------------------------
thunderbolt: Fix for v5.11-rc7

A single fix for a possible NULL pointer dereference when adding device
links from ACPI description.

----------------------------------------------------------------
Mario Limonciello (1):
      thunderbolt: Fix possible NULL pointer dereference in tb_acpi_add_link()

 drivers/thunderbolt/acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
