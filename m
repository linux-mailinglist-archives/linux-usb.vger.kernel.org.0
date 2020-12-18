Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 970052DE216
	for <lists+linux-usb@lfdr.de>; Fri, 18 Dec 2020 12:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbgLRLlY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 18 Dec 2020 06:41:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:50574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726103AbgLRLlY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Dec 2020 06:41:24 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 210767] New: uvcvideo: Webcam (1f3a:100e) stopped working after
 8a652a17e3c005dcdae31b6c8fdf14382a29cbbe
Date:   Fri, 18 Dec 2020 11:40:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cc cf_regression
Message-ID: <bug-210767-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210767

            Bug ID: 210767
           Summary: uvcvideo: Webcam (1f3a:100e) stopped working after
                    8a652a17e3c005dcdae31b6c8fdf14382a29cbbe
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.1-2.g8f3d468
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: doerges@pre-sense.de
                CC: tiwai@suse.de
        Regression: Yes

The device in question is

  Renkforce RF AC4K 300 Action Cam 4K

https://www.conrad.de/de/p/action-cam-renkforce-rf-ac-4k-webcam-4k-wlan-wasserfest-staubgeschuetzt-1577043.html


When connected via USB to a PC, it offers two modes:
 - mass storage
 - camera


When set to webcam mode it identifies as:
  [34367.545510] uvcvideo: Found UVC 1.00 device Android (1f3a:100e)


I tested against 5.10.1-2.g8f3d468.


With 8a652a17e3c005dcdae31b6c8fdf14382a29cbbe
(https://raw.githubusercontent.com/SUSE/kernel-source/openSUSE-15.2/patches.suse/media-uvcvideo-Ensure-all-probed-info-is-returned-to.patch)
the device stopped working in camera mode, i.e. no more video capture.


When reversing the above patch, the device is working as expected.


Downstream bug report is at
https://bugzilla.opensuse.org/show_bug.cgi?id=1180117

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
