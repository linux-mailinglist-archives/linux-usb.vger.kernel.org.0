Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B7120C896
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jun 2020 16:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgF1OxL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 28 Jun 2020 10:53:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:47868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbgF1OxL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 28 Jun 2020 10:53:11 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206775] pcieport 0000:05:02.0: Refused to change power state,
 currently in D3  (ASUS G752VL )
Date:   Sun, 28 Jun 2020 14:53:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yu.c.chen@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc component assigned_to product short_desc
Message-ID: <bug-206775-208809-OAoso4hN1M@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206775-208809@https.bugzilla.kernel.org/>
References: <bug-206775-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206775

Chen Yu (yu.c.chen@intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yu.c.chen@intel.com
          Component|Hibernation/Suspend         |USB
           Assignee|rjw@rjwysocki.net           |drivers_usb@kernel-bugs.ker
                   |                            |nel.org
            Product|Power Management            |Drivers
            Summary|pcieport 0000:05:02.0:      |pcieport 0000:05:02.0:
                   |Refused to change power     |Refused to change power
                   |state, currently in D3      |state, currently in D3
                   |                            |(ASUS G752VL )

--- Comment #1 from Chen Yu (yu.c.chen@intel.com) ---
How about unload/disable graphic driver/usb3(xhci) driver and to see if it
helps(and to narrow down)?
thanks

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
