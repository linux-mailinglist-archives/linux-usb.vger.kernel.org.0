Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B323D4866
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jul 2021 17:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhGXPEj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Jul 2021 11:04:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:39180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229545AbhGXPEj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 24 Jul 2021 11:04:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 06A6560EB1
        for <linux-usb@vger.kernel.org>; Sat, 24 Jul 2021 15:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627141511;
        bh=1zzGlbN7RM3ax1T4JW6c3mtcsGl++w+VuevHCRi7X14=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IWnKihG8CpzW3cBYdnYhRm2qYJ4ysnPbriWi10xoD+xVZlvbOpos/9vDxinHhNS+P
         gSY2kQh7o0Y9Z1eXdSmz3a7ohPIKNjmi5wWMeUoX4aJ4RPlW0J/elxomWxTxN4Ro68
         LeAOAh5e4TLcj8q6vRMMyeHP56Jy50dUDF8VlmPBH4kIw9o4oqUX8eRiz8xp2rufop
         HTdKRlQ856S8usv/dYbCQl2gpP5JnLIFbLc+6UT0RauoRM+SStkrPDgp+bVl885+N7
         gO+oZcndyLe4+yea2YdKt6LWXhpiLmL7z73DCfB6jnyJdlSmVg0Sg5ufN1gEhmOaEh
         1sPYwKRchsnMg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id E9712608FD; Sat, 24 Jul 2021 15:45:10 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213839] XHCI 7 port usb hub does not work correctly
Date:   Sat, 24 Jul 2021 15:45:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213839-208809-Z7A7soggwH@https.bugzilla.kernel.org/>
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

--- Comment #3 from Alan Stern (stern@rowland.harvard.edu) ---
Have you tried using Wireshark to capture the USB communications to/from the
hub under both Windows and Linux for comparison?  If there's a difference, =
it
should show up.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
