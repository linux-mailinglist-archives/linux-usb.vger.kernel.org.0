Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA3271D165
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2019 23:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfENVim (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 May 2019 17:38:42 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:33658 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726338AbfENVim (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 May 2019 17:38:42 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ACD25C01E2;
        Tue, 14 May 2019 21:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1557869926; bh=3Y6CAzzUoINQblswnFSRxSuhjhXjq5RQ36NuSQSgVtw=;
        h=Date:In-Reply-To:References:From:Subject:To:CC:From;
        b=BaawQO3vGjsCaSufuPw/A97hVtYVCt3p1lNkMSNnvoYgL/m+8FgyNibL3zKYfG8gh
         1UMbkJ9ui3IHwqL4hN3H2RSvC72dhj6Fxs+PozH6LsQm1hqqsIrE65quoDMHcQSyNS
         W57P+7pCcShbgC0tDNP9B1hEAJ7izg5FEMU/UNHrJrdUqGJqHHjckOuiFRl3KPFDBw
         mAUDZftHGq+Gu9aPc/TfdaTEIMCzOdS1/PkKl8n5OEf7Nc3ZfQffjZI+6TvaBlWE0E
         PmUZy1Sh590P/944IjrwBb8pPv8CneLxq857FWZ2F7snxSxuYvahTuvHx9YhXzfPv7
         Tj2VEh6VeyWxw==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 000CEA023B;
        Tue, 14 May 2019 21:38:39 +0000 (UTC)
Received: from US01WEHTC1.internal.synopsys.com (10.12.239.236) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 14 May 2019 14:38:39 -0700
Received: from te-lab16 (10.13.184.19) by us01wehtc1.internal.synopsys.com
 (10.12.239.236) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 14 May
 2019 14:38:38 -0700
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 14 May 2019 14:38:38
 -0700
Date:   Tue, 14 May 2019 14:38:38 -0700
Message-ID: <84e7b407523dbba982e47d7996332866012ab60f.1557869140.git.thinhn@synopsys.com>
In-Reply-To: <e4d539c430598d2ac5b75e48dec807e855adcb76.1557869140.git.thinhn@synopsys.com>
References: <e4d539c430598d2ac5b75e48dec807e855adcb76.1557869140.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 2/2] usb: core: hub: Disable hub-initiated U1/U2
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mathieu Malaterre <malat@debian.org>,
        "Nicolas Saenz Julienne" <nsaenzjulienne@suse.de>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Jon Flatley <jflat@chromium.org>,
        "Nicolas Boichat" <drinkcat@chromium.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.184.19]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the device rejects the control transfer to enable device-initiated
U1/U2 entry, then the device will not initiate U1/U2 transition. To
improve the performance, the downstream port should not initate
transition to U1/U2 to avoid the delay from the device link command
response (no packet can be transmitted while waiting for a response from
the device). If the device has some quirks and does not implement U1/U2,
it may reject all the link state change requests, and the downstream
port may resend and flood the bus with more requests. This will affect
the device performance even further. This patch disables the
hub-initated U1/U2 if the device-initiated U1/U2 entry fails.

Reference: USB 3.2 spec 7.2.4.2.3

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/core/hub.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 026b652d4f38..572e8c26a129 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3999,6 +3999,9 @@ static int usb_set_lpm_timeout(struct usb_device *udev,
  * control transfers to set the hub timeout or enable device-initiated U1/U2
  * will be successful.
  *
+ * If the control transfer to enable device-initiated U1/U2 entry fails, then
+ * hub-initiated U1/U2 will be disabled.
+ *
  * If we cannot set the parent hub U1/U2 timeout, we attempt to let the xHCI
  * driver know about it.  If that call fails, it should be harmless, and just
  * take up more slightly more bus bandwidth for unnecessary U1/U2 exit latency.
@@ -4053,23 +4056,24 @@ static void usb_enable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
 		 * host know that this link state won't be enabled.
 		 */
 		hcd->driver->disable_usb3_lpm_timeout(hcd, udev, state);
-	} else {
-		/* Only a configured device will accept the Set Feature
-		 * U1/U2_ENABLE
-		 */
-		if (udev->actconfig)
-			usb_set_device_initiated_lpm(udev, state, true);
+		return;
+	}
 
-		/* As soon as usb_set_lpm_timeout(timeout) returns 0, the
-		 * hub-initiated LPM is enabled. Thus, LPM is enabled no
-		 * matter the result of usb_set_device_initiated_lpm().
-		 * The only difference is whether device is able to initiate
-		 * LPM.
-		 */
+	/* Only a configured device will accept the Set Feature
+	 * U1/U2_ENABLE
+	 */
+	if (udev->actconfig &&
+	    usb_set_device_initiated_lpm(udev, state, true) == 0) {
 		if (state == USB3_LPM_U1)
 			udev->usb3_lpm_u1_enabled = 1;
 		else if (state == USB3_LPM_U2)
 			udev->usb3_lpm_u2_enabled = 1;
+	} else {
+		/* Don't request U1/U2 entry if the device
+		 * cannot transition to U1/U2.
+		 */
+		usb_set_lpm_timeout(udev, state, 0);
+		hcd->driver->disable_usb3_lpm_timeout(hcd, udev, state);
 	}
 }
 
-- 
2.11.0

