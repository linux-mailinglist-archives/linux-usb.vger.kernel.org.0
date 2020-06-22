Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEACE202FFC
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jun 2020 08:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbgFVGya convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 22 Jun 2020 02:54:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:42600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbgFVGya (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jun 2020 02:54:30 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207883] Regression: USB (XHCI) controller not responding after
 suspend/wake
Date:   Mon, 22 Jun 2020 06:54:29 +0000
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
X-Bugzilla-Changed-Fields: cc component assigned_to product
Message-ID: <bug-207883-208809-Y8S76JZO8n@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207883-208809@https.bugzilla.kernel.org/>
References: <bug-207883-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207883

Chen Yu (yu.c.chen@intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yu.c.chen@intel.com
          Component|Hibernation/Suspend         |USB
           Assignee|rjw@rjwysocki.net           |drivers_usb@kernel-bugs.ker
                   |                            |nel.org
            Product|Power Management            |Drivers

--- Comment #1 from Chen Yu (yu.c.chen@intel.com) ---
Hi,
How about posting this issue to the USB mailing list directly? So the USB
developers could help on this, as we have the XHCI log already. And is it
possible to do a git bisect on this please?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
