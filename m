Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3243519A685
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 09:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732004AbgDAHsa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Apr 2020 03:48:30 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:48312 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731849AbgDAHs3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Apr 2020 03:48:29 -0400
Received: by mail-qt1-f202.google.com with SMTP id n89so20318912qte.15
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2020 00:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=9Kyv0prcq9XMUnz5AhbcrUNUlnYWKeEXqgffzhkXFWA=;
        b=jsHHYk7dPh8l3V65PglhCNfzdfr4ELueU70iRPAREdQ94vaaPDGDJ6aWjYOKyFeStd
         dYwOG4IYk1dr5KBEHNeTBMRQTCUKpEeDHeges7/7DVUAW7V5yIFdHAzlBRRM6xjNFQ4C
         7DwdjO51OlM/AeHSMNwQRwkITLyQGJ//2rwTFpn/iQL/PJT7T3LlZ0bPaciCn0xB81rx
         bLqkxvrfnqY9xFudLMOgEmtrTYGM5YtXQuYI3mEl07U60jMXw2hhqXFFjf6Tv3wQOI5l
         iQJkX7RcyBC4VnEiU3BRPzPfxKL6znpEbzrn0BEP/IiDOBfK9DGr0GQ22sGcMHY3eTc2
         Otzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=9Kyv0prcq9XMUnz5AhbcrUNUlnYWKeEXqgffzhkXFWA=;
        b=qPygI43m5rnohJAqIrB+6P+31jx/WVPhOlGoopXGOgFB6GGg4N7G2CnLCLenjiKDXk
         oieewN5WkYrZtIDrOyQE5pNLhBMJpBqFGqlijGSfZ4ULC6DVhrIcPtrm9HzR+xtqmdjN
         XGeUCnF0g86tp4X1g71a8YfJXf5nxmYiYIQJwljTaKWzzebB/EZ7HD6uvwv6FFIFoJSm
         F+MyUnsWsvj1V49DHAMPFEW51vqWdv/6ZzCX3zLQoFY0+jVJop06oaRwCml9orHgOVfW
         Rik6x12jS33lSTpPmKIxY38AmYNM7C16gW9jWcWiR383ciy64UzR4llM2niStNaz8GHF
         o+MA==
X-Gm-Message-State: ANhLgQ1g+f3GfnaEVMtIgV2dMkC1nKh2CJHsDaYKJcjBSwfzBADMSdXN
        nQrZBOFc0jpxJ7lFHPo056rLXdwJTw==
X-Google-Smtp-Source: ADFU+vs0J+dnV0qXZSaE6dsczISxwq2tsmQhXz2c/IezSINTsy/Wi7PsMw/WL+Sz8BHmSE64GhoPwYjikA==
X-Received: by 2002:a37:8503:: with SMTP id h3mr8333290qkd.499.1585727308291;
 Wed, 01 Apr 2020 00:48:28 -0700 (PDT)
Date:   Wed,  1 Apr 2020 09:46:19 +0200
Message-Id: <20200401074619.8024-1-jannh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH] USB: early: Handle AMD's spec-compliant identifiers, too
From:   Jann Horn <jannh@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Lu Baolu <baolu.lu@linux.intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This fixes a bug that causes the USB3 early console to freeze after
printing a single line on AMD machines because it can't parse the
Transfer TRB properly.

The spec at
https://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/extensible-host-controler-interface-usb-xhci.pdf
says in section "4.5.1 Device Context Index" that the Context Index,
also known as Endpoint ID according to
section "1.6 Terms and Abbreviations", is normally computed as
`DCI = (Endpoint Number * 2) + Direction`, which matches the current
definitions of XDBC_EPID_OUT and XDBC_EPID_IN.

However, the numbering in a Debug Capability Context data structure is
supposed to be different:
Section "7.6.3.2 Endpoint Contexts and Transfer Rings" explains that a
Debug Capability Context data structure has the endpoints mapped to indices
0 and 1.

Change XDBC_EPID_OUT/XDBC_EPID_IN to the spec-compliant values, add
XDBC_EPID_OUT_INTEL/XDBC_EPID_IN_INTEL with Intel's incorrect values, and
let xdbc_handle_tx_event() handle both.

I have verified that with this patch applied, the USB3 early console works
on both an Intel and an AMD machine.

Fixes: aeb9dd1de98c ("usb/early: Add driver for xhci debug capability")
Cc: stable@vger.kernel.org
Signed-off-by: Jann Horn <jannh@google.com>
---
 drivers/usb/early/xhci-dbc.c |  8 ++++----
 drivers/usb/early/xhci-dbc.h | 18 ++++++++++++++++--
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index cac991173ac0..5a462a1d1896 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -728,19 +728,19 @@ static void xdbc_handle_tx_event(struct xdbc_trb *evt_trb)
 	case COMP_USB_TRANSACTION_ERROR:
 	case COMP_STALL_ERROR:
 	default:
-		if (ep_id == XDBC_EPID_OUT)
+		if (ep_id == XDBC_EPID_OUT || ep_id == XDBC_EPID_OUT_INTEL)
 			xdbc.flags |= XDBC_FLAGS_OUT_STALL;
-		if (ep_id == XDBC_EPID_IN)
+		if (ep_id == XDBC_EPID_IN || ep_id == XDBC_EPID_IN_INTEL)
 			xdbc.flags |= XDBC_FLAGS_IN_STALL;
 
 		xdbc_trace("endpoint %d stalled\n", ep_id);
 		break;
 	}
 
-	if (ep_id == XDBC_EPID_IN) {
+	if (ep_id == XDBC_EPID_IN || ep_id == XDBC_EPID_IN_INTEL) {
 		xdbc.flags &= ~XDBC_FLAGS_IN_PROCESS;
 		xdbc_bulk_transfer(NULL, XDBC_MAX_PACKET, true);
-	} else if (ep_id == XDBC_EPID_OUT) {
+	} else if (ep_id == XDBC_EPID_OUT || ep_id == XDBC_EPID_OUT_INTEL) {
 		xdbc.flags &= ~XDBC_FLAGS_OUT_PROCESS;
 	} else {
 		xdbc_trace("invalid endpoint id %d\n", ep_id);
diff --git a/drivers/usb/early/xhci-dbc.h b/drivers/usb/early/xhci-dbc.h
index 673686eeddd7..6e2b7266a695 100644
--- a/drivers/usb/early/xhci-dbc.h
+++ b/drivers/usb/early/xhci-dbc.h
@@ -120,8 +120,22 @@ struct xdbc_ring {
 	u32			cycle_state;
 };
 
-#define XDBC_EPID_OUT		2
-#define XDBC_EPID_IN		3
+/*
+ * These are the "Endpoint ID" (also known as "Context Index") values for the
+ * OUT Transfer Ring and the IN Transfer Ring of a Debug Capability Context data
+ * structure.
+ * According to the "eXtensible Host Controller Interface for Universal Serial
+ * Bus (xHCI)" specification, section "7.6.3.2 Endpoint Contexts and Transfer
+ * Rings", these should be 0 and 1, and those are the values AMD machines give
+ * you; but Intel machines seem to use the formula from section "4.5.1 Device
+ * Context Index", which is supposed to be used for the Device Context only.
+ * Luckily the values from Intel don't overlap with those from AMD, so we can
+ * just test for both.
+ */
+#define XDBC_EPID_OUT		0
+#define XDBC_EPID_IN		1
+#define XDBC_EPID_OUT_INTEL	2
+#define XDBC_EPID_IN_INTEL	3
 
 struct xdbc_state {
 	u16			vendor;
-- 
2.26.0.rc2.310.g2932bb562d-goog

