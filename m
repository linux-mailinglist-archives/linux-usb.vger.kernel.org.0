Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3866D085A
	for <lists+linux-usb@lfdr.de>; Thu, 30 Mar 2023 16:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232466AbjC3OaE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Mar 2023 10:30:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231862AbjC3OaC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Mar 2023 10:30:02 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D6BE114
        for <linux-usb@vger.kernel.org>; Thu, 30 Mar 2023 07:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680186601; x=1711722601;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TRwS79Bktv3bkRcj4KcaF4xLg3vSPA+MMQE0h1hg7x4=;
  b=e3+eUL+coshk+Heeo6tC/RMvDwnIOSKTOmpyeyOrikZc+FiSYi8iRjO8
   I+1AISCuFRysv1s0tDvUhsqe144htcep1+Eko2tbBYNpqVYm/kWljhTOR
   RSql4mgGgIawp+Q1/gMgOt1yWdg4TbmCM8FQAxHg0ryBJR/Dt8k95drcJ
   pPbsR8b7MGpfka95aDvXV/tT1G1jpoqkMUKe+HRuBmREZjcGsrTOZf3dH
   JqyVjmMPObDd6Y2qNHD556+4qxWnNvJbdgpDae5iRBrvM8Gqzj42fq0ES
   slzbI5xrk3ebJneueRFYDN5Ot7M6vXhUQpQTEuLXD/vSjG964LGXGk4wa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="406172546"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="406172546"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 07:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="774021076"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="774021076"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Mar 2023 07:29:45 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/3] xhci fixes for usb-linus
Date:   Thu, 30 Mar 2023 17:30:53 +0300
Message-Id: <20230330143056.1390020-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few small patches for usb-linus.
Reverting xhci-pci asynchronous probe due to Renesas host regression, and
fixing a memory leak.

Thanks
Mathias

D Scott Phillips (1):
  xhci: also avoid the XHCI_ZERO_64B_REGS quirk with a passthrough iommu

Mathias Nyman (2):
  Revert "usb: xhci-pci: Set PROBE_PREFER_ASYNCHRONOUS"
  xhci: Free the command allocated for setting LPM if we return early

 drivers/usb/host/xhci-pci.c | 7 +++----
 drivers/usb/host/xhci.c     | 7 ++++++-
 2 files changed, 9 insertions(+), 5 deletions(-)

-- 
2.25.1

