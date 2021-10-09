Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA49E427D3B
	for <lists+linux-usb@lfdr.de>; Sat,  9 Oct 2021 22:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbhJIUI7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Oct 2021 16:08:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:41780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230377AbhJIUI5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 9 Oct 2021 16:08:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5CAAC60F9C
        for <linux-usb@vger.kernel.org>; Sat,  9 Oct 2021 20:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633810020;
        bh=/wUa10KH82FdxbB2a9r2iM3IVgL10ZE0/HG0+a3OyK8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=braAL73Q8697OV4uUss9a2yWkar32gNOMgvXOcNmPZ0hshWw3oNcV8qQ783lwfT++
         KDZXehgAGHD45lMMth9lOJ6kcI5Jm00pTN2hxC/lFlQ1yAzwbd4l9kJaqXev9oGXTx
         SmstNENJgN1Zjx7p1rP/6DlXeuwtewKa/8KLlhxecEokiHoCod92oCQ46lIZc8frJJ
         qigTIU/3YmKUFk8FJfzyhRJM/K8f/cLAJJ8qJ9eHL9UiHXvJC/5FmJ/R9VHOu7R774
         R5f3vyOF6xOxLLnTtLqWb3LbXSY76Uwsrl8u/4CcyXDj2wczp4+XHBAru6P7E2Nkda
         ec++QAqto60cw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 45E7F60FC4; Sat,  9 Oct 2021 20:07:00 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213771] ch341 USB-Serial converter receives but does not send
Date:   Sat, 09 Oct 2021 20:07:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bondar.den@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213771-208809-JWjSQHgfJ8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213771-208809@https.bugzilla.kernel.org/>
References: <bug-213771-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213771

Denis Bondar (bondar.den@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bondar.den@gmail.com

--- Comment #5 from Denis Bondar (bondar.den@gmail.com) ---
Hi,
This version probably has the same or similar problem:

Linux home 5.11.0-37-generic #41~20.04.2-Ubuntu

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
