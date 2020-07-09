Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7188E219BFD
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 11:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgGIJWM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 9 Jul 2020 05:22:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:60040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbgGIJWM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Jul 2020 05:22:12 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 203419] Logitech Group USB audio stopped working in 5.1-rc6
Date:   Thu, 09 Jul 2020 09:22:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ikjn@chromium.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203419-208809-httBeF70UE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203419-208809@https.bugzilla.kernel.org/>
References: <bug-203419-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=203419

Ikjoon Jang (ikjn@chromium.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ikjn@chromium.org

--- Comment #37 from Ikjoon Jang (ikjn@chromium.org) ---
like mentioned in #33, "8f97250c21f0 xhci: Don't clear hub TT buffer..." should
be applied first. Moreover, it seems this device needs extra workaround in HID
(This device is HUB + UVC + UAC + HID).

Adding "usbhid.quirks=0x046d:0x0882:0x4" to command line will block HID device
initialized, and audio will be okay. but after this, pressing any key on a
keypad will trigger disconnect.

FYI, the same bug is tracked on here: http://crbug.com/983482

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
