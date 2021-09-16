Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51B040DEC0
	for <lists+linux-usb@lfdr.de>; Thu, 16 Sep 2021 17:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240210AbhIPP4k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Sep 2021 11:56:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:42474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240214AbhIPP4i (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Sep 2021 11:56:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3318661212
        for <linux-usb@vger.kernel.org>; Thu, 16 Sep 2021 15:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631807718;
        bh=Zxq37K4U6ETLKT52ad2XUTvdRVeLMfMWdaLthDOxpKU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oNU+zmjyoick01FMlPUt4yjZAI9kl5xxW7h240oRG8FL1Mzz5WgEnv0Ht4PwJJIUT
         yXFEbsPFpXYY1NLqUUjymxIjCiwIVnVL70Qfl4tv0dYOhs9vBQ8K9B464jYmzAw/Q/
         gb7y3dRYZRum8X/slLkgHkpvB1Ur4FyN8o3+STJ0A+rbHoed/jjWK45nL1olejeoZa
         zPx/edXuf1OJh1Tz/KjM/8qFmwMuQTKzhHw5U3m7p/2C8KRVaLPKfZB4V3HhYkWiJ5
         ilK52jsPY/pvHEm6zH9YSYjmE8GR21fv5+blDnmwvInYxSHXj4AoOf2iJ/g+uC2Jc4
         Qu3hfEq5jEG+w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 28EBE610A4; Thu, 16 Sep 2021 15:55:18 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214437] usb: hid: u2fzero: buffer overrun in u2fzero_rng_read
Date:   Thu, 16 Sep 2021 15:55:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrew@shadura.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214437-208809-15HJUZHzRV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214437-208809@https.bugzilla.kernel.org/>
References: <bug-214437-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214437

Andrej Shadura (andrew@shadura.me) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |andrew@shadura.me

--- Comment #1 from Andrej Shadura (andrew@shadura.me) ---
Since I=E2=80=99m the author of the driver, I=E2=80=99m currently trying to=
 figure out the
cause.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
