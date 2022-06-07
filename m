Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E735540088
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jun 2022 15:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245011AbiFGN5j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jun 2022 09:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245006AbiFGN5h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jun 2022 09:57:37 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D286E3F
        for <linux-usb@vger.kernel.org>; Tue,  7 Jun 2022 06:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654610256; x=1686146256;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=T+jwDWvZWWgxdjYAzmL0BdCDOMpUKWUHtisQD56DYcs=;
  b=YaQsEUHhv66GsWuN4TY7JwMb0xsLwr89jGOolqZispWcAJTdKcKE5d2C
   xAUQPVQRvZAPcHftrfT7UYaXlDdepDQrzPGueWoRXt0kGrL7Cr96EpNM3
   ReA+b7aHVmdBkiS9qmMtoiQPuDmkO8FU0lHRs5yEhitHz9jyHFLqJcQRS
   Z/nWS8VevAtO+MBuuq1sCkyEa/4PmHzMVHIsZXkH0lY94Xtzd6motQPIy
   IU1009me6darSEtV/5xRNi57YiXxQXEn4DnCbkJ2DamvQwJf8R7ws1PHP
   yyi3P4AUOxinD3A5MaxV+YfayMU2qyA7jqYLejjo3oNxDdVH8nOdrAfuo
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="302083880"
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; 
   d="scan'208";a="302083880"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 06:57:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; 
   d="scan'208";a="907061564"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2022 06:57:33 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <linux-usb@vger.kernel.org>, <stern@rowland.harvard.edu>
Cc:     evgreen@google.com, shobhit.srivastava@intel.com,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFC PATCH 0/1] hibernate and roothub port power
Date:   Tue,  7 Jun 2022 16:58:35 +0300
Message-Id: <20220607135836.627711-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

Looking for comments on an issue where a self-powered usb device can
survive in suspended U3 state even if the host system is restarted.

This causes additional boot delay as boot firmware is not designed
to handle usb devices in U3.
Boot firmware waits for a usb state change in vain until it times out.

In shutdown (S5), with xHCI as host, this can be solved fairly easily
by turning off roothub port power in the .shutdown path.

This is discussed in xhci spec 4.19.4 for driver unload:
"Before the xHC driver is unloaded, the driver should clear the
Port Power (PP) flag of all Root Hub ports to place them into
the Disabled state and reduce port power consumption."

But for S4 hibernate things get more complicated.
We can't just turn off port power, especially if the usb device can
generate remote wake, and host should resume the system from S4.

But I can't come up with a better solution, so this RFC patch
does exactly that. It turns off port power for xHC roothub ports
in the hibernate poweroff_late stage, but only if the host isn't set
to wake up the system from S4.

This RFC workaround is specific to PCI xHC hosts, but if this solution
makes sense at all, shuold it be turned into a more generic solution?
Maybe calling hc_driver hcd->port_power(hcd, i, false) for each roothub
port in dev_pm_ops usb_hcd_pci_pm_ops .poweroff or .poweroff_late
callbacks?

Mathias Nyman (1):
  xhci: pci: power off roothub ports in hibernate poweroff_late stage

 drivers/usb/host/xhci-hub.c |  4 ++--
 drivers/usb/host/xhci-pci.c | 32 +++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci.h     |  2 ++
 3 files changed, 35 insertions(+), 3 deletions(-)

-- 
2.25.1

