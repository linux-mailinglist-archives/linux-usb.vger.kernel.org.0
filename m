Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAD50377494
	for <lists+linux-usb@lfdr.de>; Sun,  9 May 2021 01:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbhEHXZZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 May 2021 19:25:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:41982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229522AbhEHXZZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 8 May 2021 19:25:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id EF236613FA
        for <linux-usb@vger.kernel.org>; Sat,  8 May 2021 23:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620516263;
        bh=rcLsNYz+iYWOQnYyOxbmDH/OJ2YRikNZGumzV+zKKdc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=iJMnXMCNrTBwwb993spYakpNua8LILinvGdAvkxdv4YX5gQfpSQWRZX5ti7AgNdVE
         dh5U8Q9w+t+SDCRM9FtuTpukKyyIwpaiX75nJLK+RjvOPWeGEEOkcrzyIH3i/R8B/w
         0WQx7lp8c9bwDYsLiRT+dM7nBZpRzfWxRCPRdzowryMln5dkylgWVWKC4qAEOYplTI
         J7NKhqXAOpj9l9DDC9tLbDxh4pZ39oZZ3PJ1XYwkt+Um/r2Ve2Q54gMCzya+6EASbA
         op5RyW6A/8pc66T/v+ZjtPlDJiNG9ITC1xrsVRBy/UV88RsjFd3hflmEvFjcq8+ZOh
         061mHjKs8wT1g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id DAC1661186; Sat,  8 May 2021 23:24:22 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212999] xpad map Xbox 360 controller incorrect
Date:   Sat, 08 May 2021 23:24:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Input Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: normal
X-Bugzilla-Who: anton17082003@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component
Message-ID: <bug-212999-208809-3mbJNc9onu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212999-208809@https.bugzilla.kernel.org/>
References: <bug-212999-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212999

Aru Moon (anton17082003@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |Input Devices

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
