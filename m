Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E313C2430B8
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 00:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgHLWRS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 12 Aug 2020 18:17:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:58742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726508AbgHLWRS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 18:17:18 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208891] New: Thunderbolt hotplug fails on HP x360
 13t-aw000/86FA with HP Thunderbolt 3 Dock
Date:   Wed, 12 Aug 2020 22:17:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mattst88@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-208891-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208891

            Bug ID: 208891
           Summary: Thunderbolt hotplug fails on HP x360 13t-aw000/86FA
                    with HP Thunderbolt 3 Dock
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8.0
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: mattst88@gmail.com
        Regression: No

Created attachment 290843
  --> https://bugzilla.kernel.org/attachment.cgi?id=290843&action=edit
Kernel .config

My HP Spectre x360 (Icelake) laptop doesn't successfully hotplug with an HP
Thunderbolt 3 dock. I'm using 5.8.0-rc7-next-20200729. The dock's firmwares
have been updated from a system running Windows. The HP laptop is using the
latest BIOS as of last week, and nvm_version is "80.0":

% cat /sys/devices/pci0000:00/0000:00:0d.2/domain0/0-0/nvm_version
80.0

Cold booting the system with the dock attached provides working ethernet, USB
hub, etc. Unplugging and replugging the dock does not work, leaving it only
providing power.

Attached are dmesg, lspci -vvnnt output, and /proc/iomem captured (1) at
coldboot with the dock attached, (2) after unplugging the dock, (3) after
hotplugging the dock, and (4) after hotplugging the dock when it had not been
previously attached; and my kernel .config.

For search engines, the most apparent failure in dmesg is:

xhci_hcd 0000:2e:00.0: enabling device (0000 -> 0002)
xhci_hcd 0000:2e:00.0: xHCI Host Controller
xhci_hcd 0000:2e:00.0: new USB bus registered, assigned bus number 5
xhci_hcd 0000:2e:00.0: Host halt failed, -19
xhci_hcd 0000:2e:00.0: can't setup: -19
xhci_hcd 0000:2e:00.0: USB bus 5 deregistered
xhci_hcd 0000:2e:00.0: init 0000:2e:00.0 fail, -19
tg3 0000:2f:00.0: enabling device (0000 -> 0002)
tg3 0000:2f:00.0: phy probe failed, err -19
tg3 0000:2f:00.0: Problem fetching invariants of chip, aborting

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
