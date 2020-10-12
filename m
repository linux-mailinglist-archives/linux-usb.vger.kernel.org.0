Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90FCC28C005
	for <lists+linux-usb@lfdr.de>; Mon, 12 Oct 2020 20:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730073AbgJLSuT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 12 Oct 2020 14:50:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:48108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbgJLSuT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Oct 2020 14:50:19 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209411] When retrieving string descriptor from mobile device
 returns eproto error
Date:   Mon, 12 Oct 2020 18:50:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rachithas104@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209411-208809-YuzEHCgL2a@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209411-208809@https.bugzilla.kernel.org/>
References: <bug-209411-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209411

--- Comment #39 from rachithas104@gmail.com ---
(In reply to Alan Stern from comment #38)
> \Is there any way to find out exactly what Windows sends to the device? 
> Maybe it's different from what your program sends.
> 
> Keep in mind also that the kernel sends a Set-Config request to the device
> when you plug it into the computer.  That request doesn't appear to cause
> problems either.
> 
> The only logs which might give you more information about what's happening
> on the device are the device's own logs.  Maybe you can learn something, for
> example, by running dmesg in a terminal app on the device.

Keep in mind also that the kernel sends a Set-Config request to the device when
you plug it into the computer.  That request doesn't appear to cause problems
either-This doesn't cause problem when the kernel first sends set-config,only
problem happens when there is one more select-config call on the same device

Its happening only with mobile,other devices are working fine

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
