Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C98518DE9D
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2020 09:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbgCUIGp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sat, 21 Mar 2020 04:06:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:48414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728052AbgCUIGo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 21 Mar 2020 04:06:44 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206901] New: Valve Index HMD breaks the USB controller it's
 connected into
Date:   Sat, 21 Mar 2020 08:06:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kacperski1@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-206901-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206901

            Bug ID: 206901
           Summary: Valve Index HMD breaks the USB controller it's
                    connected into
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.5.9
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: kacperski1@protonmail.com
        Regression: No

Attempting to use the Valve Index HMD breaks the USB controller it is connected
into - any newly connected or reconnected devices aren't being recognized by
the system. Unplugging the Index doesn't solve the issue, but rebooting the
system does.

After encountering this issue, during system shutdown I get the following
error: "usb 1-9: device descriptor read/64, error -110". I verified that usb
1-9 is indeed one of the HMD's connections.

Note that only the controller the HMD is connected into breaks, the rest keeps
working as intended.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
