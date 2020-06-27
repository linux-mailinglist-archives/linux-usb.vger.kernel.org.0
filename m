Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8923420BEDA
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jun 2020 07:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgF0FSQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sat, 27 Jun 2020 01:18:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:39510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725840AbgF0FSQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Jun 2020 01:18:16 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208337] ucsi_ccg 6-0008: con1: failed to register alternate
 modes
Date:   Sat, 27 Jun 2020 05:18:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208337-208809-b2jy979bsm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208337-208809@https.bugzilla.kernel.org/>
References: <bug-208337-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208337

--- Comment #1 from Greg Kroah-Hartman (greg@kroah.com) ---
On Fri, Jun 26, 2020 at 03:43:18PM +0000, bugzilla-daemon@bugzilla.kernel.org
wrote:
> nvidia-modeset: Loading NVIDIA Kernel Mode Setting Driver for UNIX platforms 
> 440.82  Wed Apr  1 19:41:29 UTC 2020
> kernel: [drm] [nvidia-drm] [GPU ID 0x00000100] Loading driver
> kernel: [drm] Initialized nvidia-drm 0.0.0 20160202 for 0000:01:00.0 on minor
> 1
> kernel: nvidia-smi (368) used greatest stack depth: 12488 bytes left
> kernel: usb 5-1: New USB device found, idVendor=2109, idProduct=2820,
> bcdDevice= b.a3
> kernel: usb 5-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> kernel: usb 5-1: Product: USB2.0 Hub
> kernel: usb 5-1: Manufacturer: VIA Labs, Inc.
> kernel: hub 5-1:1.0: USB hub found
> kernel: hub 5-1:1.0: 4 ports detected
> kernel: ucsi_ccg 6-0008: con1: failed to register alternate modes

And what is wrong with this?

Also, 5.4 is really old for typec stuff, please use 5.7 at the latest.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
