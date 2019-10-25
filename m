Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94104E4F07
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2019 16:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404059AbfJYO2Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Oct 2019 10:28:24 -0400
Received: from mga02.intel.com ([134.134.136.20]:10575 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730064AbfJYO2Y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 25 Oct 2019 10:28:24 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Oct 2019 07:28:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; 
   d="scan'208";a="192554834"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 25 Oct 2019 07:28:22 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/3] xhci fixes for usb-linus
Date:   Fri, 25 Oct 2019 17:30:26 +0300
Message-Id: <1572013829-14044-1-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few xhci fixes for usb-linus, solving a couple endianness issues, and a
use-after-free regression reported by Johan Hovold

-Mathias

Ben Dooks (Codethink) (1):
  usb: xhci: fix __le32/__le64 accessors in debugfs code

Mathias Nyman (1):
  xhci: Fix use-after-free regression in xhci clear hub TT
    implementation

Samuel Holland (1):
  usb: xhci: fix Immediate Data Transfer endianness

 drivers/usb/host/xhci-debugfs.c | 24 +++++++++---------
 drivers/usb/host/xhci-ring.c    |  2 ++
 drivers/usb/host/xhci.c         | 54 ++++++++++++++++++++++++++++++++++-------
 3 files changed, 59 insertions(+), 21 deletions(-)

-- 
2.7.4

