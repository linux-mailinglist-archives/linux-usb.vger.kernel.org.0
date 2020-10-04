Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6EC282C66
	for <lists+linux-usb@lfdr.de>; Sun,  4 Oct 2020 20:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgJDSJx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 4 Oct 2020 14:09:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:44156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726295AbgJDSJx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 4 Oct 2020 14:09:53 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209499] New: NKRO does not work on vortex race 3 keyboard
Date:   Sun, 04 Oct 2020 18:09:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sgf.dma@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-209499-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209499

            Bug ID: 209499
           Summary: NKRO does not work on vortex race 3 keyboard
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8.10-1~bpo10+1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: sgf.dma@gmail.com
        Regression: No

Created attachment 292809
  --> https://bugzilla.kernel.org/attachment.cgi?id=292809&action=edit
lsusb and usbmon debug

Hi.

Linux does not see more, than 6 simultaneous keypresses on vortex race 3
keyboard. Though on windows 10 at least 10 simultaneous keypresses work.

lsusb info and usbmon debug is in 'vortex_usb.txt' file (there i press
'qwertyuifg' sequently (next key is pressed approximately after 1-2 seconds)
and then release in reverse order):

Thanks.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
