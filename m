Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14FB930EB77
	for <lists+linux-usb@lfdr.de>; Thu,  4 Feb 2021 05:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbhBDEMO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 23:12:14 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:43696 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231794AbhBDEMK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Feb 2021 23:12:10 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 368C640870;
        Thu,  4 Feb 2021 04:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612411870; bh=JOCk3iuqFHqaKbOtYqXQp3xGMGo/G/y1enrVqMFJT8Y=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=lcdgtfpVgelFFj1d6PvCd1UyvfjyGW3FPwnFUBT0oqOpQounP9JtyhHxCurcbwHC4
         dYqQ0E8UV/5YixpE8M7axcvb55At5KnYsnhHoCqvLKMeghuL69eJNilL6/hrQ6a3Cp
         LUZ1BxPSfpJe6ddFMJ9ACWxqMOe1npAMVHvJykhD4qz7Jadt0DDW566HOYQKHs1iYA
         4C31nDNyw/olKrothXHv6NcqHma61hfgUkv2ESWd9Afo73DECyuDirGieMnDAbJZXL
         NK2Guz/b4ZspXN/BAwol8VbFB5A5pZfzydh9AUNr9f6C6vWhfeBPJjNDaPuPzFXo2s
         0RGJbFq65MXUA==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 2377DA007C;
        Thu,  4 Feb 2021 04:11:09 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 03 Feb 2021 20:11:09 -0800
Date:   Wed, 03 Feb 2021 20:11:09 -0800
Message-Id: <79abded6965de23d305f3f928094ec5fca69d664.1612410491.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1612410491.git.Thinh.Nguyen@synopsys.com>
References: <cover.1612410491.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 6/8] usb: xhci: Fix port minor revision
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some hosts incorrectly use sub-minor version for minor version (i.e.
0x02 instead of 0x20 for bcdUSB 0x320 and 0x01 for bcdUSB 0x310).
Currently the xHCI driver works around this by just checking for minor
revision > 0x01 for USB 3.1 everywhere. With the addition of USB 3.2,
checking this gets a bit cumbersome. Since there is no USB release with
bcdUSB 0x301 to 0x309, we can assume that sub-minor version 01 to 09 is
incorrect. Let's try to fix this and use the minor revision that matches
with the USB/xHCI spec to help with the version checking within the
driver.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v2:
- Use <<= when shift and assign value instead

 drivers/usb/host/xhci-mem.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index f2c4ee7c4786..d6f8093aaf53 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2129,6 +2129,15 @@ static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
 
 	if (major_revision == 0x03) {
 		rhub = &xhci->usb3_rhub;
+		/*
+		 * Some hosts incorrectly use sub-minor version for minor
+		 * version (i.e. 0x02 instead of 0x20 for bcdUSB 0x320 and 0x01
+		 * for bcdUSB 0x310). Since there is no USB release with sub
+		 * minor version 0x301 to 0x309, we can assume that they are
+		 * incorrect and fix it here.
+		 */
+		if (!(minor_revision & 0xf0) && (minor_revision & 0x0f))
+			minor_revision <<= 4;
 	} else if (major_revision <= 0x02) {
 		rhub = &xhci->usb2_rhub;
 	} else {
-- 
2.28.0

