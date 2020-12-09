Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7711D2D4CA8
	for <lists+linux-usb@lfdr.de>; Wed,  9 Dec 2020 22:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732223AbgLIVOI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 9 Dec 2020 16:14:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:38172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728931AbgLIVOE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Dec 2020 16:14:04 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 210565] Regression: Upgrading from 5.9.8 to 5.9.9 stops ME906s
 LTE mobile modem from working.
Date:   Wed, 09 Dec 2020 21:13:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: nelg@linuxsolutions.co.nz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210565-208809-zD7xWeoA1A@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210565-208809@https.bugzilla.kernel.org/>
References: <bug-210565-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210565

--- Comment #1 from Glen Ogilvie (nelg@linuxsolutions.co.nz) ---
On further digging, it's seems that 5.9.8 is also not working after a full
power off/power on.

Moving down to 5.9.3 seems to have got it to work again.

Maybe commit:  88a559432e1f3f909941f0a3ec857465db24a784

If I can find time, I might take a current kernel and undoing these commits and
see if it fixes it, unless someone has a better idea.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
