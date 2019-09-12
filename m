Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01B52B11AC
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2019 17:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732908AbfILPBF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Sep 2019 11:01:05 -0400
Received: from mail.centricular.com ([50.116.37.142]:50756 "EHLO
        mail.centricular.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732728AbfILPBE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Sep 2019 11:01:04 -0400
X-Greylist: delayed 582 seconds by postgrey-1.27 at vger.kernel.org; Thu, 12 Sep 2019 11:01:04 EDT
Received: from localhost (localhost [127.0.0.1])
        by mail.centricular.com (Postfix) with ESMTP id 2CF4E58B9D;
        Fri, 13 Sep 2019 00:51:22 +1000 (AEST)
X-Virus-Scanned: Debian amavisd-new at centricular.com
Authentication-Results: worm-farm.widgetgrove.com.au (amavisd-new);
        dkim=neutral reason="invalid (public key: not available)"
        header.d=centricular.com
Received: from mail.centricular.com ([127.0.0.1])
        by localhost (worm-farm.widgetgrove.com.au [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id kf2y9-AUm6bz; Fri, 13 Sep 2019 00:51:21 +1000 (AEST)
Received: from pimiento.home (180-150-69-32.b49645.syd.nbn.aussiebb.net [180.150.69.32])
        by mail.centricular.com (Postfix) with ESMTPSA id 2A6D958B7A;
        Fri, 13 Sep 2019 00:51:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=centricular.com;
        s=201701; t=1568299881;
        bh=0blo9GSKmoh1xANDh/GKuX1iNWqq2qOcdPcEvx0aDMQ=;
        h=From:To:Cc:Subject:Date:From;
        b=VUxF9EkTQjkD7/7FMX1enkjyBhxmN0wVjsiwE5aGCYs5z+b9CyxH3kYzsVHSSByMM
         UqLGcmeO1135CWLiEQRC1sDj6wfPRBIrtmqtJff+XtBpkZRngst2b4K5HdrxS+ip0G
         Nj2TJi0YyJUnYB5ydKRZMrSMvhmo6PxVnLo7cuSb74IarkAAeVw5IyFoT+h5ch4iy1
         96KKeEQpPiHN+FNYQ9kp0e2BuzE/Gp3QsM7Vfk2j1NL7PTzDCBQyl/UmZwq7Pw3g5k
         SeNrKf/ufwgeuif9e03k7ftuG8nxMa4jNofnHyYuyM4l5kKciSCBTWXhFaI3U54yl3
         CtJfzzjb5HfUw==
From:   Jan Schmidt <jan@centricular.com>
To:     linux-usb@vger.kernel.org
Cc:     Jan Schmidt <jan@centricular.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] xhci: Check all endpoints for LPM timeout
Date:   Fri, 13 Sep 2019 00:49:21 +1000
Message-Id: <20190912144921.368-1-jan@centricular.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If an endpoint is encountered that returns USB3_LPM_DEVICE_INITIATED, keep
checking further endpoints, as there might be periodic endpoints later
that return USB3_LPM_DISABLED due to shorter service intervals.

Without this, the code can set too high a maximum-exit-latency and
prevent the use of multiple USB3 cameras that should be able to work.

Signed-off-by: Jan Schmidt <jan@centricular.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/usb/host/xhci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 03d1e552769b..1986b88661fc 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4673,12 +4673,12 @@ static int xhci_update_timeout_for_endpoint(struct xhci_hcd *xhci,
 	alt_timeout = xhci_call_host_update_timeout_for_endpoint(xhci, udev,
 		desc, state, timeout);
 
-	/* If we found we can't enable hub-initiated LPM, or
+	/* If we found we can't enable hub-initiated LPM, and
 	 * the U1 or U2 exit latency was too high to allow
-	 * device-initiated LPM as well, just stop searching.
+	 * device-initiated LPM as well, then we will disable LPM
+	 * for this device, so stop searching any further.
 	 */
-	if (alt_timeout == USB3_LPM_DISABLED ||
-			alt_timeout == USB3_LPM_DEVICE_INITIATED) {
+	if (alt_timeout == USB3_LPM_DISABLED) {
 		*timeout = alt_timeout;
 		return -E2BIG;
 	}
-- 
2.21.0

