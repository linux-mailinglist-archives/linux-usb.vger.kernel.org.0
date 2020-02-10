Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F054157C92
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 14:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbgBJNnm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 08:43:42 -0500
Received: from mga05.intel.com ([192.55.52.43]:14982 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727369AbgBJNnm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Feb 2020 08:43:42 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Feb 2020 05:43:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,425,1574150400"; 
   d="scan'208";a="265858446"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2020 05:43:40 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/4] xhci fixes for usb-linus
Date:   Mon, 10 Feb 2020 15:45:49 +0200
Message-Id: <20200210134553.9144-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few xhci fixes resolving an issue entering runtime suspend PCI D3 for
some Intel hosts, fixing a memory leak, and forcing max packet size to
valid values allowing some older FS devices to function with xhci.

-Mathias

Mathias Nyman (4):
  xhci: Force Maximum Packet size for Full-speed bulk devices to valid
    range.
  xhci: Fix memory leak when caching protocol extended capability PSI
    tables
  xhci: fix runtime pm enabling for quirky Intel hosts
  xhci: apply XHCI_PME_STUCK_QUIRK to Intel Comet Lake platforms

 drivers/usb/host/xhci-hub.c | 25 ++++++++-----
 drivers/usb/host/xhci-mem.c | 70 ++++++++++++++++++++++++-------------
 drivers/usb/host/xhci-pci.c | 10 +++---
 drivers/usb/host/xhci.h     | 14 ++++++--
 4 files changed, 79 insertions(+), 40 deletions(-)

-- 
2.17.1

