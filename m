Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2F19169734
	for <lists+linux-usb@lfdr.de>; Sun, 23 Feb 2020 11:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbgBWKeE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 23 Feb 2020 05:34:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:50382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725980AbgBWKeE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 23 Feb 2020 05:34:04 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206271] Trackpoint stops working after updating from Kernel
 5.4.11 to 5.4.12
Date:   Sun, 23 Feb 2020 10:34:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bernd.sontheimer@posteo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-206271-208809-P6MPgqH16a@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206271-208809@https.bugzilla.kernel.org/>
References: <bug-206271-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206271

Bernd Sontheimer (bernd.sontheimer@posteo.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bernd.sontheimer@posteo.de

--- Comment #1 from Bernd Sontheimer (bernd.sontheimer@posteo.de) ---
(In reply to Johannes Goepfert from comment #0)
> The Trackpoint from my Lenovo X1 Tablet Gen 3 stopped working after updating
> to Kernel version 5.4.12. The Trackpoint is recognized by "usbmon" (usbmon
> gives an output) and also "libinput list-devices". But there is no output
> for "cat /dev/input/eventX".

I can confirm the issue for this specific tablet. Further, there are patches
and a dkms module here https://github.com/Lunm0us/linux-tp1gen3 that fix the
trackpoint and also enable missing function keys like FnLock.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
