Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12ED4249311
	for <lists+linux-usb@lfdr.de>; Wed, 19 Aug 2020 04:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbgHSCws convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 18 Aug 2020 22:52:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:46816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726632AbgHSCwr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Aug 2020 22:52:47 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208959] New: USB-serial (mct_u232): bit7=1 when tty is set to
 cs7?
Date:   Wed, 19 Aug 2020 02:52:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: mslade@epic-code.com.au
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-208959-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208959

            Bug ID: 208959
           Summary: USB-serial (mct_u232): bit7=1 when tty is set to cs7?
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.7.0
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: mslade@epic-code.com.au
        Regression: No

I'm not 100% certain this is a bug, please let me know if this is expected
behavior.

I have hooked an old serial mouse up to a USB serial device, USB ID 0711:0230
(part of an circa 2000 Targus port replicator)

when I configure it with the appropriate 1200 baud and 7 bit char width, the
bytes that come through /dev/ttyUSB0 all have bit7 set to 1.

This behavior is in contrast to an old serial port on a box running a 2.4.19
kernel.

Is there a standard for the value that non-data bits should be set to?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
