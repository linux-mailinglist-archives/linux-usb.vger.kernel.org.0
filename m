Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCB36248038
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 10:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgHRII5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 18 Aug 2020 04:08:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:53420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726403AbgHRII5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Aug 2020 04:08:57 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208917] Webcam(earlier working) doesn't work now for Sony Vaio
Date:   Tue, 18 Aug 2020 08:08:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component version assigned_to product
Message-ID: <bug-208917-208809-Y6CTkQo029@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208917-208809@https.bugzilla.kernel.org/>
References: <bug-208917-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208917

Takashi Iwai (tiwai@suse.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|webcam                      |USB
            Version|unspecified                 |2.5
           Assignee|v4l-dvb_webcam@kernel-bugs. |drivers_usb@kernel-bugs.ker
                   |osdl.org                    |nel.org
            Product|v4l-dvb                     |Drivers

--- Comment #2 from Takashi Iwai (tiwai@suse.de) ---
Lauren suggested in the opensuse bugzilla above:
The rapid cycles of disconnect/connect seem to point to a USB host controller
or USB core issue. If you open a bug upstream, I would recommend filing it with
USB, not media or UVC.

Let's reassign to USB people.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
