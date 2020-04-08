Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F83E1A1E88
	for <lists+linux-usb@lfdr.de>; Wed,  8 Apr 2020 12:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbgDHKFq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 8 Apr 2020 06:05:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:33658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727078AbgDHKFq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Apr 2020 06:05:46 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206897] Huion tablet not recognized from kernel 5.3.1
Date:   Wed, 08 Apr 2020 10:05:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hawk.it@tiscali.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-206897-208809-w2sotkkAg4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206897-208809@https.bugzilla.kernel.org/>
References: <bug-206897-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206897

Vincenzo Di Massa (hawk.it@tiscali.it) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hawk.it@tiscali.it

--- Comment #4 from Vincenzo Di Massa (hawk.it@tiscali.it) ---
Hello, please have look at bug 206897, they look related.


Bug 206897, comment 21 asks to provide logs with the following procedure...
maybe we can anticipate it here for our device. Let's see who gets the job done
faster :-)


### Detailed log generation procedure from Bug 206897, comment 21

> Also traces and logs with more usb details enabled could be useful.
> These can be taken with any recent kernel.

> mount -t debugfs none /sys/kernel/debug
> echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
> echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
> echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
> echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
> < connect the logitec device >
> Send output of dmesg
> Send content of /sys/kernel/debug/tracing/trace

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
