Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787AE2E842F
	for <lists+linux-usb@lfdr.de>; Fri,  1 Jan 2021 17:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbhAAQZr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 1 Jan 2021 11:25:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:60510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727088AbhAAQZr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 1 Jan 2021 11:25:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 85B13221F2
        for <linux-usb@vger.kernel.org>; Fri,  1 Jan 2021 16:25:06 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 72C83816ED; Fri,  1 Jan 2021 16:25:06 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209407] cdc_ncm_fill_tx_frame calls memset with huge length
 when called from cdc_mbim_tx_fixup
Date:   Fri, 01 Jan 2021 16:25:06 +0000
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
Message-ID: <bug-209407-208809-LJamfKQL4n@https.bugzilla.kernel.org/>
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

--- Comment #8 from Jouni Seppänen (jks@iki.fi) ---
I can't claim to understand what all the code in these files does, but I
noticed a couple of things:

The functions cdc_ncm_ndp16 and cdc_ncm_ndp32 include this check:

        /* verify that there is room for the NDP and the datagram (reserve) */
        if ((ctx->tx_curr_size - skb->len - reserve) < ctx->max_ndp_size)
                return NULL;

I think the types on the left-hand side of the comparison are as follows:

struct cdc_ncm_ctx {
        ...
        u32 tx_curr_size;
        ...
}

struct sk_buff {
        ...
        unsigned int            len,
                                data_len;
        ...
}

static struct usb_cdc_ncm_ndp16 *cdc_ncm_ndp16(..., size_t reserve)

Each type is unsigned, so if skb->len + reserve ever happens to be greater than
ctx->tx_curr_size, the subtraction would result in a large number and the
comparison would almost certainly yield false.

Another thing: there seems to be a set of constants referring to 16/32 bit
quantities, and quantities of the same size seem to go together. For example,
when cdc_ncm_tx_fixup calls cdc_ncm_fill_tx_frame, it chooses the sign argument
like so:

        if (ctx->is_ndp16)
                skb_out = cdc_ncm_fill_tx_frame(dev, skb,
cpu_to_le32(USB_CDC_NCM_NDP16_NOCRC_SIGN));
        else
                skb_out = cdc_ncm_fill_tx_frame(dev, skb,
cpu_to_le32(USB_CDC_NCM_NDP32_NOCRC_SIGN));

But when cdc_mbim_tx_fixup calls cdc_ncm_fill_tx_frame, the sign argument is
either cpu_to_le32(USB_CDC_MBIM_NDP16_IPS_SIGN) or
cpu_to_le32(USB_CDC_MBIM_NDP16_DSS_SIGN). The constants
USB_CDC_MBIM_NDP32_IPS_SIGN and USB_CDC_MBIM_NDP32_DSS_SIGN are defined in
include/uapi/linux/usb/cdc.h but neither seems to be used anywhere in the
kernel.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
