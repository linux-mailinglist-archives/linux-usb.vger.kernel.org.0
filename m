Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4830211AD2D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 15:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729826AbfLKOS0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 09:18:26 -0500
Received: from mga07.intel.com ([134.134.136.100]:52849 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729671AbfLKOS0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Dec 2019 09:18:26 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Dec 2019 06:18:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; 
   d="scan'208";a="414868188"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga006.fm.intel.com with ESMTP; 11 Dec 2019 06:18:20 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/6] xhci fixes for usb-linus
Date:   Wed, 11 Dec 2019 16:20:01 +0200
Message-Id: <20191211142007.8847-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few xhci fixes that resolve a race condition, a memory leak, incorrect
irqrestore and other issues.

-Mathias

Henry Lin (1):
  usb: xhci: only set D3hot for pci device

Kai-Heng Feng (1):
  xhci: Increase STS_HALT timeout in xhci_suspend()

Mathias Nyman (3):
  xhci: fix USB3 device initiated resume race with roothub autosuspend
  xhci: handle some XHCI_TRUST_TX_LENGTH quirks cases as default
    behaviour.
  xhci: make sure interrupts are restored to correct state

Mika Westerberg (1):
  xhci: Fix memory leak in xhci_add_in_port()

 drivers/usb/host/xhci-hub.c  | 22 ++++++++++++++++------
 drivers/usb/host/xhci-mem.c  |  4 ++++
 drivers/usb/host/xhci-pci.c  | 13 +++++++++++++
 drivers/usb/host/xhci-ring.c |  6 +++---
 drivers/usb/host/xhci.c      |  9 +++------
 drivers/usb/host/xhci.h      |  1 +
 6 files changed, 40 insertions(+), 15 deletions(-)

-- 
2.17.1

