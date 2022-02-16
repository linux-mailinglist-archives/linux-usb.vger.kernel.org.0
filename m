Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 184D74B83A4
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 10:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbiBPJIc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 04:08:32 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:51284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbiBPJIb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 04:08:31 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D341F24F32
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 01:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645002488; x=1676538488;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6bDo7yJOddIRbFnSVo1aXujatw8Sh06MVBDSPQUcuD8=;
  b=ZWPpgNKRoA6SVFiZRxjei4xsse0FaD9ZJKF1IOOk3JxZPPmJiijoIZlj
   jLvxiN2Eifb23fPBy+UTgj92ohXRD6pYA0AkOieRq7SZKaJcfOXT5nG4z
   T9cgCIx8BzcxQPoao3imoTiOLww045kCU6KNCvI8uU9BguUotVGvaa2M0
   5knTnEhbj40ET7bHXg2eWp6WHH9RXnf54xUkWFFBH4fgoOgusTnFAi0Jd
   ZF3zfFfAj1ZVaa4y4pElAP/mN789JqJY9N1yJYx1oyRX85brtqATgLZOx
   2ozWB5Ov24M+XNkYx/iGpUPLc2aFA3rgLL/w9igfqDnMEhn70PB+xkagR
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="275138014"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="275138014"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 01:08:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="571190291"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 16 Feb 2022 01:08:05 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/9] xhci and hub features for usb-next
Date:   Wed, 16 Feb 2022 11:09:29 +0200
Message-Id: <20220216090938.1260899-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

This series mostly adds support for running xhci DbC on more than one
xHC controller in a setup at the same time.

There are also some link power management changes, of which one touches
usb core hub code, removing an extra LPM disable before device reset.

Thanks
-Mathias

Mathias Nyman (7):
  xhci: dbc: refactor xhci_dbc_init()
  xhci: dbc: create and remove dbc structure in dbgtty driver.
  xhci: dbc: Rename xhci_dbc_init and xhci_dbc_exit
  xhci: dbc: Don't call dbc_tty_init() on every dbc tty probe
  xhci: dbgtty: use IDR to support several dbc instances.
  xhci: Allocate separate command structures for each LPM command
  usb: remove Link Powermanagement (LPM) disable before port reset.

Sergey Shtylyov (1):
  usb: host: xhci: drop redundant checks

kernel test robot (1):
  usb: xhci: fix minmax.cocci warnings

 drivers/usb/core/hub.c         |  13 +--
 drivers/usb/host/xhci-dbgcap.c | 145 ++++++++++++++++-----------------
 drivers/usb/host/xhci-dbgcap.h |  26 ++++--
 drivers/usb/host/xhci-dbgtty.c |  86 ++++++++++++-------
 drivers/usb/host/xhci-mem.c    |  10 +--
 drivers/usb/host/xhci.c        |  31 +++----
 drivers/usb/host/xhci.h        |   2 -
 7 files changed, 163 insertions(+), 150 deletions(-)

-- 
2.25.1

