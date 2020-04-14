Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4B591A8235
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2020 17:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438651AbgDNPTz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 14 Apr 2020 11:19:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:33846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438590AbgDNPTq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Apr 2020 11:19:46 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207219] [BISECTED] Sony Vaio laptop built-in ricoh webcam no
 longer found on Fedora 31 with 5.4.11 kernel
Date:   Tue, 14 Apr 2020 15:19:46 +0000
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
Message-ID: <bug-207219-208809-baqN7jZtII@https.bugzilla.kernel.org/>
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

--- Comment #4 from Alan Stern (stern@rowland.harvard.edu) ---
In fact, I think your problem isn't caused by commit 7cbdf96cda1f at all.  It's
caused by commit bd0e6c9614b9 ("usb: hub: try old enumeration scheme first for
high speed devices").  The bisection settled on 7cbdf96cda1f because the bug it
fixed was hiding your real problem.

Try starting with a vanilla (bad) kernel and reverting commit bd0e6c9614b9;
let's see if that fixes the camera problem.

Incidentally, the usbmon traces didn't help very much.  The trace under the bad
kernel showed that the camera had already gotten messed up before the trace
began, probably when the camera was probed during boot.  The camera bug (and it
is a bug in the camera, not in the kernel) showed up in the trace in two ways:
The camera connected to the USB bus at full speed instead of high speed, and
when it was connected it didn't respond to any requests.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
