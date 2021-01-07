Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 600B22ED41A
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jan 2021 17:14:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728659AbhAGQOT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 7 Jan 2021 11:14:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:41030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728316AbhAGQOT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 7 Jan 2021 11:14:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A343423118
        for <linux-usb@vger.kernel.org>; Thu,  7 Jan 2021 16:13:38 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 918E381F02; Thu,  7 Jan 2021 16:13:38 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210801] TopSeed Technology Corp. eHome Infrared Transceiver
 spams log with Error: urb status = -71
Date:   Thu, 07 Jan 2021 16:13:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sean@mess.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210801-208809-fa5Os4z87U@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210801-208809@https.bugzilla.kernel.org/>
References: <bug-210801-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210801

--- Comment #6 from Sean Young (sean@mess.org) ---
I've been looking at commit 528222d853f92 for some time now and I can't see how
this broke anything.

Can you please try again with mceusb dynamic debug enabled?

echo "file drivers/media/rc/mceusb.c +p" >
/sys/kernel/debug/dynamic_debug/control

(Both with and without the patch please.)

The output should tell us what command is causing problem and what command
changed (if anything) between the commits.

Thanks

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
