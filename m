Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5AF81A9066
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2020 03:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392552AbgDOB0W convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 14 Apr 2020 21:26:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:55692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392551AbgDOB0P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Apr 2020 21:26:15 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207219] [BISECTED] Sony Vaio laptop built-in ricoh webcam no
 longer found on Fedora 31 with 5.4.11 kernel
Date:   Wed, 15 Apr 2020 01:26:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207219-208809-6S0wNB2prg@https.bugzilla.kernel.org/>
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

--- Comment #6 from Alan Stern (stern@rowland.harvard.edu) ---
On Tue, 14 Apr 2020 bugzilla-daemon@bugzilla.kernel.org wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=207219
> 
> --- Comment #5 from William Bader (williambader@hotmail.com) ---
> Thanks for looking at it.
> 
> >Try starting with a vanilla (bad) kernel and reverting commit bd0e6c9614b9;
> >let's see if that fixes the camera problem.
> 
> Yes, that fixed the camera problem.
> 
> What is the next step?

I think the next step is for me to revert that commit.  It was written
by Zeng Tao; he said that it makes Linux behave more like Windows.  
However, based on the behavior of your webcam, I doubt that is true.  
If Windows tried to use the "old scheme" for enumerating the webcam, it 
wouldn't work at all.  At least, not if the webcam behaves the same as 
it does in your tests.

Zeng, any comments?  You can see the discussion on Bugzilla at the URL 
above.

Alan Stern

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
