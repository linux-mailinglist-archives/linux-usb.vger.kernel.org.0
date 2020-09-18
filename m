Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE40A26FDF2
	for <lists+linux-usb@lfdr.de>; Fri, 18 Sep 2020 15:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbgIRNO2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Sep 2020 09:14:28 -0400
Received: from mga09.intel.com ([134.134.136.24]:46076 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgIRNO1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Sep 2020 09:14:27 -0400
IronPort-SDR: eRHKnUE7dPF29NJJRlTePzkP08xRKRwNfYaOTbS+Tn61670X1DEyLFljmp2tostnZPe0HxUMVQ
 /4CNY/o24QlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="160849940"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="160849940"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 06:14:26 -0700
IronPort-SDR: aBshtMwTwbHDKBycD3bxNwdsMe/zCBupwl33goCeK95ABlDbFt3eVxKIK1cqkGnE9nitEL0ddI
 7L31zaCqVZng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="508871154"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga005.fm.intel.com with ESMTP; 18 Sep 2020 06:14:25 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 00/10] xhci features for usb-next
Date:   Fri, 18 Sep 2020 16:17:42 +0300
Message-Id: <20200918131752.16488-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few minor xhci improvements for usb-next
-Mathias 

Li Jun (1):
  usb: xhci: add debugfs support for ep with stream

Mathias Nyman (2):
  xhci: Tune interrupt blocking for isochronous transfers
  xhci: don't create endpoint debugfs entry before ring buffer is set.

Peter Chen (7):
  usb: host: xhci-plat: add platform data support
  usb: host: xhci-plat: add .suspend_quirk for struct xhci_plat_priv
  usb: host: xhci-plat: delete the unnecessary code
  usb: host: xhci-plat: add priv quirk for skip PHY initialization
  usb: host: xhci-plat: add wakeup entry at sysfs
  usb: host: xhci-plat: improve the comments for xhci_plat_suspend
  usb: xhci: omit duplicate actions when suspending a runtime suspended
    host.

 drivers/usb/host/xhci-debugfs.c | 109 +++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci-debugfs.h |  10 +++
 drivers/usb/host/xhci-plat.c    |  44 +++++++++----
 drivers/usb/host/xhci-plat.h    |   1 +
 drivers/usb/host/xhci-ring.c    |  23 +++++--
 drivers/usb/host/xhci.c         |  11 ++--
 drivers/usb/host/xhci.h         |   1 +
 7 files changed, 179 insertions(+), 20 deletions(-)

-- 
2.17.1

