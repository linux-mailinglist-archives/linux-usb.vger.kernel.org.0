Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC044384A6
	for <lists+linux-usb@lfdr.de>; Sat, 23 Oct 2021 20:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbhJWSOP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Oct 2021 14:14:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:49502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230051AbhJWSOO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 Oct 2021 14:14:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5752160ED5
        for <linux-usb@vger.kernel.org>; Sat, 23 Oct 2021 18:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635012715;
        bh=CEvOFMf6kkwqCtMjlvFKXl6XRyWCQtuEdkWPJaj4Ykw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ryTn/N3sGxvb/NLBWPcVMZwzMWon6Ae2JvA3OfuRz9TNpb6t7CascPPqNThpI/Mjd
         4AC1z/reTSe1cwAdP1m1o11WWbeo2aBf7oK6JuMDXTZaLx530KW9nM4x21iVFBvwOm
         a12rUnQ4R8y8cBArDkgiwpjJmq4SYq/QsneqJK4Hk5xUz5T3lkm37l7wZd8a6dXrsA
         CBFNa5IK8cPDrkniybpcscO76q5EhphSjCsFeWQYvr6wJrEeNUTfJvEpFQF6Yuasyg
         U2JKVhWY0yOxOhiBeOlnN7paTSPsR1ED8pIXRBXkAP1XcmaWz+Po452CBlfzcFekN5
         ZrxPPCcNgK5RQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 406AC60F41; Sat, 23 Oct 2021 18:11:55 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214797] ehci-pci: unable to enumerate Sony NW-WS623 Device
Date:   Sat, 23 Oct 2021 18:11:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: Stefan.Lauterwasser@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214797-208809-Go5YhKuwOh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214797-208809@https.bugzilla.kernel.org/>
References: <bug-214797-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214797

--- Comment #1 from Stefan.Lauterwasser@gmail.com ---
I am not aware of further device information.

My hope was that only the device ID is missing somewhere?
I am able to work-around this issue by specifying the driver details manual=
ly?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
