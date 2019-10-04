Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAA31CB993
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 13:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729189AbfJDL5j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 07:57:39 -0400
Received: from mga14.intel.com ([192.55.52.115]:33448 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726002AbfJDL5j (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Oct 2019 07:57:39 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Oct 2019 04:57:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; 
   d="scan'208";a="186229433"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 04 Oct 2019 04:57:36 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/8] xhci fixes for usb-linus
Date:   Fri,  4 Oct 2019 14:59:25 +0300
Message-Id: <1570190373-30684-1-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A set of xhci fixes for usb-linus, for exaple fix a NULL pointer
dereference, remove a false warning, resolve a couple link power management
related bandwidth issues, and correctly detect USB 3.1 capability on hosts
based on early xHCI 1.1 specs.

-Mathias

Bill Kuzeja (1):
  xhci: Prevent deadlock when xhci adapter breaks during init

Jan Schmidt (1):
  xhci: Check all endpoints for LPM timeout

Kai-Heng Feng (1):
  xhci: Increase STS_SAVE timeout in xhci_suspend()

Mathias Nyman (4):
  xhci: Fix false warning message about wrong bounce buffer write length
  xhci: Prevent device initiated U1/U2 link pm if exit latency is too
    long
  xhci: Fix USB 3.1 capability detection on early xHCI 1.1 spec based
    hosts
  xhci: Fix NULL pointer dereference in xhci_clear_tt_buffer_complete()

Rick Tseng (1):
  usb: xhci: wait for CNR controller not ready bit in xhci resume

 drivers/usb/host/xhci-ring.c |  4 +--
 drivers/usb/host/xhci.c      | 78 +++++++++++++++++++++++++++++++++++---------
 2 files changed, 65 insertions(+), 17 deletions(-)

-- 
2.7.4

