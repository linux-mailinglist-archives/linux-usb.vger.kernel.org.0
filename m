Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 726A328C758
	for <lists+linux-usb@lfdr.de>; Tue, 13 Oct 2020 04:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbgJMCwX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 12 Oct 2020 22:52:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:32808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727971AbgJMCwV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Oct 2020 22:52:21 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209411] When retrieving string descriptor from mobile device
 returns eproto error
Date:   Tue, 13 Oct 2020 00:24:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: larsm17@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209411-208809-KA9kDeAkcp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209411-208809@https.bugzilla.kernel.org/>
References: <bug-209411-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209411

Lars Melin (larsm17@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |larsm17@gmail.com

--- Comment #40 from Lars Melin (larsm17@gmail.com) ---
(In reply to rachithas104 from comment #37)

> I also see when Set-Config is called from Windows device there is no issue

That may be because Windows apparently does not go directly to a new
configuration, it first goes to config #0 and waits a while to let the device
reset its config, then selects the new config.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
