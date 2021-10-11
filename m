Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 851A142893C
	for <lists+linux-usb@lfdr.de>; Mon, 11 Oct 2021 10:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235336AbhJKI5Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Oct 2021 04:57:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:58580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235163AbhJKI5Y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Oct 2021 04:57:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id BDDFB60F43
        for <linux-usb@vger.kernel.org>; Mon, 11 Oct 2021 08:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633942524;
        bh=nPDc7zEfxlibN0GR1eI3F+J7hlwiQQlqnZwYfAeX0pM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fOqk7DgDFC/Os7rdHSo0C9NjWpLphvpCXh7bMU1iR3Uui2ACBO+CVaWxnbRQxIK1k
         zoseWCtz1Ue9b4DfigiIsZ2y/MqQLV614+90kFid6IBIVric3OsUaE0hqjmvdIe16e
         zginrC/DVA8XKTQ/6LiUa4LyaPwqEqnAmY7wNS9o4TI+0SXzQwE+8WAuLIQ2L7c3ad
         39udhl6n+0aY/gi3FoXEyWAuYLFjj+yCbekk0NYUXhnUgBOLaQTdpitLgXyQz5ZJ80
         8bwTWmegal2H/VwZnZ6tbtqqI0b3B1E7r4drLANbIBsndzwoh2hrsOeP2XE8B1XxZH
         ZL2DdGZxearNA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id BB6F560FA0; Mon, 11 Oct 2021 08:55:24 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214131] ch341 communication problem
Date:   Mon, 11 Oct 2021 08:55:24 +0000
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
Message-ID: <bug-214131-208809-wpEdD4H0tc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214131-208809@https.bugzilla.kernel.org/>
References: <bug-214131-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214131

--- Comment #11 from Johan Hovold (johan@kernel.org) ---
On Mon, Oct 04, 2021 at 09:21:09AM +0000, bugzilla-daemon@bugzilla.kernel.o=
rg
wrote:

> --- Comment #9 from Bogus=C5=82aw Brandys (brandys@o2.pl) ---
> 5.4.0-88-generic #99-Ubuntu SMP Thu Sep 23 17:29:00 UTC 2021 x86_64 x86_64
> x86_64 GNU/Linux
>=20
> Ubuntu 20.04.3 LTS
>=20
> problem with ch341 driver re-appeared while in 5.4.0.-86 is working fine.

This issue has been fixed in mainline (and stable), but we have no idea
what Ubuntu puts in their kernels. Please report it them.=20

Johan

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
