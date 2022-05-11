Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0229523FE6
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 00:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244494AbiEKWDp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 18:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbiEKWDo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 18:03:44 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF2F3B7
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 15:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652306622; x=1683842622;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nLAwp74cJ1YNehpSoYRmjmqr1cIizgCr7PGmdIUuWpw=;
  b=QDLFC0h1ueQq2bDfFTREWoECBxAhHvX6A4UzKFNgORXyddCGs6ScfbJF
   4x7NwTQ+tGj0eSGwWcq31WsyXerPXALVF7K4Rh+yFW25qP/PM9/rGTiUk
   csKGUklhJwzRV18iHXzp1x886YmnswgAOZ8E9xAr3o+NyMHm4bnM5oRzp
   lQOJcZhbGxYI5FDpFtC2rHhbGDVWiTCJX8gtjHIQDMYIgeO7t8PC3iFkW
   ks6Hl353T2vYwrf2S0HB9SAjdcli9zEdyLxh4YG1RSy3TjpI5oNYEFlNS
   S6OjnO6PFJq3+H6Ei4CggDMVGoMw1MN48U01ZfnFKJK7J/0id8E1S8dmK
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="330427424"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="330427424"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 15:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="542496188"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 11 May 2022 15:03:35 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/9] xhci features for usb-next
Date:   Thu, 12 May 2022 01:04:41 +0300
Message-Id: <20220511220450.85367-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

New xhci features for 5.19
Major change is support for xHC with just one roothub.

Thanks
Mathias

Heiner Kallweit (5):
  xhci: factor out parts of xhci_gen_setup()
  xhci: prepare for operation w/o shared hcd
  usb: host: xhci-plat: create shared hcd after having added main hcd
  usb: host: xhci-plat: prepare operation w/o shared hcd
  usb: host: xhci-plat: omit shared hcd if either root hub has no ports

Mathias Nyman (4):
  xhci: use generic command timer for stop endpoint commands.
  xhci: prevent U2 link power state if Intel tier policy prevented U1
  xhci: Remove quirk for over 10 year old evaluation hardware
  xhci: Allow host runtime PM as default for Intel Alder Lake N xHCI

 drivers/usb/host/xhci-hub.c  |   3 +-
 drivers/usb/host/xhci-mem.c  |  23 ++---
 drivers/usb/host/xhci-pci.c  |   5 +-
 drivers/usb/host/xhci-plat.c |  46 ++++++----
 drivers/usb/host/xhci-ring.c | 144 ++++++++---------------------
 drivers/usb/host/xhci.c      | 173 +++++++++++++++++++----------------
 drivers/usb/host/xhci.h      |  30 +++++-
 7 files changed, 199 insertions(+), 225 deletions(-)

-- 
2.25.1

