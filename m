Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 675B12E836B
	for <lists+linux-usb@lfdr.de>; Fri,  1 Jan 2021 10:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbhAAJxL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 1 Jan 2021 04:53:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:53520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726462AbhAAJxK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 1 Jan 2021 04:53:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 60F25221E9
        for <linux-usb@vger.kernel.org>; Fri,  1 Jan 2021 09:52:30 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4A3EE816ED; Fri,  1 Jan 2021 09:52:30 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209407] skb_over_panic in cdc_mbim_tx_fixup
Date:   Fri, 01 Jan 2021 09:52:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jks@iki.fi
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209407-208809-UavBF3lJBS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209407-208809@https.bugzilla.kernel.org/>
References: <bug-209407-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209407

--- Comment #7 from Jouni Seppänen (jks@iki.fi) ---
It looks like the code is calling memset with 0xFFFFFFFE, i.e. negative 2. I
added a check in the "If collected data size is less or equal ctx->min_tx_pkt"
block:

        if (!(dev->driver_info->flags & FLAG_SEND_ZLP) &&
            skb_out->len > ctx->min_tx_pkt) {
                if (ctx->tx_curr_size < skb_out->len) {
                        pr_err("ctx->tx_curr_size = %x < skb_out->len = %x",
ctx->tx_curr_size, skb_out->len);
                        BUG();
                }
                padding_count = ctx->tx_curr_size - skb_out->len;

And after rerunning my test case, I see:

[  683.677876] ctx->tx_curr_size = 4000 < skb_out->len = 4002
[  683.677953] ------------[ cut here ]------------
[  683.683590] kernel BUG at drivers/net/usb/cdc_ncm.c:1414!

So ctx->tx_curr_size is 0x4000 but skb_out->len is two larger.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
