Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67A2424D12D
	for <lists+linux-usb@lfdr.de>; Fri, 21 Aug 2020 11:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgHUJMe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Aug 2020 05:12:34 -0400
Received: from mga01.intel.com ([192.55.52.88]:60819 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbgHUJMe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 Aug 2020 05:12:34 -0400
IronPort-SDR: NqLCZpxL3AOlZuVv0eeZK1r3GuZVFu9NYYVaHuQOJiKeBHTNcGwtskM9EcG6XRpI4Ya/VfcVts
 udRLU0Fp4PgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9719"; a="173544063"
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; 
   d="scan'208";a="173544063"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2020 02:12:33 -0700
IronPort-SDR: Hb7YfONC9SPMqBpibasRJqKhqmxp6ydNOXiayqCCO2FbsBgbUKptaDVPW+5dvmU0cJ5Jzma8ZA
 DMxkjCtmr/rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; 
   d="scan'208";a="321194810"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga004.fm.intel.com with ESMTP; 21 Aug 2020 02:12:33 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/3] xhci fixes for usb-linus
Date:   Fri, 21 Aug 2020 12:15:46 +0300
Message-Id: <20200821091549.20556-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few xhci fixes for usb-linus.
This series makes sure we don't ignore devices attached during suspend that
are stuck in a resume "cold attach status" state, and makes sure xhci driver
doesn't prevent queuing urbs to a endpoint only because driver previously
refused to manually clear the data toggle of a non-empty endpoint.

-Mathias

Ding Hui (1):
  xhci: Always restore EP_SOFT_CLEAR_TOGGLE even if ep reset failed

Kai-Heng Feng (1):
  xhci: Do warm-reset when both CAS and XDEV_RESUME are set

Li Jun (1):
  usb: host: xhci: fix ep context print mismatch in debugfs

 drivers/usb/host/xhci-debugfs.c |  8 ++++----
 drivers/usb/host/xhci-hub.c     | 19 ++++++++++---------
 drivers/usb/host/xhci.c         |  3 ++-
 3 files changed, 16 insertions(+), 14 deletions(-)

-- 
2.17.1

