Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0703D336AE0
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 04:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbhCKDni (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 22:43:38 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:50234 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231126AbhCKDnX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 22:43:23 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2A2B5C0A42;
        Thu, 11 Mar 2021 03:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1615434203; bh=oV6J/DL1mt3xSX8SylGjLR/g1h13UnyEwveIicQHs1M=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=FjqG8qrcr2bUXB6pVYH1wkBG7rFGGyyb078w4ru+tWNJOtL3tJKMRqhdemAHm+ZA6
         8+91ZlAPopF71FNWKKcOk+62lyukbfMr+qgyZnX0lnFndPBka1NDdfExNPkTD2st3H
         0kTtSgYScTRUaKvNZvlx2TZy0YGDEQXVbYFEmM8LJPqtK8h9sFyyPTdBLtgOOeLmCv
         D8+5J4hakT+PssAuSScvIw1F9togcR5UoW+VBWOrQJm5qPFbFdM+3GRjLdS+vgvhqT
         jHqOLHgvf+gifr/EXBRPQnQbfqinnRVuEOaz15t8QnKfd2PF5NaQfklQSK0IpYCHZt
         ZceXIZ11C+lUQ==
Received: from lab-vbox (unknown [10.205.137.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id E0A34A005E;
        Thu, 11 Mar 2021 03:43:21 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Wed, 10 Mar 2021 19:43:21 -0800
Date:   Wed, 10 Mar 2021 19:43:21 -0800
Message-Id: <ed330e95a19dc367819c5b4d78bf7a541c35aa0a.1615432770.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1615432770.git.Thinh.Nguyen@synopsys.com>
References: <cover.1615432770.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 6/8] usb: xhci: Fix port minor revision
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
Changes in v3:
- Use comparison operators > < instead of & operation for easier read
Changes in v2:
- Use <<= when shift and assign value instead

 drivers/usb/host/xhci-mem.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 7eb8c07c8418..34d95c006751 100644
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
+		if (minor_revision > 0x00 && minor_revision < 0x10)
+			minor_revision <<= 4;
 	} else if (major_revision <= 0x02) {
 		rhub = &xhci->usb2_rhub;
 	} else {
-- 
2.28.0

