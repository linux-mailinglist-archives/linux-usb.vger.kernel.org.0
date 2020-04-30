Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2891C0AF4
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2020 01:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgD3X0T convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 30 Apr 2020 19:26:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:54006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726355AbgD3X0T (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Apr 2020 19:26:19 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207219] [BISECTED] Sony Vaio laptop built-in ricoh webcam no
 longer found on Fedora 31 with 5.4.11 kernel
Date:   Thu, 30 Apr 2020 23:26:18 +0000
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
Message-ID: <bug-207219-208809-Ns4sOlm8Sa@https.bugzilla.kernel.org/>
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

--- Comment #17 from William Bader (williambader@hotmail.com) ---
Created attachment 288863
  --> https://bugzilla.kernel.org/attachment.cgi?id=288863&action=edit
usbmon logs

>To start with, before ehci-pci.ko was loaded there should have been no
>usbmon/3u or usbmon/4u files

I might have transcribed the lines in the wrong order. The mouse wasn't
working, so I had to type into a text console and I couldn't copy and paste to
another window.

>your usbmon3 trace shows the webcam working after it was initialized using the
>old scheme!

I know. I am pretty sure that I did a cold boot, and that I tested for
/dev/video* after booting.
Since I reported the problem, I have continued using the official Fedora
kernels for day-to-day work, and I use the test kernels only for short periods
for testing.
I have been checking the webcam every day out of curiosity when I boot my
laptop in the morning, and maybe 1 out of 10 times the old scheme works.

In any case, I just did the procedure again, taking better care.

cold boot from kernel 5.6.6.localversion14

no /dev/video
ls: cannot access '/dev/vid*': No such file or directory

lsusb
 Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
 Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

sudo ls -l /sys/kernel/debug/usb/usbmon
total 0
-rw------- 1 root root 0 May  1 00:03 0s
-rw------- 1 root root 0 May  1 00:03 0u
-rw------- 1 root root 0 May  1 00:03 1s
-rw------- 1 root root 0 May  1 00:03 1t
-rw------- 1 root root 0 May  1 00:03 1u
-rw------- 1 root root 0 May  1 00:03 2s
-rw------- 1 root root 0 May  1 00:03 2t
-rw------- 1 root root 0 May  1 00:03 2u

restore ehci-pci.ko

lsusb unchanged with only 2 devices

insmod /lib/modules/$(uname -r)/kernel/drivers/usb/host/ehci-pci.ko
cat /sys/kernel/debug/usb/usbmon/3u > usbmon3.txt &
cat /sys/kernel/debug/usb/usbmon/4u > usbmon4.txt &

no /dev/video

lsusb
Bus 004 Device 003: ID 093a:2510 Pixart Imaging, Inc. Optical Mouse
Bus 004 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 004 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 004: ID 05ca:18c0 Ricoh Co., Ltd
Bus 003 Device 005: ID 0489:e036 Foxconn / Hon Hai
Bus 003 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

echo 0 >/sys/bus/usb/devices/3-1/bConfigurationValue
echo 1 >/sys/bus/usb/devices/3-1/bConfigurationValue
no /dev/video*

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
