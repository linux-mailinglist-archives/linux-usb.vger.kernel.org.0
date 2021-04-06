Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B4B354D2F
	for <lists+linux-usb@lfdr.de>; Tue,  6 Apr 2021 09:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244108AbhDFHA0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Apr 2021 03:00:26 -0400
Received: from mga04.intel.com ([192.55.52.120]:9889 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233485AbhDFHAZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Apr 2021 03:00:25 -0400
IronPort-SDR: GDY4gPVyjZB8i5f0BJLRrONoV16lbwLiDZS/C/WcRKQC1lt1G9lGoG9TZS75vDre6OeNd552Jm
 vZixnrHtNmLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="190835019"
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; 
   d="scan'208";a="190835019"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2021 00:00:17 -0700
IronPort-SDR: BotyRmi2d9SaushdnyOCQZp4Hc1Or2pLp97ofq4hnD82hQO+xa/6MmJH7IceG5inGZKJU5F+Io
 jXpTCpFtKV9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; 
   d="scan'208";a="448443156"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 06 Apr 2021 00:00:16 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/4] xhci features for usb-next
Date:   Tue,  6 Apr 2021 10:02:04 +0300
Message-Id: <20210406070208.3406266-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

I saw you already picked the Mediatek xhci patches.

Here are a few additional patches I had pending for usb-next
but didn't get around to submit before easter.

Mostly fixing potential issues found by fuzzer and other tools.

Thanks
-Mathias

Mathias Nyman (4):
  xhci: check port array allocation was successful before dereferencing
    it
  xhci: check control context is valid before dereferencing it.
  xhci: fix potential array out of bounds with several interrupters
  xhci: prevent double-fetch of transfer and transfer event TRBs

 drivers/usb/host/xhci-mem.c  |  3 +++
 drivers/usb/host/xhci-ring.c | 42 ++++++++++++++++--------------------
 drivers/usb/host/xhci.c      | 14 +++++++++++-
 3 files changed, 35 insertions(+), 24 deletions(-)

-- 
2.25.1

