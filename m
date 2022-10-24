Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D694460B4FC
	for <lists+linux-usb@lfdr.de>; Mon, 24 Oct 2022 20:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231410AbiJXSL1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Oct 2022 14:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232202AbiJXSLF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Oct 2022 14:11:05 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3F1111BAE
        for <linux-usb@vger.kernel.org>; Mon, 24 Oct 2022 09:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666630371; x=1698166371;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AODbczhR65GGx/ladMshofrucIAvN66WbE5eTGzvRfY=;
  b=QEB5ju3fZV0SY2XT7gBjIfpK+8pZxaNCtLIUtqFc6bss47zWyaOkxeil
   m/Ss7spHe8u83DxJU84tAV1HJFI0hZ0Ktqp3CGAruvx2LJ7Kbwam0hONY
   rpsJz+PEALyAY1h1WKNWigF/WTtwqMvyXVunwHr53z+jWBR0U7uLf7WhP
   8GPiMG1lFWy3/GCe+ZJwt471z35TwRxITL8tAk5tXu0HYGBrCMxpDChwZ
   kyYFINzPanBkxDHTWL07hkLw7KXBDyvPa/Ns+WRJiRagXCmb+1EFPJiIT
   NKiIHx37ehExYt0aGXgTy1/NX400OhOsppjiN37+c/EdNYod6neA1T6uD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="290732853"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; 
   d="scan'208";a="290732853"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 07:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="700177609"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; 
   d="scan'208";a="700177609"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga004.fm.intel.com with ESMTP; 24 Oct 2022 07:25:59 -0700
From:   Mathias Nyman <mathias.nyman@intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Subject: [PATCH 0/4] xhci fixes for usb-linus
Date:   Mon, 24 Oct 2022 17:27:16 +0300
Message-Id: <20221024142720.4122053-1-mathias.nyman@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

Some xhci fixes for usb-linus, mostly tuning quirks, but also fixing
one linked list issue.

Thanks
Mathias

Jens Glathe (1):
  usb: xhci: add XHCI_SPURIOUS_SUCCESS to ASM1042 despite being a V0.96
    controller

Mario Limonciello (1):
  xhci-pci: Set runtime PM as default policy on all xHC 1.2 or later
    devices

Mathias Nyman (2):
  xhci: Add quirk to reset host back to default state at shutdown
  xhci: Remove device endpoints from bandwidth list when freeing the
    device

 drivers/usb/host/xhci-mem.c | 20 ++++++++++-------
 drivers/usb/host/xhci-pci.c | 44 +++++++++++++------------------------
 drivers/usb/host/xhci.c     | 10 +++++++--
 drivers/usb/host/xhci.h     |  1 +
 4 files changed, 36 insertions(+), 39 deletions(-)

-- 
2.25.1

