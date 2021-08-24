Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 109553F591B
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 09:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234997AbhHXHh4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 03:37:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:54726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234797AbhHXHhu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Aug 2021 03:37:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B421C61246
        for <linux-usb@vger.kernel.org>; Tue, 24 Aug 2021 07:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629790626;
        bh=qwkc6pCJBdvJVUwl1IwmLcd8OS2PDWHFC1RtlVcV9KA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gbuYdAtceZ5hQTYp9mDKzLnab7iVQmrypNEzwy89ahV6EqXSoUjFKcc/Qt99oYMkV
         4BYUOvWHiNHPtGGC3pRO6bARfM3Xql2/O9adI6b+nWLqtMbmToxA3VzNzjBLHkmydG
         beir/OJCNUt1FE2Sw8QHfEn6fV3xLNqNoUF/HynS16WsaW2d7svdj8JNcNrEacrPeG
         ypF5vDlbK5ClvWdQAnPqPeCE8TnY16oW3MBnolT5NOkH5I2vtkXtH4nxI838nQyall
         N4PYtUQhDtHG2pj1dtlMw7hDiq0RSuF2aM2G3dQm9saGOlGMt47hkWNzblk3mtF4cW
         zqUzzOlhWddgA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id A6DCA60FF1; Tue, 24 Aug 2021 07:37:06 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Tue, 24 Aug 2021 07:37:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chris.chiu@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214021-208809-8PsynzhSYh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

--- Comment #13 from Chris Chiu (chris.chiu@canonical.com) ---
Mathias, thanks for the analysis since I've ran out of ideas for debugging
this. In my case, even a single line printk in either xhci-hub.c or hub.c
before hub_power_on() can make difference (undetected -> detected). But I c=
an
always reproduce with the clean code. Let me know if there's any patch I can
help test. Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
