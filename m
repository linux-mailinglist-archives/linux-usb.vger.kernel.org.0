Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D241914E981
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 09:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbgAaIWy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 31 Jan 2020 03:22:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:33164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728027AbgAaIWy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 31 Jan 2020 03:22:54 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206365] New: kernel NULL pointer dereference when charger is
 unplugged
Date:   Fri, 31 Jan 2020 08:22:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: andrea.lagala@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206365-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206365

            Bug ID: 206365
           Summary: kernel NULL pointer dereference when charger is
                    unplugged
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.3.4-300.fc31.x86_64
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: andrea.lagala@gmail.com
        Regression: No

Created attachment 287039
  --> https://bugzilla.kernel.org/attachment.cgi?id=287039&action=edit
lshw output

Every time I unplug my charger, I get a oops about a NULL pointer dereference.
The computer then slows down to a crawl, up until it fully freezes. ABRT tries
to get a report, but never gets to write any data. I installed kdump and forced
the panic on oops setting to get as much data as possible. I initially thought
that tlp was the culprit; deactivating it yielded no improvements. Then,
reading dmesg while troubleshooting I noticed lockdown was blocking direct
writes to registers. I disabled Secure Boot but the problem still is there.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
