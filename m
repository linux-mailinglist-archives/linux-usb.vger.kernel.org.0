Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 587C5301A7B
	for <lists+linux-usb@lfdr.de>; Sun, 24 Jan 2021 09:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbhAXIPG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 24 Jan 2021 03:15:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:48482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726551AbhAXIO4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 24 Jan 2021 03:14:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 0497B22CF6
        for <linux-usb@vger.kernel.org>; Sun, 24 Jan 2021 08:14:17 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EB3A182545; Sun, 24 Jan 2021 08:14:16 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 211325] usbhid.mousepoll kernel cmd option not working
Date:   Sun, 24 Jan 2021 08:14:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211325-208809-hWXY5LcxPV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211325-208809@https.bugzilla.kernel.org/>
References: <bug-211325-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=211325

--- Comment #1 from Greg Kroah-Hartman (greg@kroah.com) ---
On Sun, Jan 24, 2021 at 04:35:13AM +0000, bugzilla-daemon@bugzilla.kernel.org
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=211325
> 
>             Bug ID: 211325
>            Summary: usbhid.mousepoll kernel cmd option not working
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.11-rc3
>           Hardware: ARM
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: low
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: mathias.steiger@gmail.com
>         Regression: No
> 
> It doesn't matter what value I use, it is treated as if unset (i.e. "0").

Please email the linux-input@vger.kernel.org list about this.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
