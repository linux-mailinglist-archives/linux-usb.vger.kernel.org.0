Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81C5B28A7B5
	for <lists+linux-usb@lfdr.de>; Sun, 11 Oct 2020 16:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387985AbgJKONQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 11 Oct 2020 10:13:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:57194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387970AbgJKONQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 11 Oct 2020 10:13:16 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209411] When retrieving string descriptor from mobile device
 returns eproto error
Date:   Sun, 11 Oct 2020 14:13:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209411-208809-Lsh4nNv4H0@https.bugzilla.kernel.org/>
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

--- Comment #32 from Alan Stern (stern@rowland.harvard.edu) ---
The fix you mentioned in comment #28 applies to the Ubuntu (host) kernel.

As to whether it will fix your EPROTO problem...  I'm not certain, but there's
a good chance that it will.  However, I don't think it will help with the
device reset failures.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
