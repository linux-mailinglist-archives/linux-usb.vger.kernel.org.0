Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1453D37B769
	for <lists+linux-usb@lfdr.de>; Wed, 12 May 2021 10:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbhELIHl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 May 2021 04:07:41 -0400
Received: from mga01.intel.com ([192.55.52.88]:32313 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230011AbhELIHk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 May 2021 04:07:40 -0400
IronPort-SDR: vRmLKXz+VNJPbdD/tes1xhK1ZZzRlur3oyvzrbHY5aMMmJlG2cK8Ac/DoHtJTCAFty3/2smxo7
 HCpCTiz27e3A==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="220616870"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="220616870"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:06:30 -0700
IronPort-SDR: CCY/fB8FfYxavb1HhFlLVmxK9hRYV/Je7Om0RdPySzulrJHzK5vkc6gu5mL2RskHW/8rw1al5u
 7392l5yl2jxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="625208217"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga005.fm.intel.com with ESMTP; 12 May 2021 01:06:28 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/5] xhci fixes for usb-linus
Date:   Wed, 12 May 2021 11:08:11 +0300
Message-Id: <20210512080816.866037-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few small xHCI fixes for usb-linus 5.13-rc.

Thanks
-Mathias


Abhijeet Rao (1):
  xhci-pci: Allow host runtime PM as default for Intel Alder Lake xHCI

Christophe JAILLET (1):
  xhci: Do not use GFP_KERNEL in (potentially) atomic context

Mathias Nyman (1):
  xhci: Fix giving back cancelled URBs even if halted endpoint can't
    reset

Maximilian Luz (1):
  usb: xhci: Increase timeout for HC halt

Sandeep Singh (1):
  xhci: Add reset resume quirk for AMD xhci controller.

 drivers/usb/host/xhci-ext-caps.h |  5 +++--
 drivers/usb/host/xhci-pci.c      |  8 ++++++--
 drivers/usb/host/xhci-ring.c     | 16 +++++++++++-----
 drivers/usb/host/xhci.c          |  6 +++---
 4 files changed, 23 insertions(+), 12 deletions(-)

-- 
2.25.1

