Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F28B55788C
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jun 2022 13:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbiFWLSX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jun 2022 07:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbiFWLST (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jun 2022 07:18:19 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA49B7C0
        for <linux-usb@vger.kernel.org>; Thu, 23 Jun 2022 04:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655983098; x=1687519098;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BV5UOKFKC/yFggLRS5Q32XdO2tndk8y/5hwYPCHOVvk=;
  b=k5XW/aSd6NBARDiflhXh4pq8sMLFd8+KRpgdAnpE+C5I6672EvsThDaB
   gSsEc4E2nHj6e3yFd3WrUXJpSbdRM2hSxec5aaVvjCWJXasjGApWNrprM
   qbVeTnJ1gOXbz9xDSq7NF1GPWD5ATTODPDRRiCYIcT2VKdSz30awe7/lc
   U6Tz3bSNZZFaQ2PMEIUf5FIB3l9E4muPzxgaJxtoZ8IUUNQZh+rjFFw0N
   EwLR094aB/Y8R83Minb1jCb7TaLdvw2vsUSsdVjd4e4iSDvbEvWz1mlbO
   urothLi3IasgwVxiB/nEYd4EldpufJZ6nNYCX9scILOJZkUNeg0xXggEm
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="367010635"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="367010635"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 04:18:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="915148719"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga005.fm.intel.com with ESMTP; 23 Jun 2022 04:18:17 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/4] xhci fixes for usb-linus
Date:   Thu, 23 Jun 2022 14:19:41 +0300
Message-Id: <20220623111945.1557702-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few xhci fixes for 5.19
Adding a couple PCI IDs, turning off port power in shutdown, and delay
xHC interrupt generation until host is running.

Thanks
Mathias

Hongyu Xie (1):
  xhci: Keep interrupt disabled in initialization until host is running.

Mathias Nyman (1):
  xhci: turn off port power in shutdown

Tanveer Alam (1):
  xhci-pci: Allow host runtime PM as default for Intel Raptor Lake xHCI

Utkarsh Patel (1):
  xhci-pci: Allow host runtime PM as default for Intel Meteor Lake xHCI

 drivers/usb/host/xhci-hub.c |  2 +-
 drivers/usb/host/xhci-pci.c |  6 ++++-
 drivers/usb/host/xhci.c     | 50 ++++++++++++++++++++++++++-----------
 drivers/usb/host/xhci.h     |  2 ++
 4 files changed, 43 insertions(+), 17 deletions(-)

-- 
2.25.1

