Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 421FD2A2EA1
	for <lists+linux-usb@lfdr.de>; Mon,  2 Nov 2020 16:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbgKBPwg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 2 Nov 2020 10:52:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:44792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725837AbgKBPwg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 2 Nov 2020 10:52:36 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208257] Kingston USB flash drive repeatedly disconnected after
 "Set SEL for device-initiated U2 failed."
Date:   Mon, 02 Nov 2020 15:52:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208257-208809-k5ke5gwI0l@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208257-208809@https.bugzilla.kernel.org/>
References: <bug-208257-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208257

--- Comment #13 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Alan Stern from comment #12)
> I'll take care of it.  I was just waiting for confirmation that the patch
> worked okay.

Ok, I saw the patch, LGTM. So I believe this bug can be closed then ?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
