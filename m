Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECF2E407AF2
	for <lists+linux-usb@lfdr.de>; Sun, 12 Sep 2021 01:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbhIKXxZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Sep 2021 19:53:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:45610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234553AbhIKXxU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 11 Sep 2021 19:53:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2D2E46101D
        for <linux-usb@vger.kernel.org>; Sat, 11 Sep 2021 23:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631404327;
        bh=30UdpLyxgMTEWFT8HH7LMHJqTPUchRU3SHMci6jzuBA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nC1ioL8y2pdN1zHmr1oEhLXwFQJfqTM6IGd2OWqrlhSv7qxupeZ/Z3vGi70IgTdxL
         Vmr5I8QKarfgHcmUjouKYeRfjTMSkc7iP3xFQQWIIvpfb3JzI+gAzSvA0fgoLVeRTY
         0WDTcfgeNActJlC4RG2smMyZX/8tKwrJ04o/cRWyp9puRlIBo4CLynGDVTltYltow+
         0iyQ822R/Oc/idL/gmjQF6u2pjNJlZS7Ko2LPfwIlbvrX8D/C1ZlNHvWO3PEXproZO
         djoKjp3a2AjnvT2cg1u6efKr9+RdJspYsQfRNFYvi1WM+gg/4HVsl6oFx7O22tFJD8
         X4/2E3bGxuNkA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 1AA9A606A5; Sat, 11 Sep 2021 23:52:07 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214137] USB randomly stops working, starting with mouse
Date:   Sat, 11 Sep 2021 23:52:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yaomtc@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214137-208809-fO65mj4esZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214137-208809@https.bugzilla.kernel.org/>
References: <bug-214137-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214137

--- Comment #7 from yaomtc@protonmail.com ---
I replaced my Ryzen 7 1700X and B450 motherboard with a Ryzen 5 5600G and a
B550 mobo. No issues so far. I think my 1st gen Ryzen might have had a
compatibility issue with recent Linux kernels.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
