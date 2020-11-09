Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44EBB2AC7E5
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 23:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730294AbgKIWAs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 9 Nov 2020 17:00:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:50276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbgKIWAs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Nov 2020 17:00:48 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 210015] page allocation failure in usb_hub_wq hub_event when
 adding HID device
Date:   Mon, 09 Nov 2020 22:00:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dmitry.torokhov@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210015-208809-h6DViiZeQ5@https.bugzilla.kernel.org/>
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

Dmitry Torokhov (dmitry.torokhov@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dmitry.torokhov@gmail.com

--- Comment #5 from Dmitry Torokhov (dmitry.torokhov@gmail.com) ---
32 pages for a single field suggests that there is a garbage in the descriptor
and blindly converting to kvmalloc_array() is indeed simply papering over the
problem.

I suggest you post hid report descriptor and maybe instrument
hid-core.c::hid_register_field() to see what number of usages and values it is
being asjed to allocate.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
