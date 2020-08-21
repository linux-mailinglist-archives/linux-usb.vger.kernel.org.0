Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE9924E2F6
	for <lists+linux-usb@lfdr.de>; Sat, 22 Aug 2020 00:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgHUWFT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 21 Aug 2020 18:05:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:39046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726641AbgHUWFS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 Aug 2020 18:05:18 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208911] Renesas USB controller - FW has invalid version :8224
Date:   Fri, 21 Aug 2020 22:05:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: neoweb@hackspherelabs.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-208911-208809-tkPIkbJCDS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208911-208809@https.bugzilla.kernel.org/>
References: <bug-208911-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208911

neoweb@hackspherelabs.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |neoweb@hackspherelabs.com

--- Comment #14 from neoweb@hackspherelabs.com ---
Hello,

I am not trying to waste anyone's time here.  This is what I had:

[    1.578294] xhci_hcd 0000:0a:00.0: FW has invalid version :8215
[    1.578331] xhci_hcd 0000:0a:00.0: Direct firmware load for
renesas_usb_fw.mem failed with error -2
[    1.578334] xhci_hcd 0000:0a:00.0: request_firmware failed: -2
[    1.578339] xhci_hcd: probe of 0000:0a:00.0 failed with error -2

I can find a ton of detail about this, I never knew that cards like this needed
firmware to be loaded on every boot.  I know FreeBSD will load firmware into
LSI Raid cards IIRC.  So it looks like from the comment of the final patch: 
"Test if ROM is present and loaded, if so we can skip everything" that my card
is going to use the firmware that is in the EEPROM.

I never knew you could load firmware into a USB 3.0 card like this.  It looks
like someone has even created a userspace util + SystemD setup for this:  

*https://mjott.de/blog/881-renesas-usb-3-0-controllers-vs-linux/
*https://github.com/markusj/upd72020x-load
*https://lore.kernel.org/patchwork/patch/686290/

So to get to my point.  I have noticed I have some issues sometimes with my
Renesas USB card manufactured by StarTech.  Just standard USB stuff, and issues
with pluggable USB 3.0 hubs...sometimes I have to reboot to get everything
working again, or reset the hub.

Am I doing myself a disservice not upgrading the firmware on it using the
Windows utils from Startech...or should I systemd with the github stuff above,
and upgrade the firmware every boot?

I don't know much about this stuff, but should linux always push a new firmware
to the card like CPU microcode, or FreeBSD.

Like I said, sorry if this is a waste of time or I am posting in the wrong
place, but it would be doing linux a disservice if all the Windows drivers
pushed newer better firmware to these devices, and worked better, because
firmware loading was just skipped.

Anyone have any idea?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
