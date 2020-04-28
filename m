Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC42D1BCFB8
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 00:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgD1WR3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 28 Apr 2020 18:17:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:58780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725934AbgD1WR3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Apr 2020 18:17:29 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207219] [BISECTED] Sony Vaio laptop built-in ricoh webcam no
 longer found on Fedora 31 with 5.4.11 kernel
Date:   Tue, 28 Apr 2020 22:17:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: williambader@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-207219-208809-1JHY9yxwpU@https.bugzilla.kernel.org/>
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

--- Comment #15 from William Bader (williambader@hotmail.com) ---
Created attachment 288811
  --> https://bugzilla.kernel.org/attachment.cgi?id=288811&action=edit
logs from /sys/kernel/debug/usb/usbmon/3u and 4u

I made the logs. Here is what I did:
use make menuconfig to set
 CONFIG_USB_EHCI_HCD=m CONFIG_USB_OHCI_HCD=m CONFIG_USB_OHCI_HCD_PCI=m
CONFIG_USB_UHCI_HCD=m CONFIG_USB_XHCI_HCD=m CONFIG_USB_XHCI_PCI=m
build, install, and cold boot with new kernel
confirm no /dev/video
rename /lib/modules/$(uname -r)/kernel/drivers/usb/host/ehci-pci.ko
sudo mkinitrd --force /boot/initramfs-$(uname -r).img $(uname -r)
Creating: target|kernel|dracut args|basicmodules
dracut-install: could not get modinfo from 'ehci_pci': No such file or
directory
ls -l /boot
35318679 Apr 28 21:34 initramfs-5.6.6.localversion14.img <- before
35314182 Apr 28 21:43 initramfs-5.6.6.localversion14.img <- after
cold reboot
I did not have a mouse. I could log into Mate desktop but I couldn't find a way
to launch an xterm.
Switch to a text console.
no /dev/video
cat /sys/kernel/debug/usb/usbmon/3u > usbmon3.txt &
cat /sys/kernel/debug/usb/usbmon/4u > usbmon4.txt &
lsusb
 Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
 Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
restore ehci-pci.ko
insmod /lib/modules/$(uname -r)/kernel/drivers/usb/host/ehci-pci.ko
the mouse is working but still no /dev/video
 Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
 Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
 Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
 Bus 003 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
 Bus 003 Device 006: ID 0489:e036 Foxconn / Hon Hai
 Bus 003 Device 007: ID 05ca:18c0 Ricoh Co., Ltd <- webcam
 Bus 004 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
 Bus 004 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
 Bus 004 Device 003: ID 093a:2510 Pixart Imaging, Inc. Optical Mouse
echo 0 >/sys/bus/usb/devices/3-1/bConfigurationValue
echo 1 >/sys/bus/usb/devices/3-1/bConfigurationValue
the webcam is working

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
