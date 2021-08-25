Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572F23F7ABD
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 18:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241815AbhHYQhP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 12:37:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:35904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240886AbhHYQhP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Aug 2021 12:37:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 636E661002
        for <linux-usb@vger.kernel.org>; Wed, 25 Aug 2021 16:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629909389;
        bh=EgSOrt9WAojJtOyDEqmPBayzVRS6OBkswu/e67G2bkU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=J9Eku7Dco2WmwO//9M6NAPQ7nxwYZPj3Yo3tRDLs13iXm0+BQMHJ2b18DIOWqWdf5
         1RTzxUPPM00i6TzQV5xOgsqOlXUnjnrTUL2Lqj0QXr9yZJrCNemonm9VqE+FA+7lut
         17YgVUyjTv07OCG5PXmPbLtzNGIjfQ+Ucu8scdImPgPdYRK/YTiuGVGyO6Ia2cd+vr
         xxAd8hDFf78hdX0yE6XknLBj5q6ab4zTPHXUTA0tPdcjllBamrdGYoUVHnuIiqjgUy
         r8kVeZFIUdCNbgxx3YDQvWarYJt1TvEp+Kr+vpGMFnHp/D9TO3gzRwKrEv1giVFiNL
         hMTjYB8xkuoAw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 5ABE161001; Wed, 25 Aug 2021 16:36:29 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 207887] USB keyboard (and other devices) connected to Thinkpad
 Dock hangs after a while
Date:   Wed, 25 Aug 2021 16:36:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: catchall-kernelbug@blubbbla.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207887-208809-PfNh2xMjjd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207887-208809@https.bugzilla.kernel.org/>
References: <bug-207887-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D207887

--- Comment #11 from Johannes Wegener (catchall-kernelbug@blubbbla.de) ---
Still happening on Archlinux with Kernel 5.13.12.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
