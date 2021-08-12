Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542B43E9C98
	for <lists+linux-usb@lfdr.de>; Thu, 12 Aug 2021 04:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233575AbhHLCbv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Aug 2021 22:31:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:54198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229729AbhHLCbu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Aug 2021 22:31:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5FC0260FC3
        for <linux-usb@vger.kernel.org>; Thu, 12 Aug 2021 02:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628735486;
        bh=WxleVNopPae64aEZXW+MqiRbODlH4BawTdPe45Ov8No=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HWPM4bqlwO8oT6L265BPMDvD48nicitE7hJ+PD0nso/D4E8LwUOshEkb4rcB9ZfGL
         0IlKrhEgiuBBQd4m+5MZ9nkBNbrupO/S/uDzzE1c3zyOR6bz/0t3DaKTI94uwq5apR
         F/tRfZqzbhzjHpGWIMjjQbm5cjCtOhuSPmvYmFaPiZV+Kr+X1CVJncWKT29Q1w3uix
         AUntj7y3jVvpBoMbWfUcLmkM/rWeYzrTiSo5F1Cy79dXX2FaKAuXUU8hMYFBs7shhA
         chWw4xJjHo39xp6EWc/eKCDHqvqyPUR0SKSYr35p6bTn5NzjrSe76ALrsWKdjmHhNT
         yjZFXSrRvsIkQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 5AD2F60EE2; Thu, 12 Aug 2021 02:31:26 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Thu, 12 Aug 2021 02:31:26 +0000
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
Message-ID: <bug-214021-208809-f1LPOHBL5I@https.bugzilla.kernel.org/>
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

--- Comment #4 from Chris Chiu (chris.chiu@canonical.com) ---
The patch author Chunfeng Yun also suggest to change the bPwrOn2PwrGood. It
still fails even I set the value to 20 and 40. Then I set to a 100 to see i=
f it
makes difference. The value 100 works.

I'll add some printk to get more information. Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
