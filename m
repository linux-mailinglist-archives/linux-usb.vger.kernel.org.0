Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7E229D291
	for <lists+linux-usb@lfdr.de>; Wed, 28 Oct 2020 22:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgJ1VdT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 17:33:19 -0400
Received: from mga03.intel.com ([134.134.136.65]:44639 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725880AbgJ1VdP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Oct 2020 17:33:15 -0400
IronPort-SDR: scVFxQUexbnplgvZ+A7UQSt46RBN2YoVGFiJO4TP+wQtbLg/CmjVQugwbgeC6/rtXGvQi64HnK
 xWZvCfU5+zVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="168432565"
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; 
   d="scan'208";a="168432565"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2020 13:30:03 -0700
IronPort-SDR: v6Y6wgLvxwFFFKMprw1DEtRUs4h1rjcF3j5PPQJUQ5dcHE+O1/kg+ce07eu8iQYZkNA4yWpeVQ
 JwHklALV/0Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; 
   d="scan'208";a="323467735"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga006.jf.intel.com with ESMTP; 28 Oct 2020 13:30:01 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/3] xhci fixes for usb-linus
Date:   Wed, 28 Oct 2020 22:31:21 +0200
Message-Id: <20201028203124.375344-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few xhci patches for usb-linus, including a fix for the xhci lockdep
oops in 5.10-rc1

-Mathias

Colin Ian King (1):
  xhci: Fix sizeof() mismatch

Mathias Nyman (1):
  xhci: Don't create stream debugfs files with spinlock held.

Sandeep Singh (1):
  usb: xhci: Workaround for S3 issue on AMD SNPS 3.0 xHC

 drivers/usb/host/xhci-mem.c |  4 ++--
 drivers/usb/host/xhci-pci.c | 17 +++++++++++++++++
 drivers/usb/host/xhci.c     |  5 ++++-
 drivers/usb/host/xhci.h     |  1 +
 4 files changed, 24 insertions(+), 3 deletions(-)

-- 
2.25.1

