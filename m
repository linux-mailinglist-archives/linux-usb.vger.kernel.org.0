Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B96C2DF616
	for <lists+linux-usb@lfdr.de>; Sun, 20 Dec 2020 17:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727690AbgLTQ1I convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 20 Dec 2020 11:27:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:50682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727672AbgLTQ1H (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 20 Dec 2020 11:27:07 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 210767] uvcvideo: Webcam (1f3a:100e) stopped working after
 8a652a17e3c005dcdae31b6c8fdf14382a29cbbe
Date:   Sun, 20 Dec 2020 16:26:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: doerges@pre-sense.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210767-208809-NG9VzMW2vg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210767-208809@https.bugzilla.kernel.org/>
References: <bug-210767-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210767

--- Comment #7 from Till Dörges (doerges@pre-sense.de) ---
(In reply to Laurent Pinchart from comment #6)

> Assuming the patch fixes the issue, I'll submit it to the linux-media
> mailing list.

Will try to give the patch a shot asap.


> Till, are you OK to have your name included in the commit
> messages as the reporter ?

Yes, including my name is okay.

Thanks for the quick turnaround!

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
