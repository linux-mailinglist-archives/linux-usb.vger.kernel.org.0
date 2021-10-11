Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50DEB42892C
	for <lists+linux-usb@lfdr.de>; Mon, 11 Oct 2021 10:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235276AbhJKIyE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Oct 2021 04:54:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:57928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235325AbhJKIyE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Oct 2021 04:54:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 70B6C604AC
        for <linux-usb@vger.kernel.org>; Mon, 11 Oct 2021 08:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633942324;
        bh=sTH4tmSwJVoK3EnObyCiHRi4qgkNz1M4l2A9npfA1CM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IZ95zPMMw+mU81+CH8DHgssDviX0EFrcUBv5xavvARjsvWF2xLcg1fKxWbwDw8Knf
         UcU2iYqEGUJWcP2OPTD5Soj1ZgWTgx8wykzgLR22j3le1fk3DUMNNDiihZBPwv5Tvx
         l0OSLVEH2+aSf/4aFEHEusAFASjf8wZWgtqm3An9nzGUpjoUn6hcO4xKFM02szfScz
         LbFtXsWXiKwrAmK35x+GA221+jhD0+gL6X6jX/ZFu4LSqbvHXNl/1i9YGu1Gg3imYV
         GkOcpJLfq2mlL8ueUK+7v+3UfI86R5Mhobw9svczftGsPPOVuB/nykkymo2hxQUtgJ
         Jaru08hI223xw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 6370860E15; Mon, 11 Oct 2021 08:52:04 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213771] ch341 USB-Serial converter receives but does not send
Date:   Mon, 11 Oct 2021 08:52:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johan@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213771-208809-r0wuzn9DjJ@https.bugzilla.kernel.org/>
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

--- Comment #6 from Johan Hovold (johan@kernel.org) ---
On Sat, Oct 09, 2021 at 08:07:00PM +0000, bugzilla-daemon@bugzilla.kernel.o=
rg
wrote:

> --- Comment #5 from Denis Bondar (bondar.den@gmail.com) ---
> Hi,
> This version probably has the same or similar problem:
>=20
> Linux home 5.11.0-37-generic #41~20.04.2-Ubuntu

That's also not a mainline kernel. Unless you can reproduce this with a
mainline (or stable) kernel, you need to report this to Ubuntu.

Providing answers to the questions I asked the original reporter might
help too.

Johan

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
