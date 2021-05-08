Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2285A37715C
	for <lists+linux-usb@lfdr.de>; Sat,  8 May 2021 13:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbhEHLP2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 May 2021 07:15:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:60820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230234AbhEHLP1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 8 May 2021 07:15:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C6A7B61019
        for <linux-usb@vger.kernel.org>; Sat,  8 May 2021 11:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620472465;
        bh=PL9uuREX8U0+TjJf4EQe/D/z3rPkQ9JQjfbomdsP3SY=;
        h=From:To:Subject:Date:From;
        b=ah7+MP7UnovgwVVSncicFus7tubuCXipqSu6BvnHnOw4mzW2w7/0HWwOmI9uNt0t3
         mQlvtVranW8Qe1cXad3F8Qp9C4PyO8OZZlIiwx+0DcUpFx6P7iGDW0ziGN3bhQxdqt
         TryRGLH3USBp/uyj/cMw6EjJV4cXF3bXtwXLmpr+3deEUFOHtjA/WUSlZponPRdr9E
         LwkHU/WpV5gd58jY3y92YmugSuYyDNJuq9uNZdpRJc3BfwuEviXPSLcbHcW2Vav95p
         XAg/OHqXzCdFtOr5ePHocdFnYEjBr/U3NDurLJoh9SfTXpwvsHf31NkzQMtmW98HHJ
         kR+zUk5UW7wqg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id B33A561186; Sat,  8 May 2021 11:14:25 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212995] New: A possible divide by zero in qh_urb_transaction
Date:   Sat, 08 May 2021 11:14:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yguoaz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212995-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212995

            Bug ID: 212995
           Summary: A possible divide by zero in qh_urb_transaction
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12.2
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: yguoaz@gmail.com
        Regression: No

In the file drivers/usb/host/ehci-q.c, the function qh_urb_transaction has =
the
following code (link to the code location:
https://github.com/torvalds/linux/blob/dd860052c99b1e088352bdd4fb7aef46f8d2=
ef47/drivers/usb/host/ehci-q.c#L715):

maxpacket =3D usb_maxpacket(urb->dev, urb->pipe, !is_input);
...
if (usb_pipeout(urb->pipe) && (urb->transfer_flags & URB_ZERO_PACKET)
                           && !(urb->transfer_buffer_length % maxpacket))

However, the function usb_maxpacket may retun 0, leading to a possible divi=
de
zero problem in the remainder operation:

static inline __u16
usb_maxpacket(struct usb_device *udev, int pipe, int is_out)
{
        struct usb_host_endpoint        *ep;
        ...
        if (!ep)
                return 0;
        ...
}

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
