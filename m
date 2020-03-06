Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB46017C136
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2020 16:06:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgCFPGh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Mar 2020 10:06:37 -0500
Received: from mga14.intel.com ([192.55.52.115]:49424 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726958AbgCFPGh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Mar 2020 10:06:37 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Mar 2020 07:06:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,522,1574150400"; 
   d="scan'208";a="234831815"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 06 Mar 2020 07:06:35 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/2] xhci fixes for usb-linus
Date:   Fri,  6 Mar 2020 17:08:56 +0200
Message-Id: <20200306150858.21904-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A couple minor xhci fixes for usb-linus, fixing xhci trace events and
adding a quirk flag for a AMD xhci host.

-Mathias

Alberto Mattea (1):
  usb: xhci: apply XHCI_SUSPEND_DELAY to AMD XHCI controller 1022:145c

Steven Rostedt (VMware) (1):
  xhci: Do not open code __print_symbolic() in xhci trace events

 drivers/usb/host/xhci-pci.c   |  3 ++-
 drivers/usb/host/xhci-trace.h | 23 ++++++-----------------
 2 files changed, 8 insertions(+), 18 deletions(-)

-- 
2.17.1

