Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F4AF1569C9
	for <lists+linux-usb@lfdr.de>; Sun,  9 Feb 2020 10:19:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgBIJTj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 9 Feb 2020 04:19:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:53008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726078AbgBIJTj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 9 Feb 2020 04:19:39 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206471] Connecting Yi 4K+ to Tthinkpad T495, "usb usb2-port3:
 Cannot enable. Maybe the USB cable is bad?"
Date:   Sun, 09 Feb 2020 09:19:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lucas.vacek@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-206471-208809-ZCf5ZNoFYr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206471-208809@https.bugzilla.kernel.org/>
References: <bug-206471-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206471

--- Comment #1 from Lukas Vacek (lucas.vacek@gmail.com) ---
Created attachment 287257
  --> https://bugzilla.kernel.org/attachment.cgi?id=287257&action=edit
Good (dockstation port) usbmon

I am also adding output of cat /sys/kernel/debug/usb/usbmon/2u when the camera
is connect to an usb port on the dock station - no problem here, everything
works fine.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
