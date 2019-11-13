Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B091FB110
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2019 14:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfKMNHc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Nov 2019 08:07:32 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52664 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbfKMNHc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Nov 2019 08:07:32 -0500
Received: by mail-wm1-f65.google.com with SMTP id l1so1929381wme.2
        for <linux-usb@vger.kernel.org>; Wed, 13 Nov 2019 05:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=lUjTm0hl+7ItNZAIYW3AMjmorv6OxKhwGw2OlCF8Jh8=;
        b=c3nL5yQF2MGKfzQyzykD97oE5UAOfdfl8jcaVPxNlwwRLoxd+a+Y4bSKxO+08CeL9B
         t2hmkAZfQ0kL3RVF9e4UupyxiF6Pd7nYUDz20Lapba1G6tdkjpR5NvRn0pmQNv7+E5Ob
         nWUH5O6SLbhIvxUNVnERo4LDL69OjKKTOdcaLzeWb1wEpOgxTURIVAqAWB8Oi/SJEbLk
         Jw5EC8TP0v1JkAO60ZxG5Gbpb0dMELxDjlgYu4Cb4hin0Q9Gnj7h1RrimnBCRlyjTExA
         vIZBUg3AS4y3beeKRzpp9R0nB28aZC1XFXuQnBXLmpfasaxG38eQeRfmrnwK3uZYEpfk
         CI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lUjTm0hl+7ItNZAIYW3AMjmorv6OxKhwGw2OlCF8Jh8=;
        b=KIuzTgvB6GFwl0IEH85jDFDYzuwbwiRagHJa2KU1lL+o/ARcn4onaxLzoruK/vZaNJ
         Fn1mE6Q6flACY+vjhCw4SHJ2/Yar1HNHAXc8k7il1jjaYGl63mGnoHUk96PggQTJ8Bws
         J60bKjgQaO9wpoFycOqyK6axFrFhdEyUZDtUpZQEENQHK6Iu+3aZe8bpW3sVMy5nFgaD
         AqTDx4ypwY7CRn64mgV8w084elBV6dTarXXiLhUDGl7j4vKvhQyFxCkl/cJ2+nnqfKoU
         sSY6j+bjKc1aaE3JZOyrk/VpEEcNkaK+z33waNQF7TMVeYmnIJf3n61oGWNcyiCq19yh
         Z2XQ==
X-Gm-Message-State: APjAAAWi9NsQZWdrI0KCZmtkue9vny1kBjyLezsI/1unp6ZTO92eCSbE
        rqkHOteuqgbK6DnXFA5XFoY=
X-Google-Smtp-Source: APXvYqwjVB6HUuhAEqiVih6F53BxVD/NbUvBK1dYHYAQQXJCN7bP/udmN04FFmAcqzCi+ULe1vMZ2Q==
X-Received: by 2002:a7b:cb59:: with SMTP id v25mr2706553wmj.159.1573650449912;
        Wed, 13 Nov 2019 05:07:29 -0800 (PST)
Received: from ruhe.localdomain (93-172-117-241.bb.netvision.net.il. [93.172.117.241])
        by smtp.gmail.com with ESMTPSA id v128sm2811283wmb.14.2019.11.13.05.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 05:07:29 -0800 (PST)
From:   eli.billauer@gmail.com
To:     mathias.nyman@linux.intel.com
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org,
        Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH] xhci: No XHCI_TRUST_TX_LENGTH check in the absence of matching TD
Date:   Wed, 13 Nov 2019 15:06:09 +0200
Message-Id: <20191113130609.32831-1-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Eli Billauer <eli.billauer@gmail.com>

When an IN transfer ends with a short packet, the xHCI controller is
required to submit an event TRB with Completion Code COMP_SHORT_PACKET
against the data TRB that was in effect when the short packet arrived, as
well as any event TRBs it submits on behalf of this transfer.

Alas, some controllers (e.g. Renesas) mark the subsequent events TRBs (if
any) with COMP_SUCCESS. As these subsequent event TRBs are useless, they
are ignored on the basis that they have no matching TD queued (it was
dequeued in response to the first COMP_SHORT_PACKET event TRB).

Accordingly, the quirk handling and kernel log warning is moved to after
the TD match check, in particular in order to avoid unnecessary warnings
messages.

Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9741cdeea9d7..96680eb71a45 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2376,14 +2376,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	 * transfer type
 	 */
 	case COMP_SUCCESS:
-		if (EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)) == 0)
-			break;
-		if (xhci->quirks & XHCI_TRUST_TX_LENGTH)
-			trb_comp_code = COMP_SHORT_PACKET;
-		else
-			xhci_warn_ratelimited(xhci,
-					      "WARN Successful completion on short TX for slot %u ep %u: needs XHCI_TRUST_TX_LENGTH quirk?\n",
-					      slot_id, ep_index);
 	case COMP_SHORT_PACKET:
 		break;
 	/* Completion codes for endpoint stopped state */
@@ -2586,6 +2578,17 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			skip_isoc_td(xhci, td, event, ep, &status);
 			goto cleanup;
 		}
+
+		if ((trb_comp_code == COMP_SUCCESS) &&
+		    (EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)) != 0)) {
+			if (xhci->quirks & XHCI_TRUST_TX_LENGTH)
+				trb_comp_code = COMP_SHORT_PACKET;
+			else
+				xhci_warn_ratelimited(xhci,
+						      "WARN Successful completion on short TX for slot %u ep %u: needs XHCI_TRUST_TX_LENGTH quirk?\n",
+						      slot_id, ep_index);
+		}
+
 		if (trb_comp_code == COMP_SHORT_PACKET)
 			ep_ring->last_td_was_short = true;
 		else
-- 
2.17.1

