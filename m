Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A45831B9423
	for <lists+linux-usb@lfdr.de>; Sun, 26 Apr 2020 23:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgDZVHE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 26 Apr 2020 17:07:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:34738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725996AbgDZVHE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 26 Apr 2020 17:07:04 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207219] [BISECTED] Sony Vaio laptop built-in ricoh webcam no
 longer found on Fedora 31 with 5.4.11 kernel
Date:   Sun, 26 Apr 2020 21:07:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207219-208809-KP90075wte@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207219-208809@https.bugzilla.kernel.org/>
References: <bug-207219-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207219

--- Comment #12 from Alan Stern (stern@rowland.harvard.edu) ---
Yes, that procedure should prevent the driver from being loaded, except that
the module you want to affect is ehci-pci, not ehci-hcd.

You load the driver manually by doing:

   insmod /lib/modules/$(uname -r)/kernel/drivers/usb/host/ehci-pci.ko

Using modprobe won't work when you have blacklisted the driver.  Also, make
sure your .config has:

   CONFIG_USB_EHCI_PCI=m

so that the driver is built as a module.

(An alternate approach, that doesn't involve blacklisting, is to simply rename
the driver file.  Then modprobe won't be able to find and load it.  But of
course you still have to rebuild the initrd image.)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
