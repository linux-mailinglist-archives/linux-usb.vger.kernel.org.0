Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31FB74B84D1
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 10:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232561AbiBPJu6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 04:50:58 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:47112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232568AbiBPJu4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 04:50:56 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D860295FEA
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 01:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645005022; x=1676541022;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oJ5QaDd1wVub99rr5AlLaytX7QvPhxOq1w9Ugjk23MI=;
  b=Eb38AaRl87/fOkWXX78u3wl85uufEKsb1QFI+XuvHiH29TOSCUAnkqKU
   MhW8aEfcl/GucI893NsFFBI7WRJgfdW3PHcoU6KWDM0m2EmO1JVLgdpej
   1+vGeB9TZhK9ffRLJkOE4pSmgXRFOow5Eoezgl2N7Ffu+0ieqcvayAzy4
   K+4b4JA05+rCJXWP0bZFbAJwENVNyJv36c6yxpN7Hdt6W9zrRdKpKeKzo
   BjkFNkOxuxYTJmHZUqzq8MwnvLWi7IWnDgzYQyxkWM6iUCBKN/ws+I6ya
   GaFLT6PIXKFi2AJBT1d+p5DqCZGfiOHhtL9UkKGYMZKMo7h4ztKyNuIQ3
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="249396942"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="249396942"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 01:50:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="636410297"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 16 Feb 2022 01:50:19 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 0/9] xhci and hub features for usb-next
Date:   Wed, 16 Feb 2022 11:51:44 +0200
Message-Id: <20220216095153.1303105-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

Second try.
This series mostly adds support for running xhci DbC on more than one
xHC controller in a setup at the same time.

There are also some link power management changes, of which one touches
usb core hub code, removing an extra LPM disable before device reset.

Thanks
-Mathias

---
v2: use correct dbc branch with cleaned up "fixme" code comments

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

