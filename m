Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05E0E229985
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 15:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732645AbgGVNpx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 22 Jul 2020 09:45:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:33946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732623AbgGVNpx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jul 2020 09:45:53 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208327] xhci_hcd issue transfer event - usb3.0
Date:   Wed, 22 Jul 2020 13:45:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208327-208809-Qmml4odgR3@https.bugzilla.kernel.org/>
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

--- Comment #7 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
To check if this is related to the soft retry of the transaction errors
we could prevent soft retry with the following change:

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


Does that help?
After this chagen you should still see the Transactio errors, but not the
"Transfer event TRB DMA ptr not part of current TD.." message.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
