Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330CD1AE3DE
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2020 19:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730000AbgDQRe5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 17 Apr 2020 13:34:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:42650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728458AbgDQRe5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Apr 2020 13:34:57 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207327] New: Hang when reading encrypted DVD
Date:   Fri, 17 Apr 2020 17:34:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: horsley1953@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-207327-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207327

            Bug ID: 207327
           Summary: Hang when reading encrypted DVD
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.5.15-200.fc31.x86_64
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: horsley1953@gmail.com
        Regression: No

This redhat bug has a huge collection of comments analyzing the problem.

https://bugzilla.redhat.com/show_bug.cgi?id=1822948

It comes down to two issues:

1. Reading an encrypted sector on a commercial movie DVD simply generates a
scsi error with a directly connected sata drive, but put that same drive in an
external USB enclosure and read the same sector, and the read seems to hang and
leave the drive unusable.

2. systemd-udevd apparently decides to randomly read sectors, thus causing the
drive to be useless as soon as you insert a movie DVD.

Probably udevd shouldn't be doing that, but it also seems like it should be
getting an error rather than a hung process, which seems like a kernel bug
(unless it is a fundamental flaw in usb enclosures. I tried two different ones
with the same results, though they may be using the same chipset).

Comment 99 in the redhat bug has a somewhat more detailed summary:

https://bugzilla.redhat.com/show_bug.cgi?id=1822948#c99

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
