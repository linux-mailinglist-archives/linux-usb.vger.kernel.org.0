Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5CE81936E2
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 04:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbgCZD02 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 25 Mar 2020 23:26:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:41030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727707AbgCZD02 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Mar 2020 23:26:28 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206901] Valve Index HMD breaks the USB controller it's
 connected into
Date:   Thu, 26 Mar 2020 03:26:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: carlo@alinoe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206901-208809-YbMVc4CgQY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206901-208809@https.bugzilla.kernel.org/>
References: <bug-206901-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206901

--- Comment #2 from Carlo Wood (carlo@alinoe.com) ---
I had a LOT more problems with the USB 3 on my ASUS Sabertooth 990FX
motherboard, so I bought a PCI Express card (PEXUSB3S44V from Startech, see
https://www.startech.com/nl/en/Cards-Adapters/USB-3.0/Cards/PCI-Express-USB-3-Card-4-Dedicated-Channels-4-Port~PEXUSB3S44V)
basically because it is the most expensive card you can get (I was hoping to
rule out certain things with that).

As a result I no longer needed to disable iommu in the BIOS or pass iommu=soft
as kernel boot parameter. But the above bug remained (although less
frequently).

The PEXUSB3S44V uses the μPD720202 host controller chip (four of them I think).
Documents here
https://www.renesas.com/us/en/products/usb-assp/upd720202.html#documents

This bug has the feel of https://bugzilla.kernel.org/show_bug.cgi?id=65021
from 2013 (kernel 3.x). A patch that has been in the kernel for long related
to that bug is https://www.spinics.net/lists/linux-usb/msg122678.html a few
people said was fixing the issue for them.

However, I added debug output to the module and in my case it never even gets
to the line

> xhci->quirks |= XHCI_AVOID_BEI;

so no wonder that patch didn't solve it for me ;).
Hence, apparently pdev->vendor != PCI_VENDOR_ID_INTEL for me.

But maybe it should be? The μPD720202 specs say it is Intel compatible...

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
