Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 904AC4CBC22
	for <lists+linux-usb@lfdr.de>; Thu,  3 Mar 2022 12:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbiCCLIR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Mar 2022 06:08:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232399AbiCCLIP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Mar 2022 06:08:15 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0521D4AE37
        for <linux-usb@vger.kernel.org>; Thu,  3 Mar 2022 03:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646305649; x=1677841649;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V0/v41gESQAZ3xYf42TQV18IgTAKAeg1oI1G15uQ/cE=;
  b=dNjU4SqBBxeB1GDoq5GdRSLg1/CkQUW67HeIJ9bIbxrzSV+CI/QO6qvN
   390L9pmgICxpZtsmDj5sOP/QNsM/OXCrPgIfVcwNZuYZWHPDm9oh0R7W1
   5CQGgx2dNwMi3XNuQJ6oLyK5yRTKUKi3LBzjHGyp4Q3HGXVSGJuL2H2AK
   uawun20hd1EjqrhKvliezSFuHkhnhpgmz7QaA0FXeAma9z7PnyfxWXeWz
   RUY0yeh5OmWxRpmgPeUaPLjCtXFiPf3bHiPHmnrOaZeBrW8ixMdt+CtLK
   fNkuikjSjSr+FRoukCE5MI10F5UQ0p7aB6jQacjFwTb+eoVqNhmuSOKDO
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="251219868"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="251219868"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 03:07:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="576452342"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 03 Mar 2022 03:07:28 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 0/9] xhci cleanups and fixes for usb-next
Date:   Thu,  3 Mar 2022 13:08:54 +0200
Message-Id: <20220303110903.1662404-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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

v2: adjust incorrectly placed stable tag in patch 3/9 commit message

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

