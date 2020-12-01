Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB3022C9680
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 05:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbgLAE2N convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 30 Nov 2020 23:28:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:33912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727897AbgLAE2N (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Nov 2020 23:28:13 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 203419] Logitech Group USB audio stopped working in 5.1-rc6
Date:   Tue, 01 Dec 2020 04:27:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: petenewcomb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203419-208809-SoiZCmEcbI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203419-208809@https.bugzilla.kernel.org/>
References: <bug-203419-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=203419

Peter Newcomb (petenewcomb@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |petenewcomb@gmail.com

--- Comment #50 from Peter Newcomb (petenewcomb@gmail.com) ---
I ran into this issue and found that my Logitech Group audio device shows up
with id 0x0857, not 0x0882.  I added the following patch and now it's working
again:

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index fbc93d8dda5e..0f3d74ec3860 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -775,6 +775,7 @@
 #define USB_DEVICE_ID_LOGITECH_WII_WHEEL       0xc29c
 #define USB_DEVICE_ID_LOGITECH_ELITE_KBD       0xc30a
 #define USB_DEVICE_ID_LOGITECH_GROUP_AUDIO     0x0882
+#define USB_DEVICE_ID_LOGITECH_GROUP_AUDIO_2   0x0857
 #define USB_DEVICE_ID_S510_RECEIVER    0xc50c
 #define USB_DEVICE_ID_S510_RECEIVER_2  0xc517
 #define USB_DEVICE_ID_LOGITECH_CORDLESS_DESKTOP_LX500  0xc512
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 8a739ec50cc0..8a21a4e9db5a 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -183,6 +183,7 @@ static const struct hid_device_id hid_quirks[] = {
        { HID_USB_DEVICE(USB_VENDOR_ID_WISEGROUP,
USB_DEVICE_ID_QUAD_USB_JOYPAD), HID_QUIRK_NOGET | HID_QUIRK_MULTI_INPUT },
        { HID_USB_DEVICE(USB_VENDOR_ID_XIN_MO,
USB_DEVICE_ID_XIN_MO_DUAL_ARCADE), HID_QUIRK_MULTI_INPUT },
        { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
USB_DEVICE_ID_LOGITECH_GROUP_AUDIO), HID_QUIRK_NOGET },
+       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
USB_DEVICE_ID_LOGITECH_GROUP_AUDIO_2), HID_QUIRK_NOGET },

        { 0 }
 };

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
