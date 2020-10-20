Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3686F2935D9
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 09:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405255AbgJTHdX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 20 Oct 2020 03:33:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:56934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405253AbgJTHdX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Oct 2020 03:33:23 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208891] Thunderbolt hotplug fails on HP x360 13t-aw000/86FA
 with HP Thunderbolt 3 Dock
Date:   Tue, 20 Oct 2020 07:33:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208891-208809-sERLJh0pWo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208891-208809@https.bugzilla.kernel.org/>
References: <bug-208891-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208891

--- Comment #44 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Sorry for the delay from my side. I was on vacation last week.

From the logs I can see that the ports runtime suspend and resume so with the
patch and "pcie_port_pm=off" in the kernel command line should in theory work
the problem around.

It would help if you can ship the device to me to our Finland office and if the
dock is also Intel I suggest to ship that too so I can replicate the issue.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
