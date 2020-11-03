Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 011332A3F8E
	for <lists+linux-usb@lfdr.de>; Tue,  3 Nov 2020 10:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgKCJCW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 3 Nov 2020 04:02:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:59388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725968AbgKCJCW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Nov 2020 04:02:22 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 210015] page allocation failure in usb_hub_wq hub_event when
 adding HID device
Date:   Tue, 03 Nov 2020 09:02:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210015-208809-ZBfdipbuhK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210015-208809@https.bugzilla.kernel.org/>
References: <bug-210015-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210015

Michel Dänzer (michel@daenzer.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michel@daenzer.net

--- Comment #1 from Michel Dänzer (michel@daenzer.net) ---
Unless the memory allocated by the hid driver needs to be physically
contiguous, it should use kvmalloc(_array) instead of kmalloc(_array) (and
kvfree instead of kfree) where it can be larger than a single page.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
