Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D96FD4781EF
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 02:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbhLQBKa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Dec 2021 20:10:30 -0500
Received: from mga09.intel.com ([134.134.136.24]:64450 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231566AbhLQBKa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Dec 2021 20:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639703430; x=1671239430;
  h=from:to:cc:subject:date:message-id;
  bh=IEWu2E1HHUuvRy8LvRBbMPmAEBcoEaaD4DrxzlE57hE=;
  b=fjg+rjIA0Tbiu0CBMpM5QT+2Uw0woFzKy6LBsjTY/XaiikFvbGgaFSAe
   wh2lJh9V0uMbhcbS/IyzBw4WY9JJBIW7KS4eVrptsszzwuPI4rft+Futu
   dMNwHL1pnB/P6KzckN6gJdUalVO+kPGRgB7kRYQi6M0qpLVFa+B3I0N7T
   dcyP6vDdM5T4q/gkaFlAMb7yzw6GXjdA06bx51R/w2fCSA/A0BcXslp1x
   NpKO6xGcjvZ0gofEErvphyyGL9+kIs4t6VZAW0LWGKfsq5lLHyc77wDFC
   qdkAcUolCagDprcK1JrmgNDpCGtd6qypTkFDsq3gr1oVqV1K4rzyqoy+U
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239460801"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="239460801"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 17:10:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="605733660"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Dec 2021 17:10:11 -0800
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v2 0/7] thunderbolt: CLx support for USB4 and Titan Ridge
Date:   Fri, 17 Dec 2021 03:16:37 +0200
Message-Id: <20211217011644.21634-1-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

v1 can be found here:

  https://lore.kernel.org/linux-usb/20211125143821.16558-1-gil.fine@intel.com/

Changes from v1:

* Fixed comment from Yehezkel
* Fixed comments from Mika
* Fixed commit messages
* Fixed time-posting procedure to follow the USB4 Connection Manager Guide 1.0
  (this resolves the time posting issue after resume from suspend-to-disk)
* Fixed TMU config in bidirectional mode - disable unidirectional
* Fixed TMU config in bidirectional mode - set HiFi rate for downstream router

Gil Fine (7):
  thunderbolt: Add TMU unidirectional mode
  thunderbolt: Add CL0s support for USB4
  thunderbolt: Move usb4_switch_wait_for_bit() to switch.c
  thunderbolt: Enable TMU for Titan Ridge device
  thunderbolt: Rename Intel VSC capability
  thunderbolt: Enable CL0s for Titan Ridge device
  thunderbolt: Add kernel param for CLx disabling

 drivers/thunderbolt/lc.c      |  27 ++
 drivers/thunderbolt/switch.c  | 526 ++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/tb.c      |  23 +-
 drivers/thunderbolt/tb.h      |  62 +++-
 drivers/thunderbolt/tb_regs.h |  51 +++-
 drivers/thunderbolt/tmu.c     | 366 +++++++++++++++++++----
 drivers/thunderbolt/usb4.c    |  52 ++--
 7 files changed, 1021 insertions(+), 86 deletions(-)

-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

