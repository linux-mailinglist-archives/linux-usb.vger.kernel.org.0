Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 482F346D89B
	for <lists+linux-usb@lfdr.de>; Wed,  8 Dec 2021 17:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237134AbhLHQjw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Dec 2021 11:39:52 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:54996 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234717AbhLHQjv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Dec 2021 11:39:51 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 570D0CE2209
        for <linux-usb@vger.kernel.org>; Wed,  8 Dec 2021 16:36:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AF95C341C6
        for <linux-usb@vger.kernel.org>; Wed,  8 Dec 2021 16:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638981376;
        bh=XpQUFqVC+/12Hlrsn8ANO1bdt5sEhguabSpK14CXJGA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MwS4GDp3zECwixVlvlqEt7XTqxZPLN1kV/3CJJKwt/2maJf1kZ0LadNXtcDDKyVmh
         jn8u5kQeOC9vhVVRCdbefeTn2Cf/y0kW9t4LhVHTbPlNdptkt5/MzVsSMpVAaI6wJc
         /+H9Uxn0/yzLF+EZKEDIEVuO1Hlk4wrnjonhdFgqsRJaQUaMaAiknDbAA+IfGvscgH
         Yc8pkJ5BQBzRPgE8Uh3ksRtBg/DBS+8D7dMz6Wy6fD+JFZsecfyPaCfw6jX8XPkbHG
         cjcW9A/gZ+w1dYNMiXCB478jP94OHSx+rbXZoW/L0YQhPdJOc4TcBNX4bMOX6n5Cmd
         feZ4C5/rVPNmw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 48F4160F14; Wed,  8 Dec 2021 16:36:16 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215241] "usbreset" tool causes hung task on kernel 5.15.3+ with
 Hauppauge WinTV dualHD
Date:   Wed, 08 Dec 2021 16:36:16 +0000
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
Message-ID: <bug-215241-208809-cfCK1CiGWz@https.bugzilla.kernel.org/>
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

--- Comment #4 from Maximilian B=C3=B6hm (mabo@elbmurf.de) ---
Hallo again, found the commit:

$ git bisect bad
2899243f272f8801dceb1bb692bd1a3ae3f281c2 is the first bad commit
commit 2899243f272f8801dceb1bb692bd1a3ae3f281c2
Author: Pavel Skripkin <paskripkin@gmail.com>
Date:   Thu Jul 29 22:23:33 2021 +0200

    media: em28xx: add missing em28xx_close_extension

    [ Upstream commit 2c98b8a3458df03abdc6945bbef67ef91d181938 ]

    If em28xx dev has ->dev_next pointer, we need to delete ->dev_next list
    node from em28xx_extension_devlist on disconnect to avoid UAF bugs and
    corrupted list bugs, since driver frees this pointer on disconnect.

    Reported-and-tested-by:
syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com

    Fixes: 1a23f81b7dc3 ("V4L/DVB (9979): em28xx: move usb probe code to a
proper place")
    Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
    Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
    Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

 drivers/media/usb/em28xx/em28xx-cards.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)


What next?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
