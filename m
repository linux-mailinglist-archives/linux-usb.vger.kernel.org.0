Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4208F3371D0
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 12:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232732AbhCKLwj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 06:52:39 -0500
Received: from mga04.intel.com ([192.55.52.120]:42436 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232678AbhCKLwW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 06:52:22 -0500
IronPort-SDR: 0rNxn5IxyDWbYIb0YO8reoEN5Xxqwbn5e2dYKPESdxkHl2/ntIyj5aH/YnyOMJvyyPu1GCw5YE
 h3MRuB9qSbog==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="186275998"
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; 
   d="scan'208";a="186275998"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 03:52:22 -0800
IronPort-SDR: swHLZfWlNGRcY9ihEY7NK06DULq0djQGUc53cQnLucGSfyucfQXpXFRBqFe4wu3KspmcuIQVz2
 hzRvIb/ze91A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; 
   d="scan'208";a="409463966"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga007.jf.intel.com with ESMTP; 11 Mar 2021 03:52:20 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/4] xhci fixes for usb-linus
Date:   Thu, 11 Mar 2021 13:53:49 +0200
Message-Id: <20210311115353.2137560-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

Fix a couple power management related xHCI issues, and a couple
vendor specific workarounds.

-Mathias

Forest Crossman (1):
  usb: xhci: Fix ASMedia ASM1042A and ASM3242 DMA addressing

Mathias Nyman (2):
  xhci: Improve detection of device initiated wake signal.
  xhci: Fix repeated xhci wake after suspend due to uncleared internal
    wake state

Stanislaw Gruszka (1):
  usb: xhci: do not perform Soft Retry for some xHCI hosts

 drivers/usb/host/xhci-pci.c  | 13 +++++-
 drivers/usb/host/xhci-ring.c |  3 +-
 drivers/usb/host/xhci.c      | 78 ++++++++++++++++++++----------------
 drivers/usb/host/xhci.h      |  1 +
 4 files changed, 57 insertions(+), 38 deletions(-)

-- 
2.25.1

