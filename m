Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 347673ECEFA
	for <lists+linux-usb@lfdr.de>; Mon, 16 Aug 2021 09:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233687AbhHPHJh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Aug 2021 03:09:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:60902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233349AbhHPHJh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Aug 2021 03:09:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 15C0561A86
        for <linux-usb@vger.kernel.org>; Mon, 16 Aug 2021 07:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629097746;
        bh=2+TMixNiAyhv5H6fAyJLJ0XfjiyCIBZSByVCz2oT47E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NN3v6Ruhw0J56iWCbN7/7cKbIHK+0NrSj8PzRO0Ui1gvt8Z9l+krWlTwc1hN2d+3x
         ZT3+N1/qAA8HVjZ8mGUKnuW4M2Y5cN+YKPtSsYrBH7NUEdtkvxo+l1PRHUr1nnhu9r
         uQjC/+zLd3BAX675f5PPsRXc5s491dVwb3Z/iLPaNH3mQMcJy2brcwVw/xwi3crMKo
         2FZx/7IaZJS8PJinEwx9yfVqCzTozu27wrUsWc11OjRzQRljpXBzcJwRqay4YGKr9t
         +X08OP0I3tJdUw5gStd/ZAT5RNC+qhcSxREIaaQlgRpb7QYyKi9adFs+qSqirwJAQR
         JIu0VXnYhTuWQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 0539C60FEC; Mon, 16 Aug 2021 07:09:06 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Mon, 16 Aug 2021 07:09:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chris.chiu@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214021-208809-ACKLPrq2Zu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

--- Comment #5 from Chris Chiu (chris.chiu@canonical.com) ---
I add printks to trace where the error happens. The dmesg show as down below

[   44.488980] xhci_hcd 0000:00:14.0: FIXME: allocate a command ring segment
[   44.488981] usb_alloc_dev: hcd driver alloc dev exist but return 0
[   44.488982] usb usb1-port4: couldn't allocate usb_device

The first line show for the "xhci_dbg(xhci, "FIXME: allocate a command ring
segment\n");" in xhci_alloc_dev()

The second line shows the printk I add in usb_alloc_dev()

       /* Root hubs aren't true devices, so don't allocate HCD resources */
        if (usb_hcd->driver->alloc_dev && parent &&
                !usb_hcd->driver->alloc_dev(usb_hcd, dev)) {
+               printk("%s: hcd driver alloc dev exist but return 0",
__func__);
                usb_put_hcd(bus_to_hcd(bus));
                kfree(dev);
                return NULL;
        }

The usb_hcd->driver->alloc_dev is equal to xhci_alloc_dev and fails the
xhci_queue_slot_control(). Does that mean anything regarding this?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
