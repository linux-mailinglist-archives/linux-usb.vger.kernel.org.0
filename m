Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9A9D262FA
	for <lists+linux-usb@lfdr.de>; Wed, 22 May 2019 13:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728703AbfEVLbl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 May 2019 07:31:41 -0400
Received: from mga14.intel.com ([192.55.52.115]:39534 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728335AbfEVLbl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 May 2019 07:31:41 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 May 2019 04:31:40 -0700
X-ExtLoop1: 1
Received: from mattu-haswell.fi.intel.com ([10.237.72.164])
  by orsmga003.jf.intel.com with ESMTP; 22 May 2019 04:31:39 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>, Jia-Ju Bai <baijiaju1990@gmail.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/5] usb: xhci: Fix a potential null pointer dereference in xhci_debugfs_create_endpoint()
Date:   Wed, 22 May 2019 14:33:58 +0300
Message-Id: <1558524841-25397-3-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558524841-25397-1-git-send-email-mathias.nyman@linux.intel.com>
References: <1558524841-25397-1-git-send-email-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Jia-Ju Bai <baijiaju1990@gmail.com>

In xhci_debugfs_create_slot(), kzalloc() can fail and
dev->debugfs_private will be NULL.
In xhci_debugfs_create_endpoint(), dev->debugfs_private is used without
any null-pointer check, and can cause a null pointer dereference.

To fix this bug, a null-pointer check is added in
xhci_debugfs_create_endpoint().

This bug is found by a runtime fuzzing tool named FIZZER written by us.

[subjet line change change, add potential -Mathais]
Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index cadc013..7ba6afc 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -440,6 +440,9 @@ void xhci_debugfs_create_endpoint(struct xhci_hcd *xhci,
 	struct xhci_ep_priv	*epriv;
 	struct xhci_slot_priv	*spriv = dev->debugfs_private;
 
+	if (!spriv)
+		return;
+
 	if (spriv->eps[ep_index])
 		return;
 
-- 
2.7.4

