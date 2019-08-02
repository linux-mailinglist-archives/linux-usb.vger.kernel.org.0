Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 725057FCE6
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2019 16:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395078AbfHBO7F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Aug 2019 10:59:05 -0400
Received: from mga06.intel.com ([134.134.136.31]:55329 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726505AbfHBO7F (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 2 Aug 2019 10:59:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Aug 2019 07:59:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,338,1559545200"; 
   d="scan'208";a="167253792"
Received: from mattu-haswell.fi.intel.com ([10.237.72.164])
  by orsmga008.jf.intel.com with ESMTP; 02 Aug 2019 07:59:03 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>, eballetbo@gmail.com,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH] xhci: Fix NULL pointer dereference at endpoint zero reset.
Date:   Fri,  2 Aug 2019 18:00:44 +0300
Message-Id: <1564758044-24748-1-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Usb core will reset the default control endpoint "ep0" before resetting
a device. if the endpoint has a valid pointer back to the usb device
then the xhci driver reset callback will try to clear the toggle for
the endpoint.

ep0 didn't use to have this pointer set as ep0 was always allocated
by default together with a xhci slot for the usb device. Other endpoints
got their usb device pointer set in xhci_add_endpoint()

This changed with commit ef513be0a905 ("usb: xhci: Add Clear_TT_Buffer")
which sets the pointer for any endpoint on a FS/LS device behind a
HS hub that halts, including ep0.

If xHC controller needs to be reset at resume, then all the xhci slots
will be lost. Slots will be reenabled and reallocated at device reset,
but unlike other endpoints the ep0 is reset before device reset, while
the xhci slot may still be invalid, causing NULL pointer dereference.

Fix it by checking that the endpoint has both a usb device pointer and
valid xhci slot before trying to clear the toggle.

This issue was not seen earlier as ep0 didn't use to have a valid usb
device pointer, and other endpoints were only reset after device reset
when xhci slots were properly reenabled.

Reported-by: Bob Gleitsmann <rjgleits@bellsouth.net>
Reported-by: Enric Balletbo Serra <eballetbo@gmail.com>
Fixes: ef513be0a905 ("usb: xhci: Add Clear_TT_Buffer")
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 248cd7a..03d1e55 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3089,8 +3089,18 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 		return;
 	udev = (struct usb_device *) host_ep->hcpriv;
 	vdev = xhci->devs[udev->slot_id];
+
+	/*
+	 * vdev may be lost due to xHC restore error and re-initialization
+	 * during S3/S4 resume. A new vdev will be allocated later by
+	 * xhci_discover_or_reset_device()
+	 */
+	if (!udev->slot_id || !vdev)
+		return;
 	ep_index = xhci_get_endpoint_index(&host_ep->desc);
 	ep = &vdev->eps[ep_index];
+	if (!ep)
+		return;
 
 	/* Bail out if toggle is already being cleared by a endpoint reset */
 	if (ep->ep_state & EP_HARD_CLEAR_TOGGLE) {
-- 
2.7.4

