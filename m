Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C89CB229B23
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 17:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732648AbgGVPR4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 22 Jul 2020 11:17:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:43860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728046AbgGVPRz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jul 2020 11:17:55 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208327] xhci_hcd issue transfer event - usb3.0
Date:   Wed, 22 Jul 2020 15:17:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208327-208809-uJJJ129xzf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208327-208809@https.bugzilla.kernel.org/>
References: <bug-208327-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208327

--- Comment #10 from sander44 (ionut_n2001@yahoo.com) ---
I tried with this change:

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 2c255d0620b0..964cacc1092e 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2302,6 +2302,7 @@ static int process_bulk_intr_td(struct xhci_hcd *xhci,
struct xhci_td *td,
                remaining       = 0;
                break;
        case COMP_USB_TRANSACTION_ERROR:
+               break;
                if ((ep_ring->err_count++ > MAX_SOFT_RETRY) ||
                    le32_to_cpu(slot_ctx->tt_info) & TT_SLOT)
                        break;

And it doesn't help.
Error messages still appear.

[  245.472838] xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not part
of current TD ep_index 1 comp_code 1
[  245.473676] xhci_hcd 0000:00:14.0: Looking for event-dma 000000035ae0cea0
trb-start 000000035ae0ceb0 trb-end 000000035ae0ceb0 seg-start 000000035ae0c000
seg-end 000000035ae0cff0
[  245.473828] xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not part
of current TD ep_index 1 comp_code 1
[  245.474575] xhci_hcd 0000:00:14.0: Looking for event-dma 000000035ae0ceb0
trb-start 000000035ae0cec0 trb-end 000000035ae0cec0 seg-start 000000035ae0c000
seg-end 000000035ae0cff0
[  245.474829] xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not part
of current TD ep_index 1 comp_code 1
[  245.475710] xhci_hcd 0000:00:14.0: Looking for event-dma 000000035ae0cec0
trb-start 000000035ae0ced0 trb-end 000000035ae0ced0 seg-start 000000035ae0c000
seg-end 000000035ae0cff0
[  245.475828] xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not part
of current TD ep_index 1 comp_code 1
[  245.476706] xhci_hcd 0000:00:14.0: Looking for event-dma 000000035ae0ced0
trb-start 000000035ae0cee0 trb-end 000000035ae0cee0 seg-start 000000035ae0c000
seg-end 000000035ae0cff0

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
