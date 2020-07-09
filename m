Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15BD921A1CE
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 16:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726624AbgGIOIp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 9 Jul 2020 10:08:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:39690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726340AbgGIOIp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Jul 2020 10:08:45 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208357] snd-usb-audio broken for 06f8:b000 since 4.9.189
Date:   Thu, 09 Jul 2020 14:08:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc component assigned_to
Message-ID: <bug-208357-208809-epecupxp3B@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208357-208809@https.bugzilla.kernel.org/>
References: <bug-208357-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208357

Takashi Iwai (tiwai@suse.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tiwai@suse.de
          Component|Sound(ALSA)                 |USB
           Assignee|perex@perex.cz              |drivers_usb@kernel-bugs.ker
                   |                            |nel.org

--- Comment #1 from Takashi Iwai (tiwai@suse.de) ---
I thought the fix is on its way.  Reassigned the component to USB.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
