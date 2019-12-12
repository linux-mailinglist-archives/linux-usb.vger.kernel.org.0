Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCAC611C674
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 08:35:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728130AbfLLHe3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 12 Dec 2019 02:34:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:58186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728072AbfLLHe3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Dec 2019 02:34:29 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 205841] Lenovo USB-C dock audio NULL pointer
Date:   Thu, 12 Dec 2019 07:34:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: owl@ow1.in
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205841-208809-ZezdkNMlJX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205841-208809@https.bugzilla.kernel.org/>
References: <bug-205841-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=205841

--- Comment #2 from Ilia Pavlikhin (owl@ow1.in) ---
Also I booted to old kernel (5.0.21) and sound works perfectly, but problem
with bandwidth is saved.

[    4.781746] usb 1-2.4.2.3: new full-speed USB device number 10 using
xhci_hcd
[    5.036633] usb 1-2.4.2.3: New USB device found, idVendor=17ef,
idProduct=3063, bcdDevice= 9.02
[    5.036634] usb 1-2.4.2.3: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[    5.036634] usb 1-2.4.2.3: Product: ThinkPad USB-C Dock Audio
[    5.036635] usb 1-2.4.2.3: Manufacturer: Lenovo
[    5.036636] usb 1-2.4.2.3: SerialNumber: 000000000000
[    5.105120] input: Lenovo ThinkPad USB-C Dock Audio as
/devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2.4/1-2.4.2/1-2.4.2.3/1-2.4.2.3:1.3/0003:17EF:3063.0008/input/input14
[   23.706681] usb 1-2.4.2.3: Not enough bandwidth for new device state.
[   23.706696] usb 1-2.4.2.3: Not enough bandwidth for altsetting 1
[   23.706699] usb 1-2.4.2.3: 2:1: usb_set_interface failed (-28)
[   23.707166] usb 1-2.4.2.3: Not enough bandwidth for new device state.
[   23.707184] usb 1-2.4.2.3: Not enough bandwidth for altsetting 1
[   23.707187] usb 1-2.4.2.3: 2:1: usb_set_interface failed (-28)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
