Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3372F72F1
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jan 2021 07:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbhAOGgS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 15 Jan 2021 01:36:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:37188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725988AbhAOGgS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 Jan 2021 01:36:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 8443523370
        for <linux-usb@vger.kernel.org>; Fri, 15 Jan 2021 06:35:37 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7D4D38672D; Fri, 15 Jan 2021 06:35:37 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210777] pwc driver doesn't work anymore
Date:   Fri, 15 Jan 2021 06:35:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210777-208809-MtoJNf6Ub0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210777-208809@https.bugzilla.kernel.org/>
References: <bug-210777-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210777

--- Comment #12 from Greg Kroah-Hartman (greg@kroah.com) ---
On Thu, Jan 14, 2021 at 09:47:14PM +0000, bugzilla-daemon@bugzilla.kernel.org
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=210777
> 
> --- Comment #10 from Barto (mister.freeman@laposte.net) ---
> @Harald Jenny : I tested your patch, it works, my webcam works now with
> kernel
> 5.10.7,
> 
> I hope it will be applied to 5.10 and 5.11 tree.
> 

Please read Documentation/SubmittingPatches for how to properly get a
patch accepted to the kernel.  Attaching it in bugzilla does not work :)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
