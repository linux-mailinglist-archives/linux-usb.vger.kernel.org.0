Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8551D1A8E20
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2020 23:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407788AbgDNV7Z convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 14 Apr 2020 17:59:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:45496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729713AbgDNV7X (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Apr 2020 17:59:23 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207219] [BISECTED] Sony Vaio laptop built-in ricoh webcam no
 longer found on Fedora 31 with 5.4.11 kernel
Date:   Tue, 14 Apr 2020 21:59:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: williambader@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207219-208809-lY0OCUsUvy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207219-208809@https.bugzilla.kernel.org/>
References: <bug-207219-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207219

--- Comment #5 from William Bader (williambader@hotmail.com) ---
Thanks for looking at it.

>Try starting with a vanilla (bad) kernel and reverting commit bd0e6c9614b9;
>let's see if that fixes the camera problem.

Yes, that fixed the camera problem.

What is the next step?

>it is a bug in the camera, not in the kernel

It wouldn't surprise me.

Here is what I did:

>$ git clone --branch linux-5.4.y
>https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/ linux-5.4
>$ git status
> On branch linux-5.4.y
> Your branch is up to date with 'origin/linux-5.4.y'.
> nothing to commit, working tree clean
>$ git log --oneline -n1 HEAD
> bc844d58f697 (HEAD -> linux-5.4.y, tag: v5.4.32, origin/linux-5.4.y) Linux
> 5.4.32
>$ # <- build, install, and confirm that the webcam does not work
>$ git log --oneline -n1 bd0e6c9614b9
> bd0e6c9614b9 usb: hub: try old enumeration scheme first for high speed
> devices
>$ git revert bd0e6c9614b9
>$ git status
> On branch linux-5.4.y
> Your branch is ahead of 'origin/linux-5.4.y' by 1 commit.
> (use "git push" to publish your local commits)
> nothing to commit, working tree clean
>$ git diff v5.4.32 | grep '^[+-]'
>--- a/Documentation/admin-guide/kernel-parameters.txt
>+++ b/Documentation/admin-guide/kernel-parameters.txt
>-                       scheme,  applies only to low and full-speed devices
>-                        (default 0 = off).
>+                       scheme (default 0 = off).
>--- a/drivers/usb/core/hub.c
>+++ b/drivers/usb/core/hub.c
>-       int quick_enumeration = (udev->speed == USB_SPEED_HIGH);
>-       return USE_NEW_SCHEME(retry, old_scheme_first_port || old_scheme_first
>-                             || quick_enumeration);
>+       return USE_NEW_SCHEME(retry, old_scheme_first_port ||
>old_scheme_first);
>$ # <- the commit makes quick_enumeration use the new scheme before
>"[7cbdf96cda1fbffb17ec26ea65e1fe63c9aed430] usb: missing parentheses in
>USE_NEW_SCHEME"
>$ # <- and the old scheme after.
>$ make mrproper # <- was this needed?
>$ cp ../config .config # <- my saved config based on Fedora's
>$ uemacs .config # bump CONFIG_LOCALVERSION to ".localversion13"
>$ cp -p .config ../config-`grep Linux .config | head -1 | awk '{print
>$3}'`-`grep -i CONFIG_LOCALVERSION= .config | sed -e 's/.*=".//' -e 's/"//g'`
>$ make oldconfig
>$ time make
>$ time make binrpm-pkg
>$ sudo dnf install
>kernel-5.4.32.localversion13_00001_g0dfde04ccc52-1.x86_64.rpm
><- reboot
>$ uname -r
>5.4.32.localversion13-00001-g0dfde04ccc52
><- the webcam works

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
