Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22C01688108
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 16:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbjBBPFg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 10:05:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbjBBPFf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 10:05:35 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED69911A0
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 07:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675350301; x=1706886301;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s/Yz3S4ovISv8WEmJ3t1nMUbiVxkI0gNClvWGE4tRbE=;
  b=LJfThNErlxjuLb/08vzrAKK5O/cVD09yRPoaryvBwpR8Jd4uGA02Ffm7
   QdTpiu/seGxn4LTrYBgt4+eHdwcySSBap1Q3pEzlozzJXOlu/SBQvCjVF
   rP+Z4M2tz2oBZV1T9yh8NohYlr7x+BS1E/7cYM06aLcbeYPz8erE1fgis
   rHUa6sYsFISCUWOcgIQ2Zi9KXIlfC1OrRXVbUlgySHJzkdVqkMfNLsLT7
   u9xBoBC27fsXUQw0Qpg2RdFHacFIfoTo6Q2YfgMqXcVG5O9rlaraG9QZO
   cvTsnNpdedHbcWJmlP6cIkspKiqxh/mq/IjIZcxc2K8VYsRVdbK5/1bUx
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="327113922"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="327113922"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 07:03:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="728905606"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="728905606"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2023 07:03:48 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 00/11] xhci features for usb-next
Date:   Thu,  2 Feb 2023 17:04:54 +0200
Message-Id: <20230202150505.618915-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A set of xhci changes for usb-next.
Refactoring the xhci even thandling to simplify support for serveral
xhci interrupters, and decoupling port resume handling from get_port_status
xhci roothub request handling a bit.

Thanks
Mathias

Mathias Nyman (11):
  xhci: fix event ring segment table related masks and variables in
    header
  xhci: remove xhci_test_trb_in_td_math early development check
  xhci: Refactor interrupter code for initial multi interrupter support.
  xhci: add helpers for enabling and disabling interrupters
  xhci: cleanup xhci_hub_control port references
  xhci: pass port pointer as parameter to xhci_set_port_power()
  xhci: move port specific items such as state completions to port
    structure
  xhci: Pass port structure as parameter to xhci_disable_port().
  xhci: rename resume_done to resume_timestamp
  xhci: clear usb2 resume related variables in one place.
  xhci: decouple usb2 port resume and get_port_status request handling

 drivers/usb/host/xhci-debugfs.c |   2 +-
 drivers/usb/host/xhci-hub.c     | 256 ++++++++++++------------
 drivers/usb/host/xhci-mem.c     | 338 +++++++++++---------------------
 drivers/usb/host/xhci-ring.c    |  81 ++++----
 drivers/usb/host/xhci.c         |  79 ++++++--
 drivers/usb/host/xhci.h         |  38 ++--
 6 files changed, 366 insertions(+), 428 deletions(-)

-- 
2.25.1

