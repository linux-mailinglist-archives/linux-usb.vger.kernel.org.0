Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49365357E91
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 11:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbhDHJAj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 05:00:39 -0400
Received: from mga07.intel.com ([134.134.136.100]:47280 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229588AbhDHJAj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Apr 2021 05:00:39 -0400
IronPort-SDR: IrDni2rCxj+bpuC8uPN4nkuTROvM9kt5Dus8Pp8G0FeoIR3whc4YUpP+wWQaBvyhvkVuR7CKsp
 jlAXubCVwpKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="257478814"
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; 
   d="scan'208";a="257478814"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 02:00:27 -0700
IronPort-SDR: KktUn6dGR3bfO69GcDvNGXO74nBokLPNdetsg3dl9oONjkWPVJn7JIwslSjJp9bATGSSi0SMLf
 x2PuRa0A0QtQ==
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; 
   d="scan'208";a="441672026"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 02:00:24 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 08 Apr 2021 12:00:21 +0300
Date:   Thu, 8 Apr 2021 12:00:21 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 fixes for v5.12-rc7
Message-ID: <20210408090021.GX2542@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit a5e13c6df0e41702d2b2c77c8ad41677ebb065b3:

  Linux 5.12-rc5 (2021-03-28 15:48:16 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.12-rc7

for you to fetch changes up to 08fe7ae1857080f5075df5ac7fef2ecd4e289117:

  thunderbolt: Fix off by one in tb_port_find_retimer() (2021-03-30 13:38:10 +0300)

----------------------------------------------------------------
thunderbolt: Fixes for v5.12-rc7

This includes two fixes:

  - Fix memory leak in tb_retimer_add()
  - Off by one in tb_port_find_retimer()

Both have been in linux-next without reported issues.

----------------------------------------------------------------
Dan Carpenter (2):
      thunderbolt: Fix a leak in tb_retimer_add()
      thunderbolt: Fix off by one in tb_port_find_retimer()

 drivers/thunderbolt/retimer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
