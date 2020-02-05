Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCC2E15396A
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2020 21:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbgBEUJa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 5 Feb 2020 15:09:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:47426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726534AbgBEUJa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Feb 2020 15:09:30 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206435] New: dwc3 dwc3.3.auto: no usb2 phy configured
Date:   Wed, 05 Feb 2020 20:09:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: youling257@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-206435-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206435

            Bug ID: 206435
           Summary: dwc3 dwc3.3.auto: no usb2 phy configured
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.6
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: youling257@gmail.com
        Regression: No

android_x86:/ $ dmesg | grep dwc
[    8.956913] dwc3 dwc3.3.auto: failed to create device link to
dwc3.3.auto.ulpi
[    8.979682] dwc3 dwc3.3.auto: no usb2 phy configured
[    8.986984] dwc3 dwc3.3.auto: failed to initialize core: -22
[    8.993597] dwc3: probe of dwc3.3.auto failed with error -22
android_x86:/ $

some Bay trail device has a phy_tusb1210 used for dwc3.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
