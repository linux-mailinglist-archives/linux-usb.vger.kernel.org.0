Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88DB8259FFD
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 22:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgIAUbB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 1 Sep 2020 16:31:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:41284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726091AbgIAUbA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 16:31:00 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209089] USB storage devices appear as SATA devices
Date:   Tue, 01 Sep 2020 20:31:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209089-208809-JMTm2II9Hj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209089-208809@https.bugzilla.kernel.org/>
References: <bug-209089-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209089

--- Comment #11 from Alan Stern (stern@rowland.harvard.edu) ---
All right.  I don't have much time to spend on this, so I'll keep it brief.

Your point of view is too narrow.  As a maintainer, one quickly learns that any
change made to the kernel will affect _all_ users, not just the person who
requested the change.

You ran into a problem in one single situation (a new OS installation).  You
came up with an ad-hoc way to prevent the problem from occurring, but you
didn't think that your solution would _cause_ problems for many other people,
who rely (or have software that relies) on the current naming scheme.

Furthermore, it's a mistake to think that Linux runs only on desktop systems. 
In fact it gets used in everything from giant supercomputers to servers to
tablets to hobby boards to IoT devices to wearables.  Just because you have
never used a USB drive as the primary disk or attached two USB drives
simultaneously to your system doesn't mean nobody else has.

(In fact, one of my servers does have two USB drives attached.  They are used
for rotating backups.)

Furthermore, when presented with a well-known and commonly accepted technique
for avoiding the problem you encountered (using filesystem labels or GUID
labels), you rejected it.  If you don't want to use these things yourself,
that's fine -- but you shouldn't expect everyone else in the world to change
the naming conventions on their systems to suit your preference.

(In your triple-boot document, GUIDs would work perfectly well for everything
except the swap partition, because Windows would overwrite it.  But lack of a
swap partition wouldn't prevent you from booting.)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
