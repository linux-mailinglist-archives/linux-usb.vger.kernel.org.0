Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E69152DF159
	for <lists+linux-usb@lfdr.de>; Sat, 19 Dec 2020 20:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727429AbgLSTv4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sat, 19 Dec 2020 14:51:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:41966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727424AbgLSTv4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 19 Dec 2020 14:51:56 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 210767] uvcvideo: Webcam (1f3a:100e) stopped working after
 8a652a17e3c005dcdae31b6c8fdf14382a29cbbe
Date:   Sat, 19 Dec 2020 19:51:15 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-210767-208809-bktYpUees5@https.bugzilla.kernel.org/>
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

--- Comment #2 from Till Dörges (doerges@pre-sense.de) ---
Created attachment 294237
  --> https://bugzilla.kernel.org/attachment.cgi?id=294237&action=edit
Output from lsusb as root

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
