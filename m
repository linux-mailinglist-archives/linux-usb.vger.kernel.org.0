Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90CE622B196
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728482AbgGWOm0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:26 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728696AbgGWOmZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:25 -0400
IronPort-SDR: JPy0bnlAJUW/e7FheTg4zsCMrTbbyDdcryZemfh6XVYwsCYwfbId/KQ8ntOV6HedHHBW6bTza9
 JsuPA+NVexiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607355"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607355"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:25 -0700
IronPort-SDR: d1owht6ODW7/N+pdNAxZPEnBZ5WiCtSu6WJAiwOnx9GEUUXj+qfZn4EsK0W72eyynTvyXLRGNr
 3wKAwxv7pT1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672349"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:23 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 00/27] xhci features for usb-next
Date:   Thu, 23 Jul 2020 17:45:03 +0300
Message-Id: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

This series for usb-next is almost completely about decoupling and
cleaning up relations between xhci, xhci debug capability (DbC),
and the DbC tty support.

Real motivation behind this is to later turn DbC into a proper device
allowing us to bind different drivers to it, like dbctty.

Thanks
-Mathias

Kai-Heng Feng (1):
  xhci: Make debug message consistent with bus and port number

Mathias Nyman (26):
  xhci: dbc: Don't use generic xhci inc_deq() function for dbc
  xhci: Don't pass struct xhci_hcd pointer to xhci_link_seg()
  xhci: dbc: Don't use generic xhci erst allocation and free functions
  xhci: dbc: Remove dbc_dma_alloc_coherent() wrapper
  xhci: dbc: Remove dbc_dma_free_coherent() wrapper
  xhci: dbc: Add device pointer to dbc structure
  xhci: dbc: Use dev_info() and similar instead of xhci_info()
  xhci: dbc: Don't use xhci_write_64() as it takes xhci as a parameter
  xhci: dbc: Don't pass the xhci pointer as a parameter to
    xhci_dbc_init_context()
  xhci: dbc: Get the device pointer from dbc structure in
    dbc_ep_do_queue()
  xhci: dbc: Pass dbc pointer to endpoint init and exit functions.
  xhci: dbc: Change to pass dbc pointer to xhci_do_dbc_stop()
  xhci: dbc: Pass dbc pointer to dbc_handle_xfer_event() instead of
    xhci_hcd pointer
  xhci: dbgtty: Pass dbc pointer when registering a dbctty device
  xhci: dbc: Pass dbc pointer to get_in/out_ep() helper functions to get
    endpoints
  xhci: dbc: Use dbc structure in the request completion instead of
    xhci_hcd
  xhci: dbc: Don't use generic xhci context allocation for dbc
  xhci: dbc: don't use generic xhci ring allocation functions for dbc.
  xhci: dbc: Pass dbc pointer to dbc memory init and cleanup functions
  xhci: dbc: Pass dbc pointer to dbc start and stop functions.
  xhci: dbc: simplify dbc requests allocation and queueing
  xhci: dbc: remove endpoint pointers from dbc_port structure
  xhci: dbctty: split dbc tty driver registration and unregistration
    functions.
  xhci: dbc: Add a operations structure to access driver functions
  xhci: dbgcap: remove dbc dependency on dbctty specific flag
  xhci: dbc: remove tty specific port structure from struct xhci_dbc

 drivers/usb/host/xhci-dbgcap.c | 391 +++++++++++++++++++++------------
 drivers/usb/host/xhci-dbgcap.h |  69 +++---
 drivers/usb/host/xhci-dbgtty.c | 219 +++++++++++-------
 drivers/usb/host/xhci-hub.c    |  41 ++--
 drivers/usb/host/xhci-mem.c    |  35 +--
 drivers/usb/host/xhci.h        |   2 +
 6 files changed, 462 insertions(+), 295 deletions(-)

-- 
2.17.1

