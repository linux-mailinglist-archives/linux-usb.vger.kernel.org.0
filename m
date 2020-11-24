Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6A02C3211
	for <lists+linux-usb@lfdr.de>; Tue, 24 Nov 2020 21:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727842AbgKXUnR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 24 Nov 2020 15:43:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:55348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726890AbgKXUnR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Nov 2020 15:43:17 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 210345] xhci init fail
Date:   Tue, 24 Nov 2020 20:43:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernelorg@lelik.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210345-208809-qm1xq5mePQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210345-208809@https.bugzilla.kernel.org/>
References: <bug-210345-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210345

--- Comment #3 from Andrey (kernelorg@lelik.org) ---
This happens on 5.8 as well, this is the latest ubuntu kernel.

[    1.071876] xhci_hcd 0000:0a:00.0: xHCI Host Controller
[    1.071884] xhci_hcd 0000:0a:00.0: new USB bus registered, assigned bus
number 3
[    1.125979] xhci_hcd 0000:0a:00.0: hcc params 0x0200f180 hci version 0x96
quirks 0x0000000000080000
[    1.126207] usb usb3: Manufacturer: Linux 5.8.0-29-generic xhci-hcd
[    1.126410] xhci_hcd 0000:0a:00.0: xHCI Host Controller
[    1.126414] xhci_hcd 0000:0a:00.0: new USB bus registered, assigned bus
number 4
[    1.126416] xhci_hcd 0000:0a:00.0: Host supports USB 3.0 SuperSpeed
[    1.126450] usb usb4: Manufacturer: Linux 5.8.0-29-generic xhci-hcd
[    1.126638] xhci_hcd 0000:0b:00.0: xHCI Host Controller
[    1.126641] xhci_hcd 0000:0b:00.0: new USB bus registered, assigned bus
number 5
[    1.142664] xhci_hcd 0000:0b:00.0: Host halt failed, -110
[    1.142665] xhci_hcd 0000:0b:00.0: can't setup: -110
[    1.142697] xhci_hcd 0000:0b:00.0: USB bus 5 deregistered
[    1.142740] xhci_hcd 0000:0b:00.0: init 0000:0b:00.0 fail, -110
[    1.142748] xhci_hcd: probe of 0000:0b:00.0 failed with error -110

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
