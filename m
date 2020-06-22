Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50738203241
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jun 2020 10:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbgFVIkK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 22 Jun 2020 04:40:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:60058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725883AbgFVIkK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jun 2020 04:40:10 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207883] Regression: USB (XHCI) controller not responding after
 suspend/wake
Date:   Mon, 22 Jun 2020 08:40:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ryan@testtoast.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-207883-208809-LOWnAoWC8y@https.bugzilla.kernel.org/>
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

ryan@testtoast.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #2 from ryan@testtoast.com ---
Sorry I had forgotten to come back to this, thanks for the attention. 

This seemed to go away with -rc8 and 5.7.0, and I'm now running 5.8-rc1 without
seeing it again, so I'll close it for now.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
