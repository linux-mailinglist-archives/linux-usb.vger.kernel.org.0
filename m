Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D589527AA51
	for <lists+linux-usb@lfdr.de>; Mon, 28 Sep 2020 11:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbgI1JJL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 28 Sep 2020 05:09:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:51540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726465AbgI1JJL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Sep 2020 05:09:11 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209137] USB is not working since update from 5.0 to 5.3.0-26.
 And with 5.4 still not working.
Date:   Mon, 28 Sep 2020 09:09:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: philipp.shah@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209137-208809-r7rxKmyuKM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209137-208809@https.bugzilla.kernel.org/>
References: <bug-209137-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209137

--- Comment #5 from Philipp (philipp.shah@gmx.de) ---
If I connect a wired mouse the mouse is working, so USB is not the problem.
The new kernel just does not accept the logitech wireless mouse and keyboard
(K520 and M310) but the old does. Hopefully the bug can be fixed soon.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
