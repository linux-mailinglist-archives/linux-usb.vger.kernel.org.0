Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71DE72868BE
	for <lists+linux-usb@lfdr.de>; Wed,  7 Oct 2020 22:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727689AbgJGUAX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 7 Oct 2020 16:00:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:38564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbgJGUAX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 7 Oct 2020 16:00:23 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Wed, 07 Oct 2020 20:00:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomasz@grobelny.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209555-208809-00s8GYVO5Z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209555-208809@https.bugzilla.kernel.org/>
References: <bug-209555-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209555

--- Comment #1 from Tomasz Grobelny (tomasz@grobelny.net) ---
Here is annotated dmesg without debugging info:

[   31.709214] USB_PWR_EN: disabling
//here I connect the cable and run my program
[   54.771552] Mass Storage Function, version: 2009/09/11
[   54.771561] LUN: removable file: (no medium)
[   54.781721] file system registered
[   54.782484] read descriptors
[   54.782495] read strings
[   54.786939] dwc2 ff400000.usb: bound driver configfs-gadget
[   54.976434] dwc2 ff400000.usb: new device is high-speed
[   55.090994] dwc2 ff400000.usb: new device is high-speed
[   55.142436] dwc2 ff400000.usb: new address 4
[   56.219325] ffs_data_put(): freeing
[   56.219828] unloading
//here the switch to AOA mode happens: it is as if the device was disconected
and entirely new device (different vid, pid) connected
[   56.257710] file system registered
[   56.258362] read descriptors
[   56.258373] read strings
[   56.262135] dwc2 ff400000.usb: bound driver configfs-gadget
[   56.454364] dwc2 ff400000.usb: new device is high-speed
[   56.568367] dwc2 ff400000.usb: new device is high-speed
[   56.620390] dwc2 ff400000.usb: new address 5
// here the cable is disconnected
[   79.288505] dwc2 ff400000.usb: dwc2_hsotg_ep_stop_xfr: timeout
DIEPINT.NAKEFF
[   79.288625] dwc2 ff400000.usb: dwc2_hsotg_ep_stop_xfr: timeout
DOEPCTL.EPDisable
[   79.299850] dwc2 ff400000.usb: dwc2_flush_tx_fifo:  HANG! AHB Idle GRSCTL
[   79.299982] dwc2 ff400000.usb: dwc2_hsotg_ep_stop_xfr: timeout
GINTSTS.GOUTNAKEFF
[   79.300105] dwc2 ff400000.usb: dwc2_hsotg_ep_stop_xfr: timeout
DOEPCTL.EPDisable
[   79.307060] ffs_data_put(): freeing
[   79.307355] unloading
// rmmod dwc2 && modprobe dwc2
[  119.388282] dwc2 ff400000.usb: supply vusb_d not found, using dummy
regulator
[  119.388349] dwc2 ff400000.usb: supply vusb_a not found, using dummy
regulator
[  119.388500] dwc2 ff400000.usb: Bad value for GSNPSID: 0x00000000
// run my program again, as you see it doesn't reach the "bound driver
configfs-gadget" line seen above
[  255.814129] Mass Storage Function, version: 2009/09/11
[  255.814138] LUN: removable file: (no medium)
[  255.814545] file system registered
[  255.815119] read descriptors
[  255.815128] read strings

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
