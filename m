Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E49A3AB6CA
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jun 2021 17:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232975AbhFQPED (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Jun 2021 11:04:03 -0400
Received: from mga03.intel.com ([134.134.136.65]:36075 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233040AbhFQPD6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Jun 2021 11:03:58 -0400
IronPort-SDR: CTedH32pcK4qdzdHeMDG3TQjlCfcQ2Cm236LyQDdv8BN3hKX522fZmcqelCNvj+IZFACHkt8mD
 6vxfUGrRoDww==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="206422598"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="206422598"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 08:01:46 -0700
IronPort-SDR: MkRAO5dYLQSMfnR58YD5BGXRpwm5VEH0Az8jelrrQzeeRkGxNCz4yA+xpRNqQ5MyCm09ogMghI
 Dz47tm2Gq8oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="479490823"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2021 08:01:41 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/4] xhci features for usb-next
Date:   Thu, 17 Jun 2021 18:03:50 +0300
Message-Id: <20210617150354.1512157-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few small patches for usb-next.

There's one double free fix here as well that I normally would send to
usb-linus, but we're late in the cycle and this issue should be rare.
It has been there since 5.6 and requires system to be out of memory, so
I thought it can be added this way.

Thanks
-Mathias

Mathias Nyman (3):
  xhci: Remove unused defines for ERST_SIZE and ERST_ENTRIES
  xhci: Add adaptive interrupt rate for isoch TRBs with XHCI_AVOID_BEI
    quirk
  xhci: handle failed buffer copy to URB sg list and fix a W=1 copiler
    warning

Zhangjiantao (Kirin, nanjing) (1):
  xhci: solve a double free problem while doing s4

 drivers/usb/host/xhci-mem.c  |  3 +++
 drivers/usb/host/xhci-ring.c |  7 ++++++-
 drivers/usb/host/xhci.c      |  9 +++++++--
 drivers/usb/host/xhci.h      | 11 +++++++----
 4 files changed, 23 insertions(+), 7 deletions(-)

-- 
2.25.1

