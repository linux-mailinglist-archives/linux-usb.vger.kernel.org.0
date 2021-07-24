Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81BF63D482D
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jul 2021 16:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbhGXOEi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Jul 2021 10:04:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:60488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229545AbhGXOEh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 24 Jul 2021 10:04:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C0FB160E98
        for <linux-usb@vger.kernel.org>; Sat, 24 Jul 2021 14:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627137909;
        bh=4fiJu276tcGfyQaw8YY2k4N+ioixm2W8bYDkz+c3vVE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=vJu7+zZceHlbwYY847mJDf4SJOEYihXWFiIO+fQdlailgx+6RSek6Ilx8pWZ0rcsG
         Hi5u1vM9evAOd1fhw2aNxfwyhp7jwoFokOcxc5gzhR98rwGtI1E2hwc2jyh9cbxc7I
         V/NtNakZD9O4B44mQh3dqJQL+mPuhT8NPYC44BshWPnva+4cvx49KVOxqXktdjPT6N
         y5owfUB7ushMWJtmhHfcMAmcOGfKXYcCgWbj+15f/55Rb9nF6Dl/KfUSo7eW5Jlkv4
         KJfWKDsVzlfRH2EbvgfeI08dajWzX+Tk07oBNZdjrtnJ+qVtoKcGNfSiPLbEGQZ0Vq
         KSrw97pkHDn9Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id AB270608FA; Sat, 24 Jul 2021 14:45:09 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213839] XHCI 7 port usb hub does not work correctly
Date:   Sat, 24 Jul 2021 14:45:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tmezzadra@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213839-208809-oZJiilxOsf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213839-208809@https.bugzilla.kernel.org/>
References: <bug-213839-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213839

--- Comment #2 from tomas m (tmezzadra@gmail.com) ---
(In reply to Alan Stern from comment #1)
> This could easily be a power issue.  Does either the 7-port hub or the
> device you plug into it have its own power source?

I measured the 5v on both chips and its 5v sharp.

Soldered an additional cap to its vcc too.

Its the same vcc source.

Like i said. Under windows it works

It is being powered by the usb port.

I will test an external suppy just to be safe and report

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
