Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02A074CBB3E
	for <lists+linux-usb@lfdr.de>; Thu,  3 Mar 2022 11:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232313AbiCCK0K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Mar 2022 05:26:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbiCCK0I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Mar 2022 05:26:08 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB60179A0E
        for <linux-usb@vger.kernel.org>; Thu,  3 Mar 2022 02:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646303123; x=1677839123;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UlRfCI4Jg7T+xpDi06WvdDxFeDQDUt7zAkYv9ZGHBe8=;
  b=MweMcyUKroSK0IuGCedDdEuFp9J5Fcni+J6RsKVluVXPYfEb2Z4zkiMQ
   Y/x0p4YCeUPOXSRkp5UP0b8JkEqHmR8nE9XKXb0Qyd5yLc2yspXig+M/V
   gqbwIhYekjhi/wDOorkGenMUo/euYfa0kjpfVtEYXjR2xmQo+DfTnVx08
   EhfHHsmhdbs4lak8RAuTW4TRVFg0HHgLQ7x784CrWAw0YXn7d+6TV3/TH
   URlQiqEYkJqn0YJnlrOnwxSzJIH1TklCtZQZonynhBVQbZdic0CSCXbP6
   1mQdtZmsmjeUWt/oKDLVxi4pGAiK+okJxBTvz7GEEP0/8ZsuSny5ViBNh
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="253567107"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="253567107"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 02:25:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="535773292"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2022 02:25:21 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/9] xhci cleanups and fixes for usb-next
Date:   Thu,  3 Mar 2022 12:26:47 +0200
Message-Id: <20220303102656.1661407-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

One more set of xhci fetures and fixes for usb-next.

In addition to some cleanups there are some fixes that
would be nice to get into 5.18-rc1

All fixes are for old issues, so nothing urgent.

Thanks
-Mathias

Anssi Hannula (2):
  xhci: fix garbage USBSTS being logged in some cases
  xhci: fix uninitialized string returned by xhci_decode_ctrl_ctx()

Henry Lin (1):
  xhci: fix runtime PM imbalance in USB2 resume

Linyu Yuan (5):
  usb: host: xhci: use ffs() in xhci_mem_init()
  usb: host: xhci: fix a comment typo in xhci_mem_init()
  usb: host: xhci: update hci_version operation in xhci_gen_setup()
  usb: host: xhci: add blank line in xhci_halt()
  usb: host: xhci: Remove some unnecessary return value initializations

Mathias Nyman (1):
  xhci: make xhci_handshake timeout for xhci_reset() adjustable

 drivers/usb/host/xhci-hub.c |  5 ++++-
 drivers/usb/host/xhci-mem.c | 10 +++-------
 drivers/usb/host/xhci.c     | 34 +++++++++++++++++-----------------
 drivers/usb/host/xhci.h     | 14 +++++++++++---
 4 files changed, 35 insertions(+), 28 deletions(-)

-- 
2.25.1

