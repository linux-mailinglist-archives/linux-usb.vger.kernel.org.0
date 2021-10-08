Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6F34266A4
	for <lists+linux-usb@lfdr.de>; Fri,  8 Oct 2021 11:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237703AbhJHJZJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Oct 2021 05:25:09 -0400
Received: from mga01.intel.com ([192.55.52.88]:41430 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237458AbhJHJZI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Oct 2021 05:25:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="249830672"
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; 
   d="scan'208";a="249830672"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2021 02:23:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; 
   d="scan'208";a="489390423"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 08 Oct 2021 02:23:11 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/5] xhci fixes for usb-linus
Date:   Fri,  8 Oct 2021 12:25:42 +0300
Message-Id: <20211008092547.3996295-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few xhci fixes for 5.15-rc.
A couple races fixed, and quirks added for a couple hosts.

Thanks
-Mathias


Johan Hovold (1):
  USB: xhci: dbc: fix tty registration race

Jonathan Bell (2):
  xhci: guard accesses to ep_state in xhci_endpoint_reset()
  xhci: add quirk for host controllers that don't update endpoint DCS

Nikolay Martynov (1):
  xhci: Enable trust tx length quirk for Fresco FL11 USB controller

Pavankumar Kondeti (1):
  xhci: Fix command ring pointer corruption while aborting a command

 drivers/usb/host/xhci-dbgtty.c | 28 ++++++++++++------------
 drivers/usb/host/xhci-pci.c    |  6 +++++-
 drivers/usb/host/xhci-ring.c   | 39 +++++++++++++++++++++++++++++-----
 drivers/usb/host/xhci.c        |  5 +++++
 drivers/usb/host/xhci.h        |  1 +
 5 files changed, 58 insertions(+), 21 deletions(-)

-- 
2.25.1

