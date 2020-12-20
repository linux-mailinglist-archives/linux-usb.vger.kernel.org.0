Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A76DB2DF5AD
	for <lists+linux-usb@lfdr.de>; Sun, 20 Dec 2020 15:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbgLTOaG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 20 Dec 2020 09:30:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:59684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727487AbgLTOaF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 20 Dec 2020 09:30:05 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 210767] uvcvideo: Webcam (1f3a:100e) stopped working after
 8a652a17e3c005dcdae31b6c8fdf14382a29cbbe
Date:   Sun, 20 Dec 2020 14:29:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: laurent.pinchart+bugzilla-kernel@ideasonboard.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210767-208809-n2f9KRIkS9@https.bugzilla.kernel.org/>
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

--- Comment #6 from Laurent Pinchart (laurent.pinchart+bugzilla-kernel@ideasonboard.com) ---
Assuming the patch fixes the issue, I'll submit it to the linux-media mailing
list. Till, are you OK to have your name included in the commit messages as the
reporter ?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
