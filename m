Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 347C13E417C
	for <lists+linux-usb@lfdr.de>; Mon,  9 Aug 2021 10:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233885AbhHIIVs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Aug 2021 04:21:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:33172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233857AbhHIIVr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Aug 2021 04:21:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8601060249
        for <linux-usb@vger.kernel.org>; Mon,  9 Aug 2021 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628497287;
        bh=nSIbTHBddsW70a/Irw4eMB5QqVRB+M5NURjOggz1vi8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=X5X/Q3HeBqZajvBShX5ZTxsk13loWmlSO/rqjvJLSQbNJId3LsMhRIVyIdkI8y6Pa
         twsOA1fXcA/z1bBEwklGQ/z1YCD+0S4M+X3GLxtmQPkqv5wmXEZQ/UnayEFWSedvNR
         iutBP21nw91aUdAcMtUII3W+YVf8G3W8e3Q8qpugYj7vEX9dtk9WgwJxhu3lxSOA0w
         PilmPwjYmqZK43DjKrI90MuLh6hrGhM9yY+z17VN0HakfrxoY8C0Mnl83m1OUcs45a
         YKRU43U+/bQ2enhBqTcGWqzIet6Tq14lqC5flCHSQvDFCq/z3Vf5c0lzcUhS+vBKCh
         v5gPxCxC3+zeg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 6FCBE60FDA; Mon,  9 Aug 2021 08:21:27 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213967] Thinkpad T14 Chicony Webcam not recognized by kernel
Date:   Mon, 09 Aug 2021 08:21:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dev@horatiuion.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213967-208809-3yVzxweAcZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213967-208809@https.bugzilla.kernel.org/>
References: <bug-213967-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213967

--- Comment #3 from Horatiu Ion (dev@horatiuion.com) ---
I have not updated my BIOS. I will try reloading the default BIOS settings,
although to my recollection I haven't tweaked any settings.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
