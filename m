Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83C0D1B89A9
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2020 23:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgDYVvF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sat, 25 Apr 2020 17:51:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:52434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726015AbgDYVvF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 25 Apr 2020 17:51:05 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207219] [BISECTED] Sony Vaio laptop built-in ricoh webcam no
 longer found on Fedora 31 with 5.4.11 kernel
Date:   Sat, 25 Apr 2020 21:51:04 +0000
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
Message-ID: <bug-207219-208809-Jz78PdW46Z@https.bugzilla.kernel.org/>
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

--- Comment #9 from William Bader (williambader@hotmail.com) ---
Thanks for working on it so quickly. I got an email a few days ago that a patch
"USB: hub: Revert commit bd0e6c9614b9 ("usb: hub: try old enumeration" was
added to the usb-linus branch of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
I can see it as
https://kernel.googlesource.com/pub/scm/linux/kernel/git/gregkh/usb/+/3155f4f40811c5d7e3c686215051acf504e05565
Considering that reverting the commit will make USB enumeration slower and that
apparently no one else has reported a problem, I would be fine with adding
something like usbcore.old_scheme_first=1 to my kernel command line (although
that particular option didn't help on kernel 5.5.15-200.fc31.x86_64).

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
