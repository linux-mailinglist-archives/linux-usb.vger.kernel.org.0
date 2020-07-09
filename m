Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0733A21A516
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 18:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728299AbgGIQrT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 9 Jul 2020 12:47:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:40566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728037AbgGIQrT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Jul 2020 12:47:19 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208357] snd-usb-audio broken for 06f8:b000 since 4.9.189
Date:   Thu, 09 Jul 2020 16:47:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208357-208809-ab16KfFTqT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208357-208809@https.bugzilla.kernel.org/>
References: <bug-208357-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208357

--- Comment #4 from Alan Stern (stern@rowland.harvard.edu) ---
Well, the problem is clear enough:

   Interface 5 uses endpoint 1-OUT in alternate setting 1, 1-IN in
   alternate setting 2, and both 1-OUT and 1-IN in alternate setting 3.

   At the same time, interface 7 alternate setting 1 uses endpoint 1-OUT
   and interface 8 alternate setting 1 uses endpoint 1-IN.

According to the USB spec, different interfaces are not allowed to use the same
endpoints.  (The exact statement, in section 9.6.3 of the USB-2.0
specification, is: "An endpoint is not shared among interfaces within a single
configuration unless the endpoint is used by alternate settings of the same
interface."  IMO the word "unless" should have been "except when".)

This device would never pass the USB validation suite and would not be allowed
to use the USB logo.

Under the circumstances, it looks like interface 5 is not intended for general
use, since it is described as Vendor-Specific.  Does it get used in your
system?  The answer can be found in the /sys/kernel/debug/usb/devices file
(with the device plugged in under an earlier kernel where it works okay).

It may turn out that the way to deal with this problem is to add
ENDPOINT_IGNORE quirks for interface 5 on this device.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
