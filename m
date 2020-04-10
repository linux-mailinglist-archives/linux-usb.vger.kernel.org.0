Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C97711A4999
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2020 19:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgDJR60 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 10 Apr 2020 13:58:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:43902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726142AbgDJR60 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 10 Apr 2020 13:58:26 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207065] C-media USB audio device stops working from 5.2.0-rc3
 onwards
Date:   Fri, 10 Apr 2020 17:58:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hawk.it@tiscali.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-207065-208809-XPOL8nMPEE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207065-208809@https.bugzilla.kernel.org/>
References: <bug-207065-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207065

Vincenzo Di Massa (hawk.it@tiscali.it) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hawk.it@tiscali.it

--- Comment #7 from Vincenzo Di Massa (hawk.it@tiscali.it) ---
Created attachment 288331
  --> https://bugzilla.kernel.org/attachment.cgi?id=288331&action=edit
Fix typo in attachment 288293

bug 206897 is resolved with the patch in attachment 288293, there is a typo in
the patch.
This patch just fixes the typo.

Apply in order

0001-xhci-testpatch-Don-t-clear-TT-buffer-on-ep0-protocol.patch
0002-Fix-a-typo-in-prevoius-patch.patch

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
