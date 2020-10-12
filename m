Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81CAE28BD93
	for <lists+linux-usb@lfdr.de>; Mon, 12 Oct 2020 18:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390610AbgJLQZ3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 12 Oct 2020 12:25:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:60602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390420AbgJLQZ3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Oct 2020 12:25:29 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209411] When retrieving string descriptor from mobile device
 returns eproto error
Date:   Mon, 12 Oct 2020 16:25:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rachithas104@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209411-208809-wwA48GJ5vN@https.bugzilla.kernel.org/>
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

--- Comment #36 from rachithas104@gmail.com ---
R(In reply to Alan Stern from comment #35)
> Come to think of it, that particular change probably _won't_ affect your
> Get-String-Descriptor call.  It only affects bulk and interrupt endpoints,
> not control or isochronous endpoints, and Get-String-Descriptor uses
> endpoint 0 (which is a control endpoint).
> 
> Not calling Set-Config seems like the best workaround.  Is there any reason
> why your program calls it in the first place?  Isn't the device already
> using the configuration you want?

Regarding Get-String descriptor call,the problem seems to be happening only
when I call SelectConfiguration.If we skip SelectConfiguration there is no
error
So I am thinking SelectConfiguration call is making device to go to undesired
state ,its causing bus reset
We are calling SelectConfiguration as per the specification
Same program works with mobile device which had 4.14 kernel version even on
calling SelectConfiguration
Is there any log which would give more info on what actually is happening to
the device on calling Selectonfiguration
I am sure SelectConfiguration is doing something to the device,however no logs
are helping much

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
