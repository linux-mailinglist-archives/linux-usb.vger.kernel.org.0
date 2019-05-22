Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DEF9262F7
	for <lists+linux-usb@lfdr.de>; Wed, 22 May 2019 13:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728536AbfEVLbi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 May 2019 07:31:38 -0400
Received: from mga14.intel.com ([192.55.52.115]:39534 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728335AbfEVLbi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 May 2019 07:31:38 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 May 2019 04:31:37 -0700
X-ExtLoop1: 1
Received: from mattu-haswell.fi.intel.com ([10.237.72.164])
  by orsmga003.jf.intel.com with ESMTP; 22 May 2019 04:31:35 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/5] xhci fixes for usb-linus
Date:   Wed, 22 May 2019 14:33:56 +0300
Message-Id: <1558524841-25397-1-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few fixes for usb-linus, including regression fix for xhci IDT support
which was added to 5.2-rc1

-Mathias

Andrey Smirnov (1):
  xhci: Convert xhci_handshake() to use readl_poll_timeout_atomic()

Carsten Schmid (1):
  usb: xhci: avoid null pointer deref when bos field is NULL

Henry Lin (1):
  xhci: update bounce buffer with correct sg num

Jia-Ju Bai (1):
  usb: xhci: Fix a potential null pointer dereference in
    xhci_debugfs_create_endpoint()

Mathias Nyman (1):
  xhci: Fix immediate data transfer if buffer is already DMA mapped

 drivers/usb/host/xhci-debugfs.c |  3 +++
 drivers/usb/host/xhci-ring.c    | 26 +++++++++++++++++++-------
 drivers/usb/host/xhci.c         | 24 +++++++++++-------------
 drivers/usb/host/xhci.h         |  3 ++-
 4 files changed, 35 insertions(+), 21 deletions(-)

-- 
2.7.4

