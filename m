Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3DE33B1E2
	for <lists+linux-usb@lfdr.de>; Mon, 15 Mar 2021 12:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbhCOL5U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Mar 2021 07:57:20 -0400
Received: from mga03.intel.com ([134.134.136.65]:39331 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230215AbhCOL5K (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Mar 2021 07:57:10 -0400
IronPort-SDR: f8TAxUIH5mEH+JFLmrgnM26VN2+Or4VxoLTOs3jBxSD4C5eDmPcQ8jw+6+Xf13KZ94tVgaWFRS
 Udv5kMyff2yg==
X-IronPort-AV: E=McAfee;i="6000,8403,9923"; a="189121598"
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; 
   d="scan'208";a="189121598"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 04:57:08 -0700
IronPort-SDR: pWMtx9iQGQJQYSqoZ8WByeJwu9bMJ+A6tDH9De3rd0z+HfIzQBUL+x1DbmTu5RXi0JxgetNwEd
 0fT7qsXg/4Dg==
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; 
   d="scan'208";a="411815785"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 04:57:06 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 15 Mar 2021 13:57:03 +0200
Date:   Mon, 15 Mar 2021 13:57:03 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 fixes for v5.12-rc4
Message-ID: <20210315115703.GL2542@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.12-rc4

for you to fetch changes up to c94732bda079ee66b5c3904cbb628d0cb218ab39:

  thunderbolt: Increase runtime PM reference count on DP tunnel discovery (2021-03-08 14:22:42 +0300)

----------------------------------------------------------------
thunderbolt: Fixes for v5.12-rc4

This includes a fix to initialize HopID IDAs earlier to make sure
tb_switch_release() always works, and another fix that increases runtime
PM reference count on DisplayPort tunnel discovery.

----------------------------------------------------------------
Mika Westerberg (2):
      thunderbolt: Initialize HopID IDAs in tb_switch_alloc()
      thunderbolt: Increase runtime PM reference count on DP tunnel discovery

 drivers/thunderbolt/switch.c | 18 ++++++++----------
 drivers/thunderbolt/tb.c     |  4 ++++
 2 files changed, 12 insertions(+), 10 deletions(-)
