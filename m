Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 192EE27C2F7
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 12:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbgI2K6N convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 29 Sep 2020 06:58:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:33018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725826AbgI2K6N (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Sep 2020 06:58:13 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207065] C-media USB audio device stops working from 5.2.0-rc3
 onwards
Date:   Tue, 29 Sep 2020 10:58:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: florianmey@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207065-208809-e8UN1dIQrF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207065-208809@https.bugzilla.kernel.org/>
References: <bug-207065-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207065

--- Comment #13 from Florian Meyer (florianmey@gmx.de) ---
So I'm not entirely sure if this is related to my previous problem but I'm now
encountering a different kind of USB problems. USB equipment is still the same
as described in the first message. 
The new problem leads to all USB devices getting disconnected, USB audio as
well as mouse. The USB keyboard continues working because I guess it is working
via PS2 internally?
The problem has been occurring pretty much since the previous issue was fixed
but only sporadically. Today it occurred for the first time in ~4 weeks and
sometimes it happened several times in a day. 
The last messages in the dmesg log are:

[ 7075.685892] xhci_hcd 0000:2a:00.3: xHCI host not responding to stop endpoint
command.
[ 7075.685895] xhci_hcd 0000:2a:00.3: USBSTS:
[ 7075.701768] xhci_hcd 0000:2a:00.3: xHCI host controller not responding,
assume dead
[ 7075.701775] xhci_hcd 0000:2a:00.3: HC died; cleaning up
[ 7075.701808] usb 3-1: USB disconnect, device number 2
[ 7075.766108] usb 3-2: USB disconnect, device number 3
[ 7075.766110] usb 3-2.4: USB disconnect, device number 4

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
