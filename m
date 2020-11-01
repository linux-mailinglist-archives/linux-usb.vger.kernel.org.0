Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E56C2A1B8C
	for <lists+linux-usb@lfdr.de>; Sun,  1 Nov 2020 01:51:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbgKAAvA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sat, 31 Oct 2020 20:51:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:43474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726159AbgKAAu7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 31 Oct 2020 20:50:59 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208257] Kingston USB flash drive repeatedly disconnected after
 "Set SEL for device-initiated U2 failed."
Date:   Sun, 01 Nov 2020 00:50:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: julroy67@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208257-208809-AEenfnXY25@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208257-208809@https.bugzilla.kernel.org/>
References: <bug-208257-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208257

--- Comment #10 from Julien Humbert (julroy67@gmail.com) ---
(In reply to Hans de Goede from comment #9)
> I have prepared a Fedora kernel test-build with the patch added, this is
> currently building here:
> https://koji.fedoraproject.org/koji/taskinfo?taskID=54473681

Thank you for the build and the instructions!

I've tested out the kernel and everything works fine, the Kingston USB flash
drive gets mounted, I can read and copy to it without any problem.

So it took some time, but the patch is working!

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
