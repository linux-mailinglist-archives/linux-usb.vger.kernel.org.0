Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03F9227B463
	for <lists+linux-usb@lfdr.de>; Mon, 28 Sep 2020 20:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgI1SW3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 28 Sep 2020 14:22:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:60134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726547AbgI1SW3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Sep 2020 14:22:29 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209137] USB is not working since update from 5.0 to 5.3.0-26.
 And with 5.4 still not working.
Date:   Mon, 28 Sep 2020 18:22:28 +0000
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
Message-ID: <bug-209137-208809-NoDqmBqFTE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209137-208809@https.bugzilla.kernel.org/>
References: <bug-209137-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209137

--- Comment #6 from Alan Stern (stern@rowland.harvard.edu) ---
You should be more careful about what you write.  In the original bug
description you said that USB isn't working, but in comment #5 you said that
USB isn't the problem.  Try to be more consistent.

Your dmesg log from the 5.4 kernel does show some errors from the HID driver. 
You should collect a similar dmesg log under a 5.0 kernel for comparison.

Another thing that would help is the output from running as superuser "lsusb
-v" for the Logitech receiver.  Under either 5.0 or 5.4, the output should be
the same.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
