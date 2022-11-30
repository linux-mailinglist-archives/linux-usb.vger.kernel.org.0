Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FFED63D193
	for <lists+linux-usb@lfdr.de>; Wed, 30 Nov 2022 10:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbiK3JSV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Nov 2022 04:18:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232711AbiK3JSO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Nov 2022 04:18:14 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C06450B0
        for <linux-usb@vger.kernel.org>; Wed, 30 Nov 2022 01:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669799893; x=1701335893;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qQciihq5NwAMv1nFLLVu35kiUdvnC3QJKZ9chSQlIr8=;
  b=LLwMW2Wk3zyU/PtpZo8IKhnhjOiAmpPMJ5jWRqFvpUf9wLmkcOojuHaJ
   y3UMdYk9JKR4gzLO//OrRrs5NLqk/0VShji6Y8To1qTBMHp0Ou+Ob5Y9W
   /QtXF+PeXMio6iM3EvXfvyO2TQDQWT5p5KORQIyNLPLNrRC9MPmek/pgv
   VCEoNRhfD0n+XRLWg9BMlEjjquBHpIcufSLb116tKWt8TPPckhrAW+dlK
   vX5LfxkMYhUyz7k2EBm6384jzp+nuWlD471/RAP3SNoR4dRXI/bhOPvNx
   BhY/x0kxtdpDsZdIDF9+lRWqAjQ8hzceYJjo/iDC1AxBFd9/6xWIrtVyA
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="295711251"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; 
   d="scan'208";a="295711251"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 01:18:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="674962681"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; 
   d="scan'208";a="674962681"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga008.jf.intel.com with ESMTP; 30 Nov 2022 01:18:11 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/6] xhci patches for usb-next
Date:   Wed, 30 Nov 2022 11:19:38 +0200
Message-Id: <20221130091944.2171610-1-mathias.nyman@linux.intel.com>
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

A few features and fixes for usb-next.
Fixing an issue in xhci streams error handling, adding some Intel Alder Lake
specific workarounds, and some very minor cleanups and changes.

Nice if these can still make 6.2-rc1

Thanks
-Mathias

Longfang Liu (1):
  xhci: print warning when HCE was set

Mathias Nyman (4):
  xhci: export two xhci_hub functions for xhci-pci module usage
  xhci: disable U3 suspended ports in S4 hibernate poweroff_late stage
  xhci: Prevent infinite loop in transaction errors recovery for streams
  xhci: remove unused stream_id parameter from
    xhci_handle_halted_endpoint()

Reka Norman (1):
  xhci: Apply XHCI_RESET_TO_DEFAULT quirk to ADL-N

 drivers/usb/core/hcd-pci.c   | 13 +++++++++
 drivers/usb/host/xhci-hub.c  | 22 +++++++++++---
 drivers/usb/host/xhci-pci.c  | 56 +++++++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci-ring.c | 42 +++++++++++++++------------
 drivers/usb/host/xhci.h      |  2 +-
 include/linux/usb/hcd.h      |  3 ++
 6 files changed, 113 insertions(+), 25 deletions(-)

-- 
2.25.1

