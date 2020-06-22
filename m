Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAE9203150
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jun 2020 10:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgFVIEc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 22 Jun 2020 04:04:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:40912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725788AbgFVIEc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jun 2020 04:04:32 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208267] usbip broken with latest kernels?
Date:   Mon, 22 Jun 2020 08:04:31 +0000
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
Message-ID: <bug-208267-208809-4KzCLjeewq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208267-208809@https.bugzilla.kernel.org/>
References: <bug-208267-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208267

--- Comment #4 from Greg Kroah-Hartman (greg@kroah.com) ---
On Sun, Jun 21, 2020 at 05:03:25PM +0000, bugzilla-daemon@bugzilla.kernel.org
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=208267
> 
> --- Comment #3 from DocMAX (forum@docmax.my.to) ---
> yes 5.6 works. as i said, starts with 5.7.
> i haven't much experience with git bisect. need some guidance.

the man page for git bisect should have lots of guidance, see
        man git bisect
for the details.

To start, do:
        git bisect start
        git bisect good v5.6
        git bisect bad v5.7
and then follow the prompts from there, building and booting the
resulting kernel and saying 'good' or 'bad' depending on what happened.

If you have specific questions about this, please let us know.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
