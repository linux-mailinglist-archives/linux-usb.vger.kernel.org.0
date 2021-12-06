Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C88246A681
	for <lists+linux-usb@lfdr.de>; Mon,  6 Dec 2021 21:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348865AbhLFUHJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Dec 2021 15:07:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245430AbhLFUHI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Dec 2021 15:07:08 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E02E8C061746
        for <linux-usb@vger.kernel.org>; Mon,  6 Dec 2021 12:03:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9EF0CB81235
        for <linux-usb@vger.kernel.org>; Mon,  6 Dec 2021 20:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50EDEC341C1
        for <linux-usb@vger.kernel.org>; Mon,  6 Dec 2021 20:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638821017;
        bh=SpMU1lYx7e1eXKq1CfRFuxBnciX3R7z3J1qEApHmvKQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YaQ5jIdhtjojEKn2KwWyYCzTSY6EF6EplDPGv4elji/kBqsB2Hh9Szo0kmn6dohxY
         mnGS6VdJhTAhOL87P/txz4MGsEP1FaP5S26SYfjim/WntMkWAOG23ZdkB7G+hQBd4Q
         2A357j2ypY+pFy9dyYa04VjM6tEOYSCQJRoofNg2bbtNDzmyYg88R/fNLKMSgWClGE
         55+36/B2JVczUXVtPMZNjN2cNPPu7sLQ2Z6X/Wprsqnz1+ovn0toX7UnP+B2oZxTmE
         1eaihqixNwRSIMXWJ1YY5EZno5T96oFXM8MAwygnRBPqzJWycgDk6FmQf77Wf4JD6J
         9qNb+msDTlVWA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 22F0961106; Mon,  6 Dec 2021 20:03:37 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215241] "usbreset" tool causes hung task on kernel 5.15.3+ with
 Hauppauge WinTV dualHD
Date:   Mon, 06 Dec 2021 20:03:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mabo@elbmurf.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215241-208809-Q8jmL3Jd5f@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215241-208809@https.bugzilla.kernel.org/>
References: <bug-215241-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215241

--- Comment #3 from Maximilian B=C3=B6hm (mabo@elbmurf.de) ---
Ah, it=E2=80=99s counting "v5.1.9, v5.10", what a mess. OK, I=E2=80=99m on =
it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
