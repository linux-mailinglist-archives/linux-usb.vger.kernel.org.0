Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B90B73F2C18
	for <lists+linux-usb@lfdr.de>; Fri, 20 Aug 2021 14:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237886AbhHTMdP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Aug 2021 08:33:15 -0400
Received: from mga03.intel.com ([134.134.136.65]:32166 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233303AbhHTMdO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Aug 2021 08:33:14 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="216799508"
X-IronPort-AV: E=Sophos;i="5.84,337,1620716400"; 
   d="scan'208";a="216799508"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2021 05:32:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,337,1620716400"; 
   d="scan'208";a="680077946"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga006.fm.intel.com with ESMTP; 20 Aug 2021 05:32:35 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/6] xhci features and fixes for usb-next
Date:   Fri, 20 Aug 2021 15:34:57 +0300
Message-Id: <20210820123503.2605901-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

Some xhci features and fixes for usb-next.
Fixes are late for 5.14 so I'll add them here for 5.15-rc1 instead.
They are marked for stable.

Thanks
-Mathias

Mathias Nyman (6):
  xhci: fix unsafe memory usage in xhci tracing
  xhci: fix even more unsafe memory usage in xhci tracing
  xhci: Fix failure to give back some cached cancelled URBs.
  Revert "USB: xhci: fix U1/U2 handling for hardware with
    XHCI_INTEL_HOST quirk set"
  xhci: Add additional dynamic debug to follow URBs in cancel and error
    cases.
  xhci: Add bus number to some debug messages

 drivers/usb/host/xhci-debugfs.c | 14 ++++--
 drivers/usb/host/xhci-hub.c     |  6 ++-
 drivers/usb/host/xhci-ring.c    | 76 +++++++++++++++++++++++----------
 drivers/usb/host/xhci-trace.h   | 26 ++++++-----
 drivers/usb/host/xhci.c         | 30 +++++++------
 drivers/usb/host/xhci.h         | 73 ++++++++++++++++---------------
 6 files changed, 134 insertions(+), 91 deletions(-)

-- 
2.25.1

