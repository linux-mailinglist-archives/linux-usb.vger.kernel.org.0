Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92D8A2EC072
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jan 2021 16:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbhAFPem convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 6 Jan 2021 10:34:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:41440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725800AbhAFPem (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 6 Jan 2021 10:34:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C9F122311E
        for <linux-usb@vger.kernel.org>; Wed,  6 Jan 2021 15:34:01 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B427681F02; Wed,  6 Jan 2021 15:34:01 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210801] TopSeed Technology Corp. eHome Infrared Transceiver
 spams log with Error: urb status = -71
Date:   Wed, 06 Jan 2021 15:34:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hpj@urpla.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210801-208809-1F6UqIDRby@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210801-208809@https.bugzilla.kernel.org/>
References: <bug-210801-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210801

Hans-Peter Jansen (hpj@urpla.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hpj@urpla.net,
                   |                            |sean@mess.org

--- Comment #4 from Hans-Peter Jansen (hpj@urpla.net) ---
Hi guys, sorry for silence: kbo bug mails were incorrectly routed by sieve here
and ended up in some junk space :-( Fixed now.

@Jiri: yes, this is the stable branch from
https://github.com/frispete/kernel-source.git, directly forked from
https://github.com/openSUSE/kernel-source.git, with minor config changes added.
I'm build stable and master branches in home:frispete:kernel{:HEAD}.

@Alan: I started with reverting 528222d853f92, which messes with rc timer
durations.
While I cannot see any obvious flaws in the changeset (in the mceusb module at
least), which doesn't mean *anything* of course, it might be a good start.

@Alan and @sganes: if that doesn't change the behavior, I will try to do the
monitoring/tracing, as you suggested.

I've cc'ed Sean Young now, since he's in change of 528222d853f92.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
