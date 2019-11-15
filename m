Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37E34FE32A
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 17:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727751AbfKOQru (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Nov 2019 11:47:50 -0500
Received: from mga09.intel.com ([134.134.136.24]:15381 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727644AbfKOQru (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 Nov 2019 11:47:50 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Nov 2019 08:47:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,308,1569308400"; 
   d="scan'208";a="208179153"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga003.jf.intel.com with ESMTP; 15 Nov 2019 08:47:48 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/4] xhci features for usb-next
Date:   Fri, 15 Nov 2019 18:49:59 +0200
Message-Id: <1573836603-10871-1-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few xhci features for usb-next, hope they are not too late for 5.5 kernel.
These features mainly prepare driver for handling a flood of xhci events,
but also enables runtime PM as default for a Ice Lake xHCI, and adds a bit
of tracing.

-Mathias

Mathias Nyman (1):
  xhci: Add tracing for xhci doorbell register writes

Mika Westerberg (1):
  xhci-pci: Allow host runtime PM as default also for Intel Ice Lake
    xHCI

Peter Chen (1):
  usb: host: xhci: update event ring dequeue pointer on purpose

Suwan Kim (1):
  usb: host: xhci: Support running urb giveback in tasklet context

 drivers/usb/host/xhci-pci.c   |  4 ++-
 drivers/usb/host/xhci-ring.c  | 68 +++++++++++++++++++++++++++++++------------
 drivers/usb/host/xhci-trace.h | 26 +++++++++++++++++
 drivers/usb/host/xhci.c       |  3 +-
 drivers/usb/host/xhci.h       | 29 ++++++++++++++++++
 5 files changed, 109 insertions(+), 21 deletions(-)

-- 
2.7.4

