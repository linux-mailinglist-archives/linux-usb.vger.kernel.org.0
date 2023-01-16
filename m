Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF1166C27C
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jan 2023 15:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjAPOoK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Jan 2023 09:44:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbjAPOn1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Jan 2023 09:43:27 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74EE2265B7
        for <linux-usb@vger.kernel.org>; Mon, 16 Jan 2023 06:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673878863; x=1705414863;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5X/KWOvmd9+vKnA+vdGE75aS753J+ioQjo998SDmI5I=;
  b=gmdZe6gHNyNzBUC9D1UzSB4T/6oV0UlV67uQZHEy5vqvoa1hBDPDLw8u
   AAs3DM/ZK8Xd2XQaq6SnirMwPU/PqZRBG2oRDwfhXCiGPoTDqo/VUXbHN
   /dmJhKDveU3syD6PIWv6lxcABcUR0MyQE+mzSH48XzbTKTsJpYr8L2Fg2
   UNQk65b8N+jwYVw9CGhpF7eoo0a1dpeEZlsCylb+Kd9W85Sqi8yTqltlx
   eKxLqyGeZ5R3AHgfqEyfckN7urbAC7QPgf4Oj4XEzDjuNRmcj0jfwP27T
   /AwTmV2sbmx+/v97AsthePFcM4okfUf6Zd0XvKPZwQHaIFK8DbTxeinP1
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="312322914"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="312322914"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 06:21:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="987817159"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="987817159"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga005.fm.intel.com with ESMTP; 16 Jan 2023 06:21:00 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/7] usb and xhci fixes for usb-linus
Date:   Mon, 16 Jan 2023 16:22:09 +0200
Message-Id: <20230116142216.1141605-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few fixes for usb-linus.

Biggest change is checking from ACPI tables if OS needs to disable
USB3 U1/U2 LPM states for a port, even if both the host and device
supports LPM.
This can be the case if the system uses a USB3 U1/U2 incapable retimer
for a port.

This touches usb-acpi code in usb core.

Thanks
-Mathias

Jimmy Hu (1):
  usb: xhci: Check endpoint is valid before dereferencing it

Mathias Nyman (5):
  xhci: Fix null pointer dereference when host dies
  xhci: Add update_hub_device override for PCI xHCI hosts
  xhci: Add a flag to disable USB3 lpm on a xhci root port level.
  usb: acpi: add helper to check port lpm capability using acpi _DSM
  xhci: Detect lpm incapable xHC USB3 roothub ports from ACPI tables

Ricardo Ribalda (1):
  xhci-pci: set the dma max_seg_size

 drivers/usb/core/usb-acpi.c  | 65 ++++++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-pci.c  | 45 +++++++++++++++++++++++++
 drivers/usb/host/xhci-ring.c |  5 ++-
 drivers/usb/host/xhci.c      | 18 +++++++++-
 drivers/usb/host/xhci.h      |  5 +++
 include/linux/usb.h          |  3 ++
 6 files changed, 139 insertions(+), 2 deletions(-)

-- 
2.25.1

